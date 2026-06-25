import { mkdir, readFile, writeFile } from "node:fs/promises";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

const ROOT = fileURLToPath(new URL("..", import.meta.url));
const DATA_DIR = join(ROOT, "data");
const RUNTIME_DIR = join(DATA_DIR, "runtime");
const JOBS_FILE = join(DATA_DIR, "curated-jobs.json");
const SOURCES_FILE = join(DATA_DIR, "sources.json");
const REPORT_JSON = join(RUNTIME_DIR, "offer-quality-report.json");
const REPORT_MD = join(ROOT, "docs", "OFFER_VERIFICATION_AUDIT.md");

async function readJson(path, fallback) {
  try {
    return JSON.parse(await readFile(path, "utf8"));
  } catch {
    return fallback;
  }
}

function parseDate(value) {
  if (!value || !/^\d{4}-\d{2}-\d{2}$/.test(String(value).slice(0, 10))) return null;
  const date = new Date(`${String(value).slice(0, 10)}T00:00:00Z`);
  return Number.isNaN(date.getTime()) ? null : date;
}

function isExpired(job, now = new Date()) {
  const closing = parseDate(job.closingDate);
  if (!closing) return false;
  const today = new Date(Date.UTC(now.getUTCFullYear(), now.getUTCMonth(), now.getUTCDate()));
  return closing < today;
}

function daysUntil(value, now = new Date()) {
  const target = parseDate(value);
  if (!target) return null;
  const today = new Date(Date.UTC(now.getUTCFullYear(), now.getUTCMonth(), now.getUTCDate()));
  return Math.ceil((target - today) / 86_400_000);
}

function validUrl(value) {
  try {
    const url = new URL(value);
    return ["http:", "https:"].includes(url.protocol);
  } catch {
    return false;
  }
}

function looksLikeBadCity(city = "") {
  return /\b(courant|mois|date|deadline|cl[oô]ture|publication|candidature|offre|semaine)\b/i.test(city);
}

function sourceReliability(source = {}) {
  const base = source.official ? 25 : 10;
  const typeBoost = /official|institution|ong|rss|sitemap/i.test([source.type, source.name, source.url].join(" ")) ? 10 : 0;
  return Math.min(35, base + typeBoost);
}

function evaluateJob(job, sourceByName, now) {
  const issues = [];
  const warnings = [];
  const source = sourceByName.get(job.sourceName) || {};

  if (!job.title) issues.push("missing_title");
  if (!job.company) warnings.push("missing_company");
  if (!job.sourceUrl || !validUrl(job.sourceUrl)) issues.push("invalid_source_url");
  if (!job.closingDate) issues.push("missing_closing_date");
  if (job.closingDate && !parseDate(job.closingDate)) issues.push("invalid_closing_date");
  if (job.openingDate && !parseDate(job.openingDate)) warnings.push("invalid_opening_date");
  if (job.openingDate && job.closingDate && parseDate(job.closingDate) < parseDate(job.openingDate)) {
    issues.push("closing_before_opening");
  }
  if (job.inconsistentDates) issues.push("inconsistent_dates");
  if (isExpired(job, now)) issues.push("expired");
  if (looksLikeBadCity(job.city)) warnings.push("city_looks_like_scraped_noise");
  if ((Number(job.confidenceScore) || 0) < 60) warnings.push("low_confidence_score");
  if (job.status === "rejected") issues.push("rejected");
  if (job.status === "needs_review") warnings.push("needs_review");

  const hasReliableDate = Boolean(job.closingDate && parseDate(job.closingDate) && !isExpired(job, now));
  const sourceScore = sourceReliability(source);
  let score = 35 + sourceScore;
  if (job.sourceUrl && validUrl(job.sourceUrl)) score += 10;
  if (hasReliableDate) score += 20;
  if (job.openingDate && parseDate(job.openingDate)) score += 5;
  score += Math.min(10, Math.max(0, Math.round((Number(job.confidenceScore) || 0) / 10)));
  score -= issues.length * 18;
  score -= warnings.length * 7;
  score = Math.max(0, Math.min(100, score));

  const publicState = issues.includes("expired") || issues.includes("rejected")
    ? "hidden"
    : issues.length
      ? "review_required"
      : warnings.length
        ? "publish_with_warning"
        : "publishable";

  const remainingDays = daysUntil(job.closingDate, now);
  return {
    id: job.id,
    title: job.title,
    company: job.company,
    city: job.city,
    category: job.category,
    sourceName: job.sourceName,
    sourceUrl: job.sourceUrl,
    status: job.status || "needs_review",
    closingDate: job.closingDate || "",
    openingDate: job.openingDate || "",
    remainingDays,
    expired: isExpired(job, now),
    publicState,
    score,
    issues,
    warnings,
    recommendedAction: issues.length
      ? "Verifier la source, corriger les dates ou retirer de la publication."
      : warnings.length
        ? "Publier avec prudence et completer les champs faibles."
        : "Offre publiable.",
  };
}

function countBy(items, getter) {
  return items.reduce((acc, item) => {
    const key = getter(item) || "Autre";
    acc[key] = (acc[key] || 0) + 1;
    return acc;
  }, {});
}

const now = new Date();
const [jobs, sources] = await Promise.all([readJson(JOBS_FILE, []), readJson(SOURCES_FILE, [])]);
const sourceByName = new Map(sources.map((source) => [source.name, source]));
const items = jobs.map((job) => evaluateJob(job, sourceByName, now));
const publishable = items.filter((item) => item.publicState === "publishable" || item.publicState === "publish_with_warning");
const hidden = items.filter((item) => item.publicState === "hidden");
const reviewRequired = items.filter((item) => item.publicState === "review_required");
const missingClosingDate = items.filter((item) => item.issues.includes("missing_closing_date"));
const expired = items.filter((item) => item.expired);
const sourceCounts = countBy(items, (item) => item.sourceName);
const issueCounts = countBy(items.flatMap((item) => item.issues), (issue) => issue);
const warningCounts = countBy(items.flatMap((item) => item.warnings), (warning) => warning);
const averageScore = items.length ? Math.round(items.reduce((sum, item) => sum + item.score, 0) / items.length) : 0;
const targetClosingCoverage = Math.ceil(items.length * 0.9);
const closingCoverage = items.filter((item) => item.closingDate).length;
const critical = [];

if (closingCoverage < targetClosingCoverage) critical.push("closing_date_coverage_below_90_percent");
if (hidden.length > Math.ceil(items.length * 0.2)) critical.push("too_many_hidden_or_expired_offers");
if (reviewRequired.length > Math.ceil(items.length * 0.35)) critical.push("too_many_review_required_offers");

const report = {
  generatedAt: now.toISOString(),
  score: averageScore,
  status: critical.length ? "needs_work" : missingClosingDate.length ? "watch" : "passed",
  critical,
  totals: {
    jobs: items.length,
    publishable: publishable.length,
    hidden: hidden.length,
    reviewRequired: reviewRequired.length,
    expired: expired.length,
    missingClosingDate: missingClosingDate.length,
    withClosingDate: closingCoverage,
    closingCoveragePercent: items.length ? Math.round((closingCoverage / items.length) * 100) : 0,
    sources: Object.keys(sourceCounts).length,
  },
  issueCounts,
  warningCounts,
  sourceCounts,
  topReviewQueue: items
    .filter((item) => item.issues.length || item.warnings.length)
    .sort((a, b) => a.score - b.score || String(a.sourceName).localeCompare(String(b.sourceName), "fr"))
    .slice(0, 30),
  items,
};

const markdown = `# Audit de verification des offres Emplois Burkina

Genere le : ${report.generatedAt}

Score moyen : ${report.score}/100
Statut : ${report.status}

## Synthese

- Offres analysees : ${report.totals.jobs}
- Offres publiables ou publiables avec alerte : ${report.totals.publishable}
- Offres a verifier avant publication : ${report.totals.reviewRequired}
- Offres cachees ou expirees : ${report.totals.hidden}
- Offres expirees : ${report.totals.expired}
- Offres avec date de cloture : ${report.totals.withClosingDate} (${report.totals.closingCoveragePercent}%)
- Offres sans date de cloture : ${report.totals.missingClosingDate}
- Sources representees : ${report.totals.sources}

## Points critiques

${critical.length ? critical.map((item) => `- ${item}`).join("\n") : "Aucun point critique bloquant."}

## Principaux problemes

${Object.entries(issueCounts).length ? Object.entries(issueCounts).map(([key, value]) => `- ${key} : ${value}`).join("\n") : "Aucun probleme critique detecte."}

## Alertes a surveiller

${Object.entries(warningCounts).length ? Object.entries(warningCounts).map(([key, value]) => `- ${key} : ${value}`).join("\n") : "Aucune alerte."}

## File de revue prioritaire

${report.topReviewQueue.length ? report.topReviewQueue.map((item, index) => `### ${index + 1}. ${item.title}

- Score : ${item.score}/100
- Etat public : ${item.publicState}
- Source : ${item.sourceName}
- Ville : ${item.city || "A verifier"}
- Cloture : ${item.closingDate || "A verifier"}
- Problemes : ${item.issues.join(", ") || "Aucun"}
- Alertes : ${item.warnings.join(", ") || "Aucune"}
- Action : ${item.recommendedAction}
- Lien : ${item.sourceUrl || "A verifier"}
`).join("\n") : "Aucune offre en revue prioritaire."}
`;

await mkdir(dirname(REPORT_JSON), { recursive: true });
await mkdir(dirname(REPORT_MD), { recursive: true });
await writeFile(REPORT_JSON, `${JSON.stringify(report, null, 2)}\n`, "utf8");
await writeFile(REPORT_MD, markdown, "utf8");

console.log(`Offer audit: ${report.status} (${report.score}/100, ${report.totals.publishable}/${report.totals.jobs} publishable).`);
