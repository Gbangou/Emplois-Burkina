import type { MetadataRoute } from "next";
import { getJobs } from "@/lib/data";
import { GUIDES } from "@/lib/guides";
import { MARKET_PAGES } from "@/lib/market-pages";

const BASE = "https://emplois-burkina.com";

export default async function sitemap(): Promise<MetadataRoute.Sitemap> {
  const jobs = await getJobs();
  const now = new Date();

  const staticRoutes: MetadataRoute.Sitemap = [
    { url: BASE, lastModified: now, changeFrequency: "daily", priority: 1.0 },
    { url: `${BASE}/jobs`, lastModified: now, changeFrequency: "hourly", priority: 0.95 },
    { url: `${BASE}/international`, lastModified: now, changeFrequency: "daily", priority: 0.9 },
    { url: `${BASE}/guides`, lastModified: now, changeFrequency: "weekly", priority: 0.88 },
    { url: `${BASE}/marches`, lastModified: now, changeFrequency: "weekly", priority: 0.87 },
    { url: `${BASE}/services`, lastModified: now, changeFrequency: "weekly", priority: 0.85 },
    { url: `${BASE}/security`, lastModified: now, changeFrequency: "monthly", priority: 0.7 },
    { url: `${BASE}/annonceurs`, lastModified: now, changeFrequency: "weekly", priority: 0.8 },
    { url: `${BASE}/contact`, lastModified: now, changeFrequency: "monthly", priority: 0.5 },
    { url: `${BASE}/privacy`, lastModified: now, changeFrequency: "monthly", priority: 0.3 }
  ];

  const jobRoutes: MetadataRoute.Sitemap = jobs.map((job) => ({
    url: `${BASE}/jobs/${job.id}`,
    lastModified: job.collectedAt ? new Date(job.collectedAt) : now,
    changeFrequency: "weekly" as const,
    priority: job.confidenceScore && job.confidenceScore >= 80 ? 0.8 : 0.65
  }));

  const guideRoutes: MetadataRoute.Sitemap = GUIDES.map((guide) => ({
    url: `${BASE}/guides/${guide.slug}`,
    lastModified: now,
    changeFrequency: "monthly" as const,
    priority: 0.82
  }));

  const marketRoutes: MetadataRoute.Sitemap = MARKET_PAGES.map((page) => ({
    url: `${BASE}/marches/${page.slug}`,
    lastModified: now,
    changeFrequency: "weekly" as const,
    priority: 0.83
  }));

  return [...staticRoutes, ...guideRoutes, ...marketRoutes, ...jobRoutes];
}
