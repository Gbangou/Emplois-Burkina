import { createHash } from "node:crypto";
import { mkdir, readFile, writeFile } from "node:fs/promises";

const ROOT = new URL("../", import.meta.url);
const SOURCES_FILE = new URL("data/sources.json", ROOT);
const OUTPUT_FILE = new URL("data/raw-items.json", ROOT);
const ROBOTS_CACHE = new Map();
const USER_AGENT = process.env.JOBFASO_CRAWLER_AGENT || "JobFasoBot/0.1 (+contact: contact@jobfaso.com)";
const DETAIL_LIMIT_PER_SOURCE = Number(process.env.JOBFASO_DETAIL_LIMIT || 18);
const REQUEST_DELAY_MS = Number(process.env.JOBFASO_REQUEST_DELAY_MS || 350);

const frenchMonths = {
  janvier: "01",
  fevrier: "02",
  février: "02",
  mars: "03",
  avril: "04",
  mai: "05",
  juin: "06",
  juillet: "07",
  aout: "08",
  août: "08",
  septembre: "09",
  octobre: "10",
  novembre: "11",
  decembre: "12",
  décembre: "12",
};

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

function decodeHtml(value = "") {
  return String(value)
    .replace(/&#(\d+);/g, (_, code) => String.fromCharCode(Number(code)))
    .replace(/&#x([a-f0-9]+);/gi, (_, code) => String.fromCharCode(parseInt(code, 16)))
    .replace(/&nbsp;/g, " ")
    .replace(/&amp;/g, "&")
    .replace(/&quot;/g, "\"")
    .replace(/&#039;/g, "'")
    .replace(/&apos;/g, "'")
    .replace(/&lt;/g, "<")
    .replace(/&gt;/g, ">")
    .replace(/\s+/g, " ")
    .trim();
}

function sleep(ms) {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

function absolutizeUrl(href, baseUrl) {
  try {
    return new URL(href, baseUrl).toString();
  } catch {
    return "";
  }
}

function parseFrenchDate(value = "") {
  const text = normalize(value);
  const numeric = text.match(/\b(\d{1,2})[/-](\d{1,2})[/-](\d{2,4})\b/);
  if (numeric) {
    const [, day, month, year] = numeric;
    const fullYear = year.length === 2 ? `20${year}` : year;
    return `${fullYear.padStart(4, "0")}-${month.padStart(2, "0")}-${day.padStart(2, "0")}`;
  }

  const french = text.match(/\b(\d{1,2})\s+([a-z\u00e0-\u00ff]+)\s+(\d{4})\b/i);
  if (!french) return "";

  const [, day, monthName, year] = french;
  const month = frenchMonths[monthName];
  if (!month) return "";
  return `${year}-${month}-${day.padStart(2, "0")}`;
}

function firstDateAfter(text, patterns) {
  for (const pattern of patterns) {
    const match = text.match(pattern);
    if (match) {
      const parsed = parseFrenchDate(match[1] || match[0]);
      if (parsed) return parsed;
    }
  }
  return "";
}

function extractTitle(html, fallback = "") {
  const h1 = html.match(/<h1[^>]*>([\s\S]*?)<\/h1>/i);
  if (h1) return decodeHtml(stripHtml(h1[1])).slice(0, 180);
  const title = html.match(/<title[^>]*>([\s\S]*?)<\/title>/i);
  if (title) return decodeHtml(stripHtml(title[1]).split("-")[0]).slice(0, 180);
  return fallback;
}

function extractDetailMetadata(html, item) {
  const text = decodeHtml(stripHtml(html));
  const title = extractTitle(html, item.title);
  const openingDate =
    firstDateAfter(text, [
      /offre\s+d[eé]pos[eé]e?\s+([0-9]{1,2}\s+[a-z\u00e0-\u00ff]+\s+[0-9]{4})/i,
      /date\s+(?:de\s+)?(?:publication|depot|d[eé]p[oô]t|ouverture)\s*:?\s*([0-9]{1,2}\s+[a-z\u00e0-\u00ff]+\s+[0-9]{4})/i,
      /publi[eé]\s+le\s+([0-9]{1,2}\s+[a-z\u00e0-\u00ff]+\s+[0-9]{4})/i,
      /([0-9]{1,2}[/-][0-9]{1,2}[/-][0-9]{2,4})/,
    ]) || item.openingDate || "";
  const closingDate =
    firstDateAfter(text, [
      /date\s+de\s+cl[oô]ture\s+(?:de\s+l[’']offre\s*)?:?\s*([0-9]{1,2}\s+[a-z\u00e0-\u00ff]+\s+[0-9]{4})/i,
      /date\s+limite\s+(?:de\s+d[eé]p[oô]t|de\s+candidature|pour\s+postuler)?\s*:?\s*([0-9]{1,2}\s+[a-z\u00e0-\u00ff]+\s+[0-9]{4})/i,
      /cl[oô]ture\s*:?\s*([0-9]{1,2}\s+[a-z\u00e0-\u00ff]+\s+[0-9]{4})/i,
      /deadline\s*:?\s*([0-9]{1,2}\s+[a-z\u00e0-\u00ff]+\s+[0-9]{4})/i,
    ]) || item.closingDate || "";
  const cityMatch = text.match(/(?:lieu de travail|localisation|ville)\s*:?\s*([A-Za-zÀ-ÿ -]{3,80})/i);
  const typeMatch = text.match(/type de contrat\s*:?\s*([A-Za-zÀ-ÿ0-9 /-]{3,80})/i);
  const companyMatch = text.match(
    /offre\s+d[eé]pos[eé]e?\s+[0-9]{1,2}\s+[a-z\u00e0-\u00ff]+\s+[0-9]{4}\s+par\s+(.+?)(?:\s+Date\s+de\s+cl[oô]ture|\s+Secteur|\s+L[’']|$)/i
  );

  return {
    ...item,
    title: title || item.title,
    company: companyMatch?.[1]?.trim() || item.company,
    city: cityMatch?.[1]?.replace(/\s+(remuneration|type|assurance).*$/i, "").trim() || item.city,
    type: typeMatch?.[1]?.trim() || item.type,
    openingDate,
    closingDate,
    deadline: closingDate || item.deadline,
    excerpt: text.slice(0, 900),
    detailExtractedAt: new Date().toISOString(),
  };
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
      "user-agent": USER_AGENT,
    },
  }).finally(() => clearTimeout(timeout));

  if (!response.ok) {
    throw new Error(`HTTP ${response.status} ${response.statusText}`);
  }

  return response.text();
}

function parseRobots(text) {
  const rules = [];
  let applies = false;

  for (const rawLine of text.split(/\r?\n/)) {
    const line = rawLine.replace(/#.*/, "").trim();
    if (!line) continue;

    const [rawKey, ...rest] = line.split(":");
    const key = normalize(rawKey);
    const value = rest.join(":").trim();

    if (key === "user-agent") {
      const agent = normalize(value);
      applies = agent === "*" || normalize(USER_AGENT).includes(agent);
      continue;
    }

    if (applies && key === "disallow") {
      rules.push(value);
    }
  }

  return rules.filter(Boolean);
}

async function robotsDisallowRules(targetUrl) {
  const origin = new URL(targetUrl).origin;
  if (ROBOTS_CACHE.has(origin)) return ROBOTS_CACHE.get(origin);

  try {
    const robotsUrl = new URL("/robots.txt", origin).toString();
    const text = await fetchText(robotsUrl);
    const rules = parseRobots(text);
    ROBOTS_CACHE.set(origin, rules);
    return rules;
  } catch {
    ROBOTS_CACHE.set(origin, []);
    return [];
  }
}

async function isRobotsAllowed(targetUrl) {
  const url = new URL(targetUrl);
  const rules = await robotsDisallowRules(targetUrl);
  return !rules.some((rule) => rule === "/" || url.pathname.startsWith(rule));
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
        const datePosted = item.datePosted || "";

        jobs.push({
          id: fingerprint([title, company, city, deadline, url]),
          sourceId: source.id,
          sourceName: source.name,
          sourceUrl: source.url,
          title,
          company,
          city,
          deadline,
          openingDate: datePosted,
          closingDate: deadline,
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
      openingDate: "",
      closingDate: "",
      url,
      category: "A classer",
      status: "needs_review",
      excerpt: "",
      collectedAt: new Date().toISOString(),
    });
  }

  return items;
}

async function enrichDetails(items) {
  const enriched = [];

  for (const item of items.slice(0, DETAIL_LIMIT_PER_SOURCE)) {
    try {
      if (!(await isRobotsAllowed(item.url))) {
        enriched.push(item);
        continue;
      }
      await sleep(REQUEST_DELAY_MS);
      const html = await fetchText(item.url);
      enriched.push(extractDetailMetadata(html, item));
    } catch {
      enriched.push(item);
    }
  }

  return [...enriched, ...items.slice(DETAIL_LIMIT_PER_SOURCE)];
}

async function collectSource(source) {
  if (source.collection === "manual_only") {
    return [];
  }

  if (!(await isRobotsAllowed(source.url))) {
    throw new Error("robots.txt interdit la collecte de cette source");
  }

  const html = await fetchText(source.url);
  const structuredJobs = extractJsonLdJobs(html, source);
  const likelyLinks = extractLikelyJobLinks(html, source);
  const byId = new Map();

  for (const item of [...structuredJobs, ...likelyLinks]) {
    byId.set(item.id, item);
  }

  return enrichDetails([...byId.values()]);
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
