export type RevenueScenario = {
  id: "slow" | "base" | "fast";
  name: string;
  stance: string;
  monthsZeroToSix: {
    traffic: string;
    adsense: string;
    services: string;
    affiliate: string;
    reports: string;
    total: string;
  };
  monthTwelve: {
    traffic: string;
    adsense: string;
    services: string;
    affiliate: string;
    reports: string;
    total: string;
  };
  conditions: string[];
};

export const REVENUE_SCENARIOS: RevenueScenario[] = [
  {
    id: "slow",
    name: "Prudent",
    stance: "Croissance lente, peu de backlinks, AdSense approuve tard, faible conversion services.",
    monthsZeroToSix: {
      traffic: "2 000 - 15 000 pages vues/mois",
      adsense: "0 - 12 000 FCFA/mois",
      services: "0 - 35 000 FCFA/mois",
      affiliate: "0 - 10 000 FCFA/mois",
      reports: "0 FCFA/mois",
      total: "0 - 55 000 FCFA/mois"
    },
    monthTwelve: {
      traffic: "20 000 - 60 000 pages vues/mois",
      adsense: "10 000 - 50 000 FCFA/mois",
      services: "30 000 - 120 000 FCFA/mois",
      affiliate: "5 000 - 40 000 FCFA/mois",
      reports: "0 - 50 000 FCFA/mois",
      total: "45 000 - 260 000 FCFA/mois"
    },
    conditions: [
      "Publication reguliere mais lente",
      "Peu de distribution sociale",
      "Aucun partenariat media",
      "Conversion service encore manuelle"
    ]
  },
  {
    id: "base",
    name: "Realiste ambitieux",
    stance: "SEO propre, scraping regulier, guides evergreen, pages marches, services candidats et premiers liens utiles.",
    monthsZeroToSix: {
      traffic: "15 000 - 80 000 pages vues/mois",
      adsense: "8 000 - 80 000 FCFA/mois",
      services: "30 000 - 180 000 FCFA/mois",
      affiliate: "5 000 - 50 000 FCFA/mois",
      reports: "0 - 100 000 FCFA/mois",
      total: "45 000 - 410 000 FCFA/mois"
    },
    monthTwelve: {
      traffic: "100 000 - 300 000 pages vues/mois",
      adsense: "60 000 - 300 000 FCFA/mois",
      services: "150 000 - 600 000 FCFA/mois",
      affiliate: "40 000 - 180 000 FCFA/mois",
      reports: "100 000 - 500 000 FCFA/mois",
      total: "350 000 - 1 580 000 FCFA/mois"
    },
    conditions: [
      "Pages SEO indexees et enrichies",
      "Offres renouvelees sans interruption",
      "Canaux sociaux automatises",
      "Paiement mobile et livraison digitale branches"
    ]
  },
  {
    id: "fast",
    name: "Acceleration forte",
    stance: "Tres bon SEO, pages programmees, forte distribution sociale, contenus partages, conversion service optimisee.",
    monthsZeroToSix: {
      traffic: "80 000 - 250 000 pages vues/mois",
      adsense: "70 000 - 280 000 FCFA/mois",
      services: "150 000 - 650 000 FCFA/mois",
      affiliate: "40 000 - 180 000 FCFA/mois",
      reports: "100 000 - 400 000 FCFA/mois",
      total: "360 000 - 1 510 000 FCFA/mois"
    },
    monthTwelve: {
      traffic: "300 000 - 900 000 pages vues/mois",
      adsense: "250 000 - 1 100 000 FCFA/mois",
      services: "500 000 - 2 000 000 FCFA/mois",
      affiliate: "150 000 - 700 000 FCFA/mois",
      reports: "400 000 - 1 500 000 FCFA/mois",
      total: "1 300 000 - 5 300 000 FCFA/mois"
    },
    conditions: [
      "Indexation rapide et backlinks naturels",
      "Contenu international et local en volume",
      "Tunnel de paiement automatise",
      "Rapports marche vendables et credibles"
    ]
  }
];

export const REVENUE_ASSUMPTIONS = [
  "Les montants sont des fourchettes mensuelles, pas des garanties.",
  "Les 0 a 3 premiers mois peuvent rapporter presque rien si AdSense, SEO et paiement ne sont pas encore actifs.",
  "AdSense seul ne suffit pas pour gagner beaucoup au depart ; les services optionnels et rapports augmentent la marge.",
  "Les revenus deviennent plus previsibles quand le trafic organique, les alertes et les conversions sont mesures.",
  "La securite, la qualite du contenu et l'absence de pratiques trompeuses protegent le compte AdSense et la marque."
];

export const NEXT_REVENUE_WORK = [
  "Brancher le suivi des conversions par canal.",
  "Preparer les emplacements AdSense sans degrader la vitesse.",
  "Automatiser le paiement Mobile Money des services candidats.",
  "Publier davantage de pages metiers, villes, salaires et concours.",
  "Creer un tableau de bord revenu: trafic, leads, services, RPM, sources et pages gagnantes."
];
