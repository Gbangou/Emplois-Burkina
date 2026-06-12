import { mkdir, readFile, stat, writeFile } from "node:fs/promises";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

const ROOT = fileURLToPath(new URL("..", import.meta.url));
const DATA_DIR = join(ROOT, "data");
const RUNTIME_DIR = join(DATA_DIR, "runtime");
const REPORT_JSON = join(RUNTIME_DIR, "automation-report.json");
const REPORT_MD = join(ROOT, "docs", "AUTOMATION_REPORT.md");

async function readJson(path, fallback) {
  try {
    return JSON.parse(await readFile(path, "utf8"));
  } catch {
    return fallback;
  }
}

function countBy(items, getter) {
  return items.reduce((acc, item) => {
    const key = getter(item) || "Autre";
    acc[key] = (acc[key] || 0) + 1;
    return acc;
  }, {});
}

function daysUntil(value) {
  if (!value) return null;
  const target = new Date(`${String(value).slice(0, 10)}T23:59:59Z`);
  if (Number.isNaN(target.getTime())) return null;
  const today = new Date();
  today.setHours(0, 0, 0, 0);
  return Math.ceil((target - today) / 86_400_000);
}

function topEntries(counts, limit = 12) {
  return Object.entries(counts)
    .sort((a, b) => b[1] - a[1] || a[0].localeCompare(b[0], "fr"))
    .slice(0, limit)
    .map(([name, count]) => ({ name, count }));
}

async function fileSize(path) {
  try {
    const info = await stat(path);
    return info.size;
  } catch {
    return 0;
  }
}

function markdownTable(rows) {
  if (!rows.length) return "Aucune donnee.";
  return ["| Nom | Total |", "| --- | ---: |", ...rows.map((row) => `| ${row.name} | ${row.count} |`)].join("\n");
}

const [sources, rawItems, jobs, scraperReport, automationState, qualityGate, dateReviewQueue, socialQueue, visibilityReport] = await Promise.all([
  readJson(join(DATA_DIR, "sources.json"), []),
  readJson(join(DATA_DIR, "raw-items.json"), []),
  readJson(join(DATA_DIR, "curated-jobs.json"), []),
  readJson(join(RUNTIME_DIR, "scraper-report.json"), {}),
  readJson(join(RUNTIME_DIR, "automation-state.json"), {}),
  readJson(join(RUNTIME_DIR, "automation-quality.json"), {}),
  readJson(join(RUNTIME_DIR, "date-review-queue.json"), []),
  readJson(join(DATA_DIR, "social", "queue.json"), []),
  readJson(join(DATA_DIR, "growth", "visibility-report.json"), {}),
]);

const closingSoon = jobs
  .map((job) => ({ ...job, days: daysUntil(job.closingDate) }))
  .filter((job) => job.days !== null && job.days >= 0 && job.days <= 7)
  .sort((a, b) => a.days - b.days);
const expired = jobs.filter((job) => {
  const days = daysUntil(job.closingDate);
  return days !== null && days < 0;
});
const missingClosingDate = jobs.filter((job) => !job.closingDate);

const report = {
  generatedAt: new Date().toISOString(),
  automation: {
    status: automationState.status || "unknown",
    lastSuccessAt: automationState.lastSuccessAt || "",
    durationMs: automationState.durationMs || 0,
    runCount: automationState.runCount || 0,
    successCount: automationState.successCount || 0,
    failureCount: automationState.failureCount || 0,
    lastError: automationState.lastError || "",
  },
  quality: {
    status: qualityGate.status || "unknown",
    score: qualityGate.score ?? null,
    failedCritical: qualityGate.failedCritical || 0,
    failedWarnings: qualityGate.failedWarnings || 0,
  },
  totals: {
    sources: sources.length,
    automaticSources: sources.filter((source) => source.collection !== "manual_only").length,
    manualSources: sources.filter((source) => source.collection === "manual_only").length,
    rawItems: rawItems.length,
    jobs: jobs.length,
    needsReview: jobs.filter((job) => job.status === "needs_review").length,
    withClosingDate: jobs.filter((job) => job.closingDate).length,
    missingClosingDate: missingClosingDate.length,
    closingSoon: closingSoon.length,
    expired: expired.length,
    socialQueue: socialQueue.length,
    dateReviewQueue: dateReviewQueue.length,
    visibilityScore: visibilityReport.score ?? null,
    outreachTargets: visibilityReport.totals?.outreachTargets || 0,
    sitemapUrls: visibilityReport.totals?.sitemapUrls || 0,
    sqliteBytes: await fileSize(join(RUNTIME_DIR, "jobfaso.sqlite")),
    scraperErrors: scraperReport.errorCount || 0,
    seedSqlBytes: await fileSize(join(ROOT, "database", "seed.sql")),
  },
  categories: topEntries(countBy(jobs, (job) => job.category)),
  cities: topEntries(countBy(jobs, (job) => job.city)),
  sources: topEntries(countBy(jobs, (job) => job.sourceName)),
  closingSoon: closingSoon.slice(0, 10).map((job) => ({
    title: job.title,
    sourceName: job.sourceName,
    closingDate: job.closingDate,
    days: job.days,
  })),
  missingClosingDate: missingClosingDate.slice(0, 10).map((job) => ({
    title: job.title,
    sourceName: job.sourceName,
    category: job.category,
  })),
  scraperErrors: (scraperReport.errors || []).slice(0, 20),
};

const markdown = `# Rapport automation JobFaso

Genere le : ${report.generatedAt}

## Resume

- Etat : ${report.automation.status}
- Dernier succes : ${report.automation.lastSuccessAt || "Aucun"}
- Duree derniere run : ${Math.round(report.automation.durationMs / 1000)}s
- Runs : ${report.automation.runCount} total, ${report.automation.successCount} succes, ${report.automation.failureCount} echecs
- Quality gate : ${report.quality.status} (${report.quality.score ?? "-"} / 100)
- Checks critiques en echec : ${report.quality.failedCritical}
- Warnings quality gate : ${report.quality.failedWarnings}
- Sources : ${report.totals.sources} (${report.totals.automaticSources} automatiques, ${report.totals.manualSources} manuelles)
- Items bruts : ${report.totals.rawItems}
- Offres : ${report.totals.jobs}
- Offres a moderer : ${report.totals.needsReview}
- Offres avec date de cloture : ${report.totals.withClosingDate}
- Offres sans date de cloture : ${report.totals.missingClosingDate}
- Offres cloturant sous 7 jours : ${report.totals.closingSoon}
- Offres expirees : ${report.totals.expired}
- Posts sociaux en file : ${report.totals.socialQueue}
- Dates en file de revue : ${report.totals.dateReviewQueue}
- Score visibilite : ${report.totals.visibilityScore ?? "-"} / 100
- Cibles backlinks/partenariats : ${report.totals.outreachTargets}
- URLs sitemap : ${report.totals.sitemapUrls}
- Taille SQLite locale : ${report.totals.sqliteBytes} octets
- Erreurs scraper : ${report.totals.scraperErrors}
- Taille seed SQL : ${report.totals.seedSqlBytes} octets

## Categories

${markdownTable(report.categories)}

## Villes

${markdownTable(report.cities)}

## Sources publiees

${markdownTable(report.sources)}

## Deadlines proches

${report.closingSoon.length ? report.closingSoon.map((job) => `- ${job.days}j : ${job.title} (${job.sourceName}) - ${job.closingDate}`).join("\n") : "Aucune deadline proche."}

## Offres sans date de cloture

${report.missingClosingDate.length ? report.missingClosingDate.map((job) => `- ${job.title} (${job.sourceName}) - ${job.category}`).join("\n") : "Toutes les offres ont une date de cloture."}

## Erreurs scraper recentes

${report.scraperErrors.length ? report.scraperErrors.map((error) => `- ${error.source}: ${error.message}`).join("\n") : "Aucune erreur scraper recente."}
`;

await mkdir(dirname(REPORT_JSON), { recursive: true });
await mkdir(dirname(REPORT_MD), { recursive: true });
await writeFile(REPORT_JSON, `${JSON.stringify(report, null, 2)}\n`, "utf8");
await writeFile(REPORT_MD, markdown, "utf8");

console.log(`Automation report generated: ${REPORT_JSON}`);
console.log(`Markdown report generated: ${REPORT_MD}`);
