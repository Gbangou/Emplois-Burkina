import { NextRequest, NextResponse } from "next/server";
import { getJobs, scoreJob } from "@/lib/data";
import { normalizeSearch } from "@emplois-burkina/domain";

export async function GET(req: NextRequest) {
  const params = req.nextUrl.searchParams;
  const q = params.get("q") || "";
  const city = params.get("city") || "";
  const category = params.get("category") || "";
  const sort = params.get("sort") || "relevance";
  const page = Math.max(0, Number(params.get("page") || "0"));
  const limit = Math.min(Number(params.get("limit") || "12"), 24);

  const jobs = await getJobs();

  const filtered = jobs
    .filter((job) => {
      if (!q) return true;
      const hay = normalizeSearch([job.title, job.company, job.city, job.category, job.type, ...(job.tags || [])].join(" "));
      return hay.includes(normalizeSearch(q));
    })
    .filter((job) => !city || normalizeSearch(job.city).includes(normalizeSearch(city)))
    .filter((job) => !category || normalizeSearch(job.category).includes(normalizeSearch(category)))
    .sort((a, b) => {
      if (sort === "deadline") return String(a.closingDate || "9999").localeCompare(String(b.closingDate || "9999"));
      if (sort === "confidence") return (b.confidenceScore || 0) - (a.confidenceScore || 0);
      if (sort === "recent") return String(b.collectedAt || "").localeCompare(String(a.collectedAt || ""));
      return scoreJob(b, q) - scoreJob(a, q);
    });

  const start = page * limit;
  const items = filtered.slice(start, start + limit);
  const hasMore = start + limit < filtered.length;

  return NextResponse.json({
    jobs: items,
    total: filtered.length,
    page,
    limit,
    hasMore,
    pages: Math.ceil(filtered.length / limit)
  }, {
    headers: {
      "Cache-Control": "public, s-maxage=30, stale-while-revalidate=60"
    }
  });
}
