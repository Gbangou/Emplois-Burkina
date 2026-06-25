import { readFile } from "node:fs/promises";
import { join } from "node:path";
import type {
  BenchmarkItem,
  JobOpportunity,
  PublicationBatch,
  ProductModule,
  RawScrapedItem,
  SourceDefinition,
  SourceExpansionSegment
} from "@emplois-burkina/domain";
import {
  buildAutomationOverview,
  buildPlatformSummary,
  buildScrapingOverview,
  isPublishedJob,
  normalizeSearch
} from "@emplois-burkina/domain";

const cwd = process.cwd().replace(/\\/g, "/");
const root = (cwd.endsWith("apps/web") || cwd.endsWith("apps\\web"))
  ? join(process.cwd(), "..", "..")
  : process.cwd();

async function readJson<T>(path: string, fallback: T): Promise<T> {
  try {
    const content = await readFile(join(root, path), "utf8");
    return JSON.parse(content) as T;
  } catch {
    return fallback;
  }
}

export async function getJobs() {
  const jobs = await readJson<JobOpportunity[]>("data/curated-jobs.json", []);
  return jobs.filter(isPublishedJob);
}

export async function getProductModules() {
  return readJson<ProductModule[]>("data/product-modules.json", []);
}

export async function getBenchmarkItems() {
  return readJson<BenchmarkItem[]>("data/product-benchmark.json", []);
}

export async function getScrapingOverview() {
  const [sources, jobs, rawItems] = await Promise.all([
    readJson<SourceDefinition[]>("data/sources.json", []),
    getJobs(),
    readJson<RawScrapedItem[]>("data/raw-items.json", [])
  ]);

  return buildScrapingOverview(sources, jobs, rawItems);
}

export async function getAutomationOverview() {
  const [jobs, segments] = await Promise.all([
    getJobs(),
    readJson<SourceExpansionSegment[]>("data/source-expansion-plan.json", [])
  ]);

  return buildAutomationOverview(jobs, segments);
}

export async function getPublicationBatches() {
  return readJson<PublicationBatch[]>("data/runtime/publication-batches.json", []);
}

export async function getModerationQueue(limit = 12) {
  const jobs = await readJson<JobOpportunity[]>("data/curated-jobs.json", []);
  return jobs
    .filter((job) => job.status === "needs_review" || (job.riskScore || 0) > 35 || (job.confidenceScore || 0) < 70)
    .sort((a, b) => {
      const riskDelta = (b.riskScore || 0) - (a.riskScore || 0);
      if (riskDelta) return riskDelta;
      return String(b.collectedAt || "").localeCompare(String(a.collectedAt || ""));
    })
    .slice(0, limit);
}

export async function getHomeData() {
  const [jobs, modules, benchmark, scraping, automation] = await Promise.all([
    getJobs(),
    getProductModules(),
    getBenchmarkItems(),
    getScrapingOverview(),
    getAutomationOverview()
  ]);
  const featured = jobs
    .slice()
    .sort((a, b) => (b.confidenceScore || 0) - (a.confidenceScore || 0))
    .slice(0, 6);
  const stream = jobs
    .slice()
    .sort((a, b) => String(b.collectedAt || b.closingDate || "").localeCompare(String(a.collectedAt || a.closingDate || "")))
    .slice(0, 12);
  const summary = buildPlatformSummary(jobs);
  const urgent = jobs.filter((job) => Boolean(job.closingDate)).slice(0, 4);

  return {
    featured,
    automation,
    benchmark,
    modules,
    scraping,
    summary,
    stream,
    urgent
  };
}

export function scoreJob(job: JobOpportunity, query: string) {
  const q = normalizeSearch(query);
  if (!q) return job.confidenceScore || 65;
  const haystack = normalizeSearch([job.title, job.company, job.city, job.category, job.type, ...(job.tags || [])].join(" "));
  const bonus = haystack.includes(q) ? 35 : 0;
  return Math.min(99, Math.max(45, (job.confidenceScore || 60) + bonus));
}
