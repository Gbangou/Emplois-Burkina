import { NextResponse } from "next/server";
import { getJobs } from "@/lib/data";
import { GUIDES } from "@/lib/guides";
import { MARKET_PAGES } from "@/lib/market-pages";
import { getJobDeadline, isIndexableJob, SITE_URL } from "@/lib/seo";

function validDate(value?: string | null) {
  if (!value) return null;
  const date = new Date(value);
  return Number.isNaN(date.getTime()) ? null : date;
}

export async function GET() {
  const now = new Date();
  const jobs = await getJobs();

  const items = [
    ...jobs
      .filter((job) => isIndexableJob(job, now))
      .slice()
      .sort((a, b) => String(b.collectedAt || "").localeCompare(String(a.collectedAt || "")))
      .slice(0, 60)
      .map((job) => {
        const url = `${SITE_URL}/jobs/${job.id}`;
        const date = validDate(job.collectedAt || job.openingDate || getJobDeadline(job)) || now;

        return {
          id: url,
          url,
          title: job.title,
          content_text: [
            job.excerpt || `${job.title} chez ${job.company || job.sourceName || "une organisation"}.`,
            job.city ? `Lieu: ${job.city}.` : "",
            getJobDeadline(job) ? `Deadline: ${getJobDeadline(job)}.` : ""
          ].filter(Boolean).join(" "),
          date_published: date.toISOString(),
          tags: [job.category, job.city, job.type].filter(Boolean)
        };
      }),
    ...GUIDES.map((guide) => ({
      id: `${SITE_URL}/guides/${guide.slug}`,
      url: `${SITE_URL}/guides/${guide.slug}`,
      title: guide.title,
      content_text: guide.description,
      date_published: now.toISOString(),
      tags: ["Guide", ...guide.keywords]
    })),
    ...MARKET_PAGES.map((page) => ({
      id: `${SITE_URL}/marches/${page.slug}`,
      url: `${SITE_URL}/marches/${page.slug}`,
      title: page.title,
      content_text: page.description,
      date_published: now.toISOString(),
      tags: [page.kind, "Marche emploi"]
    }))
  ].sort((a, b) => String(b.date_published).localeCompare(String(a.date_published)));

  return NextResponse.json({
    version: "https://jsonfeed.org/version/1.1",
    title: "Emplois Burkina - Offres et guides",
    home_page_url: SITE_URL,
    feed_url: `${SITE_URL}/feed.json`,
    language: "fr-BF",
    description: "Offres d'emploi, concours, guides candidats et pages marche au Burkina Faso.",
    items
  }, {
    headers: {
      "Cache-Control": "public, s-maxage=900, stale-while-revalidate=3600"
    }
  });
}
