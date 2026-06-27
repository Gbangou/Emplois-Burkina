import type { AffiliateProgram } from "@/lib/affiliate-recommendations";

export type FormationIntentPage = {
  slug: string;
  title: string;
  description: string;
  intent: string;
  audience: string;
  primaryRecommendationId: string;
  secondaryProgramIds: AffiliateProgram["id"][];
  serviceHref: string;
  keywords: string[];
  blocks: {
    title: string;
    body: string;
  }[];
};

export const FORMATION_INTENT_PAGES: FormationIntentPage[] = [
  {
    slug: "formation-excel-emploi-administratif",
    title: "Formation Excel pour emploi administratif au Burkina Faso",
    description: "Competences Excel utiles pour secretariat, administration, comptabilite junior, RH et operations.",
    intent: "Apprendre Excel pour etre plus credible sur les offres administratives et bureautiques.",
    audience: "Candidats aux postes administratifs, secretariat, comptabilite junior, RH et gestion.",
    primaryRecommendationId: "bureautique-emploi",
    secondaryProgramIds: ["udemy", "coursera", "edx"],
    serviceHref: "/services?service=cv-ats#demande",
    keywords: ["formation Excel Burkina", "emploi administratif", "bureautique", "CV administratif"],
    blocks: [
      {
        title: "Competences Excel a prioriser",
        body: "Tableaux propres, filtres, formules simples, mise en forme, suivi de depenses et presentation de rapports sont souvent plus utiles qu'une liste vague de logiciels."
      },
      {
        title: "Comment monetiser proprement cette intention",
        body: "La page peut recommander des cours Excel verifies, afficher une annonce sobre et proposer un CV ATS adapte aux postes administratifs."
      }
    ]
  },
  {
    slug: "anglais-entretien-ong-burkina",
    title: "Anglais entretien ONG et international",
    description: "Preparer une presentation en anglais pour ONG, projets internationaux, remote et support client.",
    intent: "Se preparer a parler anglais en entretien sans promettre un recrutement.",
    audience: "Profils ONG, assistants projets, support client, remote et candidats internationaux.",
    primaryRecommendationId: "anglais-entretien",
    secondaryProgramIds: ["coursera", "grammarly", "udemy"],
    serviceHref: "/services?service=entretien#demande",
    keywords: ["anglais entretien ONG", "anglais professionnel Burkina", "entretien international"],
    blocks: [
      {
        title: "Ce qu'il faut preparer",
        body: "Un pitch de 45 secondes, des exemples de mission, des mots simples sur ses competences et des reponses courtes sur disponibilite, motivation et experience."
      },
      {
        title: "Pourquoi cette page peut convertir",
        body: "L'anglais est une competence a forte intention. Les candidats motives peuvent cliquer vers formation, correction de texte, ou preparation entretien."
      }
    ]
  },
  {
    slug: "cv-ats-ong-banque-mines",
    title: "CV ATS pour ONG, banques et mines",
    description: "Structurer un CV lisible pour les secteurs competitifs : ONG, banque, mines, projets et finance.",
    intent: "Corriger son CV avant d'envoyer des candidatures a forte concurrence.",
    audience: "Candidats aux offres ONG, banque, mines, finance, projets et administration.",
    primaryRecommendationId: "cv-ats-premium",
    secondaryProgramIds: ["grammarly", "coursera", "udemy"],
    serviceHref: "/services?service=cv-ats#demande",
    keywords: ["CV ATS Burkina", "CV ONG", "CV banque", "CV mines"],
    blocks: [
      {
        title: "Ce que les recruteurs doivent voir vite",
        body: "Poste vise, annees d'experience, outils, langues, zones d'intervention, resultats concrets et mots cles proches de l'offre."
      },
      {
        title: "Monetisation utile",
        body: "Cette intention se prete aux services CV, aux outils de correction, aux guides et aux annonces non intrusives."
      }
    ]
  },
  {
    slug: "remote-freelance-debutant-afrique",
    title: "Debuter en remote et freelance depuis l'Afrique francophone",
    description: "Checklist pour commencer le remote : profil, portfolio, plateformes, vigilance anti-arnaque et paiement.",
    intent: "Comprendre comment se lancer dans le travail remote sans payer des frais suspects.",
    audience: "Jeunes diplomes, freelances debutants, assistants virtuels, support client et profils digitaux.",
    primaryRecommendationId: "remote-starter",
    secondaryProgramIds: ["fiverr", "skillshare", "coursera"],
    serviceHref: "/international",
    keywords: ["remote Afrique", "freelance Burkina", "travail en ligne", "assistant virtuel"],
    blocks: [
      {
        title: "Preuves avant promesses",
        body: "Un profil remote doit montrer un portfolio simple, des exemples, une disponibilite claire et une methode de communication professionnelle."
      },
      {
        title: "Protection contre les arnaques",
        body: "Aucun candidat ne doit payer pour obtenir une offre. Les formations recommandees doivent servir a construire une competence ou un dossier visible."
      }
    ]
  }
];

export function getFormationIntentPage(slug: string) {
  return FORMATION_INTENT_PAGES.find((page) => page.slug === slug);
}
