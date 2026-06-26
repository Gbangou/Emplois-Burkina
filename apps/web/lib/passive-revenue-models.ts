export type PassiveRevenueModel = {
  id: string;
  name: string;
  type: "ads" | "affiliate" | "digital_product" | "data" | "audience" | "distribution";
  passiveLevel: "high" | "medium" | "low";
  revenuePotential: string;
  timeToRevenue: string;
  automation: string;
  dependencies: string[];
  compliance: string[];
  nextStep: string;
};

export const PASSIVE_REVENUE_MODELS: PassiveRevenueModel[] = [
  {
    id: "adsense-contextual",
    name: "AdSense contextuel sur contenu utile",
    type: "ads",
    passiveLevel: "high",
    revenuePotential: "Faible au depart, scalable avec pages vues",
    timeToRevenue: "Apres approbation AdSense + trafic",
    automation: "Emplacements sobres sur guides, marches et offres indexables.",
    dependencies: ["AdSense approuve", "ads.txt configure", "trafic SEO recurrent", "contenu original suffisant"],
    compliance: ["Pas d'incitation au clic", "Annonce clairement separee", "Pas de page faite uniquement pour afficher des pubs"],
    nextStep: "Activer les variables AdSense apres approbation et suivre RPM par page."
  },
  {
    id: "candidate-digital-services",
    name: "Services digitaux optionnels",
    type: "digital_product",
    passiveLevel: "medium",
    revenuePotential: "Meilleure marge que la pub, meme avec trafic modeste",
    timeToRevenue: "Immediat apres paiement Mobile Money",
    automation: "Formulaire, paiement, generation de brief, livraison numerique et relance.",
    dependencies: ["Paiement mobile", "templates CV/lettre", "workflow de livraison", "support minimum"],
    compliance: ["Offres gratuites", "Pas de promesse d'emploi", "Prix visibles et service optionnel"],
    nextStep: "Brancher paiement Mobile Money et convertir les demandes services en commandes."
  },
  {
    id: "useful-affiliate",
    name: "Affiliation utile et marquee",
    type: "affiliate",
    passiveLevel: "high",
    revenuePotential: "Interessant sur remote, anglais, CV, formation courte",
    timeToRevenue: "Apres integration de partenaires fiables",
    automation: "Recommandations contextuelles dans guides et pages marche.",
    dependencies: ["Partenaires verifiables", "liens trackes", "disclosure claire", "controle qualite"],
    compliance: ["Marquage partenaire", "Pas de fausse promesse", "Recommandations pertinentes au contenu"],
    nextStep: "Ajouter un fichier partenaires verifiables et remplacer les liens internes par liens affilies approuves."
  },
  {
    id: "market-intelligence-reports",
    name: "Rapports marche anonymises",
    type: "data",
    passiveLevel: "medium",
    revenuePotential: "Fort si donnees regulieres et credibles",
    timeToRevenue: "Apres 2-3 mois de donnees stables",
    automation: "Agregation secteurs, villes, deadlines, sources, demandes et tendances.",
    dependencies: ["Historique offres", "anonymisation", "exports PDF/CSV", "pages exemple"],
    compliance: ["Aucune donnee personnelle", "Agregation stricte", "Sources citees correctement"],
    nextStep: "Generer un rapport marche mensuel public resumant les tendances sans contacts candidats."
  },
  {
    id: "alert-audience",
    name: "Audience alertes WhatsApp/newsletter",
    type: "audience",
    passiveLevel: "medium",
    revenuePotential: "Indirect mais tres important pour recurrence",
    timeToRevenue: "Des que les alertes attirent des retours",
    automation: "Segments par ville, metier, secteur et campagnes de retour vers guides/services.",
    dependencies: ["Opt-in clair", "segmentation", "desinscription", "frequence raisonnable"],
    compliance: ["Consentement", "pas de spam", "pas de revente de numeros", "privacy-by-design"],
    nextStep: "Connecter les leads alertes a des segments et mesurer les retours vers pages monetisables."
  },
  {
    id: "rss-api-distribution",
    name: "Flux RSS/JSON et distribution autorisee",
    type: "distribution",
    passiveLevel: "high",
    revenuePotential: "Indirect: backlinks, trafic referent, visibilite IA/agregateurs",
    timeToRevenue: "Progressif",
    automation: "Feeds publics, llms.txt, OpenSearch, sitemap et cartes sociales.",
    dependencies: ["Flux propres", "contenu frais", "attribution", "monitoring trafic referent"],
    compliance: ["Pas de cloaking", "pas de contenu trompeur", "respect sources et robots"],
    nextStep: "Ajouter des appels a s'abonner aux flux et surveiller les pages qui gagnent des backlinks."
  },
  {
    id: "marked-sponsored-content",
    name: "Contenus sponsorises clairement marques",
    type: "ads",
    passiveLevel: "low",
    revenuePotential: "Fort mais moins passif et plus risque",
    timeToRevenue: "Quand l'audience est prouvee",
    automation: "Pages annonceur, reporting clics/leads, emplacements marques.",
    dependencies: ["Audience mesuree", "charte sponsor", "validation contenu", "facturation"],
    compliance: ["Marquage sponsorise", "pas de site reputation abuse", "contenu utile et controle editorial"],
    nextStep: "Garder ce canal pour plus tard, apres preuve de trafic et charte stricte."
  }
];

export const PASSIVE_REVENUE_PRIORITIES = [
  "Court terme: services digitaux optionnels + alertes pour capter les leads.",
  "Moyen terme: AdSense + affiliation utile une fois trafic et approbation obtenus.",
  "Long terme: rapports anonymises et distribution/API si les donnees deviennent uniques.",
  "Toujours: rester conforme Google, utile pour les candidats et sobre avec la publicite."
];
