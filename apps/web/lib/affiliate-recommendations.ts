import { BookOpenCheck, FileText, Languages, Laptop, type LucideIcon } from "lucide-react";

export type AffiliateProgram = {
  id: "coursera" | "udemy" | "edx" | "skillshare" | "grammarly" | "fiverr";
  name: string;
  applyUrl: string;
  network: string;
  bestFor: string;
  commission: string;
  payout: string;
  status: "ready_to_apply" | "apply_first" | "configure_tracking";
};

export type AffiliateApplicationProfile = {
  siteName: string;
  siteUrl: string;
  audience: string;
  trafficChannels: string[];
  positioning: string;
  compliance: string[];
  pitch: string;
};

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
  partnerEnv: string;
  primaryProgramId: AffiliateProgram["id"];
  sponsored: boolean;
};

export const AFFILIATE_PROGRAMS: AffiliateProgram[] = [
  {
    id: "coursera",
    name: "Coursera Affiliate Program",
    applyUrl: "https://www.coursera.org/about/affiliates",
    network: "Impact",
    bestFor: "Certificats professionnels, Excel, data, anglais, business et competences internationales.",
    commission: "Jusqu'a 45% selon produit et performance.",
    payout: "Via Impact apres validation du programme.",
    status: "ready_to_apply"
  },
  {
    id: "udemy",
    name: "Udemy Affiliate Program",
    applyUrl: "https://www.udemy.com/affiliate/",
    network: "Impact",
    bestFor: "Cours abordables, bureautique, anglais, CV, tech, productivite et preparation metier.",
    commission: "Commission competitive sur achats valides.",
    payout: "Via Impact avec liens profonds et assets de campagne.",
    status: "ready_to_apply"
  },
  {
    id: "edx",
    name: "edX Affiliate Program",
    applyUrl: "https://www.edx.org/affiliate-program",
    network: "Impact",
    bestFor: "Certificats verifies, Excel, IT, business, data et cours universitaires reconnus.",
    commission: "10% standard, 5% pour sites coupon/remise.",
    payout: "Via Impact ; cookie annonce de 60 jours.",
    status: "ready_to_apply"
  },
  {
    id: "skillshare",
    name: "Skillshare Affiliates",
    applyUrl: "https://www.skillshare.com/en/affiliates",
    network: "Impact",
    bestFor: "Design, portfolio, creativite, freelance, presentation et competences projet.",
    commission: "20% jusqu'a 34 USD par nouveau client.",
    payout: "Via Impact, paiement mensuel selon conditions du programme.",
    status: "ready_to_apply"
  },
  {
    id: "grammarly",
    name: "Grammarly Affiliate Program",
    applyUrl: "https://www.grammarly.com/affiliates",
    network: "Impact",
    bestFor: "Correction anglais, CV, lettres, emails professionnels et candidatures internationales.",
    commission: "Structure competitive et bonus selon activation.",
    payout: "Via Impact apres approbation du compte affilié.",
    status: "ready_to_apply"
  },
  {
    id: "fiverr",
    name: "Fiverr Affiliate Program",
    applyUrl: "https://www.fiverr.com/partnerships/affiliates",
    network: "Fiverr Affiliates",
    bestFor: "Freelance, remote, logo, portfolio, services digitaux et economie creator.",
    commission: "25% a 100% du premier achat + 10% revenue share sur 12 mois selon offre.",
    payout: "Paiement apres seuil et facture selon le programme Fiverr.",
    status: "ready_to_apply"
  }
];

export const AFFILIATE_APPLICATION_PROFILE: AffiliateApplicationProfile = {
  siteName: "Emplois Burkina",
  siteUrl: "https://emplois-burkina.com",
  audience: "Candidats, jeunes diplomes, professionnels, freelances, profils ONG, remote et administratifs au Burkina Faso et en Afrique francophone.",
  trafficChannels: [
    "SEO sur offres d'emploi, concours, villes, metiers, guides CV et pages formations.",
    "Alertes WhatsApp, partage social, flux RSS/JSON et pages marche indexables.",
    "Contenu evergreen : CV ATS, anglais entretien, remote, bureautique et candidatures ONG."
  ],
  positioning:
    "Plateforme emploi gratuite pour les candidats, avec recommandations marquees, services optionnels et contenus utiles pour ameliorer les candidatures.",
  compliance: [
    "Pas de promesse d'emploi, de visa ou de revenu garanti.",
    "Recommandations clairement marquees et reliees a une valeur candidat.",
    "Tracking first-party minimal, sans revente de donnees personnelles.",
    "Sources, politiques de confidentialite et contenus conformes aux moteurs de recherche."
  ],
  pitch:
    "Emplois Burkina aide les candidats a trouver des offres gratuites et a ameliorer leurs candidatures. Nous souhaitons recommander des formations et outils pertinents a notre audience emploi, avec une presentation transparente et des liens affilies clairement marques."
};

export const AFFILIATE_ENV_VARS = [
  "EMPLOIS_BURKINA_AFFILIATE_CV_ATS_URL",
  "EMPLOIS_BURKINA_AFFILIATE_ENGLISH_URL",
  "EMPLOIS_BURKINA_AFFILIATE_REMOTE_URL",
  "EMPLOIS_BURKINA_AFFILIATE_OFFICE_URL"
];

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
    partnerEnv: "EMPLOIS_BURKINA_AFFILIATE_CV_ATS_URL",
    primaryProgramId: "grammarly",
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
    partnerEnv: "EMPLOIS_BURKINA_AFFILIATE_ENGLISH_URL",
    primaryProgramId: "coursera",
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
    partnerEnv: "EMPLOIS_BURKINA_AFFILIATE_REMOTE_URL",
    primaryProgramId: "fiverr",
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
    partnerEnv: "EMPLOIS_BURKINA_AFFILIATE_OFFICE_URL",
    primaryProgramId: "udemy",
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
    programs: AFFILIATE_PROGRAMS.length,
    ready,
    sponsored
  };
}

export function getAffiliateRecommendation(id: string) {
  return AFFILIATE_RECOMMENDATIONS.find((item) => item.id === id);
}

export function getAffiliateProgram(id: AffiliateProgram["id"]) {
  return AFFILIATE_PROGRAMS.find((program) => program.id === id);
}

export function getAffiliateDestination(id: string) {
  const item = getAffiliateRecommendation(id);
  if (!item) return null;

  const configured = process.env[item.partnerEnv];
  if (configured) {
    try {
      const url = new URL(configured);
      if (url.protocol === "https:" || url.protocol === "http:") {
        if (!url.searchParams.has("utm_source")) url.searchParams.set("utm_source", "emplois-burkina");
        if (!url.searchParams.has("utm_medium")) url.searchParams.set("utm_medium", "affiliate");
        if (!url.searchParams.has("utm_campaign")) url.searchParams.set("utm_campaign", item.id);
        return { item, href: url.toString(), external: true };
      }
    } catch {
      return { item, href: item.href, external: false };
    }
  }

  return { item, href: item.href, external: false };
}
