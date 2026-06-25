import { readdir, readFile, writeFile, mkdir } from "node:fs/promises";
import { dirname, extname, join, resolve } from "node:path";

const ROOT = resolve(new URL("..", import.meta.url).pathname.replace(/^\/([A-Za-z]:)/, "$1"));
const BASE_URL = process.env.EMPLOIS_BURKINA_BASE_URL || "http://127.0.0.1:8088";
const REPORT_FILE = join(ROOT, "docs", "LINK_AUDIT.md");
const USER_AGENT = "Emplois BurkinaLinkAudit/0.1 (+https://emplois-burkina.com)";
const CHECK_EXTERNAL = process.argv.includes("--external");
const SITE_SCOPE = process.argv.includes("--site");
const CONCURRENCY = Math.max(1, Number(process.env.LINK_AUDIT_CONCURRENCY || 12));
const REQUEST_TIMEOUT_MS = Math.max(1000, Number(process.env.LINK_AUDIT_TIMEOUT_MS || 5000));
const allowedExtensions = new Set([".html", ".css", ".js", ".mjs", ".json", ".xml", ".webmanifest", ".txt"]);
const ignoredDirectories = new Set([".git", "node_modules", ".agents", ".codex"]);
const productionHosts = new Set(["emplois-burkina.com", "www.emplois-burkina.com"]);
const ignoredSchemes = /^(mailto:|tel:|whatsapp:|javascript:|data:|#)/i;

async function listFiles(dir) {
  const entries = await readdir(dir, { withFileTypes: true });
  const files = [];

  for (const entry of entries) {
    if (ignoredDirectories.has(entry.name)) continue;
    const absolute = join(dir, entry.name);
    if (entry.isDirectory()) {
      files.push(...(await listFiles(absolute)));
      continue;
    }
    if (allowedExtensions.has(extname(entry.name))) files.push(absolute);
  }

  return files;
}

function normalizePath(value) {
  return value.replaceAll("\\", "/").replace(ROOT.replaceAll("\\", "/"), "").replace(/^\/+/, "");
}

function isPublicSiteFile(file) {
  const relative = normalizePath(file);
  if (relative.startsWith("pages/")) return allowedExtensions.has(extname(relative));
  if (["data/curated-jobs.json", "data/employer-logos.json", "data/sources.json"].includes(relative)) return true;
  if (relative.includes("/")) return false;
  return allowedExtensions.has(extname(relative));
}

function decode(value) {
  return String(value || "")
    .replace(/&amp;/g, "&")
    .replace(/&quot;/g, "\"")
    .replace(/&#039;/g, "'")
    .trim();
}

function extractLinks(content, file) {
  const links = [];
  const extension = extname(file).toLowerCase();
  const text = String(content || "");

  if (extension === ".html" || extension === ".xml") {
    const attributePatterns = [
      /\b(?:href|src|action)=["']([^"']+)["']/gi,
      /<meta\b[^>]*(?:property|name)=["'](?:og:url|og:image|twitter:image|twitter:url)["'][^>]*content=["']([^"']+)["']/gi,
    ];
    for (const pattern of attributePatterns) {
      for (const match of text.matchAll(pattern)) {
        const raw = decode(match[1]);
        if (!raw || ignoredSchemes.test(raw)) continue;
        links.push({ file, raw });
      }
    }
    return links;
  }

  if (extension === ".json" || extension === ".webmanifest") {
    const jsonPatterns = [
      /"(?:url|sourceUrl|canonicalUrl|logoUrl|profileUrl|applyUrl|externalUrl)"\s*:\s*"([^"]+)"/gi,
      /"(?:start_url|scope)"\s*:\s*"([^"]+)"/gi,
    ];
    for (const pattern of jsonPatterns) {
      for (const match of text.matchAll(pattern)) {
        const raw = decode(match[1]);
        if (!raw || ignoredSchemes.test(raw)) continue;
        links.push({ file, raw });
      }
    }
    return links;
  }

  if (extension === ".css") {
    for (const match of text.matchAll(/url\(["']?([^"')]+)["']?\)/gi)) {
      const raw = decode(match[1]);
      if (!raw || ignoredSchemes.test(raw)) continue;
      links.push({ file, raw });
    }
    return links;
  }

  return links;
}

function toCheckUrl(link) {
  const clean = link.raw.split("#")[0];
  if (!clean || ignoredSchemes.test(clean)) return null;
  if (clean.includes("${")) return null;
  try {
    if (/^https?:\/\//i.test(clean)) {
      const parsed = new URL(clean);
      if (productionHosts.has(parsed.hostname)) {
        return { type: "internal", url: new URL(`${parsed.pathname}${parsed.search}`, BASE_URL).toString() };
      }
      return { type: "external", url: clean };
    }
    const fileUrl = new URL(`file:///${link.file.replaceAll("\\", "/")}`);
    const resolved = new URL(clean, fileUrl);
    const relative = resolved.pathname.replace(/^\/([A-Za-z]:\/)/, "$1");
    const root = ROOT.replaceAll("\\", "/");
    if (!relative.startsWith(root)) return { type: "internal", url: new URL(clean, BASE_URL).toString() };
    const webPath = `/${relative.slice(root.length).replace(/^\/+/, "")}`;
    return { type: "internal", url: new URL(webPath, BASE_URL).toString() };
  } catch {
    return { type: "invalid", url: clean };
  }
}

async function request(url, method = "HEAD") {
  const controller = new AbortController();
  const timeout = setTimeout(() => controller.abort(), REQUEST_TIMEOUT_MS);
  try {
    const response = await fetch(url, {
      method,
      redirect: "follow",
      signal: controller.signal,
      headers: { "user-agent": USER_AGENT, accept: "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" },
    });
    return { ok: response.status < 500, status: response.status, finalUrl: response.url };
  } catch (error) {
    return { ok: false, status: 0, error: error.message };
  } finally {
    clearTimeout(timeout);
  }
}

async function checkUrl(url, type) {
  if (type === "external" && !CHECK_EXTERNAL) return { ok: true, status: "skipped", note: "external non verifie sans --external" };
  const head = await request(url, "HEAD");
  if (head.ok && head.status !== 405) return head;
  return request(url, "GET");
}

function uniqueLinks(links) {
  const byKey = new Map();
  for (const link of links) {
    const check = toCheckUrl(link);
    if (!check) continue;
    const key = `${check.type}:${check.url}`;
    const existing = byKey.get(key);
    if (existing) {
      existing.files.add(normalizePath(link.file));
      continue;
    }
    byKey.set(key, { ...check, raw: link.raw, files: new Set([normalizePath(link.file)]) });
  }
  return [...byKey.values()];
}

async function mapLimit(items, limit, mapper) {
  const results = new Array(items.length);
  let nextIndex = 0;

  async function worker() {
    while (nextIndex < items.length) {
      const currentIndex = nextIndex;
      nextIndex += 1;
      results[currentIndex] = await mapper(items[currentIndex], currentIndex);
    }
  }

  await Promise.all(Array.from({ length: Math.min(limit, items.length) }, worker));
  return results;
}

const files = (await listFiles(ROOT)).filter((file) => !SITE_SCOPE || isPublicSiteFile(file));
const links = [];
for (const file of files) links.push(...extractLinks(await readFile(file, "utf8"), file));

const checks = await mapLimit(uniqueLinks(links), CONCURRENCY, async (link) => {
  const result = link.type === "invalid" ? { ok: false, status: "invalid" } : await checkUrl(link.url, link.type);
  return { ...link, ...result, files: [...link.files] };
});

const broken = checks.filter((item) => !item.ok);
const internalBroken = broken.filter((item) => item.type === "internal");
const externalBroken = broken.filter((item) => item.type === "external");
const markdown = `# Audit des liens Emplois Burkina

Genere le : ${new Date().toISOString()}

- Base locale : ${BASE_URL}
- Fichiers analyses : ${files.length}
- Liens uniques : ${checks.length}
- Liens internes casses : ${internalBroken.length}
- Liens externes casses : ${externalBroken.length}
- Verification externe : ${CHECK_EXTERNAL ? "oui" : "non"}
- Portee : ${SITE_SCOPE ? "site public" : "tout le depot"}
- Concurrence : ${CONCURRENCY}

## Liens a corriger

${broken.length ? broken.map((item) => `- ${item.type} ${item.status || item.error || ""} : ${item.url}\n  - Fichiers : ${item.files.join(", ")}`).join("\n") : "Aucun lien casse detecte."}
`;

await mkdir(dirname(REPORT_FILE), { recursive: true });
await writeFile(REPORT_FILE, markdown, "utf8");

console.log(`Link audit: ${broken.length ? "failed" : "passed"} (${checks.length} liens uniques)`);
console.log(`Internal broken: ${internalBroken.length}`);
console.log(`External broken: ${externalBroken.length}`);
console.log(`Report: ${REPORT_FILE}`);

if (internalBroken.length || externalBroken.length) process.exitCode = 1;
