import { mkdir, readFile, writeFile } from "node:fs/promises";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

const ROOT = fileURLToPath(new URL("..", import.meta.url));
const DATA_DIR = join(ROOT, "data");
const RUNTIME_DIR = join(DATA_DIR, "runtime");
const LOCAL_DB_FILE = join(RUNTIME_DIR, "local-db.json");

async function readJson(file, fallback) {
  try {
    return JSON.parse(await readFile(file, "utf8"));
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

function publicConfig(config) {
  return {
    siteName: config.siteName,
    baseUrl: config.baseUrl,
    country: config.country,
    defaultCity: config.defaultCity,
    description: config.description,
    hasWhatsApp: Boolean(config.whatsappNumber),
    hasAdsense: Boolean(config.adsenseClient),
    social: {
      facebook: Boolean(config.social?.facebook),
      linkedin: Boolean(config.social?.linkedin),
      whatsappChannel: Boolean(config.social?.whatsappChannel),
    },
  };
}

function summarizeJobs(jobs) {
  const sourceCounts = countBy(jobs, (job) => job.sourceName);
  const categoryCounts = countBy(jobs, (job) => job.category);
  const cityCounts = countBy(jobs, (job) => job.city);
  return {
    total: jobs.length,
    withClosingDate: jobs.filter((job) => job.closingDate).length,
    needsReview: jobs.filter((job) => job.status === "needs_review").length,
    sources: Object.keys(sourceCounts).length,
    categories: Object.entries(categoryCounts).sort((a, b) => b[1] - a[1]),
    cities: Object.entries(cityCounts).sort((a, b) => b[1] - a[1]),
    sourceCounts: Object.entries(sourceCounts).sort((a, b) => b[1] - a[1]),
  };
}

const [config, jobs, sources, rateCards, rawItems, leads, events] = await Promise.all([
  readJson(join(DATA_DIR, "site-config.json"), {}),
  readJson(join(DATA_DIR, "curated-jobs.json"), []),
  readJson(join(DATA_DIR, "sources.json"), []),
  readJson(join(DATA_DIR, "rate-card.json"), []),
  readJson(join(DATA_DIR, "raw-items.json"), []),
  readJson(join(RUNTIME_DIR, "leads.json"), []),
  readJson(join(RUNTIME_DIR, "events.json"), []),
]);

const db = {
  version: 1,
  generatedAt: new Date().toISOString(),
  lastSyncReason: "cli_sync",
  config: publicConfig(config),
  jobs,
  sources,
  rateCards,
  rawItemsCount: rawItems.length,
  leads,
  events,
  stats: summarizeJobs(jobs),
  monetization: {
    publicAdSlots: ["homepage_featured", "category_sponsor", "job_detail_rail", "guide_sponsor"],
    directSalesFirst: true,
    adsenseReady: Boolean(config.adsenseClient),
  },
};

await mkdir(dirname(LOCAL_DB_FILE), { recursive: true });
await writeFile(LOCAL_DB_FILE, `${JSON.stringify(db, null, 2)}\n`, "utf8");

console.log(
  `DB locale synchronisee: ${db.jobs.length} offres, ${db.sources.length} sources, ${db.rawItemsCount} items bruts.`,
);
