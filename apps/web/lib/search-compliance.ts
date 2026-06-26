export type SearchComplianceItem = {
  label: string;
  status: "ready" | "watch" | "blocked";
  proof: string;
  revenueImpact: string;
};

export type SearchComplianceReport = {
  score: number;
  items: SearchComplianceItem[];
  adSenseRules: string[];
};

export function getSearchComplianceReport(): SearchComplianceReport {
  const items: SearchComplianceItem[] = [
    {
      label: "Sitemap public",
      status: "ready",
      proof: "/sitemap.xml couvre offres, guides, marches, services et pages confiance.",
      revenueImpact: "Aide les moteurs a decouvrir les pages qui peuvent generer trafic et revenus."
    },
    {
      label: "Robots propre",
      status: "ready",
      proof: "Les routes admin, API, operations et profil sont exclues du crawl public.",
      revenueImpact: "Protege les surfaces sensibles et concentre le crawl sur les pages monetisables."
    },
    {
      label: "Donnees structurees",
      status: "ready",
      proof: "WebSite, Organization, JobPosting, Article et BreadcrumbList sont exposes.",
      revenueImpact: "Ameliore la comprehension des pages par Google sans manipuler le classement."
    },
    {
      label: "Contenu utile",
      status: "ready",
      proof: "Guides, marches, offres et securite apportent une valeur lisible avant toute monetisation.",
      revenueImpact: "Reduit le risque de site fait uniquement pour la publicite."
    },
    {
      label: "Ads non intrusives",
      status: "watch",
      proof: "Les emplacements AdSense ne sont pas encore branches, donc ils doivent rester sobres au moment de l'activation.",
      revenueImpact: "Evite les placements trompeurs, clics invalides et experience lente."
    },
    {
      label: "Sources responsables",
      status: "ready",
      proof: "Scraper avec robots.txt, user-agent, manual_only, review_required et moderation.",
      revenueImpact: "Preserve confiance, legalite, SEO et valeur des offres."
    }
  ];

  const ready = items.filter((item) => item.status === "ready").length;
  const watch = items.filter((item) => item.status === "watch").length;
  const score = Math.round((ready / items.length) * 100 - watch * 4);

  return {
    score,
    items,
    adSenseRules: [
      "Ne pas inciter les clics publicitaires.",
      "Ne pas masquer le contenu utile derriere les annonces.",
      "Ne pas placer d'annonces sur pages vides, trompeuses ou sans valeur originale.",
      "Ne pas collecter ni exposer de donnees personnelles sans base claire.",
      "Garder une politique de confidentialite lisible et a jour."
    ]
  };
}
