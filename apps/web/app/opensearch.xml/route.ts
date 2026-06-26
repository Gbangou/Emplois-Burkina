import { NextResponse } from "next/server";
import { SITE_URL } from "@/lib/seo";

function escapeXml(value: string) {
  return value
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/"/g, "&quot;")
    .replace(/'/g, "&apos;");
}

export async function GET() {
  const body = `<?xml version="1.0" encoding="UTF-8"?>
<OpenSearchDescription xmlns="http://a9.com/-/spec/opensearch/1.1/">
  <ShortName>Emplois Burkina</ShortName>
  <Description>Rechercher des offres d'emploi, concours, stages et guides au Burkina Faso.</Description>
  <InputEncoding>UTF-8</InputEncoding>
  <Language>fr-BF</Language>
  <Image height="16" width="16" type="image/png">${escapeXml(`${SITE_URL}/icon-192.png`)}</Image>
  <Url type="text/html" method="get" template="${escapeXml(`${SITE_URL}/jobs?q={searchTerms}`)}" />
  <Url type="application/rss+xml" rel="results" method="get" template="${escapeXml(`${SITE_URL}/feed.xml?q={searchTerms}`)}" />
</OpenSearchDescription>
`;

  return new NextResponse(body, {
    headers: {
      "Content-Type": "application/opensearchdescription+xml; charset=utf-8",
      "Cache-Control": "public, s-maxage=86400, stale-while-revalidate=604800"
    }
  });
}
