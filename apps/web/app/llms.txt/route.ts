import { NextResponse } from "next/server";
import { AFFILIATE_RECOMMENDATIONS } from "@/lib/affiliate-recommendations";
import { GUIDES } from "@/lib/guides";
import { MARKET_PAGES } from "@/lib/market-pages";
import { SITE_URL } from "@/lib/seo";

export async function GET() {
  const guideLinks = GUIDES.map((guide) => `- [${guide.title}](${SITE_URL}/guides/${guide.slug}): ${guide.description}`).join("\n");
  const marketLinks = MARKET_PAGES.map((page) => `- [${page.title}](${SITE_URL}/marches/${page.slug}): ${page.description}`).join("\n");
  const formationLinks = AFFILIATE_RECOMMENDATIONS.map((item) => `- [${item.title}](${SITE_URL}/formations/${item.id}): ${item.value}`).join("\n");

  const body = `# Emplois Burkina

Emplois Burkina est une application moderne pour trouver des offres d'emploi, concours, stages, missions ONG, opportunites remote et guides candidats au Burkina Faso.

## Pages principales

- [Accueil](${SITE_URL})
- [Offres d'emploi](${SITE_URL}/jobs)
- [Guides candidats](${SITE_URL}/guides)
- [Pages marche emploi](${SITE_URL}/marches)
- [International et remote](${SITE_URL}/international)
- [Formations et outils recommandes](${SITE_URL}/formations)
- [Services candidats optionnels](${SITE_URL}/services)
- [Politique de confidentialite](${SITE_URL}/privacy)

## Guides utiles

${guideLinks}

## Marches et intentions fortes

${marketLinks}

## Formations et recommandations utiles

${formationLinks}

## Flux publics

- [RSS](${SITE_URL}/feed.xml)
- [JSON Feed](${SITE_URL}/feed.json)
- [Sitemap](${SITE_URL}/sitemap.xml)

## Regles d'utilisation

Les offres doivent etre presentees avec attribution et lien vers la source officielle quand disponible. Les zones admin, API privees, leads et donnees personnelles ne doivent pas etre indexees ni reutilisees.
`;

  return new NextResponse(body, {
    headers: {
      "Content-Type": "text/plain; charset=utf-8",
      "Cache-Control": "public, s-maxage=86400, stale-while-revalidate=604800"
    }
  });
}
