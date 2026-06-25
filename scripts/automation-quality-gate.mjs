import { access, mkdir, readFile, stat, writeFile } from "node:fs/promises";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

const ROOT = fileURLToPath(new URL("..", import.meta.url));
const DATA_DIR = join(ROOT, "data");
const RUNTIME_DIR = join(DATA_DIR, "runtime");
const QUALITY_JSON = join(RUNTIME_DIR, "automation-quality.json");
const QUALITY_MD = join(ROOT, "docs", "AUTOMATION_QUALITY.md");

async function readJson(path, fallback) {
  try {
    return JSON.parse(await readFile(path, "utf8"));
  } catch {
    return fallback;
  }
}

async function exists(path) {
  try {
    await access(path);
    return true;
  } catch {
    return false;
  }
}

async function size(path) {
  try {
    return (await stat(path)).size;
  } catch {
    return 0;
  }
}

function sitemapUrls(xml) {
  return [...xml.matchAll(/<loc>(.*?)<\/loc>/g)].map((match) => match[1]);
}

function pathFromUrl(url) {
  try {
    const parsed = new URL(url);
    return parsed.pathname.replace(/^\/+/, "") || "index.html";
  } catch {
    return "";
  }
}

function countBy(items, getter) {
  return items.reduce((acc, item) => {
    const key = getter(item) || "Autre";
    acc[key] = (acc[key] || 0) + 1;
    return acc;
  }, {});
}

function add(checks, severity, name, passed, detail, recommendation = "") {
  checks.push({ severity, name, passed, detail, recommendation });
}

const [sources, rawItems, jobs, socialQueue] = await Promise.all([
  readJson(join(DATA_DIR, "sources.json"), []),
  readJson(join(DATA_DIR, "raw-items.json"), []),
  readJson(join(DATA_DIR, "curated-jobs.json"), []),
  readJson(join(DATA_DIR, "social", "queue.json"), []),
]);

const sitemap = (await exists(join(ROOT, "sitemap.xml"))) ? await readFile(join(ROOT, "sitemap.xml"), "utf8") : "";
const projectAudit = (await exists(join(ROOT, "docs", "PROJECT_AUDIT.md")))
  ? await readFile(join(ROOT, "docs", "PROJECT_AUDIT.md"), "utf8")
  : "";
const sitemapUrlList = sitemapUrls(sitemap);
const sitemapPaths = sitemapUrlList.map(pathFromUrl).filter(Boolean);
const missingSitemapFiles = [];

for (const path of sitemapPaths) {
  if (path.endsWith(".html") && !(await exists(join(ROOT, path)))) missingSitemapFiles.push(path);
}

const categoryCounts = countBy(jobs, (job) => job.category);
const sourceCounts = countBy(jobs, (job) => job.sourceName);
const jobsWithClosingDate = jobs.filter((job) => job.closingDate).length;
const jobsWithOpeningDate = jobs.filter((job) => job.openingDateConfirmed).length;
const minimumCuratedJobs =
  jobsWithClosingDate >= Math.ceil(jobs.length * 0.8) && jobsWithOpeningDate >= Math.ceil(jobs.length * 0.5) ? 8 : 10;
const checks = [];

add(checks, "critical", "sources_minimum", sources.length >= 20, `${sources.length} sources configurees`, "Garder une base de sources large et diversifiee.");
add(checks, "critical", "raw_items_minimum", rawItems.length >= 50, `${rawItems.length} items bruts`, "Verifier les crawlers si ce nombre chute brutalement.");
add(
  checks,
  "critical",
  "jobs_minimum",
  jobs.length >= minimumCuratedJobs,
  `${jobs.length} offres curees (seuil actuel ${minimumCuratedJobs})`,
  "Ne pas publier un catalogue vide ou trop faible. Un seuil plus bas n'est accepte que si les dates sont bien confirmees.",
);
add(checks, "critical", "sitemap_exists", Boolean(sitemap), `${sitemapUrlList.length} URLs sitemap`, "Executer npm run growth.");
add(checks, "critical", "sitemap_files_exist", missingSitemapFiles.length === 0, `${missingSitemapFiles.length} fichiers sitemap manquants`, "Regenerer les pages SEO.");
add(checks, "critical", "seed_exists", (await size(join(ROOT, "database", "seed.sql"))) > 1000, `${await size(join(ROOT, "database", "seed.sql"))} octets`, "Executer npm run db:export.");
add(checks, "critical", "sqlite_exists", (await size(join(RUNTIME_DIR, "emplois-burkina.sqlite"))) > 1000, `${await size(join(RUNTIME_DIR, "emplois-burkina.sqlite"))} octets`, "Executer npm run db:sqlite.");
add(checks, "warning", "source_diversity", Object.keys(sourceCounts).length >= 3, `${Object.keys(sourceCounts).length} sources publiees`, "Ameliorer les sources actives si le catalogue depend trop d'un site.");
add(checks, "warning", "category_diversity", Object.keys(categoryCounts).length >= 4, `${Object.keys(categoryCounts).length} categories publiees`, "Continuer a capter informel, BTP, ONG, finance et logistique.");
add(checks, "warning", "opening_dates", jobsWithOpeningDate >= Math.ceil(jobs.length * 0.5), `${jobsWithOpeningDate}/${jobs.length} avec date d'ouverture confirmee`, "Continuer a capter et confirmer les dates de publication.");
add(checks, "warning", "closing_dates", jobsWithClosingDate >= Math.ceil(jobs.length * 0.8), `${jobsWithClosingDate}/${jobs.length} avec date de cloture`, "Renforcer extraction detail et moderation dates.");
add(checks, "warning", "social_queue", socialQueue.length >= Math.min(10, jobs.length), `${socialQueue.length} posts en file`, "Executer npm run social:queue.");
add(checks, "warning", "visibility_engine", await exists(join(DATA_DIR, "growth", "visibility-report.json")), "rapport visibilite present", "Executer npm run visibility.");
add(checks, "warning", "outreach_targets", await exists(join(DATA_DIR, "growth", "outreach-targets.json")), "cibles prospection presentes", "Executer npm run visibility.");
add(checks, "warning", "project_audit", projectAudit.includes("Statut : passed"), "audit projet passed", "Executer npm run audit:project.");
add(checks, "info", "indexnow_urls", (await size(join(ROOT, "indexnow-urls.txt"))) > 0, `${await size(join(ROOT, "indexnow-urls.txt"))} octets`, "Executer npm run growth.");
add(checks, "info", "llms_txt", await exists(join(ROOT, "llms.txt")), "llms.txt present", "Executer npm run growth.");
add(checks, "info", "manifest", await exists(join(ROOT, "site.webmanifest")), "manifest present", "Executer npm run growth.");

const failedCritical = checks.filter((check) => check.severity === "critical" && !check.passed);
const failedWarnings = checks.filter((check) => check.severity === "warning" && !check.passed);
const passed = checks.filter((check) => check.passed).length;
const score = Math.round((passed / checks.length) * 100);

const quality = {
  generatedAt: new Date().toISOString(),
  score,
  status: failedCritical.length ? "failed" : failedWarnings.length ? "warning" : "passed",
  failedCritical: failedCritical.length,
  failedWarnings: failedWarnings.length,
  totals: {
    sources: sources.length,
    rawItems: rawItems.length,
    jobs: jobs.length,
    sitemapUrls: sitemapUrlList.length,
    categories: Object.keys(categoryCounts).length,
    publishedSources: Object.keys(sourceCounts).length,
  },
  checks,
  missingSitemapFiles,
};

const markdown = `# Qualite automation Emplois Burkina

Genere le : ${quality.generatedAt}

Score : ${quality.score}/100
Statut : ${quality.status}

## Checks

| Severite | Check | Etat | Detail | Recommandation |
| --- | --- | --- | --- | --- |
${checks
  .map(
    (check) =>
      `| ${check.severity} | ${check.name} | ${check.passed ? "OK" : "A corriger"} | ${check.detail} | ${check.recommendation} |`,
  )
  .join("\n")}

## Fichiers sitemap manquants

${missingSitemapFiles.length ? missingSitemapFiles.map((path) => `- ${path}`).join("\n") : "Aucun."}
`;

await mkdir(dirname(QUALITY_JSON), { recursive: true });
await mkdir(dirname(QUALITY_MD), { recursive: true });
await writeFile(QUALITY_JSON, `${JSON.stringify(quality, null, 2)}\n`, "utf8");
await writeFile(QUALITY_MD, markdown, "utf8");

console.log(`Automation quality: ${quality.status} (${quality.score}/100)`);
if (failedCritical.length && process.env.EMPLOIS_BURKINA_QUALITY_STRICT !== "false") {
  console.error(`Critical automation checks failed: ${failedCritical.map((check) => check.name).join(", ")}`);
  process.exit(1);
}
