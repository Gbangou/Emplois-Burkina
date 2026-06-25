import { mkdir, readFile, writeFile } from "node:fs/promises";

const ROOT = new URL("../", import.meta.url);
const JOBS_FILE = new URL("data/curated-jobs.json", ROOT);
const RATE_CARD_FILE = new URL("data/rate-card.json", ROOT);
const OUT_DIR = new URL("data/growth/", ROOT);
const DOCS_DIR = new URL("docs/", ROOT);

function countBy(items, keyFn) {
  return items.reduce((acc, item) => {
    const key = keyFn(item) || "Non precise";
    acc[key] = (acc[key] || 0) + 1;
    return acc;
  }, {});
}

function topEntries(map, limit = 8) {
  return Object.entries(map)
    .sort((a, b) => b[1] - a[1] || a[0].localeCompare(b[0], "fr"))
    .slice(0, limit);
}

function markdownTable(rows) {
  return ["| Element | Volume |", "| --- | ---: |", ...rows.map(([name, count]) => `| ${name} | ${count} |`)].join("\n");
}

function formatFcfa(value) {
  return String(value || 0).replace(/\B(?=(\d{3})+(?!\d))/g, " ") + " FCFA";
}

async function main() {
  const jobs = JSON.parse(await readFile(JOBS_FILE, "utf8"));
  const rateCard = JSON.parse(await readFile(RATE_CARD_FILE, "utf8"));
  await mkdir(OUT_DIR, { recursive: true });

  const categories = topEntries(countBy(jobs, (job) => job.category));
  const cities = topEntries(countBy(jobs, (job) => job.city));
  const sources = topEntries(countBy(jobs, (job) => job.sourceName));
  const recentJobs = jobs.slice(0, 12).map((job) => ({
    title: job.title,
    company: job.company || job.sourceName || "Organisation",
    city: job.city || "Burkina Faso",
    category: job.category || "Opportunite",
    source: job.sourceName || "Source",
    url: job.canonicalUrl || job.sourceUrl || "",
  }));

  const calendar = [
    {
      day: "Lundi",
      channel: "Site + Facebook + LinkedIn",
      action: "Publier le digest des 10 nouvelles opportunites avec lien vers Emplois Burkina.",
      revenueHook: "Ajouter un encart sponsorise pour formation ou recruteur.",
    },
    {
      day: "Mardi",
      channel: "Guide SEO",
      action: "Mettre en avant un guide candidat et 3 offres liees au theme.",
      revenueHook: "Proposer un partenaire CV, formation ou coaching.",
    },
    {
      day: "Mercredi",
      channel: "Prospection recruteurs",
      action: "Contacter 10 recruteurs avec les categories les plus consultees.",
      revenueHook: "Vendre annonce prioritaire ou sponsor categorie.",
    },
    {
      day: "Jeudi",
      channel: "WhatsApp / newsletter",
      action: "Envoyer un digest court par domaine avec consentement des abonnes.",
      revenueHook: "Inclure un seul sponsor clairement marque.",
    },
    {
      day: "Vendredi",
      channel: "Rapport marche",
      action: "Publier une tendance agregee : villes, secteurs, sources, deadlines.",
      revenueHook: "Vendre rapport detaille aux ecoles, cabinets RH et formations.",
    },
  ];

  const playbook = `# Systeme revenus et croissance Emplois Burkina

## Positionnement

Emplois Burkina doit rester gratuit pour les chercheurs d'emploi. Les revenus viennent de l'audience qualifiee, de la visibilite recruteur, des sponsors clairement identifies, des formations partenaires et des donnees agregees.

## Inventaire a vendre

${rateCard
  .map((product) => `- ${product.name} : ${product.priceFcfa ? formatFcfa(product.priceFcfa) : "sur devis"} - ${(product.includes || []).join(", ")}`)
  .join("\n")}

## Opportunites par categorie

${markdownTable(categories)}

## Opportunites par ville

${markdownTable(cities)}

## Sources les plus actives

${markdownTable(sources)}

## Cadence automatique

${calendar.map((item) => `- ${item.day} : ${item.action} ${item.revenueHook}`).join("\n")}

## Regles de confiance

- Les candidats ne paient pas pour voir les offres.
- Les offres sponsorisees sont marquees.
- Les donnees personnelles ne sont pas revendues.
- Les rapports vendus sont agreges, sans contacts individuels sans consentement.
- Les publicites ne doivent pas bloquer la lecture ni encourager des clics artificiels.
`;

  const socialPosts = recentJobs
    .slice(0, 6)
    .map(
      (job, index) => `Post ${index + 1}
${job.category} - ${job.title}
Ville : ${job.city}
Organisation : ${job.company}
Source : ${job.source}
Voir les details sur Emplois Burkina et verifier la source officielle avant de postuler.
`
    )
    .join("\n---\n\n");

  await writeFile(new URL("calendar.json", OUT_DIR), JSON.stringify(calendar, null, 2), "utf8");
  await writeFile(new URL("recent-jobs.json", OUT_DIR), JSON.stringify(recentJobs, null, 2), "utf8");
  await writeFile(new URL("market-snapshot.json", OUT_DIR), JSON.stringify({ categories, cities, sources }, null, 2), "utf8");
  await writeFile(new URL("GROWTH_REVENUE_SYSTEM.md", DOCS_DIR), playbook, "utf8");
  await writeFile(new URL("MARKETING_POSTS.md", DOCS_DIR), `# Posts marketing Emplois Burkina\n\n${socialPosts}`, "utf8");

  console.log("Growth assets generated: data/growth/*, docs/GROWTH_REVENUE_SYSTEM.md, docs/MARKETING_POSTS.md");
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
