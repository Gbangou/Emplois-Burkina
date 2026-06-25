import { mkdir, readFile, writeFile } from "node:fs/promises";

const ROOT = new URL("../", import.meta.url);
const DATA_DIR = new URL("data/", ROOT);
const GROWTH_DIR = new URL("data/growth/", ROOT);
const DOCS_DIR = new URL("docs/", ROOT);

function readJson(path, fallback = {}) {
  return readFile(path, "utf8")
    .then((content) => JSON.parse(content))
    .catch(() => fallback);
}

function formatNumber(value) {
  return String(Math.round(value || 0)).replace(/\B(?=(\d{3})+(?!\d))/g, " ");
}

function formatFcfa(value) {
  return `${formatNumber(value)} FCFA`;
}

function buildPlays({ adReport, contentModel, jobs, sources }) {
  const usefulPages = adReport.estimates?.usefulPages || 0;
  const pageviews = adReport.estimates?.monthlyPageviews || 0;
  const currentAds = adReport.estimates?.adsenseMonthlyFcfa || 0;
  const remoteSources = sources.filter((source) => (source.segments || []).includes("consulting_remote")).length;
  const intlSources = sources.filter((source) => (source.segments || []).includes("international_onu")).length;
  const trustedJobs = jobs.filter((job) => (job.confidenceScore || 0) >= 80).length;

  return [
    {
      id: "content_scale",
      play: "Multiplier les guides evergreen monetisables",
      upsideFcfa: 250000,
      automation: "Generation de guides longs, FAQ, pages metiers, pages villes et pages remote.",
      humanEffort: "faible",
      risk: "faible si contenu utile et original",
      nextAction: `Passer de ${usefulPages} pages indexables a 300 pages utiles avant de chercher plus agressif.`,
    },
    {
      id: "remote_international",
      play: "Lancer une verticale international/remote",
      upsideFcfa: 400000,
      automation: "Sources internationales classees, resumes courts, filtres, liens officiels et pages conseils.",
      humanEffort: "moyen au depart",
      risk: "moyen si les pages ressemblent a une copie de sources",
      nextAction: `Activer progressivement ${remoteSources} sources remote et ${intlSources} sources ONG/ONU avec review_required.`,
    },
    {
      id: "adsense_threshold",
      play: "Atteindre le seuil AdSense mensuel",
      upsideFcfa: 65000,
      automation: "SEO, IndexNow, sitemap, posts sociaux UTM et pages longues.",
      humanEffort: "faible",
      risk: "faible si trafic organique reel",
      nextAction: `Faire monter les pages vues de ${formatNumber(pageviews)} a 100 000/mois.`,
    },
    {
      id: "affiliate_tools",
      play: "Affiliation utile non intrusive",
      upsideFcfa: 150000,
      automation: "Liens marques vers formations, outils CV, cours d'anglais, cloud CV et preparation concours.",
      humanEffort: "faible apres configuration",
      risk: "moyen si les liens sont trop agressifs ou non marques",
      nextAction: "Prevoir des emplacements affiliation dans les guides, separes des boutons de candidature.",
    },
    {
      id: "data_products",
      play: "Produits de donnees agreges automatiques",
      upsideFcfa: 300000,
      automation: "Rapports mensuels publics/telechargeables sur tendances, secteurs, villes et competences.",
      humanEffort: "faible si generation automatique",
      risk: "faible si aucune donnee personnelle n'est vendue",
      nextAction: `Transformer ${trustedJobs} offres fiables en tendances anonymisees et pages rapports.`,
    },
    {
      id: "programmatic_later",
      play: "Programmatique apres traction",
      upsideFcfa: 600000,
      automation: "AdSense d'abord, puis reseaux plus premium quand le trafic est stable.",
      humanEffort: "moyen",
      risk: "moyen, depend du volume et de la qualite trafic",
      nextAction: `Ne pas optimiser trop tot : revenu AdSense actuel estime ${formatFcfa(currentAds)}.`,
    },
  ].sort((a, b) => b.upsideFcfa - a.upsideFcfa);
}

function buildMarkdown(report) {
  return `# Roadmap business automatique

Derniere generation : ${report.generatedAt}

## Principe

L'objectif est de maximiser l'argent avec le moins d'interaction humaine possible,
mais sans tomber dans le scraping abusif, le contenu pauvre ou les pratiques qui
peuvent faire refuser AdSense. La voie la plus solide est de combiner contenu
original, SEO, international/remote, affiliation utile, data agregee et publicite.

## Plays priorises

| Priorite | Play | Potentiel mensuel | Effort | Risque | Action suivante |
| ---: | --- | ---: | --- | --- | --- |
${report.plays
  .map(
    (play, index) =>
      `| ${index + 1} | ${play.play} | ${formatFcfa(play.upsideFcfa)} | ${play.humanEffort} | ${play.risk} | ${play.nextAction} |`
  )
  .join("\n")}

## Decisions de marque

- Garder Emplois Burkina comme actif SEO local.
- Ajouter International/Remote avant tout changement global de nom.
- Creer une marque mere seulement si la verticale internationale depasse durablement le local.
- Ne pas promettre un revenu passif garanti : suivre le revenu reel par trafic, RPM et seuil de paiement.

## Ce que le systeme doit faire chaque run

- Collecter les offres propres et les sources internationales autorisees.
- Generer des pages originales qui expliquent, comparent et guident.
- Soumettre sitemap et IndexNow.
- Alimenter la file sociale avec UTM.
- Recalculer les scenarios AdSense et contenu pur.
- Mettre en noindex ou moderation les contenus faibles ou trop dupliques.
`;
}

async function main() {
  await mkdir(GROWTH_DIR, { recursive: true });
  const [adReport, contentModel, jobs, sources] = await Promise.all([
    readJson(new URL("growth/ad-monetization-autopilot.json", DATA_DIR), {}),
    readJson(new URL("growth/pure-content-revenue-model.json", DATA_DIR), {}),
    readJson(new URL("curated-jobs.json", DATA_DIR), []),
    readJson(new URL("sources.json", DATA_DIR), []),
  ]);

  const report = {
    generatedAt: new Date().toISOString(),
    plays: buildPlays({ adReport, contentModel, jobs, sources }),
    metrics: {
      usefulPages: adReport.estimates?.usefulPages || 0,
      currentContentOnlyMinFcfa: contentModel.minimumRangeFcfa?.min || 0,
      currentContentOnlyMaxFcfa: contentModel.minimumRangeFcfa?.max || 0,
      sources: sources.length,
      jobs: jobs.length,
    },
  };

  await writeFile(new URL("business-growth-roadmap.json", GROWTH_DIR), JSON.stringify(report, null, 2), "utf8");
  await writeFile(new URL("BUSINESS_GROWTH_ROADMAP.md", DOCS_DIR), buildMarkdown(report), "utf8");

  console.log(`Business growth roadmap generated: ${report.plays.length} plays.`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
