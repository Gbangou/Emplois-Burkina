import { NextResponse } from "next/server";
import { getJobs } from "@/lib/data";
import { GUIDES } from "@/lib/guides";
import { MARKET_PAGES } from "@/lib/market-pages";
import { getJobDeadline, isIndexableJob, SITE_URL } from "@/lib/seo";

type FeedItem = {
  title: string;
  url: string;
  description: string;
  date: Date;
  category: string;
};

function escapeXml(value: string) {
  return value
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/"/g, "&quot;")
    .replace(/'/g, "&apos;");
}

function validDate(value?: string | null) {
  if (!value) return null;
  const date = new Date(value);
  return Number.isNaN(date.getTime()) ? null : date;
}

async function getFeedItems(): Promise<FeedItem[]> {
  const now = new Date();
  const jobs = await getJobs();

  const jobItems = jobs
    .filter((job) => isIndexableJob(job, now))
    .slice()
    .sort((a, b) => String(b.collectedAt || "").localeCompare(String(a.collectedAt || "")))
    .slice(0, 60)
    .map((job) => ({
      title: job.title,
      url: `${SITE_URL}/jobs/${job.id}`,
      description: [
        job.excerpt || `${job.title} chez ${job.company || job.sourceName || "une organisation"}.`,
        job.city ? `Lieu: ${job.city}.` : "",
        getJobDeadline(job) ? `Deadline: ${getJobDeadline(job)}.` : ""
      ].filter(Boolean).join(" "),
      date: validDate(job.collectedAt || job.openingDate || getJobDeadline(job)) || now,
      category: job.category || "Offre"
    }));

  const guideItems = GUIDES.map((guide) => ({
    title: guide.title,
    url: `${SITE_URL}/guides/${guide.slug}`,
    description: guide.description,
    date: now,
    category: "Guide"
  }));

  const marketItems = MARKET_PAGES.map((page) => ({
    title: page.title,
    url: `${SITE_URL}/marches/${page.slug}`,
    description: page.description,
    date: now,
    category: page.kind === "city" ? "Ville" : "Marche emploi"
  }));

  return [...jobItems, ...guideItems, ...marketItems].sort((a, b) => b.date.getTime() - a.date.getTime());
}

export async function GET() {
  const items = await getFeedItems();
  const updated = items[0]?.date || new Date();

  const body = `<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
  <channel>
    <title>Emplois Burkina - Offres et guides</title>
    <link>${SITE_URL}</link>
    <description>Offres d'emploi, concours, guides candidats et pages marche au Burkina Faso.</description>
    <language>fr-BF</language>
    <lastBuildDate>${updated.toUTCString()}</lastBuildDate>
    <atom:link href="${SITE_URL}/feed.xml" rel="self" type="application/rss+xml" />
${items.map((item) => `    <item>
      <title>${escapeXml(item.title)}</title>
      <link>${escapeXml(item.url)}</link>
      <guid isPermaLink="true">${escapeXml(item.url)}</guid>
      <description>${escapeXml(item.description)}</description>
      <category>${escapeXml(item.category)}</category>
      <pubDate>${item.date.toUTCString()}</pubDate>
    </item>`).join("\n")}
  </channel>
</rss>
`;

  return new NextResponse(body, {
    headers: {
      "Content-Type": "application/rss+xml; charset=utf-8",
      "Cache-Control": "public, s-maxage=900, stale-while-revalidate=3600"
    }
  });
}
