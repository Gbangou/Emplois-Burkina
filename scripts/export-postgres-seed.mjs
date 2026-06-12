import { createHash } from "node:crypto";
import { mkdir, readFile, writeFile } from "node:fs/promises";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

const ROOT = fileURLToPath(new URL("..", import.meta.url));
const DATA_DIR = join(ROOT, "data");
const OUTPUT_FILE = join(ROOT, "database", "seed.sql");

async function readJson(path, fallback) {
  try {
    return JSON.parse(await readFile(path, "utf8"));
  } catch {
    return fallback;
  }
}

function sql(value) {
  if (value === null || value === undefined || value === "") return "null";
  if (typeof value === "number") return Number.isFinite(value) ? String(value) : "null";
  if (typeof value === "boolean") return value ? "true" : "false";
  return `'${String(value).replaceAll("'", "''")}'`;
}

function sqlDate(value) {
  if (!value || !/^\d{4}-\d{2}-\d{2}$/.test(String(value).slice(0, 10))) return "null";
  return sql(String(value).slice(0, 10));
}

function sqlTimestamp(value) {
  if (!value) return "now()";
  const date = new Date(value);
  return Number.isNaN(date.getTime()) ? "now()" : sql(date.toISOString());
}

function sqlArray(values = []) {
  const items = [...new Set((Array.isArray(values) ? values : []).filter(Boolean).map(String))];
  if (!items.length) return "'{}'";
  return `array[${items.map(sql).join(", ")}]::text[]`;
}

function uuidFrom(value) {
  const hex = createHash("sha256").update(String(value)).digest("hex").slice(0, 32);
  return `${hex.slice(0, 8)}-${hex.slice(8, 12)}-4${hex.slice(13, 16)}-8${hex.slice(17, 20)}-${hex.slice(20, 32)}`;
}

function normalizePathFromUrl(loc) {
  try {
    const url = new URL(loc);
    return url.pathname.replace(/^\/+/, "") || "index.html";
  } catch {
    return "";
  }
}

function inferPageType(path) {
  if (path.startsWith("pages/jobs/")) return "job";
  if (path.startsWith("pages/categories/")) return "category";
  if (path.startsWith("pages/villes/")) return "city";
  if (path.startsWith("pages/guides/")) return "guide";
  if (path === "jobs.html") return "jobs";
  if (path === "index.html") return "home";
  return "page";
}

function htmlMeta(html, pattern, fallback = "") {
  return html.match(pattern)?.[1]?.replace(/\s+/g, " ").trim() || fallback;
}

async function seoPagesFromSitemap(config) {
  const sitemap = await readFile(join(ROOT, "sitemap.xml"), "utf8");
  const entries = [...sitemap.matchAll(/<url>\s*<loc>(.*?)<\/loc>\s*<lastmod>(.*?)<\/lastmod>\s*(?:<changefreq>(.*?)<\/changefreq>)?\s*(?:<priority>(.*?)<\/priority>)?/gs)];
  const pages = [];

  for (const [, loc, lastmod, changefreq = "weekly", priority = "0.7"] of entries) {
    const path = normalizePathFromUrl(loc);
    if (!path) continue;
    let html = "";
    try {
      html = await readFile(join(ROOT, path), "utf8");
    } catch {
      // Keep sitemap entry even if a static artifact is missing.
    }
    pages.push({
      path,
      title: htmlMeta(html, /<title>(.*?)<\/title>/is, path),
      description: htmlMeta(html, /<meta\s+name=["']description["']\s+content=["'](.*?)["']/is, config.description || ""),
      pageType: inferPageType(path),
      canonicalUrl: loc,
      lastmod,
      changefreq,
      priority: Number(priority) || 0.7,
    });
  }

  return pages;
}

function sourceInsert(source) {
  return `insert into sources (id, name, url, type, priority, collection, include_url, exclude_url, notes, updated_at)
values (${sql(source.id)}, ${sql(source.name)}, ${sql(source.url)}, ${sql(source.type)}, ${sql(source.priority || 3)}, ${sql(source.collection || "review_required")}, ${sqlArray(source.includeUrl)}, ${sqlArray(source.excludeUrl)}, ${sql(source.notes)}, now())
on conflict (id) do update set
  name = excluded.name,
  url = excluded.url,
  type = excluded.type,
  priority = excluded.priority,
  collection = excluded.collection,
  include_url = excluded.include_url,
  exclude_url = excluded.exclude_url,
  notes = excluded.notes,
  updated_at = now();`;
}

function rawItemInsert(item) {
  return `insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values (${sql(item.id)}, ${sql(item.sourceId)}, ${sql(item.sourceName)}, ${sql(item.sourceUrl)}, ${sql(item.title)}, ${sql(item.company)}, ${sql(item.city)}, ${sql(item.deadline)}, ${sqlDate(item.openingDate)}, ${sqlDate(item.closingDate)}, ${sql(Boolean(item.inconsistentDates))}, ${sql(item.url)}, ${sql(item.category || "A classer")}, ${sql(item.status || "needs_review")}, ${sql(item.excerpt)}, ${sql(item.canonicalUrl || item.url)}, ${sqlTimestamp(item.detailExtractedAt)}, ${sql(item.riskScore || 0)}, ${sql(item.confidenceScore || 0)}, ${sqlTimestamp(item.collectedAt)})
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;`;
}

function jobInsert(job) {
  return `insert into jobs (id, raw_item_id, title, company, city, category, job_type, salary, opening_date, closing_date, deadline_label, source_url, canonical_url, summary, tags, confidence_score, risk_score, status, published_at, updated_at)
values (${sql(uuidFrom(job.id))}::uuid, ${sql(job.id)}, ${sql(job.title)}, ${sql(job.company)}, ${sql(job.city)}, ${sql(job.category)}, ${sql(job.type)}, ${sql(job.salary)}, ${sqlDate(job.openingDate)}, ${sqlDate(job.closingDate)}, ${sql(job.deadline)}, ${sql(job.sourceUrl)}, ${sql(job.canonicalUrl || job.sourceUrl)}, ${sql(job.excerpt)}, ${sqlArray(job.tags)}, ${sql(job.confidenceScore || 0)}, ${sql(job.riskScore || 0)}, ${sql(job.status === "validated" ? "published" : "review")}, ${sqlTimestamp(job.collectedAt)}, now())
on conflict (raw_item_id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  category = excluded.category,
  job_type = excluded.job_type,
  salary = excluded.salary,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  deadline_label = excluded.deadline_label,
  source_url = excluded.source_url,
  canonical_url = excluded.canonical_url,
  summary = excluded.summary,
  tags = excluded.tags,
  confidence_score = excluded.confidence_score,
  risk_score = excluded.risk_score,
  status = excluded.status,
  updated_at = now();`;
}

function seoPageInsert(page) {
  return `insert into seo_pages (path, title, description, page_type, canonical_url, lastmod, changefreq, priority, is_indexable, updated_at)
values (${sql(page.path)}, ${sql(page.title)}, ${sql(page.description)}, ${sql(page.pageType)}, ${sql(page.canonicalUrl)}, ${sqlDate(page.lastmod)}, ${sql(page.changefreq)}, ${sql(page.priority)}, true, now())
on conflict (path) do update set
  title = excluded.title,
  description = excluded.description,
  page_type = excluded.page_type,
  canonical_url = excluded.canonical_url,
  lastmod = excluded.lastmod,
  changefreq = excluded.changefreq,
  priority = excluded.priority,
  is_indexable = excluded.is_indexable,
  updated_at = now();`;
}

const [config, sources, rawItems, jobs] = await Promise.all([
  readJson(join(DATA_DIR, "site-config.json"), {}),
  readJson(join(DATA_DIR, "sources.json"), []),
  readJson(join(DATA_DIR, "raw-items.json"), []),
  readJson(join(DATA_DIR, "curated-jobs.json"), []),
]);
const seoPages = await seoPagesFromSitemap(config);

const lines = [
  "-- JobFaso seed generated from local JSON data.",
  `-- Generated at ${new Date().toISOString()}.`,
  "-- Apply database/schema.sql first.",
  "begin;",
  "",
  "-- Sources",
  ...sources.map(sourceInsert),
  "",
  "-- Raw collected items",
  ...rawItems.map(rawItemInsert),
  "",
  "-- Curated jobs",
  ...jobs.map(jobInsert),
  "",
  "-- SEO pages",
  ...seoPages.map(seoPageInsert),
  "",
  "commit;",
  "",
];

await mkdir(dirname(OUTPUT_FILE), { recursive: true });
await writeFile(OUTPUT_FILE, lines.join("\n"), "utf8");

console.log(`PostgreSQL seed exported: ${OUTPUT_FILE}`);
console.log(`Rows: ${sources.length} sources, ${rawItems.length} raw items, ${jobs.length} jobs, ${seoPages.length} SEO pages.`);
