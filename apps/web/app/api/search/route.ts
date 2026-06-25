import { NextRequest, NextResponse } from "next/server";
import { getJobs } from "@/lib/data";
import { normalizeSearch } from "@emplois-burkina/domain";

export async function GET(req: NextRequest) {
  const q = req.nextUrl.searchParams.get("q") || "";
  const limit = Math.min(Number(req.nextUrl.searchParams.get("limit") || "6"), 20);

  if (!q.trim()) {
    return NextResponse.json({ jobs: [] });
  }

  const jobs = await getJobs();
  const normalized = normalizeSearch(q);

  const results = jobs
    .filter((job) => {
      const haystack = normalizeSearch(
        [job.title, job.company, job.city, job.category, job.type, ...(job.tags || [])].join(" ")
      );
      return haystack.includes(normalized);
    })
    .sort((a, b) => (b.confidenceScore || 0) - (a.confidenceScore || 0))
    .slice(0, limit)
    .map((job) => ({
      id: job.id,
      title: job.title,
      company: job.company,
      city: job.city,
      category: job.category
    }));

  return NextResponse.json({ jobs: results });
}
