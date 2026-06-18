import { readFile } from "node:fs/promises";
import { join, resolve } from "node:path";
import {
  SEARCH_EQUIVALENTS,
  SPECIAL_JOB_FILTERS,
  SPECIAL_JOB_FILTER_LABEL,
} from "../assets/js/app-config.js";
import {
  boundedDistance,
  normalize,
  tokenizeNormalized,
} from "../assets/js/app-utils.js";
import { createSearchHelpers } from "../assets/js/search-helpers.js";

const ROOT = resolve(new URL("..", import.meta.url).pathname.replace(/^\/([A-Za-z]:)/, "$1"));
const curatedJobs = JSON.parse(await readFile(join(ROOT, "data", "curated-jobs.json"), "utf8"));
const sources = JSON.parse(await readFile(join(ROOT, "data", "sources.json"), "utf8"));
const sourceIndex = new Map(sources.filter((source) => source?.name).map((source) => [normalize(source.name), source]));

function getSourceRecord(sourceName = "") {
  return sourceIndex.get(normalize(sourceName)) || null;
}

function getSourceSegments(source = {}) {
  return Array.isArray(source.segments) ? source.segments.map((segment) => normalize(segment)) : [];
}

const {
  buildJobSearchCache,
  getJobSearchScore,
  getJobSearchableText,
  matchesSpecialJobFilter,
} = createSearchHelpers({
  searchEquivalents: SEARCH_EQUIVALENTS,
  specialJobFilters: SPECIAL_JOB_FILTERS,
  getJobSearchCache: () => searchCache,
  getSourceRecord,
  getSourceSegments,
  normalize,
  tokenizeNormalized,
  boundedDistance,
});

const jobs = curatedJobs.filter((job) => job && job.title && !["rejected", "expired"].includes(job.status));
const searchCache = buildJobSearchCache(jobs);
const failures = [];

function assert(condition, message) {
  if (!condition) failures.push(message);
}

function searchJobs({ q = "", category = "", city = "", source = "" }) {
  const normalizedQuery = normalize(q);
  return jobs.filter((job) => {
    const haystack = searchCache.get(job.id)?.searchable || getJobSearchableText(job);
    const searchScore = getJobSearchScore(job, normalizedQuery);
    const matchesQuery = !normalizedQuery || searchScore > 0 || haystack.includes(normalizedQuery);
    const matchesCategory = !category || matchesSpecialJobFilter(job, category) || job.category === category;
    const matchesCity = !city || job.city === city || job.city === "Tout le Burkina" || job.city === "Burkina Faso";
    const matchesSource = !source || job.sourceName === source;
    return matchesQuery && matchesCategory && matchesCity && matchesSource;
  });
}

const searchCases = [
  { label: "recherche simple chauffeur", q: "chauffeur" },
  { label: "recherche ONG", q: "ONG" },
  { label: "recherche teletravail", q: "teletravail" },
  { label: "filtre ONU / Consultance", category: SPECIAL_JOB_FILTER_LABEL },
  { label: "filtre metiers terrain", category: "Metiers terrain et informels" },
  { label: "filtre par source BFemploi", source: "BFemploi" },
];

for (const testCase of searchCases) {
  const results = searchJobs(testCase);
  assert(results.length > 0, `${testCase.label}: aucun resultat`);
}

for (const job of jobs) {
  assert(job.sourceUrl && /^https?:\/\//i.test(job.sourceUrl), `${job.title}: lien source absent ou non absolu`);
  assert(job.sourceUrl !== "#", `${job.title}: lien source fictif`);
  assert(!/\s/.test(job.sourceUrl), `${job.title}: lien source contient un espace`);
  assert(job.canonicalUrl && /^https?:\/\//i.test(job.canonicalUrl), `${job.title}: canonicalUrl absent ou non absolu`);
}

const sourceNames = new Set(sources.map((source) => source.name).filter(Boolean));
for (const job of jobs) {
  assert(sourceNames.has(job.sourceName), `${job.title}: source inconnue (${job.sourceName || "vide"})`);
}

if (failures.length) {
  console.error("Search/link verification failed:");
  for (const failure of failures) console.error(`- ${failure}`);
  process.exit(1);
}

console.log(`Search/link verification passed: ${searchCases.length} parcours, ${jobs.length} offres, ${sources.length} sources.`);
