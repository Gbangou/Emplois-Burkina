import { readFile, writeFile } from "node:fs/promises";

const ROOT = new URL("../", import.meta.url);
const RAW_FILE = new URL("data/raw-items.json", ROOT);
const OUTPUT_FILE = new URL("data/curated-jobs.json", ROOT);
const EMPLOYER_LOGOS_FILE = new URL("data/employer-logos.json", ROOT);

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
  "all jobs",
  "clear filters",
  "closing soon",
  "duty stations",
  "organizations",
  "remote / roster / roving",
  "skip to main content",
  "la recherche d'emploi",
];

const blockedTitlePatterns = [
  /^comment\s+/,
  /^all jobs$/,
  /^clear filters$/,
  /^skip to /,
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

const nonEmploymentTitlePatterns = [
  /\bbourse(s)?\b/,
  /\bscholarship(s)?\b/,
  /\bfellowship(s)?\b/,
  /formation certifiante/,
  /\bbootcamp\b/,
  /\bmasterclass\b/,
  /\bwebinaire\b/,
  /\bwebinar\b/,
  /\batelier\b/,
  /\bconference\b/,
  /\bconf[ée]rence\b/,
  /\bcours\b/,
  /\bcertification\b/,
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
  /benin|burundi|cameroun|central african republic|centrafrique|congo|cote d'ivoire|cote-d-ivoire|france|gabon|ghana|guinee|liberia|mali|mauritanie|niger|nigeria|rdc|republique centrafricaine|senegal|sierra leone|tchad|togo/;

const categoryRules = [
  {
    category: "Stage",
    type: "Stage",
    keywords: ["stage", "stagiaire", "internship", "apprenti", "apprentissage"],
  },
  {
    category: "ONG",
    type: "Mission",
    keywords: [
      "ong",
      "humanitaire",
      "programme",
      "project",
      "officer",
      "coordinateur",
      "unicef",
      "unhcr",
      "pnud",
      "world food",
      "wfp",
      "nrc",
      "drc",
      "projet",
      "suivi-evaluation",
      "bailleur",
    ],
  },
  {
    category: "Metiers terrain et informels",
    type: "Mission",
    keywords: [
      "aide macon",
      "apprenti",
      "artisan",
      "balayeur",
      "blanchisseur",
      "boucher",
      "boulanger",
      "carreleur",
      "charpentier",
      "chauffeur",
      "coiffeur",
      "couturier",
      "cuisinier",
      "electricien",
      "ferrailleur",
      "gardien",
      "journali",
      "macon",
      "mecanicien",
      "menuisier",
      "nettoyage",
      "ouvrier",
      "peintre",
      "plombier",
      "soudeur",
      "tailleur",
      "terrain",
      "vigile",
    ],
  },
  {
    category: "BTP et chantier",
    type: "Mission",
    keywords: ["btp", "chantier", "construction", "genie civil", "topographe", "conducteur travaux", "climatisation"],
  },
  {
    category: "Technique et maintenance",
    type: "CDD",
    keywords: ["technicien", "maintenance", "reseau", "informatique", "developpeur", "electricite", "froid", "climatisation"],
  },
  {
    category: "Transport et logistique",
    type: "CDD",
    keywords: ["logistique", "magasinier", "stock", "approvisionnement", "livreur", "conducteur", "fleet", "transport"],
  },
  {
    category: "Commerce et vente",
    type: "CDD",
    keywords: ["commercial", "vente", "vendeur", "caissier", "guichetier", "marketing", "client", "recouvrement"],
  },
  {
    category: "Finance et administration",
    type: "CDD",
    keywords: ["comptable", "finance", "administratif", "juridique", "secretaire", "assistant", "gestionnaire"],
  },
  {
    category: "Sante",
    type: "CDD",
    keywords: ["medecin", "infirmier", "pediatre", "pharmacien", "sage-femme", "sante", "medical", "clinique"],
  },
  {
    category: "Concours",
    type: "Concours",
    keywords: ["concours", "fonction publique", "enaref", "police", "douane", "armee", "gendarmerie"],
  },
];

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

const monthNumbers = {
  jan: "01",
  janvier: "01",
  january: "01",
  feb: "02",
  fev: "02",
  fevrier: "02",
  février: "02",
  february: "02",
  mar: "03",
  mars: "03",
  march: "03",
  apr: "04",
  avr: "04",
  avril: "04",
  april: "04",
  may: "05",
  mai: "05",
  jun: "06",
  juin: "06",
  june: "06",
  jul: "07",
  juillet: "07",
  july: "07",
  aug: "08",
  aou: "08",
  aout: "08",
  août: "08",
  august: "08",
  sep: "09",
  sept: "09",
  septembre: "09",
  september: "09",
  oct: "10",
  octobre: "10",
  october: "10",
  nov: "11",
  novembre: "11",
  november: "11",
  dec: "12",
  decembre: "12",
  décembre: "12",
  december: "12",
};

function parseDateValue(value) {
  const raw = String(value || "").trim();
  const iso = validIsoDate(raw);
  if (iso) return iso;

  const numeric = raw.match(/\b(\d{1,2})[/-](\d{1,2})[/-](\d{2,4})\b/);
  if (numeric) {
    const [, day, month, year] = numeric;
    const fullYear = year.length === 2 ? `20${year}` : year;
    return validIsoDate(`${fullYear.padStart(4, "0")}-${month.padStart(2, "0")}-${day.padStart(2, "0")}`);
  }

  const text = normalize(raw).replace(/\./g, "");
  const named = text.match(/\b(\d{1,2})(?:er)?[\s-]+([a-z]+)[\s-]+(\d{4})\b/);
  if (!named) return "";

  const [, day, monthName, year] = named;
  const month = monthNumbers[monthName.slice(0, 3)] || monthNumbers[monthName];
  return month ? validIsoDate(`${year}-${month}-${day.padStart(2, "0")}`) : "";
}

function firstDateAfter(text, patterns) {
  for (const pattern of patterns) {
    const match = text.match(pattern);
    if (!match) continue;
    const parsed = parseDateValue(match[1] || match[0]);
    if (parsed) return parsed;
  }
  return "";
}

function extractClosingDate(item) {
  const existing = parseDateValue(item.closingDate) || parseDateValue(item.deadline);
  if (existing) return existing;

  const text = decodeHtml(`${item.deadline || ""} ${item.excerpt || ""}`);
  const explicitDate = firstDateAfter(text, [
    /date\s+de\s+cl[oô]ture\s+(?:de\s+l[’']offre\s*)?:?\s*([0-9]{1,2}(?:er)?[\s/-]+[a-zA-ZÀ-ÿ.]+[\s/-]+[0-9]{2,4})/i,
    /date\s+limite\s+(?:de\s+d[eé]p[oô]t|de\s+candidature|pour\s+postuler)?\s*:?\s*([0-9]{1,2}(?:er)?[\s/-]+[a-zA-ZÀ-ÿ.]+[\s/-]+[0-9]{2,4})/i,
    /(?:closing\s+date|application\s+deadline|apply\s+by|deadline\s+on)\s*:?\s*([0-9]{1,2}(?:er)?[\s/-]+[a-zA-ZÀ-ÿ.]+[\s/-]+[0-9]{2,4})/i,
    /deadline\s+on\s*:?\s*([0-9]{1,2}(?:er)?[\s/-]+[a-zA-ZÀ-ÿ.]+[\s/-]+[0-9]{2,4})/i,
    /deadline\s*:?\s*([0-9]{1,2}(?:er)?[\s/-]+[a-zA-ZÀ-ÿ.]+[\s/-]+[0-9]{2,4})/i,
    /cl[oô]ture\s*:?\s*([0-9]{1,2}(?:er)?[\s/-]+[a-zA-ZÀ-ÿ.]+[\s/-]+[0-9]{2,4})/i,
    /date\s+de\s+cl[oô]ture\s+(?:de\s+l[’']offre\s*)?:?\s*([0-9]{1,2}[/-][0-9]{1,2}[/-][0-9]{2,4})/i,
    /date\s+limite\s+(?:de\s+d[eé]p[oô]t|de\s+candidature|pour\s+postuler)?\s*:?\s*([0-9]{1,2}[/-][0-9]{1,2}[/-][0-9]{2,4})/i,
    /(?:closing\s+date|application\s+deadline|apply\s+by|deadline\s+on|deadline)\s*:?\s*([0-9]{1,2}[/-][0-9]{1,2}[/-][0-9]{2,4})/i,
  ]);
  if (explicitDate) return explicitDate;

  const relativeDays = `${item.title || ""} ${text}`.match(/\bJ-(\d{1,3})\b/i);
  const collectedDate = validIsoDate(String(item.collectedAt || "").slice(0, 10));
  if (!relativeDays || !collectedDate) return "";

  const date = new Date(`${collectedDate}T00:00:00Z`);
  date.setUTCDate(date.getUTCDate() + Number(relativeDays[1]));
  return date.toISOString().slice(0, 10);
}

function extractOpeningDate(item) {
  const existing = parseDateValue(item.openingDate);
  if (existing) return existing;

  const text = decodeHtml(`${item.title || ""} ${item.deadline || ""} ${item.excerpt || ""}`);
  return firstDateAfter(text, [
    /\b(?:lundi|mardi|mercredi|jeudi|vendredi|samedi|dimanche)\s+([0-9]{1,2}(?:er)?\s+[a-zA-ZÀ-ÿ.]+\s+[0-9]{4})/i,
    /offre\s+d[eé]pos[eé]e?\s+([0-9]{1,2}(?:er)?\s+[a-zA-ZÀ-ÿ.]+\s+[0-9]{4})/i,
    /date\s+(?:de\s+)?(?:publication|depot|d[eé]p[oô]t|ouverture)\s*:?\s*([0-9]{1,2}(?:er)?[\s/-]+[a-zA-ZÀ-ÿ.]+[\s/-]+[0-9]{2,4})/i,
    /(?:published|posted|date\s+posted)\s+(?:on\s+)?\s*:?\s*([0-9]{1,2}(?:er)?[\s/-]+[a-zA-ZÀ-ÿ.]+[\s/-]+[0-9]{2,4})/i,
    /publi[eé]\s+le\s+([0-9]{1,2}(?:er)?[\s/-]+[a-zA-ZÀ-ÿ.]+[\s/-]+[0-9]{2,4})/i,
    /mis(?:e)?\s+en\s+ligne\s+le\s+([0-9]{1,2}(?:er)?[\s/-]+[a-zA-ZÀ-ÿ.]+[\s/-]+[0-9]{2,4})/i,
    /([0-9]{1,2}(?:er)?\s+[a-zA-ZÀ-ÿ.]+\s+[0-9]{4})\s*,?\s+par\b/i,
  ]);
}

function todayIso() {
  return new Date().toISOString().slice(0, 10);
}

function isIsoBefore(left, right) {
  return Boolean(left && right && left < right);
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
  const openingDate = extractOpeningDate(item);
  const closingDate = extractClosingDate(item);
  const today = todayIso();
  const inconsistentDates = Boolean(openingDate && closingDate && closingDate < openingDate);
  const expired = Boolean(closingDate && isIsoBefore(closingDate, today));
  const stalePosting = Boolean(openingDate && !closingDate && openingDate < `${Number(today.slice(0, 4)) - 1}-01-01`);

  return {
    openingDate,
    closingDate,
    openingDateConfirmed: Boolean(openingDate),
    closingDateConfirmed: Boolean(closingDate),
    deadline: closingDate ? dateLabel(closingDate) : item.deadline || "A verifier",
    inconsistentDates,
    expired,
    stalePosting,
  };
}

function inferCategory(item) {
  const titleText = normalize(`${item.title} ${item.type}`);
  const bodyText = normalize(`${item.company} ${item.excerpt}`);

  for (const rule of categoryRules) {
    if (rule.keywords.some((keyword) => titleText.includes(normalize(keyword)))) return rule.category;
  }

  for (const rule of categoryRules.filter((entry) => entry.category !== "Concours")) {
    const hits = rule.keywords.filter((keyword) => bodyText.includes(normalize(keyword))).length;
    if (hits >= 2) return rule.category;
  }

  return "Bureau";
}

function inferType(item, category) {
  const titleText = normalize(`${item.title} ${item.type}`);
  const bodyText = normalize(`${item.type} ${item.excerpt}`);
  if (/cdi|contrat a duree indeterminee/.test(bodyText) || /cdi/.test(titleText)) return "CDI";
  if (/cdd|contrat a duree determinee/.test(bodyText) || /cdd/.test(titleText)) return "CDD";
  if (/consultant|consultation|appel a propositions|appel d.offres/.test(titleText)) return "Consultation";
  if (/stage|stagiaire|internship|apprenti/.test(titleText)) return "Stage";
  if (/concours/.test(titleText)) return "Concours";
  const rule = categoryRules.find((entry) => entry.category === category);
  return item.type || rule?.type || "A verifier";
}

function inferTags(item, category, city) {
  const text = normalize(`${item.title} ${item.excerpt}`);
  const tags = new Set([category, city, item.sourceName].filter(Boolean));
  for (const rule of categoryRules) {
    for (const keyword of rule.keywords) {
      if (text.includes(normalize(keyword))) tags.add(keyword);
      if (tags.size >= 8) break;
    }
    if (tags.size >= 8) break;
  }
  return [...tags].slice(0, 8);
}

function inferCity(item) {
  const titleText = normalize(`${item.title} ${item.city}`);
  const excerptText = decodeHtml(item.excerpt || "");
  const normalizedExcerpt = normalize(excerptText);
  const sourceCity = normalize(item.city);
  const explicitLocationMatch = excerptText.match(
    /(?:\bLieu\b|\bPays\b|\bCountry\b|\bDuty\s*station\b|📍)\s*[:\-]?\s*([A-Za-zÀ-ÿ' -]{3,80})/i
  );
  const explicitLocation = normalize(explicitLocationMatch?.[1] || "");

  if (/bagassi/.test(titleText) || /bagassi/.test(explicitLocation)) return "Bagassi";
  if (/bobo/.test(titleText) || /bobo/.test(explicitLocation)) return "Bobo-Dioulasso";
  if (/koudougou/.test(titleText) || /koudougou/.test(explicitLocation)) return "Koudougou";
  if (/ouahigouya/.test(titleText) || /ouahigouya/.test(explicitLocation)) return "Ouahigouya";
  if (/teletravail|remote/.test(titleText) || /teletravail|remote/.test(explicitLocation)) return "Teletravail";
  if (/ouaga|ouagadougou/.test(titleText) || /ouaga|ouagadougou/.test(explicitLocation)) return "Ouagadougou";
  if (/burkina faso/.test(titleText) || /burkina faso/.test(explicitLocation) || /burkina faso/.test(normalizedExcerpt)) {
    return "Burkina Faso";
  }
  if (/ghana/.test(sourceCity) || /ghana/.test(explicitLocation)) return "Ghana";
  if (/senegal/.test(sourceCity) || /senegal/.test(explicitLocation)) return "Senegal";
  if (/burkina faso/.test(sourceCity)) return "Burkina Faso";
  if (!sourceCity || /americaines|africaines|europeennes|membres|plusieurs secteurs/.test(sourceCity)) return "Burkina Faso";

  return item.city || "Burkina Faso";
}

function cleanUrl(value) {
  try {
    const url = new URL(String(value || ""));
    return ["http:", "https:"].includes(url.protocol) ? url.toString() : "";
  } catch {
    return "";
  }
}

function buildEmployerLogos(jobs) {
  const byName = new Map();

  for (const job of jobs) {
    const name = job.company && normalize(job.company) !== normalize(job.sourceName) ? job.company : job.sourceName;
    const logoUrl = cleanUrl(job.companyLogoUrl) || cleanUrl(job.sourceLogoUrl);
    if (!name || !logoUrl) continue;

    const key = normalize(name);
    const current = byName.get(key);
    if (!current) {
      byName.set(key, {
        name,
        logoUrl,
        sector: job.category || job.type || "Recruteur",
        profileUrl: job.sourceUrl,
        sourceName: job.sourceName,
        jobs: 1,
        updatedAt: job.collectedAt || new Date().toISOString(),
      });
      continue;
    }

    current.jobs += 1;
    if (!current.sector && job.category) current.sector = job.category;
    if (String(job.collectedAt || "") > String(current.updatedAt || "")) current.updatedAt = job.collectedAt;
  }

  return [...byName.values()].sort((a, b) => b.jobs - a.jobs || a.name.localeCompare(b.name, "fr")).slice(0, 24);
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
  if (/artisan|chauffeur|conducteur|cuisinier|electricien|gardien|macon|mecanicien|menuisier|ouvrier|peintre|plombier|soudeur|tailleur|vigile/.test(title)) {
    return true;
  }

  return item.sourceId !== "rmo-burkina";
}

function isNonEmploymentOpportunity(item) {
  const title = normalize(decodeHtml(item.title));
  const excerpt = normalize(decodeHtml(item.excerpt || ""));
  const text = `${title} ${excerpt}`;

  if (nonEmploymentTitlePatterns.some((pattern) => pattern.test(title))) return true;
  if (/appel a candidatures/.test(text) && /formation|bourse|scholarship|fellowship|promotion/.test(text)) return true;
  if (/programme de bourses|immigration ?& ?bourses/.test(text)) return true;

  return false;
}

function curate(items) {
  const seen = new Set();
  const softSeen = new Set();
  const blockedSoftKeys = new Set();
  const curated = [];
  const rankedItems = items
    .slice()
    .sort((a, b) => {
      const score = (item) =>
        (item.detailExtractedAt ? 1000 : 0) +
        (parseDateValue(item.openingDate) ? 220 : 0) +
        (parseDateValue(item.closingDate) || parseDateValue(item.deadline) ? 220 : 0) +
        Math.min(String(item.excerpt || "").length, 900);
      return score(b) - score(a);
    });

  for (const item of rankedItems) {
    if (!item.title || !item.url || isLikelyCategoryPage(item)) continue;
    if (isOutsideBurkina(item)) continue;
    if (normalize(item.title).length < 10) continue;
    if (item.title.includes("�")) continue;
    if (!isLikelyJobTitle(item)) continue;
    if (isNonEmploymentOpportunity(item)) continue;
    if (seen.has(item.id)) continue;

    const category = inferCategory(item);
    const city = inferCity(item);
    const type = inferType(item, category);
    const softKey = normalize(`${item.title} ${item.company || item.sourceName} ${city}`).replace(/[^a-z0-9]+/g, "");
    const dateFields = normalizeDateFields(item);
    const excerpt = decodeHtml(item.excerpt || "").slice(0, 900);
    const hasMeaningfulContent = excerpt.length >= 120 || dateFields.openingDateConfirmed || dateFields.closingDateConfirmed;

    if (blockedSoftKeys.has(softKey)) continue;
    if (softSeen.has(softKey)) continue;
    if (dateFields.inconsistentDates || dateFields.expired || dateFields.stalePosting) {
      blockedSoftKeys.add(softKey);
      continue;
    }
    if (!hasMeaningfulContent) {
      blockedSoftKeys.add(softKey);
      continue;
    }

    seen.add(item.id);
    softSeen.add(softKey);

    curated.push({
      id: item.id,
      title: decodeHtml(item.title),
      company: item.company || item.sourceName,
      city,
      category,
      type,
      salary: "Non communique",
      deadline: dateFields.deadline,
      openingDate: dateFields.openingDate,
      closingDate: dateFields.closingDate,
      openingDateConfirmed: dateFields.openingDateConfirmed,
      closingDateConfirmed: dateFields.closingDateConfirmed,
      inconsistentDates: dateFields.inconsistentDates,
      sourceName: item.sourceName,
      sourceUrl: item.url,
      canonicalUrl: item.url,
      sourceLogoUrl: cleanUrl(item.sourceLogoUrl),
      companyLogoUrl: cleanUrl(item.companyLogoUrl) || cleanUrl(item.sourceLogoUrl),
      riskScore: 0,
      confidenceScore: item.excerpt ? 70 : 45,
      tags: inferTags(item, category, city),
      status: "needs_review",
      excerpt,
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
  await writeFile(EMPLOYER_LOGOS_FILE, `${JSON.stringify(buildEmployerLogos(curated), null, 2)}\n`, "utf8");
  console.log(`Curated jobs: ${curated.length}`);
  console.log(`Output: ${OUTPUT_FILE.pathname}`);
  console.log(`Employer logos: ${EMPLOYER_LOGOS_FILE.pathname}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
