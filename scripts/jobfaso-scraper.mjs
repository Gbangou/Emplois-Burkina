import { createHash } from "node:crypto";
import { mkdir, readFile, writeFile } from "node:fs/promises";

const ROOT = new URL("../", import.meta.url);
const SOURCES_FILE = new URL("data/sources.json", ROOT);
const OUTPUT_FILE = new URL("data/raw-items.json", ROOT);

function normalize(value) {
  return String(value || "")
    .toLowerCase()
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .replace(/\s+/g, " ")
    .trim();
}

function fingerprint(parts) {
  return createHash("sha256").update(normalize(parts.join(" "))).digest("hex");
}

function stripHtml(html) {
  return html
    .replace(/<script[\s\S]*?<\/script>/gi, " ")
    .replace(/<style[\s\S]*?<\/style>/gi, " ")
    .replace(/<[^>]+>/g, " ")
    .replace(/&nbsp;/g, " ")
    .replace(/&amp;/g, "&")
    .replace(/&#039;/g, "'")
    .replace(/&quot;/g, "\"")
    .replace(/&agrave;/g, "a")
    .replace(/&eacute;/g, "e")
    .replace(/&egrave;/g, "e")
    .replace(/&ecirc;/g, "e")
    .replace(/&ocirc;/g, "o")
    .replace(/&ccedil;/g, "c")
    .replace(/\s+/g, " ")
    .trim();
}

function absolutizeUrl(href, baseUrl) {
  try {
    return new URL(href, baseUrl).toString();
  } catch {
    return "";
  }
}

async function loadSources() {
  return JSON.parse(await readFile(SOURCES_FILE, "utf8"));
}

async function fetchText(url) {
  const controller = new AbortController();
  const timeout = setTimeout(() => controller.abort(), 12000);

  const response = await fetch(url, {
    signal: controller.signal,
    headers: {
      "accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
      "user-agent": "JobFasoBot/0.1 (+contact: contact@jobfaso.com)",
    },
  }).finally(() => clearTimeout(timeout));

  if (!response.ok) {
    throw new Error(`HTTP ${response.status} ${response.statusText}`);
  }

  return response.text();
}

function extractJsonLdJobs(html, source) {
  const blocks = html.match(/<script[^>]+type=["']application\/ld\+json["'][^>]*>[\s\S]*?<\/script>/gi) || [];
  const jobs = [];

  for (const block of blocks) {
    const jsonText = block.replace(/^<script[^>]*>/i, "").replace(/<\/script>$/i, "").trim();

    try {
      const parsed = JSON.parse(jsonText);
      const items = Array.isArray(parsed) ? parsed : [parsed];

      for (const item of items.flatMap((entry) => entry["@graph"] || entry)) {
        if (item?.["@type"] !== "JobPosting") continue;

        const title = item.title || "";
        const company = item.hiringOrganization?.name || source.name;
        const city = item.jobLocation?.address?.addressLocality || "Burkina Faso";
        const url = item.url || source.url;
        const deadline = item.validThrough || "";

        jobs.push({
          id: fingerprint([title, company, city, deadline, url]),
          sourceId: source.id,
          sourceName: source.name,
          sourceUrl: source.url,
          title,
          company,
          city,
          deadline,
          url,
          category: "A classer",
          status: "needs_review",
          excerpt: stripHtml(item.description || "").slice(0, 320),
          collectedAt: new Date().toISOString(),
        });
      }
    } catch {
      // Ignore invalid JSON-LD blocks; many sites include tracking fragments.
    }
  }

  return jobs;
}

function extractLikelyJobLinks(html, source) {
  const links = [...html.matchAll(/<a\s+[^>]*href=["']([^"']+)["'][^>]*>([\s\S]*?)<\/a>/gi)];
  const keywords = /(emploi|job|recrut|concours|stage|candidature|offre|career|carriere)/i;
  const blockedLabel = /(inscription|connexion|newsletter|deposer|deposez|publier|candidat|recruteur|conditions|telechargement|formation|freelance|voir plus|toutes les annonces)/i;
  const items = [];

  for (const [, href, labelHtml] of links) {
    const label = stripHtml(labelHtml);
    const url = absolutizeUrl(href, source.url);
    const haystack = `${label} ${url}`;
    const normalizedUrl = normalize(url);
    const includeUrl = source.includeUrl || [];
    const excludeUrl = source.excludeUrl || [];
    const included = !includeUrl.length || includeUrl.some((pattern) => normalizedUrl.includes(normalize(pattern)));
    const excluded = excludeUrl.some((pattern) => normalizedUrl.includes(normalize(pattern)));

    if (!url || !label || label.length < 8 || !keywords.test(haystack)) continue;
    if (blockedLabel.test(label) || !included || excluded) continue;

    items.push({
      id: fingerprint([source.id, label, url]),
      sourceId: source.id,
      sourceName: source.name,
      sourceUrl: source.url,
      title: label.slice(0, 160),
      company: source.name,
      city: "Burkina Faso",
      deadline: "",
      url,
      category: "A classer",
      status: "needs_review",
      excerpt: "",
      collectedAt: new Date().toISOString(),
    });
  }

  return items;
}

async function collectSource(source) {
  if (source.collection === "manual_only") {
    return [];
  }

  const html = await fetchText(source.url);
  const structuredJobs = extractJsonLdJobs(html, source);
  const likelyLinks = extractLikelyJobLinks(html, source);
  const byId = new Map();

  for (const item of [...structuredJobs, ...likelyLinks]) {
    byId.set(item.id, item);
  }

  return [...byId.values()];
}

async function main() {
  const sources = await loadSources();
  const allItems = [];
  const errors = [];

  for (const source of sources) {
    try {
      const items = await collectSource(source);
      allItems.push(...items);
      console.log(`${source.name}: ${items.length} item(s)`);
    } catch (error) {
      errors.push({ source: source.name, message: error.message });
      console.warn(`${source.name}: ${error.message}`);
    }
  }

  const uniqueItems = [...new Map(allItems.map((item) => [item.id, item])).values()];
  let previousItems = [];

  try {
    previousItems = JSON.parse(await readFile(OUTPUT_FILE, "utf8"));
  } catch {
    previousItems = [];
  }

  if (!uniqueItems.length && previousItems.length) {
    console.warn("Collecte vide: conservation du precedent fichier raw-items.json.");
    console.warn(`Sources en erreur: ${errors.length}/${sources.length}`);
    return;
  }

  await mkdir(new URL("data/", ROOT), { recursive: true });
  await writeFile(OUTPUT_FILE, `${JSON.stringify(uniqueItems, null, 2)}\n`, "utf8");

  console.log(`Total unique: ${uniqueItems.length}`);
  console.log(`Sources en erreur: ${errors.length}/${sources.length}`);
  console.log(`Output: ${OUTPUT_FILE.pathname}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
