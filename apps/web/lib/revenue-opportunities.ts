import { AFFILIATE_PROGRAMS, AFFILIATE_RECOMMENDATIONS } from "@/lib/affiliate-recommendations";
import { FORMATION_INTENT_PAGES } from "@/lib/formation-intents";
import { GUIDES } from "@/lib/guides";
import { MARKET_PAGES } from "@/lib/market-pages";
import type { RevenueSignals } from "@/lib/revenue-signals";

export type RevenueOpportunity = {
  id: string;
  title: string;
  channel: "adsense" | "affiliate" | "services" | "audience" | "reports";
  score: number;
  expectedImpact: string;
  why: string;
  nextStep: string;
  href: string;
};

function hasPath(signals: RevenueSignals, prefix: string) {
  return signals.topPaths.some((item) => item.path.startsWith(prefix));
}

function clampScore(value: number) {
  return Math.max(10, Math.min(98, Math.round(value)));
}

export function getRevenueOpportunities(signals: RevenueSignals): RevenueOpportunity[] {
  const contentSurfaces = GUIDES.length + MARKET_PAGES.length + FORMATION_INTENT_PAGES.length;
  const affiliateReadiness = AFFILIATE_PROGRAMS.length * 6 + AFFILIATE_RECOMMENDATIONS.length * 5;
  const formationSignals = signals.funnel.affiliateViews + signals.funnel.affiliateClicks * 5;
  const serviceSignals = signals.funnel.serviceViews + signals.funnel.serviceClicks * 6 + signals.leadSubmits * 8;
  const audienceSignals = signals.funnel.alertClicks * 6 + signals.pageViews * 0.08;

  const opportunities: RevenueOpportunity[] = [
    {
      id: "formation-affiliate",
      title: "Pousser les parcours formation vers affiliation",
      channel: "affiliate",
      score: clampScore(affiliateReadiness + formationSignals + (hasPath(signals, "/formations") ? 12 : 0)),
      expectedImpact: "Commissions futures sur formations, outils CV, anglais et remote.",
      why: "Les pages formation existent, les programmes reels sont repertories et les clics sont maintenant mesures.",
      nextStep: "Faire approuver les comptes affiliés puis renseigner les URLs EMPLOIS_BURKINA_AFFILIATE_*_URL.",
      href: "/formations"
    },
    {
      id: "service-payment",
      title: "Transformer les clics services en commandes payees",
      channel: "services",
      score: clampScore(42 + serviceSignals),
      expectedImpact: "Revenu plus rapide qu'AdSense avec trafic modeste.",
      why: "Les offres, outils CV et pages services envoient deja vers des demandes optionnelles.",
      nextStep: "Brancher un paiement Mobile Money reel et une livraison numerique simple.",
      href: "/services"
    },
    {
      id: "adsense-evergreen",
      title: "Renforcer les pages evergreen pour AdSense",
      channel: "adsense",
      score: clampScore(30 + contentSurfaces * 4 + signals.pageViews * 0.05),
      expectedImpact: "Revenu passif progressif quand le trafic organique augmente.",
      why: "Guides, marches et parcours formation donnent des pages durables que les offres expirees ne remplacent pas.",
      nextStep: "Publier davantage de pages metiers/villes/competences et activer AdSense apres approbation.",
      href: "/guides"
    },
    {
      id: "alert-retention",
      title: "Construire une audience recurrente par alertes",
      channel: "audience",
      score: clampScore(28 + audienceSignals),
      expectedImpact: "Retour de trafic regulier vers offres, guides, services et formations.",
      why: "Une audience opt-in reduit la dependance a Google et augmente les chances de conversion.",
      nextStep: "Segmenter les alertes par ville, metier et secteur, avec des liens vers pages monetisables.",
      href: "/alertes"
    },
    {
      id: "market-reports",
      title: "Preparer les rapports marche anonymises",
      channel: "reports",
      score: clampScore(22 + MARKET_PAGES.length * 5 + signals.pageViews * 0.03),
      expectedImpact: "Revenu B2B possible plus tard sans vendre les donnees personnelles.",
      why: "Les pages marche structurent deja les villes, secteurs et tendances exploitables en agregat.",
      nextStep: "Generer un exemple public de rapport mensuel avec donnees anonymisees.",
      href: "/marches"
    }
  ];

  return opportunities.sort((a, b) => b.score - a.score);
}
