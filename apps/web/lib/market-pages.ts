export type MarketPage = {
  slug: string;
  title: string;
  description: string;
  kind: "city" | "sector" | "work_mode";
  filter: {
    city?: string;
    categoryIncludes?: string[];
    queryTerms?: string[];
  };
  revenueAngle: string;
  serviceHref: string;
  guideHref: string;
  contentBlocks: {
    title: string;
    body: string;
  }[];
};

export const MARKET_PAGES: MarketPage[] = [
  {
    slug: "emploi-ouagadougou",
    title: "Emploi a Ouagadougou",
    description: "Offres, secteurs actifs, candidatures et alertes pour trouver un emploi a Ouagadougou.",
    kind: "city",
    filter: { city: "Ouagadougou" },
    revenueAngle: "Trafic local + alertes + CV ATS",
    serviceHref: "/services?service=cv-ats#demande",
    guideHref: "/guides/cv-ats-burkina",
    contentBlocks: [
      {
        title: "Pourquoi cette page peut attirer du trafic",
        body: "Ouagadougou concentre une forte partie des recherches emploi du pays. Une page locale claire peut capter les requetes regulieres des candidats et des familles."
      },
      {
        title: "Comment postuler plus vite",
        body: "Les candidats doivent garder un CV a jour, suivre les deadlines et activer des alertes par secteur pour ne pas verifier manuellement toutes les sources."
      }
    ]
  },
  {
    slug: "emploi-bobo-dioulasso",
    title: "Emploi a Bobo-Dioulasso",
    description: "Offres et conseils pour chercher un emploi a Bobo-Dioulasso et dans l'ouest du Burkina Faso.",
    kind: "city",
    filter: { city: "Bobo-Dioulasso" },
    revenueAngle: "Trafic ville + guides + services candidat",
    serviceHref: "/services?service=lettre#demande",
    guideHref: "/guides/cv-ats-burkina",
    contentBlocks: [
      {
        title: "Un marche local a structurer",
        body: "Les recherches hors capitale sont souvent mal servies. Une page dediee permet de donner une visibilite durable aux opportunites regionales."
      },
      {
        title: "Se distinguer avec un dossier simple",
        body: "Une lettre courte, un CV lisible et un suivi propre des candidatures aident le candidat a repondre rapidement quand une offre pertinente apparait."
      }
    ]
  },
  {
    slug: "emploi-ong-humanitaire",
    title: "Emploi ONG et humanitaire au Burkina Faso",
    description: "Offres ONG, projets internationaux, humanitaire, developpement et conseils pour candidater.",
    kind: "sector",
    filter: { categoryIncludes: ["ONG", "Humanitaire"], queryTerms: ["ong", "humanitaire", "developpement"] },
    revenueAngle: "Pack ONG / International + guides premium",
    serviceHref: "/services?service=ong-international#demande",
    guideHref: "/guides/lettre-motivation-ong",
    contentBlocks: [
      {
        title: "Un secteur a forte intention",
        body: "Les offres ONG attirent des candidats motives, souvent prets a ameliorer CV, lettre et anglais pour postuler a des projets plus competitifs."
      },
      {
        title: "Preparer des preuves concretes",
        body: "Les recruteurs ONG cherchent des exemples: terrain, reporting, budget, coordination, langues, outils et comprehension du mandat."
      }
    ]
  },
  {
    slug: "concours-burkina-faso",
    title: "Concours et recrutements publics au Burkina Faso",
    description: "Concours, dossiers, deadlines et alertes pour suivre les recrutements publics au Burkina Faso.",
    kind: "sector",
    filter: { categoryIncludes: ["Concours"], queryTerms: ["concours", "fonction publique", "ministere"] },
    revenueAngle: "AdSense evergreen + alertes gratuites",
    serviceHref: "/jobs?category=Concours",
    guideHref: "/guides/concours-recrutements-burkina",
    contentBlocks: [
      {
        title: "Une demande continue",
        body: "Les concours generent une recherche repetitive et familiale. Le contenu doit etre clair, actualisable et relie aux alertes."
      },
      {
        title: "Organiser son dossier",
        body: "Les candidats gagnent du temps quand les documents sont prets avant l'ouverture des inscriptions et les dates limites."
      }
    ]
  },
  {
    slug: "emploi-remote-afrique",
    title: "Emploi remote depuis le Burkina Faso",
    description: "Offres remote, missions internationales et preparation pour travailler en ligne depuis le Burkina Faso.",
    kind: "work_mode",
    filter: { queryTerms: ["remote", "distance", "freelance", "online"] },
    revenueAngle: "Affiliation formation + traduction FR/EN",
    serviceHref: "/services?service=ong-international#demande",
    guideHref: "/guides/emplois-remote-afrique",
    contentBlocks: [
      {
        title: "Un marche plus large que le pays",
        body: "Le remote permet de viser des opportunites internationales, mais demande un profil clair, des preuves de competence et une bonne verification des offres."
      },
      {
        title: "Monetisation utile",
        body: "Les recommandations peuvent porter sur l'anglais, les outils CV, les portfolios et les formations courtes, a condition d'etre marquees clairement."
      }
    ]
  },
  {
    slug: "emploi-tech-informatique",
    title: "Emploi informatique et tech au Burkina Faso",
    description: "Offres tech, developpement, data, support informatique et conseils pour profils numeriques.",
    kind: "sector",
    filter: { categoryIncludes: ["Informatique", "Tech", "data"], queryTerms: ["developpeur", "informatique", "data", "support"] },
    revenueAngle: "Affiliation outils + CV ATS specialise",
    serviceHref: "/services?service=cv-ats#demande",
    guideHref: "/guides/emplois-remote-afrique",
    contentBlocks: [
      {
        title: "Des profils recherchables toute l'annee",
        body: "La tech genere des recherches constantes: developpeur, data, support, reseaux, cybersecurite et assistance informatique."
      },
      {
        title: "Montrer les competences",
        body: "Un profil numerique doit presenter les outils, projets, liens, certifications et resultats, pas seulement une liste de logiciels."
      }
    ]
  },
  {
    slug: "emploi-finance-comptabilite",
    title: "Emploi finance et comptabilite au Burkina Faso",
    description: "Offres finance, comptabilite, audit, banque, microfinance et administration financiere.",
    kind: "sector",
    filter: { categoryIncludes: ["Finance", "Comptabilite"], queryTerms: ["finance", "comptable", "audit", "banque"] },
    revenueAngle: "CV cible + lettre sectorielle",
    serviceHref: "/services?service=lettre#demande",
    guideHref: "/guides/cv-ats-burkina",
    contentBlocks: [
      {
        title: "Un secteur a forte recurrence",
        body: "Les roles finance et comptabilite reviennent regulierement dans les entreprises, ONG, banques, cabinets et projets."
      },
      {
        title: "Valoriser la precision",
        body: "Les candidats doivent mettre en avant logiciels, reporting, fiscalite, rapprochements, budgets, controles et experiences verifiables."
      }
    ]
  },
  {
    slug: "emploi-sante-medical",
    title: "Emploi sante et medical au Burkina Faso",
    description: "Offres sante, medical, projets sanitaires, cliniques, ONG et structures publiques.",
    kind: "sector",
    filter: { categoryIncludes: ["Sante", "Medical"], queryTerms: ["sante", "medical", "infirmier", "clinique"] },
    revenueAngle: "Guides candidats + alertes qualifiees",
    serviceHref: "/services?service=cv-ats#demande",
    guideHref: "/guides/cv-ats-burkina",
    contentBlocks: [
      {
        title: "Un secteur sensible",
        body: "Les offres sante demandent une verification stricte, car les diplomes, autorisations et experiences terrain comptent beaucoup."
      },
      {
        title: "Rendre le dossier lisible",
        body: "Le CV doit mettre en avant le diplome, les stages, les specialites, les zones d'intervention et les outils ou protocoles maitrises."
      }
    ]
  }
];

export function getMarketPage(slug: string) {
  return MARKET_PAGES.find((page) => page.slug === slug);
}
