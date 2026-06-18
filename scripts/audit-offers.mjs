import { mkdir, readFile, writeFile } from "node:fs/promises";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

const ROOT = fileURLToPath(new URL("..", import.meta.url));
const DATA_DIR = join(ROOT, "data");
const REPORT_JSON = join(DATA_DIR, "offer-quality-report.json");
const REPORT_MD = join(ROOT, "docs", "OFFER_VERIFICATION_AUDIT.md");
const TODAY = new Date().toISOString().slice(0, 10);

async function readJson(path, fallback) {
  try {
    return JSON.parse(await readFile(path, "utf8"));
  } catch {
    return fallback;
  }
}

function normalize(value = "") {
  return String(value)
    .toLowerCase()
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "");
}

function issue(id, severity, message, fields = {}) {
  return { id, severity, message, ...fields };
}

function auditJob(job = {}) {
  const issues = [];
  const city = String(job.city || "").trim();
  const title = String(job.title || "").trim();
  const closingDate = String(job.closingDate || "").slice(0, 10);
  const openingDate = String(job.openingDate || "").slice(0, 10);
  const normalizedCity = normalize(city);
  const foreignCity = /\b(rdc|mali|niger|senegal|tchad|benin|cameroun|rwanda|ethiopie|mauritanie|liban|afghanistan|ghana)\b/.test(
    normalizedCity
  );
  const hasInternationalSignal = /international|remote|teletravail|onu|consultance|ngo|ong/i.test(
    `${job.category || ""} ${(job.tags || []).join(" ")} ${job.sourceName || ""}`
  );

  if (!title || title.length < 10) issues.push(issue("title_weak", "high", "Titre trop court ou absent."));
  if (!job.sourceUrl || job.sourceUrl === "#") issues.push(issue("source_missing", "critical", "Lien source absent."));
  if (!closingDate) issues.push(issue("missing_closing_date", "high", "Date de cloture absente."));
  if (closingDate && closingDate < TODAY) issues.push(issue("expired", "critical", "Offre expiree.", { closingDate }));
  if (openingDate && closingDate && closingDate < openingDate) {
    issues.push(issue("inconsistent_dates", "critical", "Date de cloture avant date d'ouverture.", { openingDate, closingDate }));
  }
  if (/courant|mois|date|email|http|www|login|connexion|recherche/.test(normalizedCity)) {
    issues.push(issue("city_suspicious", "high", "Ville ou localisation suspecte.", { city }));
  }
  if (foreignCity && !hasInternationalSignal) {
    issues.push(issue("foreign_without_international_context", "medium", "Localisation hors Burkina sans contexte international.", { city }));
  }
  if (job.status !== "validated") {
    issues.push(issue("not_validated", "medium", "Offre non validee manuellement.", { status: job.status || "unknown" }));
  }

  return issues;
}

function auditFeedJob(job = {}, feed = {}) {
  const issues = [];
  const closingDate = String(job.closingDate || "").slice(0, 10);
  if (!job.title || String(job.title).length < 10) issues.push(issue("feed_title_weak", "medium", "Titre flux faible."));
  if (!job.url) issues.push(issue("feed_source_missing", "high", "Lien source flux absent."));
  if (!closingDate) issues.push(issue("feed_missing_closing_date", "medium", "Date de cloture absente dans le flux."));
  if (closingDate && closingDate < TODAY) issues.push(issue("feed_expired", "high", "Offre de flux expiree.", { closingDate }));
  if (feed.error) issues.push(issue("feed_source_error", "medium", "La source du flux signale une erreur.", { error: feed.error }));
  return issues;
}

function topIssues(items) {
  const counts = new Map();
  for (const item of items) {
    for (const current of item.issues || []) counts.set(current.id, (counts.get(current.id) || 0) + 1);
  }
  return [...counts.entries()].sort((a, b) => b[1] - a[1]);
}

const [jobs, feeds] = await Promise.all([
  readJson(join(DATA_DIR, "curated-jobs.json"), []),
  readJson(join(DATA_DIR, "international-feeds.json"), []),
]);

const auditedJobs = jobs.map((job) => ({
  id: job.id,
  title: job.title,
  sourceName: job.sourceName,
  sourceUrl: job.sourceUrl,
  city: job.city,
  closingDate: job.closingDate || "",
  status: job.status || "",
  issues: auditJob(job),
}));

const feedJobs = feeds.flatMap((feed) =>
  (feed.jobs || []).map((job) => ({
    id: job.id || `${feed.sourceId}-${job.title}`,
    title: job.title,
    sourceName: feed.name,
    sourceUrl: job.url || feed.url,
    closingDate: job.closingDate || "",
    issues: auditFeedJob(job, feed),
  }))
);

const criticalJobs = auditedJobs.filter((job) => job.issues.some((current) => current.severity === "critical"));
const reviewJobs = auditedJobs.filter((job) => job.issues.length);
const feedReviewJobs = feedJobs.filter((job) => job.issues.length);

const report = {
  generatedAt: new Date().toISOString(),
  today: TODAY,
  curated: {
    total: jobs.length,
    clean: auditedJobs.filter((job) => !job.issues.length).length,
    withIssues: reviewJobs.length,
    critical: criticalJobs.length,
    topIssues: topIssues(auditedJobs),
    reviewItems: reviewJobs,
  },
  internationalFeeds: {
    feeds: feeds.length,
    jobs: feedJobs.length,
    withIssues: feedReviewJobs.length,
    topIssues: topIssues(feedJobs),
    reviewItems: feedReviewJobs.slice(0, 80),
  },
};

const markdown = `# Audit de verification des offres JobFaso

Genere le : ${report.generatedAt}
Date de reference : ${report.today}

## Resume

- Offres curees : ${report.curated.total}
- Offres curees sans anomalie : ${report.curated.clean}
- Offres curees a revoir : ${report.curated.withIssues}
- Offres curees critiques : ${report.curated.critical}
- Flux internationaux : ${report.internationalFeeds.feeds}
- Offres issues des flux internationaux : ${report.internationalFeeds.jobs}
- Offres de flux a revoir : ${report.internationalFeeds.withIssues}

## Principales anomalies des offres curees

${report.curated.topIssues.map(([name, count]) => `- ${name} : ${count}`).join("\n") || "Aucune anomalie."}

## Offres curees a verifier

${report.curated.reviewItems
  .map(
    (job, index) => `### ${index + 1}. ${job.title}

- Source : ${job.sourceName}
- Ville : ${job.city || "Non communiquee"}
- Cloture : ${job.closingDate || "A verifier"}
- Statut : ${job.status || "unknown"}
- Lien : ${job.sourceUrl}
- Anomalies : ${job.issues.map((current) => `${current.id} (${current.severity})`).join(", ")}
`
  )
  .join("\n")}

## Principales anomalies des flux internationaux

${report.internationalFeeds.topIssues.map(([name, count]) => `- ${name} : ${count}`).join("\n") || "Aucune anomalie."}
`;

await mkdir(dirname(REPORT_JSON), { recursive: true });
await mkdir(dirname(REPORT_MD), { recursive: true });
await writeFile(REPORT_JSON, `${JSON.stringify(report, null, 2)}\n`, "utf8");
await writeFile(REPORT_MD, markdown, "utf8");

console.log(`Offer audit generated: ${report.curated.withIssues}/${report.curated.total} curated item(s) to review.`);
