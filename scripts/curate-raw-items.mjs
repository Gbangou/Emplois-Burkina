import { readFile, writeFile } from "node:fs/promises";

const ROOT = new URL("../", import.meta.url);
const RAW_FILE = new URL("data/raw-items.json", ROOT);
const OUTPUT_FILE = new URL("data/curated-jobs.json", ROOT);

const blockedTitles = [
  "a propos de rmo",
  "burkina faso",
  "conseils emploi",
  "cote d'ivoire",
  "domaine d'activite",
  "espace entreprises",
  "offres d'emploi",
  "pas encore inscrit",
  "packs annonces",
  "plan du site",
  "se connecter",
  "les annonces",
  "liste des annonces",
  "toutes les offres",
  "commande d'annonces",
  "les entreprises qui recrutent en ce moment",
  "offres de stages",
  "examens et concours",
  "administration",
  "agriculture",
  "architecture",
  "assistance",
  "audiovisuel",
  "biologie",
  "commerce",
  "commercial, vente",
  "comptabilite",
  "conseil",
  "direction",
  "gestion, comptabilite, finance",
  "informatique",
  "ingenieurs",
  "marketing, communication",
  "metiers des services",
  "metiers du btp",
  "mentions legales",
  "journalisme",
  "plus d'articles",
  "production, maintenance, qualite",
  "propriete intellectuelle",
  "recrutements permanents",
  "secretariat, assistanat",
  "choisir des annonces",
  "la lettre de motivation",
  "les parties principales d'un cv",
  "nos clients",
  "nos implantations",
  "nos partenaires",
  "notre savoir faire",
  "qui sommes-nous",
  "transport, logistique",
  "tous les metiers",
  "voir l'offre",
  "alertes emploi",
  "closing soon",
  "duty stations",
  "organizations",
  "la recherche d'emploi",
];

const blockedTitlePatterns = [
  /^comment\s+/,
  /^\d+\s+regles?\s+/,
  /arbre de noel/,
  /arbre de no.l/,
  /cancer du sein/,
  /cliquez ici/,
  /cliquez-ici/,
  /c.te d.ivoire/,
  /grand jeu/,
  /emploi (benin|cameroun|congo|gabon|guinee|maroc|mali|niger|senegal|togo)/,
  /^emploi [a-z\s'-]+$/,
  /emplois actifs/,
  /pas encore inscrit/,
  /plus d.article/,
  /la recherche d.?emploi/,
  /reussir son entretien/,
  /negocier une augmentation/,
  /se connecter/,
  /^ouagadougou \d+$/,
  /^[a-z\s.'&-]+ ouagadougou \d+$/,
  /^vacancytitle:/,
];

const nonBurkinaCountryPatterns = [
  /\/burundi\//,
  /\/centrafrique\//,
  /\/offices\//,
  /\/benin\//,
  /\/cameroun\//,
  /\/congo\//,
  /\/cote-d-ivoire\//,
  /\/gabon\//,
  /\/guinee\//,
  /\/mali\//,
  /\/niger\//,
  /\/senegal\//,
  /\/togo\//,
  /country=(benin|cameroun|congo|gabon|guinee|mali|niger|senegal|togo)/,
];

const nonBurkinaTextPattern =
  /benin|burundi|cameroun|central african republic|centrafrique|congo|cote d'ivoire|cote-d-ivoire|gabon|guinee|mali|mauritanie|niger|nigeria|republique centrafricaine|senegal|togo/;

function normalize(value) {
  return String(value || "")
    .toLowerCase()
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .replace(/\s+/g, " ")
    .trim();
}

function decodeHtml(value) {
  return String(value || "")
    .replace(/&#(\d+);/g, (_, code) => String.fromCharCode(Number(code)))
    .replace(/&#x([a-f0-9]+);/gi, (_, code) => String.fromCharCode(parseInt(code, 16)))
    .replace(/&amp;/g, "&")
    .replace(/&quot;/g, "\"")
    .replace(/&#039;/g, "'")
    .replace(/&apos;/g, "'")
    .replace(/&lt;/g, "<")
    .replace(/&gt;/g, ">")
    .replace(/&nbsp;/g, " ")
    .replace(/\s+/g, " ")
    .trim();
}

function validIsoDate(value) {
  if (!value || !/^\d{4}-\d{2}-\d{2}$/.test(String(value))) return "";
  const date = new Date(`${value}T00:00:00Z`);
  return Number.isNaN(date.getTime()) ? "" : value;
}

function dateLabel(value) {
  const date = validIsoDate(value);
  if (!date) return "";
  return new Intl.DateTimeFormat("fr-FR", {
    day: "2-digit",
    month: "long",
    year: "numeric",
  }).format(new Date(`${date}T00:00:00Z`));
}

function normalizeDateFields(item) {
  const openingDate = validIsoDate(item.openingDate) || validIsoDate(String(item.collectedAt || "").slice(0, 10));
  const closingDate = validIsoDate(item.closingDate) || validIsoDate(item.deadline);
  const inconsistentDates = Boolean(openingDate && closingDate && closingDate < openingDate);

  return {
    openingDate,
    closingDate,
    deadline: closingDate ? dateLabel(closingDate) : item.deadline || "A verifier",
    inconsistentDates,
  };
}

function inferCategory(item) {
  const text = normalize(`${item.title} ${item.url} ${item.excerpt}`);

  if (/concours|fonction publique|enaref|police|douane|armee/.test(text)) return "Concours";
  if (/stage|stagiaire|internship/.test(text)) return "Stage";
  if (/ong|humanitaire|programme|project|officer|coordinateur|unicef|unhcr|pnud|world food|wfp/.test(text)) return "ONG";
  if (/macon|plombier|mecanicien|chauffeur|electricien|technicien|ouvrier|terrain/.test(text)) return "Metier terrain";

  return "Bureau";
}

function inferCity(item) {
  const text = normalize(`${item.title} ${item.city} ${item.excerpt}`);

  if (/bagassi/.test(text)) return "Bagassi";
  if (/bobo/.test(text)) return "Bobo-Dioulasso";
  if (/koudougou/.test(text)) return "Koudougou";
  if (/ouahigouya/.test(text)) return "Ouahigouya";
  if (/teletravail|remote/.test(text)) return "Teletravail";
  if (/ouaga|ouagadougou/.test(text)) return "Ouagadougou";

  return item.city || "Burkina Faso";
}

function isLikelyCategoryPage(item) {
  const title = normalize(item.title);
  const url = normalize(item.url);
  const exactBlocked = blockedTitles.some((blocked) => title === normalize(blocked) || title.includes(normalize(blocked)));
  const patternBlocked = blockedTitlePatterns.some((pattern) => pattern.test(title));
  const categoryUrl = /\/category\/|\/offices\/|\/offres-emploi\/?$|\/examens-concours\/?$|recherche-jobs-burkina-faso\?f%5b0%5d=|recherche-jobs-burkina-faso$/.test(url);
  const genericRmoUrl = item.sourceId === "rmo-burkina" && !/offre|job|emploi/.test(url);

  return exactBlocked || patternBlocked || categoryUrl || genericRmoUrl;
}

function isOutsideBurkina(item) {
  const url = normalize(item.url);
  const text = normalize(`${item.title} ${item.excerpt}`);
  const urlOutside = nonBurkinaCountryPatterns.some((pattern) => pattern.test(url));
  const textOutside = nonBurkinaTextPattern.test(text);
  const textBurkina = /burkina|ouaga|ouagadougou|bobo|koudougou|ouahigouya|dori|kaya|bagassi/.test(text);

  return (urlOutside || textOutside) && !textBurkina;
}

function isLikelyJobTitle(item) {
  const title = normalize(item.title);

  if (/\(h\/f\)|\(f\/h\)|h\/f|f\/h/.test(title)) return true;
  if (/responsable|assistant|charge|chef|directeur|manager|agent|technicien|commercial|magasinier|comptable|coordinateur|specialiste|officer|enqueteur|webdesigner|infographe/.test(title)) {
    return true;
  }

  return item.sourceId !== "rmo-burkina";
}

function curate(items) {
  const seen = new Set();
  const softSeen = new Set();
  const curated = [];

  for (const item of items) {
    if (!item.title || !item.url || isLikelyCategoryPage(item)) continue;
    if (isOutsideBurkina(item)) continue;
    if (normalize(item.title).length < 10) continue;
    if (item.title.includes("�")) continue;
    if (!isLikelyJobTitle(item)) continue;
    if (seen.has(item.id)) continue;

    const category = inferCategory(item);
    const city = inferCity(item);
    const softKey = normalize(`${item.title} ${item.company || item.sourceName} ${city}`).replace(/[^a-z0-9]+/g, "");
    const dateFields = normalizeDateFields(item);

    if (softSeen.has(softKey)) continue;
    if (dateFields.inconsistentDates) continue;

    seen.add(item.id);
    softSeen.add(softKey);

    curated.push({
      id: item.id,
      title: decodeHtml(item.title),
      company: item.company || item.sourceName,
      city,
      category,
      type: item.type || (category === "Concours" ? "Concours" : "A verifier"),
      salary: "Non communique",
      deadline: dateFields.deadline,
      openingDate: dateFields.openingDate,
      closingDate: dateFields.closingDate,
      inconsistentDates: dateFields.inconsistentDates,
      sourceName: item.sourceName,
      sourceUrl: item.url,
      canonicalUrl: item.url,
      riskScore: 0,
      confidenceScore: item.excerpt ? 70 : 45,
      tags: [category, item.sourceName].filter(Boolean),
      status: "needs_review",
      excerpt: decodeHtml(item.excerpt || "").slice(0, 900),
      collectedAt: item.collectedAt,
    });
  }

  return diversifyBySource(curated);
}

function diversifyBySource(items) {
  const buckets = new Map();
  for (const item of items) {
    const bucket = buckets.get(item.sourceName) || [];
    bucket.push(item);
    buckets.set(item.sourceName, bucket);
  }

  for (const bucket of buckets.values()) {
    bucket.sort((a, b) => {
      const dateA = a.closingDate || a.openingDate || String(a.collectedAt || "").slice(0, 10);
      const dateB = b.closingDate || b.openingDate || String(b.collectedAt || "").slice(0, 10);
      return dateB.localeCompare(dateA);
    });
  }

  const diversified = [];
  const sourceNames = [...buckets.keys()].sort((a, b) => a.localeCompare(b, "fr"));
  let added = true;

  while (added) {
    added = false;
    for (const sourceName of sourceNames) {
      const next = buckets.get(sourceName)?.shift();
      if (next) {
        diversified.push(next);
        added = true;
      }
    }
  }

  return diversified;
}

async function main() {
  const raw = JSON.parse(await readFile(RAW_FILE, "utf8"));
  const curated = curate(raw);

  if (!curated.length) {
    try {
      const previous = JSON.parse(await readFile(OUTPUT_FILE, "utf8"));
      if (previous.length) {
        console.warn("Curation vide: conservation du precedent fichier curated-jobs.json.");
        return;
      }
    } catch {
      // No previous output to preserve.
    }
  }

  await writeFile(OUTPUT_FILE, `${JSON.stringify(curated, null, 2)}\n`, "utf8");
  console.log(`Curated jobs: ${curated.length}`);
  console.log(`Output: ${OUTPUT_FILE.pathname}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
