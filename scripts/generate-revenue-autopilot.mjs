import { mkdir, readFile, writeFile } from "node:fs/promises";

const ROOT = new URL("../", import.meta.url);
const DATA_DIR = new URL("data/", ROOT);
const GROWTH_DIR = new URL("data/growth/", ROOT);
const DOCS_DIR = new URL("docs/", ROOT);

function readJson(path, fallback = []) {
  return readFile(path, "utf8")
    .then((content) => JSON.parse(content))
    .catch(() => fallback);
}

function formatFcfa(value) {
  return `${String(Math.round(value || 0)).replace(/\B(?=(\d{3})+(?!\d))/g, " ")} FCFA`;
}

function unique(items) {
  return [...new Set(items.filter(Boolean))];
}

function countBy(items, pick) {
  const map = new Map();
  for (const item of items) {
    const key = pick(item) || "A classer";
    map.set(key, (map.get(key) || 0) + 1);
  }
  return [...map.entries()].sort((a, b) => b[1] - a[1] || a[0].localeCompare(b[0]));
}

function estimateMonthlyRevenue(plan) {
  return plan.reduce((sum, item) => sum + item.targetUnits * item.priceFcfa * item.closeRate, 0);
}

function buildRevenuePlan({ jobs, rateCard, intelligence, visibility }) {
  const categories = countBy(jobs, (job) => job.category).slice(0, 5);
  const cities = countBy(jobs, (job) => job.city).slice(0, 5);
  const sources = countBy(jobs, (job) => job.sourceName).slice(0, 6);
  const trustedJobs = jobs.filter((job) => (job.confidenceScore || 0) >= 80).length;
  const urgentJobs = jobs.filter((job) => job.closingDate || job.deadline).length;
  const score = visibility.score || 0;
  const heat = intelligence.marketHeatScore || Math.min(100, jobs.length * 2);
  const monetization = intelligence.monetizationScore || Math.min(100, rateCard.length * 10 + trustedJobs);

  const primaryCategory = categories[0]?.[0] || "Offres verifiees";
  const primaryCity = cities[0]?.[0] || "Ouagadougou";
  const sourcePitch = sources[0]?.[0] || "sources partenaires";
  const baseAudienceReadiness = Math.round((score + heat + monetization) / 3);
  const revenueTargetFcfa = Math.max(0, Number(process.env.EMPLOIS_BURKINA_REVENUE_TARGET_FCFA || 1_000_000));

  const plan = [
    {
      id: "premium_job_posts",
      channel: "Annonces recruteurs premium",
      offer: "Publication + mise en avant + diffusion WhatsApp/Facebook + rapport simple",
      targetCustomers: "Entreprises, ONG, cabinets RH, PME locales",
      targetUnits: 12,
      priceFcfa: 25000,
      closeRate: 0.35,
      trigger: `${trustedJobs} offres fiables et ${urgentJobs} offres avec dates exploitables.`,
      nextAction: `Prospecter 30 recruteurs lies a ${primaryCategory} et ${primaryCity}.`,
    },
    {
      id: "category_sponsorship",
      channel: "Sponsoring categorie",
      offer: `Sponsor mensuel de la categorie ${primaryCategory}`,
      targetCustomers: "Centres de formation, fintech, telecoms, ecoles professionnelles",
      targetUnits: 4,
      priceFcfa: 100000,
      closeRate: 0.25,
      trigger: `Categorie dominante : ${primaryCategory}.`,
      nextAction: "Envoyer 20 propositions sponsor avec preuve trafic/offres et placement clair.",
    },
    {
      id: "whatsapp_digest_sponsor",
      channel: "Digest WhatsApp sponsorise",
      offer: "Sponsor discret du digest hebdomadaire d'offres",
      targetCustomers: "Formations, banques, telecoms, assurance, mobile money",
      targetUnits: 4,
      priceFcfa: 50000,
      closeRate: 0.3,
      trigger: "WhatsApp est le canal le plus naturel pour l'audience locale.",
      nextAction: "Preparer un kit sponsor WhatsApp avec limites de frequence et mention sponsorisee.",
    },
    {
      id: "cv_services",
      channel: "Services candidats optionnels",
      offer: "CV ATS, lettre, traduction FR/EN, preparation entretien",
      targetCustomers: "Candidats actifs, jeunes diplomes, profils ONG/tech",
      targetUnits: 120,
      priceFcfa: 2000,
      closeRate: 0.18,
      trigger: `Top source actuelle : ${sourcePitch}.`,
      nextAction: "Ajouter CTA service CV sur fiches offres fortes et guides candidats.",
    },
    {
      id: "market_reports",
      channel: "Rapports marche agreges",
      offer: "Rapport mensuel secteurs, villes, sources, competences et tendances",
      targetCustomers: "Ecoles, ONG, cabinets RH, investisseurs, institutions",
      targetUnits: 3,
      priceFcfa: 150000,
      closeRate: 0.2,
      trigger: `Score marche : ${heat}/100, score revenu : ${monetization}/100.`,
      nextAction: "Generer un exemple PDF/HTML de rapport marche avec donnees non personnelles.",
    },
    {
      id: "source_partnerships",
      channel: "Partenariats sources et backlinks",
      offer: "Flux propre, attribution, backlink, page partenaire",
      targetCustomers: "Sites RH, medias, institutions, ecoles, cabinets",
      targetUnits: 10,
      priceFcfa: 0,
      closeRate: 0.4,
      trigger: "Les partenariats augmentent le SEO et reduisent le scraping fragile.",
      nextAction: "Demander flux RSS/API ou autorisation explicite aux sources prioritaires.",
    },
  ];

  const estimatedMonthlyRevenueFcfa = Math.round(estimateMonthlyRevenue(plan));

  return {
    generatedAt: new Date().toISOString(),
    readinessScore: baseAudienceReadiness,
    revenueTargetFcfa,
    estimatedMonthlyRevenueFcfa,
    revenueGapFcfa: Math.max(0, revenueTargetFcfa - estimatedMonthlyRevenueFcfa),
    activeJobs: jobs.length,
    trustedJobs,
    topCategories: categories.map(([label, count]) => ({ label, count })),
    topCities: cities.map(([label, count]) => ({ label, count })),
    topSources: sources.map(([label, count]) => ({ label, count })),
    plan,
    zeroTouchOperatingModel: [
      "Automatisation toutes les 30 a 60 minutes en production.",
      "Base PostgreSQL managee pour conserver offres, leads, paiements et logs.",
      "Alertes healthcheck si aucun run reussi dans la fenetre attendue.",
      "Moderation humaine seulement pour les offres a risque ou les partenaires payants.",
      "Rapport revenu genere a chaque run pour guider prospection, sponsors et contenus.",
    ],
    requiredIntegrations: [
      "PostgreSQL manage Supabase ou Neon",
      "WhatsApp Business Cloud API",
      "Paiement Mobile Money via aggregateur local/regional",
      "AdSense apres validation Google",
      "Email transactionnel pour factures et relances",
      "Analytics produit et erreurs",
    ],
  };
}

function buildMarkdown(report) {
  return `# Autopilote revenu Emplois Burkina

Derniere generation : ${report.generatedAt}

## Reponse courte

Oui, une base de donnees est necessaire pour une app permanente, rentable et
quasi autonome. Le bon choix est une base managee PostgreSQL, pas une base a
administrer manuellement. Les fichiers JSON/SQLite restent utiles en local, mais
la production doit stocker durablement offres, leads, alertes, paiements,
partenaires, logs d'envoi et historiques de moderation.

## Objectif zero interaction

${report.zeroTouchOperatingModel.map((item) => `- ${item}`).join("\n")}

## Score revenu

- Score preparation : ${report.readinessScore}/100
- Offres actives : ${report.activeJobs}
- Offres fiables : ${report.trustedJobs}
- Objectif mensuel : ${formatFcfa(report.revenueTargetFcfa)}
- Revenu mensuel initial estime : ${formatFcfa(report.estimatedMonthlyRevenueFcfa)}
- Ecart a combler : ${formatFcfa(report.revenueGapFcfa)}

## Canaux a activer

| Canal | Offre | Clients | Objectif | Prix | Conversion | Action suivante |
| --- | --- | --- | ---: | ---: | ---: | --- |
${report.plan
  .map(
    (item) =>
      `| ${item.channel} | ${item.offer} | ${item.targetCustomers} | ${item.targetUnits} | ${formatFcfa(item.priceFcfa)} | ${Math.round(item.closeRate * 100)}% | ${item.nextAction} |`
  )
  .join("\n")}

## Segments chauds

Categories :
${report.topCategories.map((item) => `- ${item.label} : ${item.count}`).join("\n")}

Villes :
${report.topCities.map((item) => `- ${item.label} : ${item.count}`).join("\n")}

Sources :
${report.topSources.map((item) => `- ${item.label} : ${item.count}`).join("\n")}

## Integrations indispensables

${report.requiredIntegrations.map((item) => `- ${item}`).join("\n")}

## Priorite maintenant

1. Mettre PostgreSQL manage en production.
2. Garder le daemon automation actif toutes les 30 a 60 minutes.
3. Brancher WhatsApp Business et opt-in/desinscription.
4. Vendre manuellement les 3 premiers sponsors avant d'attendre AdSense.
5. Ajouter paiement Mobile Money pour offres sponsorisees.
`;
}

async function main() {
  await mkdir(GROWTH_DIR, { recursive: true });
  const [jobs, rateCard, intelligence, visibility, adMonetization] = await Promise.all([
    readJson(new URL("curated-jobs.json", DATA_DIR), []),
    readJson(new URL("rate-card.json", DATA_DIR), []),
    readJson(new URL("growth/market-intelligence.json", DATA_DIR), {}),
    readJson(new URL("growth/visibility-report.json", DATA_DIR), {}),
    readJson(new URL("growth/ad-monetization-autopilot.json", DATA_DIR), {}),
  ]);

  const publishedJobs = jobs.filter((job) => job.status !== "rejected");
  const report = buildRevenuePlan({ jobs: publishedJobs, rateCard, intelligence, visibility });

  if (adMonetization.estimates?.totalTrafficRevenueFcfa) {
    report.plan.unshift({
      id: "adsense_display_affiliate",
      channel: "AdSense, display et affiliation utile",
      offer: "Pages guides/offres/villes monetisees par trafic, annonces automatiques et liens utiles marques",
      targetCustomers: "Google AdSense, reseaux publicitaires, partenaires formation/outils utiles",
      targetUnits: 1,
      priceFcfa: adMonetization.estimates.totalTrafficRevenueFcfa || 0,
      closeRate: 1,
      trigger: `${adMonetization.estimates.usefulPages || 0} pages utiles indexables.`,
      nextAction: "Configurer AdSense, ads.txt, Search Console, Bing Webmaster Tools et analytics revenu.",
    });
    report.estimatedMonthlyRevenueFcfa += adMonetization.estimates.totalTrafficRevenueFcfa;
    report.revenueGapFcfa = Math.max(0, report.revenueTargetFcfa - report.estimatedMonthlyRevenueFcfa);
  }

  await writeFile(new URL("revenue-autopilot.json", GROWTH_DIR), JSON.stringify(report, null, 2), "utf8");
  await writeFile(new URL("REVENUE_AUTOPILOT.md", DOCS_DIR), buildMarkdown(report), "utf8");

  console.log(
    `Revenue autopilot generated: ${formatFcfa(report.estimatedMonthlyRevenueFcfa)} estimated monthly revenue, score ${report.readinessScore}/100.`
  );
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
