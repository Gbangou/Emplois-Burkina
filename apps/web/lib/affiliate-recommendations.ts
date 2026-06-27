import { BookOpenCheck, FileText, Languages, Laptop, type LucideIcon } from "lucide-react";

export type AffiliateRecommendation = {
  id: string;
  title: string;
  category: "cv" | "anglais" | "remote" | "bureautique";
  audience: string;
  value: string;
  searchIntent: string;
  checklist: string[];
  revenueModel: string;
  trustScore: number;
  payoutReadiness: "Pret" | "A negocier" | "A connecter";
  icon: LucideIcon;
  href: string;
  sponsored: boolean;
};

export const AFFILIATE_RECOMMENDATIONS: AffiliateRecommendation[] = [
  {
    id: "cv-ats-premium",
    title: "Pack CV ATS + optimisation LinkedIn",
    category: "cv",
    audience: "Candidats qui postulent a des offres ONG, banques, mines et remote",
    value: "Aide a rendre le dossier lisible par les recruteurs et les logiciels ATS.",
    searchIntent: "Trouver un outil ou service pour corriger un CV avant de postuler au Burkina Faso.",
    checklist: [
      "Titre clair, poste vise et competences visibles en haut du CV.",
      "Mots cles coherents avec l'offre consultee.",
      "Mise en page simple, export PDF propre et contacts lisibles.",
      "Lien LinkedIn ou portfolio si le secteur le justifie."
    ],
    revenueModel: "Commission partenaire ou vente directe du pack premium.",
    trustScore: 92,
    payoutReadiness: "Pret",
    icon: FileText,
    href: "/services?service=cv-ats#demande",
    sponsored: false
  },
  {
    id: "anglais-entretien",
    title: "Anglais professionnel pour entretien",
    category: "anglais",
    audience: "Profils junior, assistants, projets ONG et support client international",
    value: "Preparation orale, vocabulaire entretien et reponses courtes en anglais.",
    searchIntent: "Se preparer a un entretien en anglais pour ONG, remote ou entreprise internationale.",
    checklist: [
      "Presentation personnelle de 45 secondes.",
      "Reponses simples sur experience, motivation et disponibilite.",
      "Vocabulaire du poste vise et exemples concrets.",
      "Simulation courte avec correction des phrases importantes."
    ],
    revenueModel: "Affiliation formation courte ou service de preparation entretien.",
    trustScore: 88,
    payoutReadiness: "A negocier",
    icon: Languages,
    href: "/services?service=entretien#demande",
    sponsored: false
  },
  {
    id: "remote-starter",
    title: "Starter kit travail remote",
    category: "remote",
    audience: "Candidats visant support client, virtual assistant, data entry et freelancing",
    value: "Checklist profil, plateformes, portfolio simple et habitudes de candidature.",
    searchIntent: "Comprendre comment commencer le travail remote depuis le Burkina Faso sans tomber dans les arnaques.",
    checklist: [
      "Profil clair en francais et anglais selon la plateforme.",
      "Preuves de travail : mini portfolio, exemples, certificats ou tests.",
      "Methode de candidature reguliere sans payer de frais suspects.",
      "Organisation connexion, disponibilites, paiement et communication."
    ],
    revenueModel: "Affiliation outils remote, cours verifies ou pack numerique Emplois Burkina.",
    trustScore: 86,
    payoutReadiness: "A connecter",
    icon: Laptop,
    href: "/international",
    sponsored: false
  },
  {
    id: "bureautique-emploi",
    title: "Bureautique utile pour emploi administratif",
    category: "bureautique",
    audience: "Secretariat, administration, comptabilite junior, RH et operations",
    value: "Excel, Word, email professionnel et organisation de documents.",
    searchIntent: "Identifier les competences bureautiques vraiment utiles pour les emplois administratifs.",
    checklist: [
      "Excel : tableaux, filtres, formules simples et presentation.",
      "Word : mise en page, courriers, rapports et CV propre.",
      "Email professionnel : objet, pieces jointes, relance et politesse.",
      "Classement numerique : dossiers, noms de fichiers et sauvegarde."
    ],
    revenueModel: "Affiliation centre de formation local ou formation digitale courte.",
    trustScore: 84,
    payoutReadiness: "A negocier",
    icon: BookOpenCheck,
    href: "/guides",
    sponsored: false
  }
];

export const AFFILIATE_GUARDRAILS = [
  "Toujours marquer clairement les recommandations sponsorisees ou affiliees.",
  "Ne recommander que des formations utiles, verifiables et remboursees ou livrees correctement.",
  "Ne jamais promettre un emploi, un visa ou un revenu garanti.",
  "Mesurer clics, commandes et revenus sans revendre les donnees personnelles des candidats."
];

export function getAffiliateSummary() {
  const totalTrust = AFFILIATE_RECOMMENDATIONS.reduce((sum, item) => sum + item.trustScore, 0);
  const ready = AFFILIATE_RECOMMENDATIONS.filter((item) => item.payoutReadiness === "Pret").length;
  const sponsored = AFFILIATE_RECOMMENDATIONS.filter((item) => item.sponsored).length;

  return {
    count: AFFILIATE_RECOMMENDATIONS.length,
    averageTrust: Math.round(totalTrust / AFFILIATE_RECOMMENDATIONS.length),
    ready,
    sponsored
  };
}

export function getAffiliateRecommendation(id: string) {
  return AFFILIATE_RECOMMENDATIONS.find((item) => item.id === id);
}
