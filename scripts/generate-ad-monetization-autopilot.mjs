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

function readText(path, fallback = "") {
  return readFile(path, "utf8").catch(() => fallback);
}

function countBy(items, pick) {
  const map = new Map();
  for (const item of items) {
    const key = pick(item) || "A classer";
    map.set(key, (map.get(key) || 0) + 1);
  }
  return [...map.entries()].sort((a, b) => b[1] - a[1] || a[0].localeCompare(b[0], "fr"));
}

function formatNumber(value) {
  return String(Math.round(value || 0)).replace(/\B(?=(\d{3})+(?!\d))/g, " ");
}

function formatFcfa(value) {
  return `${formatNumber(value)} FCFA`;
}

function topPagesFromSitemap(sitemap) {
  return [...sitemap.matchAll(/<loc>(.*?)<\/loc>/g)]
    .map((match) => match[1])
    .filter(Boolean);
}

function isUsefulCity(value = "") {
  const city = String(value).trim();
  if (!city || city.length > 28) return false;
  if (/poste|courant|mois|date|deadline|recrut/i.test(city)) return false;
  return /[a-z]/i.test(city);
}

function buildEvergreenClusters(jobs) {
  const topCategories = countBy(jobs, (job) => job.category).slice(0, 8);
  const topCities = countBy(
    jobs.filter((job) => isUsefulCity(job.city)),
    (job) => job.city
  ).slice(0, 6);
  const baseClusters = [
    {
      id: "concours-publics",
      theme: "Concours, resultats et dossiers administratifs",
      searchIntent: "Requetes permanentes autour des concours, communiques, resultats, dossiers et dates.",
      contentToCreate: [
        "Calendrier concours Burkina Faso par mois",
        "Documents a fournir pour concours au Burkina Faso",
        "Comment verifier un communique officiel de concours",
      ],
      monetization: "AdSense display + liens utiles sponsorisables par formations de preparation.",
    },
    {
      id: "cv-lettre-entretien",
      theme: "CV, lettre de motivation et entretien",
      searchIntent: "Trafic evergreen candidat avec fort volume et faible dependance aux offres du jour.",
      contentToCreate: [
        "Modele CV Burkina Faso gratuit",
        "Exemple lettre de motivation ONG",
        "Questions entretien emploi au Burkina Faso",
      ],
      monetization: "AdSense + affiliation outils CV + sponsors formation/coaching clairement marques.",
    },
    {
      id: "metiers-salaires",
      theme: "Metiers, salaires et formations",
      searchIntent: "Recherche d'orientation, reconversion, salaires et formations locales.",
      contentToCreate: [
        "Salaire comptable Burkina Faso",
        "Metiers qui recrutent a Ouagadougou",
        "Formations courtes pour trouver du travail",
      ],
      monetization: "AdSense + affiliation formation + rapports agreges pour institutions.",
    },
  ];

  const categoryClusters = topCategories.map(([category, count]) => ({
    id: `categorie-${category.toLowerCase().replace(/[^a-z0-9]+/gi, "-")}`,
    theme: `Guide complet ${category}`,
    searchIntent: `${count} offres actuelles donnent un angle naturel pour capter les recherches ${category}.`,
    contentToCreate: [
      `Comment trouver un emploi ${category} au Burkina Faso`,
      `Competences demandees en ${category}`,
      `Sources fiables pour offres ${category}`,
    ],
    monetization: "AdSense sur guide long + sponsor categorie si un partenaire pertinent existe.",
  }));

  const cityClusters = topCities.map(([city, count]) => ({
    id: `ville-${city.toLowerCase().replace(/[^a-z0-9]+/gi, "-")}`,
    theme: `Emploi et opportunites a ${city}`,
      searchIntent: `${count} offre${count > 1 ? "s" : ""} actuelle${count > 1 ? "s" : ""} soutiennent une page locale indexable.`,
    contentToCreate: [
      `Offres d'emploi a ${city}`,
      `Entreprises et ONG qui recrutent a ${city}`,
      `Alertes emploi ${city}`,
    ],
    monetization: "AdSense local + partenaires utiles locaux, sans facturer les candidats.",
  }));

  return [...baseClusters, ...categoryClusters, ...cityClusters].slice(0, 18);
}

function buildDistributionNetwork(config, urls, socialQueue) {
  const baseUrl = config.baseUrl || "https://emplois-burkina.com";
  return [
    {
      channel: "Google Search",
      automation: "Sitemap, schema.org JobPosting/Article, Search Console, contenu evergreen et Core Web Vitals.",
      nextAction: `Soumettre ${baseUrl}/sitemap.xml et surveiller pages indexees, impressions et CTR.`,
      revenueImpact: "Source principale pour AdSense durable.",
    },
    {
      channel: "Bing, Yahoo, DuckDuckGo, Yandex",
      automation: "IndexNow + sitemap + robots propre.",
      nextAction: `Soumettre ${urls.length} URLs via indexnow-urls.txt apres chaque generation.`,
      revenueImpact: "Trafic additionnel peu couteux, utile pour diversifier.",
    },
    {
      channel: "Google Discover et actualites emploi",
      automation: "Titres clairs, images OG, guides utiles, flux RSS/JSON, pages fraiches.",
      nextAction: "Publier des guides longs et des syntheses hebdomadaires non dupliquees.",
      revenueImpact: "Pics de trafic compatibles display si contenu original.",
    },
    {
      channel: "Facebook, LinkedIn, WhatsApp, Telegram",
      automation: "File de posts, digest, liens UTM, opt-in et desinscription.",
      nextAction: `Programmer ${socialQueue.length || 0} posts utiles avec liens vers pages guides/offres.`,
      revenueImpact: "Amene l'audience vers les pages monetisees sans faire payer les lecteurs.",
    },
    {
      channel: "Crawlers IA et assistants",
      automation: "llms.txt, flux structures, pages FAQ et donnees propres.",
      nextAction: "Garder llms.txt a jour et creer des pages de reponses directes.",
      revenueImpact: "Visibilite de marque, backlinks et citations indirectes.",
    },
  ];
}

function estimateAdsRevenue({ urls, jobs, config }) {
  const usefulPages = Math.max(urls.length, jobs.length);
  const monthlyPageviews = Math.max(10_000, usefulPages * 180);
  const rpmFcfa = config.adsenseClient ? 900 : 650;
  const adsenseMonthlyFcfa = Math.round((monthlyPageviews / 1000) * rpmFcfa);
  const affiliateMonthlyFcfa = Math.round(monthlyPageviews * 0.0025 * 500);
  const directDisplayMonthlyFcfa = Math.round(Math.min(4, Math.ceil(monthlyPageviews / 25_000)) * 50_000);

  return {
    usefulPages,
    monthlyPageviews,
    rpmFcfa,
    adsenseMonthlyFcfa,
    affiliateMonthlyFcfa,
    directDisplayMonthlyFcfa,
    totalTrafficRevenueFcfa: adsenseMonthlyFcfa + affiliateMonthlyFcfa + directDisplayMonthlyFcfa,
  };
}

function buildMarkdown(report) {
  return `# Autopilote trafic, referencement et AdSense

Derniere generation : ${report.generatedAt}

## Objectif

Rendre Emplois Burkina trouvable partout de facon naturelle : moteurs de
recherche, reseaux sociaux, flux RSS/JSON, crawlers IA et partages communautaires.
Le revenu prioritaire doit venir du trafic et des inventaires publicitaires :
AdSense, display direct, affiliation utile et contenus sponsorises marques, sans
faire payer les chercheurs d'emploi.

## Estimation trafic et revenu publicitaire

- Pages utiles indexables : ${report.estimates.usefulPages}
- Pages vues mensuelles visees a court terme : ${formatNumber(report.estimates.monthlyPageviews)}
- RPM AdSense prudent : ${formatFcfa(report.estimates.rpmFcfa)}
- AdSense estime : ${formatFcfa(report.estimates.adsenseMonthlyFcfa)}
- Affiliation utile estimee : ${formatFcfa(report.estimates.affiliateMonthlyFcfa)}
- Display direct estime : ${formatFcfa(report.estimates.directDisplayMonthlyFcfa)}
- Total trafic estime : ${formatFcfa(report.estimates.totalTrafficRevenueFcfa)}

## Reseau de distribution automatique

| Canal | Automatisation | Action suivante | Impact revenu |
| --- | --- | --- | --- |
${report.distribution
  .map((item) => `| ${item.channel} | ${item.automation} | ${item.nextAction} | ${item.revenueImpact} |`)
  .join("\n")}

## Clusters de contenu a produire en priorite

${report.contentClusters
  .map(
    (cluster) => `### ${cluster.theme}

- Intention : ${cluster.searchIntent}
- Monetisation : ${cluster.monetization}
- Pages a creer :
${cluster.contentToCreate.map((item) => `  - ${item}`).join("\n")}`
  )
  .join("\n\n")}

## Regles AdSense et confiance

- Ne jamais encourager les clics sur les annonces.
- Ne jamais placer une annonce comme si c'etait un bouton de candidature.
- Garder les offres lisibles et utiles avant la publicite.
- Preferer guides longs, pages villes, pages categories et dossiers pratiques.
- Marquer sponsors, affiliation et contenu partenaire.
- Eviter les pages pauvres creees uniquement pour afficher des annonces.

## Stack moderne recommandee

- PostgreSQL managee pour donnees persistantes et historiques.
- Next.js/NestJS pour pages rapides, API et rendu indexable.
- Schema.org JobPosting, Article, BreadcrumbList, FAQPage et ItemList.
- Search Console, Bing Webmaster Tools, IndexNow et sitemaps automatiques.
- Analytics respectueux de la vie privee + evenements UTM.
- AdSense Auto ads au debut, puis emplacements manuels sur pages longues.
- CDN, cache edge, compression images et controle Core Web Vitals.
`;
}

async function main() {
  await mkdir(GROWTH_DIR, { recursive: true });

  const [config, jobs, sitemap, socialQueue] = await Promise.all([
    readJson(new URL("site-config.json", DATA_DIR), {}),
    readJson(new URL("curated-jobs.json", DATA_DIR), []),
    readText(new URL("sitemap.xml", ROOT), ""),
    readJson(new URL("social/queue.json", DATA_DIR), []),
  ]);

  const urls = topPagesFromSitemap(sitemap);
  const report = {
    generatedAt: new Date().toISOString(),
    estimates: estimateAdsRevenue({ urls, jobs, config }),
    distribution: buildDistributionNetwork(config, urls, socialQueue),
    contentClusters: buildEvergreenClusters(jobs),
    requirements: [
      "AdSense approuve et ads.txt configure",
      "Search Console et Bing Webmaster Tools connectes",
      "Sitemap soumis automatiquement",
      "Posts sociaux avec UTM",
      "Analytics trafic/revenu",
      "Contenu original long et renouvelable",
    ],
  };

  await writeFile(new URL("ad-monetization-autopilot.json", GROWTH_DIR), JSON.stringify(report, null, 2), "utf8");
  await writeFile(new URL("TRAFFIC_ADSENSE_AUTOPILOT.md", DOCS_DIR), buildMarkdown(report), "utf8");

  console.log(
    `Ad monetization autopilot generated: ${formatFcfa(report.estimates.totalTrafficRevenueFcfa)} estimated traffic revenue.`
  );
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
