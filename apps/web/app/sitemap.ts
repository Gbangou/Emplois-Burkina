import type { MetadataRoute } from "next";
import { getJobs } from "@/lib/data";

const BASE = "https://emplois-burkina.com";

export default async function sitemap(): Promise<MetadataRoute.Sitemap> {
  const jobs = await getJobs();
  const now = new Date();

  const staticRoutes: MetadataRoute.Sitemap = [
    { url: BASE, lastModified: now, changeFrequency: "daily", priority: 1.0 },
    { url: `${BASE}/jobs`, lastModified: now, changeFrequency: "hourly", priority: 0.95 },
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

  return [...staticRoutes, ...jobRoutes];
}
