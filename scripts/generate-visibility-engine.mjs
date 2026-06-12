import { mkdir, readFile, writeFile } from "node:fs/promises";
import { existsSync } from "node:fs";
import { join } from "node:path";
import { fileURLToPath } from "node:url";

const ROOT = new URL("../", import.meta.url);
const ROOT_PATH = fileURLToPath(ROOT);
const DATA_DIR = new URL("data/", ROOT);
const GROWTH_DIR = new URL("data/growth/", ROOT);
const RUNTIME_DIR = new URL("data/runtime/", ROOT);
const DOCS_DIR = new URL("docs/", ROOT);

function readJson(path, fallback = []) {
  return readFile(path, "utf8")
    .then((content) => JSON.parse(content))
    .catch(() => fallback);
}

function readText(path, fallback = "") {
  return readFile(path, "utf8").catch(() => fallback);
}

function countExisting(paths) {
  return paths.filter((path) => existsSync(join(ROOT_PATH, path))).length;
}

function scoreCheck(checks, id, label, ok, weight, fix) {
  checks.push({ id, label, ok: Boolean(ok), weight, fix });
}

function formatFcfa(value) {
  return String(value || 0).replace(/\B(?=(\d{3})+(?!\d))/g, " ") + " FCFA";
}

function unique(items) {
  return [...new Set(items.filter(Boolean))];
}

function buildPartnerTargets(sources, jobs, rateCard) {
  const sourceTargets = sources.slice(0, 24).map((source) => ({
    type: "source_partner",
    name: source.name,
    url: source.url,
    priority: source.priority || 5,
    angle: "Proposer un partenariat de diffusion propre avec lien vers la source officielle et attribution claire.",
    ask: "Backlink vers JobFaso, flux RSS/API autorise, ou formulaire de soumission d'offres.",
  }));

  const categories = unique(jobs.map((job) => job.category)).slice(0, 12);
  const categoryTargets = categories.map((category, index) => ({
    type: "category_sponsor",
    name: `Sponsor categorie ${category}`,
    url: "",
    priority: index + 2,
    angle: `Vendre une visibilite utile sur la categorie ${category}.`,
    ask: "Sponsor mensuel, bannieres natives marquees, lien suivi et rapport de performance.",
  }));

  const services = [
    ["Ecoles de formation professionnelle", "Sponsor guides metiers, pages categories et posts WhatsApp."],
    ["Cabinets RH et recruteurs", "Annonces premium, shortlist candidats et rapport marche."],
    ["Centres CV et coaching entretien", "Leads qualifies avec commission par client confirme."],
    ["Operateurs telecom et fintech", "Campagnes utiles pour candidats, data et mobile money."],
    ["Associations artisans et BTP", "Profils terrain verifies et pages metiers locales."],
  ].map(([name, angle], index) => ({
    type: "commercial_partner",
    name,
    url: "",
    priority: index + 1,
    angle,
    ask: "Partenariat legal, marque, mesure par clics/leads, sans vente abusive de donnees personnelles.",
  }));

  const products = rateCard.map((product, index) => ({
    type: "revenue_product",
    name: product.name,
    url: "",
    priority: index + 1,
    angle: `${product.priceFcfa ? formatFcfa(product.priceFcfa) : "Sur devis"} - ${(product.includes || []).join(", ")}.`,
    ask: `Trouver 5 clients potentiels pour le produit ${product.name}.`,
  }));

  return [...services, ...categoryTargets, ...sourceTargets, ...products].sort((a, b) => a.priority - b.priority);
}

function buildOutreachTemplates(config) {
  const siteUrl = config.baseUrl || "https://jobfaso.com";
  return [
    {
      id: "source_partner",
      subject: "Partenariat diffusion offres d'emploi au Burkina Faso",
      body: `Bonjour,\n\nJe vous contacte pour JobFaso, une plateforme qui aide les candidats au Burkina Faso a retrouver les offres d'emploi, concours, stages et missions locales depuis des sources fiables.\n\nNous souhaitons referencer vos annonces avec attribution claire, lien vers votre source officielle et respect de vos conditions de diffusion. L'objectif est de vous apporter des candidats mieux informes, pas de remplacer votre site.\n\nSeriez-vous ouvert a un partenariat simple : flux autorise, page partenaire, ou lien retour vers ${siteUrl} ?\n\nMerci,\nEquipe JobFaso`,
    },
    {
      id: "recruiter_offer",
      subject: "Publier vos offres et recevoir plus de candidats qualifies",
      body: `Bonjour,\n\nJobFaso aide les recruteurs a diffuser leurs offres au Burkina Faso avec pages indexables, alertes candidats, suivi des clics et rapports simples.\n\nNous pouvons publier une offre, la mettre en avant, ou lancer une campagne de recrutement avec formulaire et export candidats.\n\nSouhaitez-vous recevoir la grille des packs ou tester une premiere publication ?\n\nCordialement,\nEquipe JobFaso`,
    },
    {
      id: "training_sponsor",
      subject: "Visibilite formation aupres des candidats JobFaso",
      body: `Bonjour,\n\nVotre formation peut toucher des candidats qui recherchent activement un emploi, une reconversion ou un metier terrain.\n\nJobFaso propose des emplacements sponsorises marques, des guides metiers et un suivi des clics/leads pour mesurer l'interet reel.\n\nSouhaitez-vous sponsoriser une categorie ou un guide pendant un mois ?\n\nCordialement,\nEquipe JobFaso`,
    },
  ];
}

function buildMarkdownReport(report, targets, templates) {
  return `# Moteur visibilite et revenus JobFaso

Derniere generation : ${report.generatedAt}

## Score de preparation

Score global : ${report.score}/100

| Controle | Etat | Poids | Correction |
| --- | --- | ---: | --- |
${report.checks.map((check) => `| ${check.label} | ${check.ok ? "OK" : "A faire"} | ${check.weight} | ${check.fix} |`).join("\n")}

## Priorites immediates

${report.priorities.map((item) => `- ${item}`).join("\n")}

## Cibles backlinks et partenariats

${targets
  .slice(0, 30)
  .map((target) => `- ${target.name} (${target.type}) : ${target.angle} Demande : ${target.ask}`)
  .join("\n")}

## Scripts de prospection

${templates.map((template) => `### ${template.subject}\n\n${template.body}`).join("\n\n")}

## Regles de croissance propre

- Ne jamais acheter de faux trafic ou provoquer de faux clics AdSense.
- Marquer clairement publicite, sponsorise ou partenaire.
- Obtenir le consentement avant newsletter, WhatsApp ou collecte candidat.
- Chercher des backlinks utiles : partenaires RH, ecoles, medias locaux, associations, institutions.
- Prioriser contenu original, guides utiles et fiches d'offres propres.
`;
}

async function main() {
  const [config, jobs, sources, rateCard, sitemap, robots] = await Promise.all([
    readJson(new URL("site-config.json", DATA_DIR), {}),
    readJson(new URL("curated-jobs.json", DATA_DIR), []),
    readJson(new URL("sources.json", DATA_DIR), []),
    readJson(new URL("rate-card.json", DATA_DIR), []),
    readText(new URL("sitemap.xml", ROOT)),
    readText(new URL("robots.txt", ROOT)),
  ]);

  await mkdir(GROWTH_DIR, { recursive: true });
  await mkdir(RUNTIME_DIR, { recursive: true });

  const staticTrustPages = countExisting(["privacy.html", "terms.html", "contacts.html", "grille-tarifaire.html"]);
  const sitemapUrls = [...sitemap.matchAll(/<loc>/g)].length;
  const guidePages = countExisting(["conseils.html", "docs/MONETISATION.md", "docs/COMPLIANCE.md"]);
  const checks = [];

  scoreCheck(checks, "domain", "Domaine public configure", Boolean(config.baseUrl), 10, "Configurer JOBFASO_BASE_URL et DNS.");
  scoreCheck(checks, "contact", "Contact public visible", Boolean(config.contactEmail), 10, "Ajouter email et page contact.");
  scoreCheck(checks, "trust_pages", "Pages confiance", staticTrustPages >= 4, 12, "Garder privacy, terms, contacts et tarifs.");
  scoreCheck(checks, "sitemap", "Sitemap riche", sitemapUrls >= 40, 12, "Executer npm run growth.");
  scoreCheck(checks, "robots", "Robots.txt propre", robots.includes("Sitemap:"), 8, "Regenerer robots.txt.");
  scoreCheck(checks, "content_depth", "Volume offres SEO", jobs.length >= 20, 12, "Automatiser plus de sources fiables.");
  scoreCheck(checks, "source_diversity", "Diversite des sources", sources.length >= 30, 10, "Ajouter partenaires/RSS/API autorises.");
  scoreCheck(checks, "guides", "Contenus utiles hors offres", guidePages >= 3, 8, "Publier guides candidats originaux.");
  scoreCheck(checks, "adsense", "AdSense pret a activer", Boolean(config.adsenseClient), 8, "Ajouter adsenseClient apres approbation Google.");
  scoreCheck(checks, "monetization", "Produits revenus definis", rateCard.length >= 6, 10, "Maintenir data/rate-card.json.");

  const score = checks.reduce((sum, check) => sum + (check.ok ? check.weight : 0), 0);
  const priorities = checks
    .filter((check) => !check.ok)
    .sort((a, b) => b.weight - a.weight)
    .slice(0, 6)
    .map((check) => check.fix);

  const targets = buildPartnerTargets(sources, jobs, rateCard);
  const templates = buildOutreachTemplates(config);
  const report = {
    generatedAt: new Date().toISOString(),
    score,
    checks,
    priorities,
    totals: {
      jobs: jobs.length,
      sources: sources.length,
      sitemapUrls,
      rateProducts: rateCard.length,
      outreachTargets: targets.length,
      outreachTemplates: templates.length,
    },
  };

  await writeFile(new URL("visibility-report.json", GROWTH_DIR), JSON.stringify(report, null, 2), "utf8");
  await writeFile(new URL("outreach-targets.json", GROWTH_DIR), JSON.stringify(targets, null, 2), "utf8");
  await writeFile(new URL("outreach-templates.json", GROWTH_DIR), JSON.stringify(templates, null, 2), "utf8");
  await writeFile(new URL("visibility-report.json", RUNTIME_DIR), JSON.stringify(report, null, 2), "utf8");
  await writeFile(new URL("VISIBILITY_ENGINE.md", DOCS_DIR), buildMarkdownReport(report, targets, templates), "utf8");

  console.log(`Visibility engine generated: score ${score}/100, ${targets.length} targets.`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
