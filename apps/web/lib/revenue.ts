export type ServiceProduct = {
  id: "cv-ats" | "lettre" | "ong-international" | "entretien";
  name: string;
  price: string;
  copy: string;
  delivery: string;
  revenue: string;
};

export type RevenueChannel = {
  id: "adsense-content" | "affiliate-tools" | "digital-services" | "market-reports";
  name: string;
  audience: string;
  model: string;
  activation: string;
  monthlyPotential: string;
  guardrails: string[];
};

export const SERVICE_PRODUCTS: ServiceProduct[] = [
  {
    id: "cv-ats",
    name: "CV ATS Express",
    price: "2 000 FCFA",
    copy: "CV clair, lisible, adapte au poste vise et pret a envoyer.",
    delivery: "Livraison numerique",
    revenue: "Produit d'entree a fort volume"
  },
  {
    id: "lettre",
    name: "Lettre ciblee",
    price: "1 500 FCFA",
    copy: "Lettre courte, specifique et coherente avec l'offre choisie.",
    delivery: "Version modifiable",
    revenue: "Upsell naturel apres une offre consultee"
  },
  {
    id: "ong-international",
    name: "Pack ONG / International",
    price: "5 000 FCFA",
    copy: "CV, lettre et checklist pour ONG, ONU, remote ou consulting.",
    delivery: "Pack premium",
    revenue: "Meilleure marge sur profils ambitieux"
  },
  {
    id: "entretien",
    name: "Preparation entretien",
    price: "3 000 FCFA",
    copy: "Questions probables, pitch personnel et reponses courtes.",
    delivery: "Guide personnalise",
    revenue: "Conversion apres preselection"
  }
];

export const REVENUE_CHANNELS: RevenueChannel[] = [
  {
    id: "adsense-content",
    name: "Pages gratuites financees par contenu",
    audience: "Candidats, parents, etudiants, diaspora",
    model: "AdSense sur offres, guides metiers, villes, salaires, concours et remote.",
    activation: "Priorite SEO + pages rapides + contenu evergreen.",
    monthlyPotential: "Automatique avec volume de trafic",
    guardrails: ["Offres toujours gratuites", "Publicites sobres", "Contenu utile avant revenu"]
  },
  {
    id: "affiliate-tools",
    name: "Affiliation utile et marquee",
    audience: "Candidats qui veulent se former ou postuler mieux",
    model: "Recommandations de cours, outils CV, anglais, remote et productivite.",
    activation: "Liens marques comme recommandations, uniquement si pertinents.",
    monthlyPotential: "Commissions sans faire payer l'acces",
    guardrails: ["Disclosure claire", "Partenaires verifiables", "Pas de promesse d'emploi"]
  },
  {
    id: "digital-services",
    name: "Produits numeriques optionnels",
    audience: "Candidats qui veulent gagner du temps",
    model: "CV ATS, lettres, entretien, traduction FR/EN et pack ONG/remote.",
    activation: "Demande simple, paiement mobile, livraison numerique.",
    monthlyPotential: "Marge directe sur services legers",
    guardrails: ["Optionnel", "Prix accessibles", "Livraison tracable"]
  },
  {
    id: "market-reports",
    name: "Rapports marche anonymises",
    audience: "Ecoles, medias, ONG, institutions, cabinets",
    model: "Tendances emploi par ville, secteur, niveau, salaire et competences.",
    activation: "Statistiques agregees depuis les offres, sans donnees personnelles.",
    monthlyPotential: "Revenu B2B sans vendre des annonces",
    guardrails: ["Donnees anonymes", "Agregation stricte", "Usage institutionnel"]
  }
];

export const REVENUE_OPERATING_RULES = [
  "Les offres restent accessibles gratuitement.",
  "Les revenus viennent d'abord du trafic, du contenu, de l'affiliation utile et des services optionnels.",
  "Aucune promesse de recrutement, de visa ou de gain n'est vendue.",
  "Les donnees sensibles ne doivent pas etre revendues ; seuls les indicateurs anonymises sont exploitables."
];
