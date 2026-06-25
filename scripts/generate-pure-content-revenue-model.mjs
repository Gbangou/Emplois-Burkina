import { mkdir, readFile, writeFile } from "node:fs/promises";

const ROOT = new URL("../", import.meta.url);
const DATA_DIR = new URL("data/", ROOT);
const GROWTH_DIR = new URL("data/growth/", ROOT);
const DOCS_DIR = new URL("docs/", ROOT);

const USD_TO_FCFA = Number(process.env.EMPLOIS_BURKINA_USD_TO_FCFA || 600);
const ADSENSE_THRESHOLD_USD = 100;
const ADSENSE_THRESHOLD_FCFA = ADSENSE_THRESHOLD_USD * USD_TO_FCFA;

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

function adsenseRevenue(pageviews, rpmFcfa) {
  return Math.round((pageviews / 1000) * rpmFcfa);
}

function monthsToThreshold(monthlyRevenue) {
  if (!monthlyRevenue) return null;
  return Math.max(1, Math.ceil(ADSENSE_THRESHOLD_FCFA / monthlyRevenue));
}

function buildScenarios(basePageviews) {
  const scenarioInputs = [
    {
      id: "not_approved",
      label: "Sans approbation AdSense",
      monthlyPageviews: basePageviews,
      rpmFcfa: 0,
      probability: "Possible tant que le site n'est pas valide par Google",
      interpretation: "Revenu AdSense nul meme si le site a du trafic.",
    },
    {
      id: "current_low",
      label: "Demarrage prudent",
      monthlyPageviews: Math.max(basePageviews, 8_000),
      rpmFcfa: 200,
      probability: "Conservateur",
      interpretation: "Trafic encore faible, RPM bas, paiement seulement apres plusieurs mois.",
    },
    {
      id: "current_base",
      label: "Base actuelle du modele",
      monthlyPageviews: Math.max(basePageviews, 20_000),
      rpmFcfa: 450,
      probability: "Realiste apres indexation initiale",
      interpretation: "Le contenu commence a tourner, mais le paiement mensuel reste improbable.",
    },
    {
      id: "local_scale",
      label: "Site local qui prend",
      monthlyPageviews: 100_000,
      rpmFcfa: 500,
      probability: "Possible avec SEO, reseaux sociaux et contenu original regulier",
      interpretation: "Premier niveau ou le paiement mensuel devient presque regulier.",
    },
    {
      id: "regional_scale",
      label: "Afrique francophone",
      monthlyPageviews: 500_000,
      rpmFcfa: 650,
      probability: "Ambitieux, demande marque plus large et contenu vraiment utile",
      interpretation: "Revenu correct, mais exige une vraie audience et beaucoup de pages utiles.",
    },
    {
      id: "international_scale",
      label: "International emploi/remote",
      monthlyPageviews: 1_000_000,
      rpmFcfa: 900,
      probability: "Tres ambitieux, concurrence forte",
      interpretation: "Possible seulement avec une vraie experience produit et contenu differencie.",
    },
  ];

  return scenarioInputs.map((scenario) => {
    const monthlyRevenueFcfa = adsenseRevenue(scenario.monthlyPageviews, scenario.rpmFcfa);
    const payoutEveryMonths = monthsToThreshold(monthlyRevenueFcfa);
    return {
      ...scenario,
      monthlyRevenueFcfa,
      payoutEveryMonths,
      reachesMonthlyThreshold: monthlyRevenueFcfa >= ADSENSE_THRESHOLD_FCFA,
    };
  });
}

function buildInternationalStrategy() {
  return [
    {
      decision: "Ne pas renommer brutalement Emplois Burkina maintenant",
      reason: "Le nom est fort pour le SEO local et la confiance au Burkina Faso.",
      action: "Garder Emplois Burkina comme verticale locale et ajouter une section international/remote.",
    },
    {
      decision: "Creer une marque mere plus large seulement quand la section internationale prouve son trafic",
      reason: "Changer trop tot peut diluer le positionnement et casser la clarte du site.",
      action: "Prevoir une architecture type Emplois Burkina + Jobs Afrique + Remote Afrique.",
    },
    {
      decision: "Scraper moins, enrichir plus",
      reason: "Google peut penaliser le scraping massif sans valeur ajoutee.",
      action: "Publier resumes courts, liens officiels, filtres, scoring, guides, tendances et pages originales.",
    },
    {
      decision: "Privilegier RSS, API, pages officielles et sources qui autorisent la reprise",
      reason: "La stabilite du revenu depend de la conformite et de la confiance.",
      action: "Classer chaque source en official_link, rss_api, review_required ou manual_only.",
    },
  ];
}

function buildMarkdown(report) {
  return `# Modele revenu contenu pur

Derniere generation : ${report.generatedAt}

## Reponse serieuse

Non, je ne peux pas confirmer un revenu regulier automatique garanti uniquement
avec du contenu. Le modele peut rapporter de l'argent, mais seulement si le site
est approuve par AdSense, indexe, utile, rapide, conforme et s'il obtient du
trafic humain reel. Sans approbation AdSense ou sans trafic, le revenu contenu
pur est de ${formatFcfa(0)}.

La projection minimale prudente actuelle est volontairement basse : entre
${formatFcfa(report.minimumRangeFcfa.min)} et ${formatFcfa(report.minimumRangeFcfa.max)}
par mois au demarrage apres approbation. Ce n'est pas encore un revenu regulier
mensuel, car le seuil de paiement AdSense est modelise ici a environ
${formatFcfa(report.adsenseThresholdFcfa)} (${ADSENSE_THRESHOLD_USD} USD x
${USD_TO_FCFA} FCFA). Si le mois ne depasse pas ce seuil, le solde s'accumule
jusqu'au paiement.

Mon estimation sincere :

- 0 FCFA/mois tant qu'AdSense n'est pas approuve ou que le trafic est trop faible.
- ${formatFcfa(report.minimumRangeFcfa.min)}-${formatFcfa(report.minimumRangeFcfa.max)}/mois au debut si le site est approuve et commence a etre visite.
- ${formatFcfa(50_000)}-${formatFcfa(120_000)}/mois avec environ 100 000 a 200 000 pages vues mensuelles qualifiees.
- ${formatFcfa(250_000)}-${formatFcfa(600_000)}/mois devient possible seulement avec plusieurs centaines de milliers de pages vues mensuelles, des guides originaux et une bonne retention.
- Plus de ${formatFcfa(1_000_000)}/mois avec contenu pur uniquement est possible mais non minimal ; il faut une audience massive, regionale/internationale, et une execution SEO tres forte.

## Scenarios AdSense uniquement

| Scenario | Pages vues/mois | RPM | Revenu/mois | Paiement mensuel ? | Delai estime avant paiement |
| --- | ---: | ---: | ---: | --- | --- |
${report.scenarios
  .map(
    (item) =>
      `| ${item.label} | ${formatNumber(item.monthlyPageviews)} | ${formatFcfa(item.rpmFcfa)} | ${formatFcfa(item.monthlyRevenueFcfa)} | ${item.reachesMonthlyThreshold ? "Oui" : "Non"} | ${item.payoutEveryMonths ? `${item.payoutEveryMonths} mois` : "Aucun paiement"} |`
  )
  .join("\n")}

## Mobile Money

AdSense ne doit pas etre modelise comme un paiement direct Orange Money ou Mobile
Money au Burkina Faso. Le chemin realiste est : AdSense -> virement bancaire
international -> transfert vers Orange Money/Mobile Money si ta banque le permet.
Pour recevoir directement sur Mobile Money, il faudrait des reseaux publicitaires,
affiliations ou paiements locaux qui supportent explicitement ce mode, mais ce ne
serait plus AdSense pur.

## Modele automatise a forte valeur ajoutee

Pour maximiser les revenus sans faire payer les candidats pauvres, il faut
automatiser quatre etages :

- Etage 1 : AdSense sur pages offres, guides, villes, metiers, salaires et concours.
- Etage 2 : affiliation utile et ethique vers formations, outils CV, cours, livres, outils remote.
- Etage 3 : produits numeriques automatises, par exemple CV ATS, lettres, packs entretien, traduction FR/EN.
- Etage 4 : donnees agregees anonymes et rapports marche, sans donnees personnelles.

Le contenu seul peut demarrer le revenu, mais le revenu important vient du mix.

## Scraping international

Le scraping mondial peut augmenter le volume, mais il peut aussi detruire la
visibilite si le site devient une copie automatique de milliers d'autres pages.
La strategie professionnelle est donc :

${report.internationalStrategy.map((item) => `- ${item.decision} : ${item.action}`).join("\n")}

## Nom et positionnement

Je ne recommande pas de renommer tout de suite Emplois Burkina. Le meilleur
chemin est de garder la marque locale, puis d'ajouter des sections :

- Emplois Burkina : offres Burkina, concours, guides locaux.
- Jobs Afrique : opportunites Afrique francophone et ONG internationales.
- Remote Afrique : emplois remote, freelancing, tech, support, data.

Un changement de nom global devient pertinent seulement si la section
internationale depasse durablement le trafic local.

## Ce qui doit etre automatise sans te faire vendre

- Collecte de sources autorisees et scoring qualite.
- Generation de resumes originaux, guides longs, FAQ et pages tendances.
- Soumission sitemap/IndexNow apres chaque generation.
- File sociale automatique avec UTM vers les pages monetisees.
- Tableau de bord revenu : pages vues, RPM, revenu estime, seuil de paiement.
- Blocage ou noindex des pages pauvres, dupliquees ou trop proches des sources.

## Ligne rouge

Un "scraping total partout" sans autorisation, sans valeur ajoutee et fait pour
AdSense est dangereux : risque de non-indexation, refus AdSense, suspension,
reclamations de sources et trafic nul. Le bon modele est massif mais propre :
beaucoup de sources, oui ; duplication automatique, non.
`;
}

async function main() {
  await mkdir(GROWTH_DIR, { recursive: true });
  const adReport = await readJson(new URL("growth/ad-monetization-autopilot.json", DATA_DIR), {});
  const basePageviews = Number(adReport.estimates?.monthlyPageviews || 10_000);
  const scenarios = buildScenarios(basePageviews);
  const currentApprovedScenario = scenarios.find((scenario) => scenario.id === "current_base");

  const report = {
    generatedAt: new Date().toISOString(),
    adsenseThresholdUsd: ADSENSE_THRESHOLD_USD,
    usdToFcfa: USD_TO_FCFA,
    adsenseThresholdFcfa: ADSENSE_THRESHOLD_FCFA,
    minimumRangeFcfa: {
      min: scenarios.find((scenario) => scenario.id === "current_low")?.monthlyRevenueFcfa || 0,
      max: currentApprovedScenario?.monthlyRevenueFcfa || 0,
    },
    scenarios,
    internationalStrategy: buildInternationalStrategy(),
    paymentTruth: {
      adsenseDirectMobileMoney: false,
      realisticPath: "AdSense -> bank account -> Orange Money/Mobile Money transfer if supported by the bank",
      directMobileMoneyRequires: "local ad network, affiliate partner or payment provider that explicitly supports Mobile Money",
    },
  };

  await writeFile(new URL("pure-content-revenue-model.json", GROWTH_DIR), JSON.stringify(report, null, 2), "utf8");
  await writeFile(new URL("PURE_CONTENT_REVENUE_MODEL.md", DOCS_DIR), buildMarkdown(report), "utf8");

  console.log(
    `Pure content revenue model generated: ${formatFcfa(report.minimumRangeFcfa.min)}-${formatFcfa(report.minimumRangeFcfa.max)} minimal approved range.`
  );
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
