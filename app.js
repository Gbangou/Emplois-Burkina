const fallbackJobs = [
  {
    id: "demo-it-manager",
    title: "IT Manager",
    company: "Entreprise telecom",
    city: "Ouagadougou",
    category: "Bureau",
    type: "CDI",
    salary: "900k - 1.5M FCFA",
    deadline: "15 juin",
    sourceName: "Demo Emplois Burkina",
    sourceUrl: "#",
    tags: ["Informatique", "Management", "Urgent"],
    status: "validated",
    collectedAt: "2026-06-09T11:20:01.631Z",
  },
  {
    id: "demo-programme-officer",
    title: "Charge de programme",
    company: "ONG internationale",
    city: "Ouagadougou",
    category: "ONG",
    type: "CDD",
    salary: "Non communique",
    deadline: "21 juin",
    sourceName: "Demo Emplois Burkina",
    sourceUrl: "#",
    tags: ["ONG", "Projet", "Bilingue"],
    status: "validated",
    collectedAt: "2026-06-09T11:20:01.631Z",
  },
  {
    id: "demo-concours",
    title: "Concours agent administratif",
    company: "Fonction publique",
    city: "Tout le Burkina",
    category: "Concours",
    type: "Concours",
    salary: "Selon grille",
    deadline: "30 juin",
    sourceName: "Demo Emplois Burkina",
    sourceUrl: "#",
    tags: ["Concours", "BAC", "Dossier"],
    status: "validated",
    collectedAt: "2026-06-09T11:20:01.631Z",
  },
  {
    id: "demo-macon",
    title: "Macon qualifie",
    company: "Chantier prive",
    city: "Bobo-Dioulasso",
    category: "Metiers terrain et informels",
    type: "Mission",
    salary: "8k - 15k FCFA / jour",
    deadline: "Cette semaine",
    sourceName: "Demo Emplois Burkina",
    sourceUrl: "#",
    tags: ["Construction", "Experience", "Terrain"],
    status: "validated",
    collectedAt: "2026-06-09T11:20:01.631Z",
  },
];

let jobs = [];
let baseJobs = [];
let sources = [];
let employerLogos = [];
let internationalFeeds = [];
let sourceIndex = new Map();
let jobSearchCache = new Map();
let activeCategory = "";
let activeJobId = "";
let currentJobsPage = 1;
let wordCloudAnimationFrame = 0;
let jobsRenderTimer = 0;
let savedJobs = new Set(JSON.parse(localStorage.getItem("emplois-burkina.savedJobs") || "[]"));
const institutionFeedControllers = new WeakMap();
const WHATSAPP_NUMBER = "";
const LEADS_KEY = "emplois-burkina.leads";
const EVENTS_KEY = "emplois-burkina.events";
const JOBS_PER_PAGE = 8;

const jobsList = document.querySelector("#jobsList");
const jobCount = document.querySelector("#jobCount");
const sourceCount = document.querySelector("#sourceCount");
const savedCount = document.querySelector("#savedCount");
const searchInput = document.querySelector("#searchInput");
const cityFilter = document.querySelector("#cityFilter");
const typeFilter = document.querySelector("#typeFilter");
const sourceFilter = document.querySelector("#sourceFilter");
const sortFilter = document.querySelector("#sortFilter");
const savedOnlyFilter = document.querySelector("#savedOnlyFilter");
const resultsSummary = document.querySelector("#resultsSummary");
const searchAlertPanel = document.querySelector("#searchAlertPanel");
const jobsPagination = document.querySelector("#jobsPagination");
const jobDetail = document.querySelector("#jobDetail");
const employmentExplorer = document.querySelector("#employmentExplorer");
const sourceMetrics = document.querySelector("#sourceMetrics");
const sourceGrid = document.querySelector("#sourceGrid");
const strategicSourceSections = document.querySelector("#strategicSourceSections");
const quickSearch = document.querySelector("#quickSearch");
const filterButtons = document.querySelectorAll(".filter-button");
const alertForm = document.querySelector("#alertForm");
const publishForm = document.querySelector("#publishForm");
const sponsorForm = document.querySelector("#sponsorForm");
const contactForm = document.querySelector("#contactForm");
const leadTable = document.querySelector("#leadTable");
const leadCount = document.querySelector("#leadCount");
const eventCount = document.querySelector("#eventCount");
const exportLeadsButton = document.querySelector("#exportLeadsButton");
const clearDemoDataButton = document.querySelector("#clearDemoDataButton");
const adminJobsList = document.querySelector("#adminJobsList");
const adminSummary = document.querySelector("#adminSummary");
const menuButton = document.querySelector(".menu-button");
const mainNav = document.querySelector("#mainNav");
const socialQueueTable = document.querySelector("#socialQueueTable");
const socialAdminMessage = document.querySelector("#socialAdminMessage");
const dateReviewTable = document.querySelector("#dateReviewTable");
const automationStatus = document.querySelector("#automationStatus");
const moduleSummary = document.querySelector("#moduleSummary");
const moduleRoadmapTable = document.querySelector("#moduleRoadmapTable");
const analyticsSummary = document.querySelector("#analyticsSummary");
const analyticsTable = document.querySelector("#analyticsTable");
const alertSegmentsSummary = document.querySelector("#alertSegmentsSummary");
const alertSegmentsTable = document.querySelector("#alertSegmentsTable");
const visibilitySummary = document.querySelector("#visibilitySummary");
const visibilityTable = document.querySelector("#visibilityTable");
const employerCarousel = document.querySelector("#employerCarousel");
const featuredJobsCarousel = document.querySelector("#featuredJobsCarousel");
const profileCarousel = document.querySelector("#profileCarousel");
const categoryStats = document.querySelector("#categoryStats");
const regionStats = document.querySelector("#regionStats");
const heroJobCount = document.querySelector("#heroJobCount");
const heroTrustedCount = document.querySelector("#heroTrustedCount");
const adminJobSearchInput = document.querySelector("#adminJobSearchInput");
const adminJobStatusFilter = document.querySelector("#adminJobStatusFilter");
const adminJobSourceFilter = document.querySelector("#adminJobSourceFilter");
const adminJobDateFilter = document.querySelector("#adminJobDateFilter");
const adminJobsFilterSummary = document.querySelector("#adminJobsFilterSummary");
const networkStatusBar = document.createElement("div");

const demoProfiles = [
  {
    code: "Profil N°003101",
    title: "Assistant comptable",
    experience: "2 ans",
    education: "Bac+3 Finance",
    city: "Ouagadougou",
    skills: ["Sage", "Excel", "Fiscalite"],
  },
  {
    code: "Profil N°003102",
    title: "Technicien terrain",
    experience: "5 ans",
    education: "BEP / Maintenance",
    city: "Bobo-Dioulasso",
    skills: ["Maintenance", "HSE", "Logistique"],
  },
  {
    code: "Profil N°003103",
    title: "Charge de projet ONG",
    experience: "4 ans",
    education: "Master gestion projet",
    city: "Ouagadougou",
    skills: ["MEAL", "Reporting", "Anglais"],
  },
  {
    code: "Profil N°003104",
    title: "Developpeur web",
    experience: "3 ans",
    education: "Licence informatique",
    city: "Teletravail",
    skills: ["JavaScript", "API", "React"],
  },
];

function normalize(value = "") {
  return value
    .toString()
    .toLowerCase()
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "");
}

function tokenizeNormalized(value = "") {
  return normalize(value)
    .split(/[^a-z0-9]+/i)
    .map((token) => token.trim())
    .filter((token) => token.length >= 2);
}

const SEARCH_EQUIVALENTS = {
  admin: ["assistant", "bureau", "office", "secretariat"],
  anglais: ["english", "bilingual", "bilingue"],
  artisan: ["informel", "service", "terrain"],
  assistant: ["admin", "bureau", "office", "secretaire"],
  bureau: ["administration", "secretariat", "assistante"],
  chauffeur: ["conducteur", "transport", "livraison", "logistique"],
  commerce: ["vente", "vendeur", "vendeuse", "commercial"],
  comptable: ["finance", "administration", "gestion"],
  concours: ["fonction publique", "selection", "communique"],
  consultance: ["consultant", "consultancy", "expert", "freelance", "mission"],
  consultant: ["consultance", "consultancy", "expert", "mission"],
  distance: ["remote", "teletravail", "homebased"],
  driver: ["chauffeur", "conducteur", "transport"],
  electricien: ["technique", "artisan", "chantier", "maintenance"],
  english: ["anglais", "bilingual", "bilingue"],
  freelance: ["consultance", "consultant", "remote", "teletravail"],
  gardien: ["vigile", "securite"],
  homebased: ["remote", "teletravail", "distance"],
  informel: ["artisan", "terrain", "journalier", "service"],
  internship: ["stage", "stagiaire", "trainee"],
  journalier: ["mission", "terrain", "chantier"],
  macon: ["btp", "chantier", "construction", "terrain"],
  nurse: ["infirmier", "sante"],
  ong: ["humanitaire", "programme", "projet", "international"],
  plomberie: ["plombier", "artisan", "chantier"],
  plombier: ["artisan", "chantier", "service"],
  remote: ["teletravail", "distance", "homebased", "workfromhome"],
  sante: ["medical", "clinique", "pediatre", "infirmier"],
  secretaire: ["bureau", "administration", "assistante"],
  soudeur: ["artisan", "chantier", "technique"],
  stage: ["stagiaire", "apprentissage", "formation"],
  teletravail: ["remote", "distance", "homebased"],
  trainee: ["stage", "internship", "stagiaire"],
  vendeur: ["vente", "commerce", "boutique"],
  vendeuse: ["vente", "commerce", "boutique"],
  volunteer: ["volontariat", "benevole", "unv"],
  volontariat: ["volunteer", "benevole", "unv"],
  workfromhome: ["remote", "teletravail"],
};

const SOURCE_SPOTLIGHTS = [
  {
    id: "international_onu",
    anchor: "international-careers",
    eyebrow: "Carriere internationale",
    title: "Organisations internationales et systeme des Nations Unies",
    description:
      "Portes d'entree officielles et verifiees pour les agences onusiennes, ONG internationales, bailleurs et structures de developpement ou les Burkinabe peuvent postuler.",
    segments: ["international_onu"],
    sourceTypes: ["multilateral", "organization", "ngo"],
    keywords: ["Burkina Faso", "Ouagadougou", "national", "programme", "consultant", "volunteer"],
    actionHref: "jobs.html?focus=onu-consultance",
    actionLabel: "Voir les offres ONG suivies",
    searchShortcuts: [
      {
        label: "Offres onusiennes",
        note: "UNICEF, PNUD, FAO, WFP, OMS, UNESCO et volontariat.",
        query: "ONU",
        focus: "onu-consultance",
      },
      {
        label: "Organisations internationales",
        note: "ONG, bailleurs, projets et postes a dimension regionale.",
        query: "international",
        focus: "onu-consultance",
      },
      {
        label: "Consultance internationale",
        note: "Consultant, expert, mission, terme de reference, home-based.",
        query: "consultant",
        focus: "onu-consultance",
      },
    ],
    limit: 12,
  },
  {
    id: "international_tech",
    anchor: "international-tech",
    eyebrow: "Tech internationale",
    title: "Informatique, data, systemes et cyber",
    description:
      "Selection orientee IT, data, infrastructure, support, cloud et cyber, issue de portails officiels internationaux, onusiens et ONG. Eligibilite exacte a relire sur chaque fiche source.",
    segments: ["international_onu", "consulting_remote"],
    sourceTypes: ["multilateral", "organization", "ngo"],
    keywords: ["IT", "Data", "Systemes", "Cloud", "Cyber", "Digital"],
    actionHref: "jobs.html?focus=onu-consultance&q=informatique",
    actionLabel: "Explorer les offres tech",
    searchShortcuts: [
      {
        label: "Informatique",
        note: "Support IT, admin systeme, reseau, digital, infrastructure.",
        query: "informatique",
        focus: "onu-consultance",
      },
      {
        label: "Data",
        note: "Data analyst, BI, SQL, information management, reporting technique.",
        query: "data",
        focus: "onu-consultance",
      },
      {
        label: "Cyber / systemes",
        note: "Cybersecurite, cloud, systemes, securite de l'information.",
        query: "cybersecurite",
        focus: "onu-consultance",
      },
    ],
    limit: 12,
    mode: "tech",
  },
  {
    id: "consulting_remote",
    anchor: "consulting-remote",
    eyebrow: "Travail flexible",
    title: "Consultance, freelance et travail a distance",
    description:
      "Sources serieuses pour missions de consultance, teletravail, freelance et opportunites internationales accessibles depuis le Burkina Faso.",
    segments: ["consulting_remote"],
    sourceTypes: ["multilateral", "organization", "ngo", "development_marketplace", "freelance_platform", "remote_board"],
    keywords: ["consultant", "consultancy", "remote", "teletravail", "homebased", "freelance"],
    actionHref: "jobs.html?focus=onu-consultance&q=consultant",
    actionLabel: "Lancer une recherche guidee",
    searchShortcuts: [
      {
        label: "Consultance",
        note: "Missions courtes, experts, reporting, evaluation, assistance technique.",
        query: "consultant",
        focus: "onu-consultance",
      },
      {
        label: "Travail a distance",
        note: "Remote, teletravail, home-based et support digital.",
        query: "teletravail",
        focus: "onu-consultance",
      },
      {
        label: "Freelance",
        note: "Redaction, design, support, produit, data, developpement.",
        query: "freelance",
        focus: "onu-consultance",
      },
    ],
    limit: 12,
  },
];

const SPECIAL_JOB_FILTER_LABEL = "ONU / Consultance";
const SPECIAL_JOB_FILTERS = {
  "onu / consultance": {
    segments: ["international_onu", "consulting_remote"],
    keywords: [
      "onu",
      "unicef",
      "undp",
      "fao",
      "wfp",
      "unesco",
      "who",
      "unv",
      "volunteer",
      "volontariat",
      "international",
      "consultant",
      "consultance",
      "consultancy",
      "expert",
      "remote",
      "teletravail",
      "homebased",
      "freelance",
    ],
  },
  "metiers informels": {
    segments: [],
    keywords: [
      "informel",
      "terrain",
      "artisan",
      "chauffeur",
      "conducteur",
      "vendeur",
      "vendeuse",
      "macon",
      "plombier",
      "soudeur",
      "electricien",
      "menuisier",
      "gardien",
      "vigile",
      "ouvrier",
      "livreur",
      "caissier",
      "cuisinier",
      "couturier",
      "coiffeur",
      "chantier",
    ],
  },
  informatique: {
    segments: ["international_onu", "consulting_remote"],
    keywords: [
      "informatique",
      "ict",
      "data",
      "digital",
      "systeme",
      "systemes",
      "cloud",
      "cyber",
      "developer",
      "developpeur",
      "sql",
      "power bi",
      "support it",
      "it support",
      "reseau",
      "telecom",
      "software",
      "database",
      "meal",
      "monitoring",
      "evaluation",
    ],
  },
};

const INTERNATIONAL_TECH_PATTERNS = [
  /\bict\b/,
  /\bit support\b/,
  /\bit assistant\b/,
  /\bit officer\b/,
  /\bit manager\b/,
  /\bit operations?\b/,
  /\boperations? informatiques?\b/,
  /\binformation technology\b/,
  /\binformation management\b/,
  /\binformation security\b/,
  /\binformation officer\b/,
  /\binformation manager\b/,
  /\beducational technology\b/,
  /\bdigital pedagog(?:y|ies)\b/,
  /\binformatique\b/,
  /\bdata science\b/,
  /\bdata scientist\b/,
  /\bdata analyst\b/,
  /\bdata engineer\b/,
  /\bdata manager\b/,
  /\bbusiness intelligence\b/,
  /\bdatabase\b/,
  /\bdatabase administrator\b/,
  /\bsql\b/,
  /\bpower bi\b/,
  /\bdigital\b/,
  /\bsoftware\b/,
  /\bapplication support\b/,
  /\bdeveloper\b/,
  /\bdeveloppeur\b/,
  /\bengineer\b/,
  /\bdevops\b/,
  /\bcloud\b/,
  /\binfrastructure\b/,
  /\bhelp desk\b/,
  /\bit support\b/,
  /\btechnical support\b/,
  /\bnetwork\b/,
  /\breseau\b/,
  /\btelecom\b/,
  /\bsystem administrator\b/,
  /\badministrateur systeme\b/,
  /\badministrateur reseau\b/,
  /\bcyber\b/,
  /\bcybersecurity\b/,
  /\bcybersecurite\b/,
  /\bsecurity analyst\b/,
  /\bsecurity engineer\b/,
];

const INTERNATIONAL_ELIGIBILITY_BLOCKERS = [
  /\binternal candidates only\b/,
  /\bstaff only\b/,
  /\bonly for [a-z\s-]+ nationals\b/,
  /\bmust be a citizen\b/,
  /\bfor nationals of\b/,
];

const INTERNATIONAL_TECH_TITLE_PATTERNS = [
  /\bit support\b/,
  /\bit assistant\b/,
  /\bit officer\b/,
  /\bit manager\b/,
  /\bit operations?\b/,
  /\boperations? informatiques?\b/,
  /\binformation technology\b/,
  /\beducational technology\b/,
  /\bdigital pedagog(?:y|ies)\b/,
  /\binformatique\b/,
  /\bdata science\b/,
  /\bdata scientist\b/,
  /\bdata analyst\b/,
  /\bdata engineer\b/,
  /\bdata manager\b/,
  /\bbusiness intelligence\b/,
  /\bdatabase\b/,
  /\bdatabase administrator\b/,
  /\bsql\b/,
  /\bpower bi\b/,
  /\bdigital\b/,
  /\bsoftware\b/,
  /\bapplication support\b/,
  /\bdeveloper\b/,
  /\bdeveloppeur\b/,
  /\bdevops\b/,
  /\bcloud\b/,
  /\binfrastructure\b/,
  /\bhelp desk\b/,
  /\btechnical support\b/,
  /\bnetwork\b/,
  /\breseau\b/,
  /\btelecom\b/,
  /\bsystem administrator\b/,
  /\badministrateur systeme\b/,
  /\badministrateur reseau\b/,
  /\bcyber\b/,
  /\bcybersecurity\b/,
  /\bcybersecurite\b/,
  /\bsecurity analyst\b/,
  /\bsecurity engineer\b/,
];

const INTERNATIONAL_TECH_EXCLUSION_PATTERNS = [
  /\bclinicien\b/,
  /\bepidemiologiste\b/,
  /\bmalaria\b/,
  /\bnutrition\b/,
  /\bwash\b/,
  /\bprotection\b/,
  /\blogistics?\b/,
  /\bapprovisionnement\b/,
  /\bprocurement\b/,
  /\bhuman resources\b/,
  /\bfinance\b/,
  /\bcommunication officer\b/,
  /\bproject officer\b/,
  /\bprogramme associate\b/,
  /\bprogramme assistant\b/,
  /\bmonitoring intern\b/,
];

function readStorageArray(key) {
  try {
    const data = JSON.parse(localStorage.getItem(key) || "[]");
    return Array.isArray(data) ? data : [];
  } catch {
    return [];
  }
}

function writeStorageArray(key, items) {
  localStorage.setItem(key, JSON.stringify(items));
}

function rebuildSourceIndex() {
  sourceIndex = new Map(
    sources
      .filter((source) => source?.name)
      .map((source) => [normalize(source.name), source]),
  );
}

function getSourceRecord(sourceName = "") {
  return sourceIndex.get(normalize(sourceName)) || null;
}

function getSourceSegments(source = {}) {
  return Array.isArray(source.segments) ? source.segments.map((segment) => normalize(segment)) : [];
}

function sourceHasSegment(source, segment) {
  return getSourceSegments(source).includes(normalize(segment));
}

function sortSourcesByPriority(list = []) {
  return list
    .slice()
    .sort((a, b) => a.priority - b.priority || a.name.localeCompare(b.name, "fr"));
}

function getVerifiedSourceCount(list = sources) {
  return list.filter((source) => ["official_link", "review_required"].includes(source?.collection)).length;
}

function getInternationalFeed(sourceId = "") {
  return internationalFeeds.find((feed) => normalize(feed.sourceId) === normalize(sourceId)) || null;
}

function getFeedJobAgeDays(job = {}) {
  const reference = job.openingDate || String(job.updatedAt || job.collectedAt || "").slice(0, 10);
  if (!reference) return null;
  const date = new Date(`${String(reference).slice(0, 10)}T00:00:00`);
  if (Number.isNaN(date.getTime())) return null;
  const today = new Date();
  today.setHours(0, 0, 0, 0);
  return Math.floor((today - date) / 86_400_000);
}

function isExpiredFeedJob(job = {}) {
  if (job?.expired) return true;
  if (!job?.closingDate) return false;
  return daysUntil(job.closingDate) < 0;
}

function isStaleFeedJob(job = {}) {
  if (job?.closingDate) return false;
  const ageDays = getFeedJobAgeDays(job);
  return typeof ageDays === "number" && ageDays > 21;
}

function isVisibleFeedJob(job = {}) {
  return !isExpiredFeedJob(job) && !isStaleFeedJob(job);
}

function sortFeedJobs(list = []) {
  return list
    .slice()
    .sort((a, b) => {
      const hasClosingA = Boolean(a?.closingDate);
      const hasClosingB = Boolean(b?.closingDate);
      if (hasClosingA !== hasClosingB) return Number(hasClosingB) - Number(hasClosingA);

      if (hasClosingA && hasClosingB) {
        const remainingA = daysUntil(a.closingDate);
        const remainingB = daysUntil(b.closingDate);
        if (remainingA !== remainingB) return remainingA - remainingB;
      }

      const openingA = String(a?.openingDate || "");
      const openingB = String(b?.openingDate || "");
      if (openingA !== openingB) return openingB.localeCompare(openingA);

      return String(a?.title || "").localeCompare(String(b?.title || ""), "fr");
    });
}

function countFeedJobsWithDates(list = []) {
  return list.filter((job) => job?.openingDate || job?.closingDate).length;
}

function getFeedMonitoringState(feed = {}) {
  const jobs = Array.isArray(feed?.jobs) ? feed.jobs : [];
  const visibleJobs = jobs.filter(isVisibleFeedJob);
  return {
    visibleCount: visibleJobs.length,
    datedCount: countFeedJobsWithDates(visibleJobs),
    hasError: Boolean(feed?.error),
    isStale: Boolean(feed?.stale),
    hasLiveSync: Boolean(visibleJobs.length) && !feed?.error && !feed?.stale,
  };
}

function getRenderableFeedJobs(feed = {}, limit = 10) {
  const jobs = Array.isArray(feed?.jobs) ? feed.jobs : [];
  const visible = sortFeedJobs(jobs.filter(isVisibleFeedJob)).slice(0, limit);
  const archived = sortFeedJobs(jobs.filter((job) => !isVisibleFeedJob(job)));
  return { visible, archived };
}

function getFeedPortalState(feed = {}) {
  const status = normalize(feed?.portalStatus || "");
  if (["maintenance", "unavailable", "unreachable"].includes(status)) {
    return {
      unavailable: true,
      status,
      message:
        feed?.statusMessage ||
        "Le portail externe est temporairement indisponible. Emplois Burkina garde la reference visible mais suspend l'ouverture directe.",
    };
  }

  return {
    unavailable: false,
    status: status || "available",
    message: "",
  };
}

function daysSince(value) {
  if (!value) return null;
  const target = new Date(`${String(value).slice(0, 10)}T00:00:00`);
  if (Number.isNaN(target.getTime())) return null;
  const today = new Date();
  today.setHours(0, 0, 0, 0);
  return Math.floor((today - target) / 86_400_000);
}

function isPublicSearchableFeedJob(job = {}) {
  return isVisibleFeedJob(job) && Boolean(job?.title) && Boolean(job?.url);
}

function inferPublicCategoryFromFeedJob(job = {}, source = {}) {
  const text = normalize([job.title, job.location, job.contract, job.excerpt].filter(Boolean).join(" "));
  if (INTERNATIONAL_TECH_PATTERNS.some((pattern) => pattern.test(text))) return "Informatique, data et systemes";
  if (/consultant|consultance|consultation|roster|call for|proposal/.test(text)) return "Consultation";
  if (/terrain|driver|chauffeur|artisan|ma[çc]on|mason|soudeur|ouvrier|plombier|electricien|gardien|vigile/.test(text)) {
    return "Metiers terrain et informels";
  }
  if (sourceHasSegment(source, "international_onu")) return "ONG";
  return "Bureau";
}

function inferPublicTypeFromFeedJob(job = {}) {
  const text = normalize([job.title, job.contract, job.excerpt].filter(Boolean).join(" "));
  if (/consultant|consultance|consultation/.test(text)) return "Consultation";
  if (/intern|internship|stage|stagiaire/.test(text)) return "Stage";
  if (/volunteer|volontaire/.test(text)) return "Volontariat";
  if (/remote|teletravail/.test(text)) return "Teletravail";
  return job.contract || "A verifier";
}

function buildFeedJobTags(job = {}, source = {}, category = "", city = "") {
  return [
    category,
    city,
    source.name || "",
    ...(sourceHasSegment(source, "international_onu") ? ["International", "ONU / ONG"] : []),
    ...(sourceHasSegment(source, "consulting_remote") ? ["Consultance", "Teletravail"] : []),
  ]
    .filter(Boolean)
    .slice(0, 8);
}

function normalizeFeedJobAsPublicJob(job = {}, feed = {}) {
  const source = sourceIndex.get(normalize(feed.name)) || sources.find((entry) => normalize(entry.id) === normalize(feed.sourceId)) || {
    id: feed.sourceId,
    name: feed.name,
    collection: feed.collection,
    type: feed.type,
    url: feed.url,
  };
  const category = inferPublicCategoryFromFeedJob(job, source);
  const city = job.location || (sourceHasSegment(source, "consulting_remote") ? "Teletravail" : "International");

  return {
    id: `intl-${job.id || normalize(`${feed.sourceId}-${job.title}-${job.url}`)}`,
    title: job.title,
    company: source.name || feed.name || "Source internationale",
    city,
    category,
    type: inferPublicTypeFromFeedJob(job),
    salary: "Non communique",
    deadline: job.closingDate ? formatJobDate(job.closingDate, "A verifier") : "A verifier",
    openingDate: job.openingDate || "",
    closingDate: job.closingDate || "",
    openingDateConfirmed: Boolean(job.openingDate),
    closingDateConfirmed: Boolean(job.closingDate),
    inconsistentDates: false,
    sourceName: source.name || feed.name || "",
    sourceUrl: job.url || source.url || feed.url || "#",
    canonicalUrl: job.url || source.url || feed.url || "#",
    sourceLogoUrl: source.logoUrl || "",
    companyLogoUrl: source.logoUrl || "",
    riskScore: 0,
    confidenceScore: 72 + (job.closingDate ? 10 : 0) + (job.openingDate ? 8 : 0),
    tags: buildFeedJobTags(job, source, category, city),
    status: "needs_review",
    excerpt: job.excerpt || "",
    collectedAt: feed.updatedAt || new Date().toISOString(),
    sourceLabel: job.sourceLabel || "",
    fromInternationalFeed: true,
  };
}

function mergePublicJobs(baseList = []) {
  const byCanonical = new Map();
  const merged = [];

  for (const job of baseList) {
    const key = normalize(job.canonicalUrl || job.sourceUrl || job.id);
    if (!key || byCanonical.has(key)) continue;
    byCanonical.set(key, job.id);
    merged.push(job);
  }

  for (const feed of internationalFeeds) {
    for (const job of (feed.jobs || []).filter(isPublicSearchableFeedJob)) {
      const normalizedJob = normalizeFeedJobAsPublicJob(job, feed);
      const key = normalize(normalizedJob.canonicalUrl || normalizedJob.sourceUrl || normalizedJob.id);
      if (!key || byCanonical.has(key)) continue;
      byCanonical.set(key, normalizedJob.id);
      merged.push(normalizedJob);
    }
  }

  return merged;
}

function buildJobSearchCache(list = []) {
  return new Map(
    list.map((job) => [
      job.id,
      {
        searchable: getJobSearchableText(job),
        titleTokens: tokenizeNormalized(`${job.title} ${job.company}`),
        companyTokens: tokenizeNormalized(job.company),
        cityTokens: tokenizeNormalized(job.city),
        categoryTokens: tokenizeNormalized(job.category),
        typeTokens: tokenizeNormalized(job.type),
        sourceTokens: tokenizeNormalized(job.sourceName),
        tagTokens: tokenizeNormalized((job.tags || []).join(" ")),
        excerptTokens: tokenizeNormalized(job.excerpt),
      },
    ])
  );
}

function isLikelyInternationallyEligible(job = {}) {
  const text = normalize([job.title, job.location, job.contract, job.excerpt].filter(Boolean).join(" "));
  return !INTERNATIONAL_ELIGIBILITY_BLOCKERS.some((pattern) => pattern.test(text));
}

function isInternationalTechJob(job = {}) {
  const title = normalize(job.title || "");
  if (!title) return false;
  if (INTERNATIONAL_TECH_EXCLUSION_PATTERNS.some((pattern) => pattern.test(title))) return false;
  return INTERNATIONAL_TECH_TITLE_PATTERNS.some((pattern) => pattern.test(title));
}

function isFreshSpotlightJob(job = {}, maxAgeDays = 90) {
  const closingIn = daysUntil(job.closingDate);
  if (typeof closingIn === "number" && closingIn < 0) return false;

  const openingAge = daysSince(job.openingDate);
  if (typeof openingAge === "number") return openingAge <= maxAgeDays;

  const closingAge = daysSince(job.closingDate);
  if (typeof closingAge === "number") return closingAge <= maxAgeDays;

  return true;
}

function matchesSpotlightFeedJob(job = {}, spotlight = {}) {
  if (spotlight.mode === "tech") {
    return isLikelyInternationallyEligible(job) && isFreshSpotlightJob(job) && isInternationalTechJob(job);
  }
  return true;
}

function getSpotlightFeedJobs(source, spotlight, limit = 10) {
  const feed = getInternationalFeed(source?.id);
  if (spotlight?.mode === "tech" && (feed?.stale || feed?.error)) return [];
  const { visible } = getRenderableFeedJobs(feed, Math.max(limit * 4, limit));
  return visible.filter((job) => matchesSpotlightFeedJob(job, spotlight)).slice(0, limit);
}

function sortSourcesForSpotlight(list = [], spotlight = {}) {
  const uniqueSources = [];
  const seen = new Set();
  list.forEach((source) => {
    const key = normalize(source?.id || source?.name);
    if (!key || seen.has(key)) return;
    seen.add(key);
    uniqueSources.push(source);
  });

  return uniqueSources
    .slice()
    .sort((a, b) => {
      const feedA = getInternationalFeed(a.id);
      const feedB = getInternationalFeed(b.id);
      const jobsA = getSpotlightFeedJobs(a, spotlight, 10);
      const jobsB = getSpotlightFeedJobs(b, spotlight, 10);
      const scoreA =
        jobsA.length * 10 +
        countFeedJobsWithDates(jobsA) * 3 +
        (a.collection === "review_required" ? 2 : a.collection === "official_link" ? 1 : 0) -
        (feedA?.error ? 4 : 0) -
        (feedA?.stale ? 2 : 0);
      const scoreB =
        jobsB.length * 10 +
        countFeedJobsWithDates(jobsB) * 3 +
        (b.collection === "review_required" ? 2 : b.collection === "official_link" ? 1 : 0) -
        (feedB?.error ? 4 : 0) -
        (feedB?.stale ? 2 : 0);
      return scoreB - scoreA || a.priority - b.priority || a.name.localeCompare(b.name, "fr");
    });
}

function collectSpotlightAggregateJobs(entries = [], limit = 10) {
  const queue = entries
    .map(({ source, feedJobs }) => ({
      source,
      jobs: (feedJobs || []).slice(),
      index: 0,
    }))
    .filter((entry) => entry.jobs.length);

  const selected = [];
  const seen = new Set();

  while (queue.length && selected.length < limit) {
    for (let i = 0; i < queue.length && selected.length < limit; i += 1) {
      const entry = queue[i];
      const job = entry.jobs[entry.index];
      entry.index += 1;
      if (!job) continue;
      const key = job.id || `${normalize(job.title)}::${normalize(job.url)}`;
      if (seen.has(key)) continue;
      seen.add(key);
      selected.push({
        ...job,
        sourceLabel: entry.source?.name || job.sourceName || "",
      });
    }

    for (let i = queue.length - 1; i >= 0; i -= 1) {
      if (queue[i].index >= queue[i].jobs.length) queue.splice(i, 1);
    }
  }

  return selected;
}

function collectPublicSpotlightJobs(spotlight = {}, limit = 10) {
  const segments = Array.isArray(spotlight.segments) && spotlight.segments.length ? spotlight.segments : [spotlight.id];
  const seen = new Set();
  return jobs
    .filter((job) => {
      const source = getSourceRecord(job.sourceName);
      return (
        segments.some((segment) => sourceHasSegment(source, segment)) &&
        (!spotlight.mode || matchesSpotlightFeedJob(job, spotlight))
      );
    })
    .sort((a, b) => {
      const hasClosingA = Boolean(a.closingDate);
      const hasClosingB = Boolean(b.closingDate);
      if (hasClosingA !== hasClosingB) return Number(hasClosingB) - Number(hasClosingA);
      if (hasClosingA && hasClosingB) {
        const daysA = daysUntil(a.closingDate);
        const daysB = daysUntil(b.closingDate);
        if (daysA !== daysB) return daysA - daysB;
      }
      return String(b.collectedAt || "").localeCompare(String(a.collectedAt || ""));
    })
    .filter((job) => {
      const key = normalize(job.canonicalUrl || job.sourceUrl || job.id);
      if (!key || seen.has(key)) return false;
      seen.add(key);
      return true;
    })
    .slice(0, limit)
    .map((job) => ({
      id: job.id,
      title: job.title,
      url: job.sourceUrl || job.canonicalUrl,
      location: job.city,
      contract: job.type,
      openingDate: job.openingDate,
      closingDate: job.closingDate,
      excerpt: job.excerpt,
      sourceLabel: job.sourceName,
    }));
}

function sortSpotlightSources(list = []) {
  return list
    .slice()
    .sort((a, b) => {
      const feedA = getInternationalFeed(a.id);
      const feedB = getInternationalFeed(b.id);
      const jobsA = getRenderableFeedJobs(feedA).visible.length;
      const jobsB = getRenderableFeedJobs(feedB).visible.length;
      return jobsB - jobsA || a.priority - b.priority || a.name.localeCompare(b.name, "fr");
    });
}

function getJobSearchableText(job) {
  return normalize(
    [
      job.title,
      job.company,
      job.city,
      job.category,
      job.type,
      job.salary,
      job.deadline,
      job.openingDate,
      job.closingDate,
      job.sourceName,
      job.excerpt,
      ...(job.tags || []),
    ].join(" ")
  );
}

function matchesSpecialJobFilter(job, filterValue = "") {
  const config = SPECIAL_JOB_FILTERS[normalize(filterValue)];
  if (!config) return false;

  const source = getSourceRecord(job.sourceName);
  const sourceSegments = new Set(getSourceSegments(source));
  if ((config.segments || []).some((segment) => sourceSegments.has(normalize(segment)))) return true;

  const searchable = getJobSearchableText(job);
  return (config.keywords || []).some((keyword) => searchable.includes(normalize(keyword)));
}

function matchesSpotlightJob(job, spotlight) {
  const source = getSourceRecord(job.sourceName);
  const sourceSegments = new Set(getSourceSegments(source));
  return (spotlight.segments || []).some((segment) => sourceSegments.has(normalize(segment)));
}

function sourceReferenceDescriptor(source) {
  if (source?.collection === "official_link") {
    return {
      badge: "Lien officiel",
      actionLabel: "Ouvrir la reference officielle",
      note: "Lien officiel.",
    };
  }

  if (source?.collection === "manual_only") {
    return {
      badge: "Veille humaine",
      actionLabel: "Ouvrir la reference citee",
      note: "Veille humaine.",
    };
  }

  if (source?.collection === "review_required") {
    return {
      badge: "Source verifiee",
      actionLabel: "Ouvrir l'annonce source",
      note: "Source suivie.",
    };
  }

  return {
    badge: "Source citee",
    actionLabel: "Ouvrir la source",
    note: "Source citee.",
  };
}

function getJobSourceDescriptor(job) {
  return sourceReferenceDescriptor(getSourceRecord(job.sourceName));
}

function buildSearchGroups(query = "") {
  const tokens = tokenizeNormalized(query);

  return tokens.map((token) => {
    const variants = new Set([token]);
    const related = SEARCH_EQUIVALENTS[token] || [];
    related.forEach((value) => variants.add(normalize(value)));
    for (const [keyword, equivalents] of Object.entries(SEARCH_EQUIVALENTS)) {
      if (keyword.includes(token) || token.includes(keyword)) {
        variants.add(normalize(keyword));
        equivalents.forEach((value) => variants.add(normalize(value)));
      }
    }
    return [...variants];
  });
}

function boundedDistance(a = "", b = "", maxDistance = 1) {
  if (!a || !b) return Number.MAX_SAFE_INTEGER;
  if (Math.abs(a.length - b.length) > maxDistance) return Number.MAX_SAFE_INTEGER;
  if (a === b) return 0;

  const rows = Array.from({ length: a.length + 1 }, (_, index) => [index]);
  for (let j = 1; j <= b.length; j += 1) rows[0][j] = j;

  for (let i = 1; i <= a.length; i += 1) {
    let rowMin = Number.MAX_SAFE_INTEGER;
    for (let j = 1; j <= b.length; j += 1) {
      const cost = a[i - 1] === b[j - 1] ? 0 : 1;
      rows[i][j] = Math.min(rows[i - 1][j] + 1, rows[i][j - 1] + 1, rows[i - 1][j - 1] + cost);
      rowMin = Math.min(rowMin, rows[i][j]);
    }
    if (rowMin > maxDistance) return Number.MAX_SAFE_INTEGER;
  }

  return rows[a.length][b.length];
}

function tokenMatchStrength(token, candidates = []) {
  if (!token) return 0;
  let best = 0;
  for (const candidate of candidates) {
    if (!candidate) continue;
    if (candidate === token) return 1;
    if (candidate.includes(token) || token.includes(candidate)) best = Math.max(best, 0.88);
    if ((candidate.startsWith(token) || token.startsWith(candidate)) && Math.min(candidate.length, token.length) >= 4) {
      best = Math.max(best, 0.78);
    }
    if (Math.min(candidate.length, token.length) >= 5 && boundedDistance(candidate, token, 1) <= 1) {
      best = Math.max(best, 0.68);
    }
  }
  return best;
}

function scoreTextAgainstGroups(text, groups, weight, fieldTokens = tokenizeNormalized(text)) {
  if (!text && !fieldTokens.length) return 0;
  let score = 0;
  for (const group of groups) {
    let groupScore = 0;
    for (const token of group) {
      const normalizedToken = normalize(token);
      if (!normalizedToken) continue;
      if (text.includes(normalizedToken)) {
        groupScore = Math.max(groupScore, 1);
        continue;
      }
      groupScore = Math.max(groupScore, tokenMatchStrength(normalizedToken, fieldTokens));
    }
    score += Math.round(weight * groupScore);
  }
  return score;
}

function getJobSearchScore(job, query = "") {
  const normalizedQuery = normalize(query);
  if (!normalizedQuery) return 0;

  const groups = buildSearchGroups(normalizedQuery);
  if (!groups.length) return 0;

  const cached = jobSearchCache.get(job.id);

  const fields = {
    title: cached?.searchable ? normalize(job.title) : normalize(job.title),
    company: normalize(job.company),
    city: normalize(job.city),
    category: normalize(job.category),
    type: normalize(job.type),
    source: normalize(job.sourceName),
    tags: normalize((job.tags || []).join(" ")),
    excerpt: normalize(job.excerpt),
  };
  const fieldTokens = {
    title: cached?.titleTokens || tokenizeNormalized(`${job.title} ${job.company}`),
    company: cached?.companyTokens || tokenizeNormalized(job.company),
    city: cached?.cityTokens || tokenizeNormalized(job.city),
    category: cached?.categoryTokens || tokenizeNormalized(job.category),
    type: cached?.typeTokens || tokenizeNormalized(job.type),
    source: cached?.sourceTokens || tokenizeNormalized(job.sourceName),
    tags: cached?.tagTokens || tokenizeNormalized((job.tags || []).join(" ")),
    excerpt: cached?.excerptTokens || tokenizeNormalized(job.excerpt),
  };

  const searchable = cached?.searchable || Object.values(fields).join(" ");
  const matchedGroups = groups.filter((group) =>
    group.some((token) => {
      const normalizedToken = normalize(token);
      return (
        searchable.includes(normalizedToken) ||
        tokenMatchStrength(normalizedToken, [
          ...fieldTokens.title,
          ...fieldTokens.company,
          ...fieldTokens.city,
          ...fieldTokens.category,
          ...fieldTokens.type,
          ...fieldTokens.source,
          ...fieldTokens.tags,
          ...fieldTokens.excerpt,
        ]) >= 0.68
      );
    })
  );
  if (!matchedGroups.length) return 0;
  if (groups.length > 1 && matchedGroups.length < groups.length) return 0;

  let score = 0;
  if (searchable.includes(normalizedQuery)) score += 18;
  score += scoreTextAgainstGroups(fields.title, groups, 9, fieldTokens.title);
  score += scoreTextAgainstGroups(fields.category, groups, 7, fieldTokens.category);
  score += scoreTextAgainstGroups(fields.tags, groups, 6, fieldTokens.tags);
  score += scoreTextAgainstGroups(fields.company, groups, 5, fieldTokens.company);
  score += scoreTextAgainstGroups(fields.type, groups, 4, fieldTokens.type);
  score += scoreTextAgainstGroups(fields.city, groups, 4, fieldTokens.city);
  score += scoreTextAgainstGroups(fields.source, groups, 3, fieldTokens.source);
  score += scoreTextAgainstGroups(fields.excerpt, groups, 1, fieldTokens.excerpt);
  return score;
}

function sendServerEvent(type, payload = {}) {
  const eventPayload = {
    type,
    label: payload.label || "",
    target: payload.href || payload.target || "",
    path: window.location.pathname,
    metadata: payload,
  };
  const body = JSON.stringify(eventPayload);

  if (navigator.sendBeacon) {
    const sent = navigator.sendBeacon("/api/events", new Blob([body], { type: "application/json" }));
    if (sent) return;
  }

  fetch("/api/events", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body,
    keepalive: true,
  }).catch(() => {});
}

function recordEvent(type, payload = {}) {
  const events = readStorageArray(EVENTS_KEY);
  events.unshift({
    id: `${Date.now()}-${Math.random().toString(16).slice(2)}`,
    type,
    payload,
    createdAt: new Date().toISOString(),
  });
  writeStorageArray(EVENTS_KEY, events.slice(0, 250));
  sendServerEvent(type, payload);
}

function formatFcfa(value) {
  return new Intl.NumberFormat("fr-FR").format(value || 0) + " FCFA";
}

function buildWhatsAppUrl(message) {
  const text = encodeURIComponent(message);
  return WHATSAPP_NUMBER ? `https://wa.me/${WHATSAPP_NUMBER}?text=${text}` : `https://wa.me/?text=${text}`;
}

function getPackageValue(kind, data = {}) {
  if (kind === "sponsor") {
    if (data.need === "Sponsoriser une categorie") return 100000;
    if (data.need === "Recruter avec preselection") return 150000;
    if (data.need === "Verifier un profil artisan") return 1500;
    if (data.need === "Publier une offre") return 25000;
  }
  if (kind === "publish") return data.type === "Je suis artisan/professionnel" ? 1500 : 25000;
  if (kind === "alert") return 0;
  if (kind === "contact") return 0;
  return 0;
}

function saveLead(kind, data) {
  const leads = readStorageArray(LEADS_KEY);
  const lead = {
    id: `${Date.now()}-${Math.random().toString(16).slice(2)}`,
    kind,
    status: "new",
    valueFcfa: getPackageValue(kind, data),
    data,
    createdAt: new Date().toISOString(),
  };
  leads.unshift(lead);
  writeStorageArray(LEADS_KEY, leads);
  recordEvent("lead_created", { kind, valueFcfa: lead.valueFcfa });
  renderAdmin();
  return lead;
}

async function syncLeadToServer(lead) {
  try {
    const response = await fetch("/api/leads", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        kind: lead.kind,
        data: lead.data,
        valueFcfa: lead.valueFcfa,
      }),
    });

    if (!response.ok) throw new Error("API lead refused");
    const result = await response.json();
    recordEvent("lead_synced", { localId: lead.id, serverId: result.id });
    return result.id;
  } catch {
    recordEvent("lead_sync_failed", { localId: lead.id });
    return "";
  }
}

function escapeHtml(value = "") {
  return value
    .toString()
    .replaceAll("&", "&amp;")
    .replaceAll("<", "&lt;")
    .replaceAll(">", "&gt;")
    .replaceAll('"', "&quot;")
    .replaceAll("'", "&#039;");
}

function displayDate(value) {
  if (!value) return "Date inconnue";
  const date = new Date(value);
  if (Number.isNaN(date.getTime())) return value;
  return new Intl.DateTimeFormat("fr-BF", {
    day: "2-digit",
    month: "short",
    year: "numeric",
  }).format(date);
}

function formatJobDate(value, fallback = "Date non precisee") {
  if (!value) return fallback;
  const date = new Date(`${String(value).slice(0, 10)}T00:00:00`);
  if (Number.isNaN(date.getTime())) return fallback;
  return new Intl.DateTimeFormat("fr-BF", {
    day: "2-digit",
    month: "short",
    year: "numeric",
  }).format(date);
}

function daysUntil(value) {
  if (!value) return null;
  const target = new Date(`${String(value).slice(0, 10)}T23:59:59`);
  if (Number.isNaN(target.getTime())) return null;
  const today = new Date();
  today.setHours(0, 0, 0, 0);
  return Math.ceil((target - today) / 86_400_000);
}

function isExpiredJob(job) {
  if (job?.expired) return true;
  const days = daysUntil(job?.closingDate);
  return typeof days === "number" && days < 0;
}

function getDeadlineTarget(value) {
  if (!value) return null;
  const target = new Date(`${String(value).slice(0, 10)}T23:59:59`);
  return Number.isNaN(target.getTime()) ? null : target;
}

function millisecondsUntil(value) {
  const target = getDeadlineTarget(value);
  return target ? target.getTime() - Date.now() : null;
}

function formatCountdown(value) {
  const remaining = millisecondsUntil(value);
  if (remaining === null) return "";
  if (remaining <= 0) return "00h 00mn 00s";

  const totalSeconds = Math.floor(remaining / 1000);
  const days = Math.floor(totalSeconds / 86_400);
  const hours = Math.floor((totalSeconds % 86_400) / 3600);
  const minutes = Math.floor((totalSeconds % 3600) / 60);
  const seconds = totalSeconds % 60;

  if (days > 0) {
    return `${days}j ${String(hours).padStart(2, "0")}h ${String(minutes).padStart(2, "0")}mn`;
  }

  return `${String(hours).padStart(2, "0")}h ${String(minutes).padStart(2, "0")}mn ${String(seconds).padStart(2, "0")}s`;
}

function deadlineState(job) {
  if (job.inconsistentDates) {
    return {
      label: "Dates a verifier",
      tone: "warning",
      helper: "La source affiche des dates incoherentes.",
    };
  }

  const days = daysUntil(job.closingDate);
  if (days === null) {
    return {
      label: "Date non precisee",
      tone: "neutral",
      helper: "Consultez la source officielle pour la date limite.",
    };
  }
  if (days < 0) {
    return {
      label: "Expiree",
      tone: "danger",
      helper: `Cloturee depuis ${Math.abs(days)} jour${Math.abs(days) > 1 ? "s" : ""}.`,
    };
  }
  if (days === 0) {
    return {
      label: formatCountdown(job.closingDate),
      tone: "danger",
      helper: "La cloture est prevue aujourd'hui.",
    };
  }
  if (days <= 3) {
    return {
      label: formatCountdown(job.closingDate),
      tone: "warning",
      helper: "Deadline proche.",
    };
  }
  return {
    label: formatCountdown(job.closingDate),
    tone: "success",
    helper: "Candidature encore ouverte.",
  };
}

function renderDeadlineStrip(job) {
  const state = deadlineState(job);
  const hasClosingDate = Boolean(job.closingDate);
  return `
    <div class="deadline-strip ${state.tone} ${hasClosingDate ? "" : "missing"}">
      <span>Date de cloture</span>
      <strong>${escapeHtml(formatJobDate(job.closingDate, "Date non precisee"))}</strong>
      <small>${escapeHtml(state.helper)}</small>
    </div>
  `;
}

function renderTimeline(job, compact = false) {
  const state = deadlineState(job);
  const openingDateLabel = job.openingDateConfirmed ? "Date d'ouverture verifiee" : "Date d'ouverture";
  const openingDateValue = formatJobDate(job.openingDate, "Non communiquee par la source");
  return `
    <div class="job-timeline ${compact ? "compact" : ""}">
      <div>
        <span>${escapeHtml(openingDateLabel)}</span>
        <strong>${escapeHtml(openingDateValue)}</strong>
      </div>
      <div>
        <span>Date de cloture</span>
        <strong>${escapeHtml(formatJobDate(job.closingDate, "Date non precisee"))}</strong>
      </div>
      <div class="countdown ${state.tone}">
        <span>Temps restant</span>
        <strong ${job.closingDate ? `data-countdown="${escapeHtml(job.closingDate)}"` : ""}>${escapeHtml(state.label)}</strong>
      </div>
    </div>
  `;
}

function updateCountdowns() {
  document.querySelectorAll("[data-countdown]").forEach((node) => {
    const value = node.getAttribute("data-countdown") || "";
    const next = formatCountdown(value);
    if (next && node.textContent !== next) node.textContent = next;
  });
}

function stopWordCloudOrbit() {
  if (!wordCloudAnimationFrame) return;
  cancelAnimationFrame(wordCloudAnimationFrame);
  wordCloudAnimationFrame = 0;
}

function startWordCloudOrbit() {
  stopWordCloudOrbit();
  const cloud = employmentExplorer?.querySelector(".word-cloud");
  if (!cloud || window.matchMedia("(prefers-reduced-motion: reduce)").matches) return;

  const rect = cloud.getBoundingClientRect();
  const scale = Math.min(1, Math.max(0.52, rect.width / 980));
  const words = [...cloud.querySelectorAll("[data-orbit-word]")].map((node) => ({
    node,
    angle: Number(node.dataset.orbitAngle || 0),
    radiusX: Number(node.dataset.orbitRadiusX || 0) * scale,
    radiusY: Number(node.dataset.orbitRadiusY || 0) * scale,
    speed: Number(node.dataset.orbitSpeed || 0.00008),
    phase: Number(node.dataset.orbitPhase || 0),
  }));
  if (!words.length) return;

  const render = (time) => {
    if (!cloud.matches(":hover, :focus-within")) {
      for (const word of words) {
        const angle = word.angle + time * word.speed + word.phase;
        const x = Math.cos(angle) * word.radiusX;
        const y = Math.sin(angle) * word.radiusY;
        const depth = (Math.sin(angle) + 1) / 2;
        word.node.style.setProperty("--orbit-x", `${x.toFixed(2)}px`);
        word.node.style.setProperty("--orbit-y", `${y.toFixed(2)}px`);
        word.node.style.setProperty("--orbit-scale", (0.9 + depth * 0.2).toFixed(3));
        word.node.style.setProperty("--orbit-opacity", (0.74 + depth * 0.26).toFixed(3));
        word.node.style.zIndex = String(Math.round(10 + depth * 20));
      }
    }
    wordCloudAnimationFrame = requestAnimationFrame(render);
  };

  wordCloudAnimationFrame = requestAnimationFrame(render);
}

function slugify(value = "") {
  return String(value)
    .toLowerCase()
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .replace(/&/g, " et ")
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/^-+|-+$/g, "")
    .slice(0, 90);
}

function getJobPagePath(job) {
  return `pages/jobs/${slugify(job.title)}-${String(job.id).slice(0, 8)}.html`;
}

function updateSavedStorage() {
  localStorage.setItem("emplois-burkina.savedJobs", JSON.stringify([...savedJobs]));
  if (savedCount) savedCount.textContent = savedJobs.size;
}

function getSources() {
  return [...new Set(jobs.map((job) => job.sourceName).filter(Boolean))].sort((a, b) =>
    a.localeCompare(b, "fr")
  );
}

function initials(value = "") {
  return value
    .split(/\s+/)
    .filter(Boolean)
    .slice(0, 2)
    .map((part) => part[0])
    .join("")
    .toUpperCase();
}

function brandTone(value = "") {
  const total = [...String(value)].reduce((sum, char) => sum + char.charCodeAt(0), 0);
  return (total % 6) + 1;
}

function isUsableEmployerLogo(value = "") {
  const url = String(value || "").toLowerCase();
  if (!url) return false;
  return !/favicon|apple-touch-icon|\/icon[\W_]|\.ico(?:$|\?)/.test(url);
}

function countBy(items, getter) {
  return items.reduce((acc, item) => {
    const key = getter(item) || "Autre";
    acc[key] = (acc[key] || 0) + 1;
    return acc;
  }, {});
}

function getSearchTermsFromJobs(items) {
  const stopWords = new Set([
    "a",
    "au",
    "aux",
    "avec",
    "de",
    "des",
    "du",
    "en",
    "et",
    "la",
    "le",
    "les",
    "pour",
    "sur",
    "une",
    "un",
    "d",
    "l",
    "offre",
    "emploi",
    "recrutement",
    "vacancy",
    "job",
    "jobs",
    "burkina",
    "faso",
    "a verifier",
    "date non precisee",
    "verifier",
    "connexion",
    "inscription",
    "ressources",
    "candidats",
    "employeurs",
    "newsletter",
    "publier",
    "demandes",
    "nous",
    "annonce",
    "annonces",
    "espace",
  ]);
  const counts = new Map();
  const add = (term, weight = 1) => {
    const clean = String(term || "").replace(/[^\p{L}\p{N}\s'-]/gu, " ").replace(/\s+/g, " ").trim();
    if (!clean || clean.length < 3) return;
    const normalized = normalize(clean);
    if (!normalized || stopWords.has(normalized)) return;
    counts.set(clean, (counts.get(clean) || 0) + weight);
  };
  const addWords = (value, weight = 1) => {
    const words = String(value || "")
      .split(/\s+/)
      .map((word) => word.replace(/[^\p{L}\p{N}'-]/gu, ""))
      .filter((word) => word.length >= 4);
    for (const word of words) add(word, weight);
  };

  for (const job of items) {
    add(job.city, 4);
    add(job.category, 4);
    add(job.type, 3);
    add(job.company, 2);
    add(job.sourceName, 2);
    for (const tag of job.tags || []) add(tag, 3);
    addWords(job.title, 1);
    addWords(job.excerpt, 0.35);
  }

  return [...counts.entries()]
    .sort((a, b) => b[1] - a[1] || a[0].localeCompare(b[0], "fr"))
    .slice(0, 26)
    .map(([term, count]) => ({ term, count }));
}

function setQuickCategory(category) {
  activeCategory = category || "";
  filterButtons.forEach((button) => {
    button.classList.toggle("active", (button.dataset.category || "") === activeCategory);
  });
}

function initNetworkStatus() {
  networkStatusBar.className = "network-status";
  networkStatusBar.setAttribute("role", "status");
  networkStatusBar.setAttribute("aria-live", "polite");
  document.body.append(networkStatusBar);

  const update = () => {
    const offline = !navigator.onLine;
    document.documentElement.classList.toggle("is-offline", offline);
    networkStatusBar.textContent = offline
      ? "Mode hors ligne : les offres deja chargees restent consultables."
      : "Connexion retablie.";
    networkStatusBar.classList.toggle("is-visible", offline);
    if (!offline) {
      window.setTimeout(() => networkStatusBar.classList.remove("is-visible"), 2600);
    }
  };

  window.addEventListener("online", update);
  window.addEventListener("offline", update);
  update();
}

async function registerServiceWorker() {
  if (!("serviceWorker" in navigator)) return;
  if (location.protocol === "file:") return;

  try {
    const registration = await navigator.serviceWorker.register("/sw.js", { scope: "/" });
    if (registration.waiting) registration.waiting.postMessage({ type: "SKIP_WAITING" });
  } catch {
    // PWA enhancement only: the app must keep working when SW registration is blocked.
  }
}

function syncQuickCategoryFromType(value = "") {
  const hasMatchingButton = [...filterButtons].some((button) => (button.dataset.category || "") === value);
  setQuickCategory(hasMatchingButton ? value : "");
}

function applyUrlSearchParams() {
  const params = new URLSearchParams(window.location.search);
  const query = params.get("q") || params.get("search") || "";
  const category = params.get("category") || "";
  const city = params.get("city") || "";
  const source = params.get("source") || "";
  const focus = params.get("focus") || "";

  if (query && searchInput) searchInput.value = query;
  if (focus === "onu-consultance") {
    setQuickCategory(SPECIAL_JOB_FILTER_LABEL);
    if (typeFilter && [...typeFilter.options].some((option) => option.value === SPECIAL_JOB_FILTER_LABEL || option.textContent === SPECIAL_JOB_FILTER_LABEL)) {
      typeFilter.value = SPECIAL_JOB_FILTER_LABEL;
    }
  }
  if (category) {
    setQuickCategory(category);
    if (typeFilter && [...typeFilter.options].some((option) => option.value === category || option.textContent === category)) {
      typeFilter.value = category;
    }
  }
  if (city && cityFilter && [...cityFilter.options].some((option) => option.value === city || option.textContent === city)) {
    cityFilter.value = city;
  }
  if (source && sourceFilter && [...sourceFilter.options].some((option) => option.value === source || option.textContent === source)) {
    sourceFilter.value = source;
  }
}

function syncSearchUrl() {
  if (!jobsList || !window.history?.replaceState) return;
  const path = window.location.pathname.split("/").pop() || "index.html";
  if (path !== "jobs.html") return;

  const params = new URLSearchParams();
  const query = searchInput?.value.trim() || "";
  const city = cityFilter?.value || "";
  const type = typeFilter?.value || "";
  const source = sourceFilter?.value || "";

  if (query) params.set("q", query);
  if (city) params.set("city", city);
  if (source) params.set("source", source);
  if (activeCategory) params.set("category", activeCategory);
  else if (type) params.set("category", type);

  const nextUrl = params.toString() ? `jobs.html?${params.toString()}` : "jobs.html";
  window.history.replaceState({}, "", nextUrl);
}

function applyExplorerSearch({ type, value }) {
  const term = value || "";
  if (!term) return;

  if (type === "category") {
    setQuickCategory(term);
  } else if (type === "city" && cityFilter) {
    cityFilter.value = [...cityFilter.options].some((option) => option.value === term || option.textContent === term) ? term : "";
    searchInput.value = cityFilter.value ? searchInput.value : term;
  } else if (type === "source" && sourceFilter) {
    sourceFilter.value = [...sourceFilter.options].some((option) => option.value === term || option.textContent === term) ? term : "";
    searchInput.value = sourceFilter.value ? searchInput.value : term;
  } else if (type === "type" && typeFilter) {
    typeFilter.value = [...typeFilter.options].some((option) => option.value === term || option.textContent === term) ? term : "";
    searchInput.value = typeFilter.value ? searchInput.value : term;
  } else if (searchInput) {
    searchInput.value = term;
  }

  resetJobsPage();
  recordEvent("employment_explorer_search", { label: term, type });
  syncSearchUrl();
  renderJobs();
  document.querySelector("#offres")?.scrollIntoView({ behavior: "smooth", block: "start" });
}

function applyPortalSearch({ query = "", focus = "", category = "", type = "" }) {
  if (searchInput) searchInput.value = query;
  if (cityFilter) cityFilter.value = "";
  if (sourceFilter) sourceFilter.value = "";

  const resolvedType = focus === "onu-consultance" ? SPECIAL_JOB_FILTER_LABEL : type;
  const resolvedCategory = focus === "onu-consultance" ? SPECIAL_JOB_FILTER_LABEL : category;

  if (typeFilter) {
    const canUseType = [...typeFilter.options].some((option) => option.value === resolvedType || option.textContent === resolvedType);
    typeFilter.value = resolvedType && canUseType ? resolvedType : "";
  }

  if (resolvedCategory) {
    setQuickCategory(resolvedCategory);
  } else {
    setQuickCategory("");
  }

  resetJobsPage();
  recordEvent("portal_search_shortcut", {
    label: query || resolvedCategory || focus || "shortcut",
    focus,
  });
  syncSearchUrl();
  renderJobs();
  document.querySelector("#offres")?.scrollIntoView({ behavior: "smooth", block: "start" });
}

function updateFilterCounts() {
  if (!filterButtons.length) return;
  filterButtons.forEach((button) => {
    const category = button.dataset.category || "";
    const count = category ? jobs.filter((job) => matchesSpecialJobFilter(job, category) || job.category === category).length : jobs.length;
    button.dataset.count = String(count);
  });
}

function renderTaxonomy(container, entries, baseHref) {
  if (!container) return;
  container.innerHTML = entries.length
        ? entries
            .map(
              ([name, count]) => `
            <a href="${baseHref}" data-taxonomy="${escapeHtml(name)}">
              <span>${escapeHtml(name)}</span>
              <strong>${count}</strong>
            </a>
          `
        )
        .join("")
    : `<p class="muted">Les statistiques seront disponibles apres la prochaine collecte.</p>`;
}

function initVisualEnhancements() {
  if (typeof window === "undefined") return;
  initInstitutionFeedControls();
  if (!("IntersectionObserver" in window)) return;
  const selectors = [
    ".blueprint-card",
    ".journey-photo",
    ".journey-steps article",
    ".matching-grid article",
    ".portal-stats article",
    ".trust-strip article",
    ".job-card",
    ".source-card",
    ".profile-card",
    ".logo-card",
  ];
  const elements = document.querySelectorAll(selectors.join(", "));
  if (!elements.length) return;

  if (!window.emploisBurkinaRevealObserver) {
    window.emploisBurkinaRevealObserver = new IntersectionObserver(
      (entries) => {
        for (const entry of entries) {
          if (!entry.isIntersecting) continue;
          entry.target.classList.add("is-visible");
          window.emploisBurkinaRevealObserver.unobserve(entry.target);
        }
      },
      { rootMargin: "0px 0px -8% 0px", threshold: 0.12 }
    );
  }

  elements.forEach((element) => {
    if (element.dataset.revealBound === "true") return;
    element.classList.add("reveal-on-scroll");
    element.dataset.revealBound = "true";
    const bounds = element.getBoundingClientRect();
    if (bounds.top < window.innerHeight * 0.92 && bounds.bottom > 0) {
      element.classList.add("is-visible");
      return;
    }
    window.emploisBurkinaRevealObserver.observe(element);
  });
}

function initInstitutionFeedControls() {
  const shells = document.querySelectorAll(".institution-feed-shell");
  if (!shells.length) return;

  shells.forEach((shell) => {
    const track = shell.querySelector(".institution-feed-track");
    if (!track || institutionFeedControllers.has(shell)) return;

    shell.tabIndex = 0;
    shell.classList.add("js-feed-scroll");
    const controller = {
      shell,
      track,
      paused: false,
      dragging: false,
      pointerId: null,
      lastClientY: 0,
      resumeTimer: 0,
      rafId: 0,
      autoRemainder: 0,
    };

    const getLoopPoint = () => {
      if (!shell.classList.contains("is-animated")) return 0;
      return Math.max(0, Math.floor(track.scrollHeight / 2));
    };

    const normalizeLoop = () => {
      const loopPoint = getLoopPoint();
      if (!loopPoint) return;
      if (shell.scrollTop >= loopPoint) shell.scrollTop -= loopPoint;
      if (shell.scrollTop < 0) shell.scrollTop += loopPoint;
    };

    const canScroll = () => track.scrollHeight > shell.clientHeight + 6;

    const pauseTemporarily = (delay = 1400) => {
      controller.paused = true;
      window.clearTimeout(controller.resumeTimer);
      controller.resumeTimer = window.setTimeout(() => {
        if (!controller.dragging && !shell.matches(":hover, :focus-within")) {
          controller.paused = false;
        }
      }, delay);
    };

    const finishDrag = () => {
      controller.dragging = false;
      controller.pointerId = null;
      shell.classList.remove("is-dragging");
      pauseTemporarily(1100);
    };

    const step = () => {
      if (!document.body.contains(shell)) return;
      if (shell.dataset.feedAuto === "true" && !controller.paused && !controller.dragging && canScroll()) {
        const nextOffset = controller.autoRemainder + 0.8;
        const pixels = Math.floor(nextOffset);
        controller.autoRemainder = nextOffset - pixels;
        if (pixels > 0) {
          shell.scrollTop += pixels;
          normalizeLoop();
        }
      }
      controller.rafId = window.requestAnimationFrame(step);
    };

    shell.addEventListener("mouseenter", () => {
      controller.paused = true;
    });
    shell.addEventListener("mouseleave", () => {
      if (!controller.dragging) controller.paused = false;
    });
    shell.addEventListener("focusin", () => {
      controller.paused = true;
    });
    shell.addEventListener("focusout", () => {
      if (!controller.dragging) controller.paused = false;
    });
    shell.addEventListener(
      "wheel",
      (event) => {
        if (!canScroll()) return;
        event.preventDefault();
        pauseTemporarily();
        shell.scrollTop += event.deltaY;
        normalizeLoop();
      },
      { passive: false }
    );
    shell.addEventListener("pointerdown", (event) => {
      if (!canScroll() || event.button !== 0) return;
      if (event.target.closest("a, button")) return;
      controller.dragging = true;
      controller.pointerId = event.pointerId;
      controller.lastClientY = event.clientY;
      controller.paused = true;
      shell.classList.add("is-dragging");
      shell.setPointerCapture(event.pointerId);
      event.preventDefault();
    });
    shell.addEventListener("pointermove", (event) => {
      if (!controller.dragging || event.pointerId !== controller.pointerId) return;
      const delta = event.clientY - controller.lastClientY;
      controller.lastClientY = event.clientY;
      shell.scrollTop -= delta;
      normalizeLoop();
    });
    shell.addEventListener("pointerup", (event) => {
      if (event.pointerId !== controller.pointerId) return;
      finishDrag();
    });
    shell.addEventListener("pointercancel", finishDrag);
    shell.addEventListener("lostpointercapture", finishDrag);
    shell.addEventListener("keydown", (event) => {
      if (!canScroll()) return;
      const moves = {
        ArrowDown: 48,
        ArrowUp: -48,
        PageDown: Math.max(120, shell.clientHeight - 48),
        PageUp: -Math.max(120, shell.clientHeight - 48),
      };
      if (event.key in moves) {
        event.preventDefault();
        pauseTemporarily(1500);
        shell.scrollTop += moves[event.key];
        normalizeLoop();
      } else if (event.key === "Home") {
        event.preventDefault();
        pauseTemporarily(1500);
        shell.scrollTop = 0;
      } else if (event.key === "End") {
        event.preventDefault();
        pauseTemporarily(1500);
        shell.scrollTop = track.scrollHeight;
        normalizeLoop();
      }
    });

    if (shell.dataset.feedAuto === "true" && canScroll() && shell.scrollTop === 0) {
      shell.scrollTop = 1;
    }
    controller.rafId = window.requestAnimationFrame(step);
    institutionFeedControllers.set(shell, controller);
  });
}

function renderPortalWidgets() {
  if (heroJobCount) heroJobCount.textContent = jobs.length || 0;
  if (heroTrustedCount) {
    heroTrustedCount.textContent = sources.filter((source) => ["official_link", "review_required"].includes(source.collection)).length || 0;
  }

  if (employerCarousel) {
    const dynamicCards = buildEmployerCardsFromJobs();
    const cards = (dynamicCards.length ? dynamicCards : employerLogos).slice(0, 18);
    const renderLogoCards = (items, duplicate = false) =>
      items
        .map((card) => {
          const useImageLogo = isUsableEmployerLogo(card.logoUrl);
          const count = card.jobs || card.count || 0;
          const updateLabel = card.updatedAt ? displayDate(card.updatedAt) : "";
          return `
          <a class="logo-card ${useImageLogo ? "has-logo" : "generated-logo"} tone-${brandTone(card.name)}" href="${escapeHtml(card.profileUrl || "#")}" target="_blank" rel="noopener" data-track="employer_logo_click" data-track-label="${escapeHtml(card.name)}"${duplicate ? ` aria-hidden="true" tabindex="-1"` : ""}>
            <span class="logo-visual">
              ${useImageLogo ? `<img src="${escapeHtml(card.logoUrl)}" alt="Logo ${escapeHtml(card.name)}" loading="lazy" onload="if(this.naturalWidth < 96 || this.naturalHeight < 32){this.closest('.logo-visual').classList.add('logo-missing'); this.remove();}" onerror="this.closest('.logo-visual').classList.add('logo-missing'); this.remove();" />` : ""}
              <span class="logo-fallback" aria-hidden="${useImageLogo ? "true" : "false"}">
                <b>${escapeHtml(initials(card.name))}</b>
                <em>${escapeHtml(card.sector || "Recruteur")}</em>
              </span>
            </span>
            <strong>${escapeHtml(card.name)}</strong>
            <div class="logo-card-meta">
              <span class="pill">${escapeHtml(card.sector || "Recruteur")}</span>
              <span class="pill">${count ? `${count} offre${count > 1 ? "s" : ""}` : "Source active"}</span>
            </div>
            <small>${escapeHtml(updateLabel ? `Derniere collecte ${updateLabel}` : "Cliquer pour ouvrir la source")}</small>
          </a>
        `;
        })
        .join("");

    employerCarousel.classList.toggle("is-animated", cards.length > 1);
    employerCarousel.innerHTML = cards.length
      ? `
          <div class="logo-marquee-track">
            ${renderLogoCards(cards)}
            ${renderLogoCards(cards, true)}
          </div>
        `
      : `<p class="muted">Les logos recruteurs seront affiches apres la prochaine collecte.</p>`;
  }

  if (featuredJobsCarousel) {
    const featured = jobs
      .slice()
      .sort((a, b) => Number(Boolean(b.closingDate)) - Number(Boolean(a.closingDate)))
      .slice(0, 10);
    const renderFeaturedJobs = (items, duplicate = false) =>
      items
        .map((job) => renderJobCard(job, { duplicate }))
        .join("");

    featuredJobsCarousel.classList.toggle("is-animated", featured.length > 1);
    featuredJobsCarousel.innerHTML = featured.length
      ? `
          <div class="featured-marquee-track">
            ${renderFeaturedJobs(featured)}
            ${renderFeaturedJobs(featured, true)}
          </div>
        `
      : `<p class="muted">Les offres mises en avant seront affichees apres la prochaine collecte.</p>`;
  }

  if (categoryStats) {
    renderTaxonomy(
      categoryStats,
      Object.entries(countBy(jobs, (job) => job.category)).sort((a, b) => b[1] - a[1]).slice(0, 10),
      "jobs.html"
    );
  }

  if (regionStats) {
    renderTaxonomy(
      regionStats,
      Object.entries(countBy(jobs, (job) => job.city)).sort((a, b) => b[1] - a[1]).slice(0, 10),
      "jobs.html"
    );
  }

  if (profileCarousel) {
    profileCarousel.innerHTML = demoProfiles
      .map(
        (profile) => `
          <article class="profile-card">
            <span>${escapeHtml(profile.code)}</span>
            <strong>${escapeHtml(profile.title)}</strong>
            <p>${escapeHtml(profile.experience)} - ${escapeHtml(profile.education)} - ${escapeHtml(profile.city)}</p>
            <div class="tag-row">
              ${profile.skills.map((skill) => `<span class="pill">${escapeHtml(skill)}</span>`).join("")}
            </div>
            <a class="secondary-link" href="annonceurs.html">Demander ce profil</a>
          </article>
        `
      )
      .join("");
  }

  initVisualEnhancements();
}

function buildEmployerCardsFromJobs() {
  const byName = new Map();

  for (const job of jobs) {
    const name = job.company && normalize(job.company) !== normalize(job.sourceName) ? job.company : job.sourceName;
    const logoUrl = job.companyLogoUrl || job.sourceLogoUrl || "";
    if (!name) continue;
    const key = normalize(name);
    const current = byName.get(key);
    if (!current) {
      byName.set(key, {
        name,
        logoUrl,
        sector: job.category || job.type || "Recruteur",
        profileUrl: job.sourceUrl || job.canonicalUrl || "#",
        jobs: 1,
        updatedAt: job.collectedAt || "",
      });
      continue;
    }
    current.jobs += 1;
    if (!current.logoUrl && logoUrl) current.logoUrl = logoUrl;
    if (String(job.collectedAt || "") > String(current.updatedAt || "")) current.updatedAt = job.collectedAt;
  }

  return [...byName.values()].sort((a, b) => Number(Boolean(b.logoUrl)) - Number(Boolean(a.logoUrl)) || b.jobs - a.jobs || a.name.localeCompare(b.name, "fr"));
}

function renderEntityLogo(name, logoUrl, className = "job-logo") {
  const safeName = name || "Organisation";
  return `
    <span class="${className} ${logoUrl ? "has-logo" : ""}">
      ${
        logoUrl
          ? `<img src="${escapeHtml(logoUrl)}" alt="Logo ${escapeHtml(safeName)}" loading="lazy" onerror="this.closest('.${className}').classList.add('logo-missing'); this.remove();" />`
          : ""
      }
      <b>${escapeHtml(initials(safeName))}</b>
    </span>
  `;
}

function getSourceTypeLabel(type) {
  const labels = {
    aggregator: "Agregateur",
    classifieds: "Petites annonces",
    development_marketplace: "Consultance",
    freelance_platform: "Freelance",
    government: "Officiel",
    job_board: "Portail emploi",
    marketplace: "Marketplace",
    media: "Media",
    multilateral: "Institution internationale",
    ngo: "ONG / ONU",
    organization: "Organisation",
    recruiter: "Cabinet RH",
    remote_board: "Teletravail",
    social_group: "Groupe social",
    social_jobs: "Reseau pro",
  };

  return labels[type] || "Source";
}

function getCollectionLabel(collection) {
  const labels = {
    manual_only: "Controle manuel",
    official_link: "Lien officiel",
    review_required: "Verification requise",
  };

  return labels[collection] || "Verification requise";
}

function getSourceMonitoringLabel(source) {
  if (source.collection === "manual_only") return "Controle humain";
  if (source.collection === "official_link") return "Source officielle";
  return source.priority <= 1 ? "Veille prioritaire" : "Veille reguliere";
}

function hydrateSourceFilter() {
  if (!sourceFilter) return;
  const current = sourceFilter.value;
  sourceFilter.innerHTML = `<option value="">Toutes les sources</option>${getSources()
    .map((source) => `<option value="${escapeHtml(source)}">${escapeHtml(source)}</option>`)
    .join("")}`;
  sourceFilter.value = current;
}

function hydrateAdminSourceFilter() {
  if (!adminJobSourceFilter) return;
  const current = adminJobSourceFilter.value;
  const values = [...new Set(jobs.map((job) => job.sourceName).filter(Boolean))].sort((a, b) => a.localeCompare(b, "fr"));
  adminJobSourceFilter.innerHTML = `<option value="">Toutes les sources</option>${values
    .map((source) => `<option value="${escapeHtml(source)}">${escapeHtml(source)}</option>`)
    .join("")}`;
  adminJobSourceFilter.value = values.includes(current) ? current : "";
}

function isFreshAdminJob(job) {
  const reference = new Date(job.collectedAt || 0).getTime();
  if (!reference) return false;
  return reference >= Date.now() - 14 * 24 * 60 * 60 * 1000;
}

function getFilteredAdminJobs() {
  const query = normalize(adminJobSearchInput?.value || "");
  const status = adminJobStatusFilter?.value || "";
  const source = adminJobSourceFilter?.value || "";
  const dateMode = adminJobDateFilter?.value || "";

  return jobs.filter((job) => {
    const haystack = normalize(
      [job.title, job.company, job.city, job.category, job.type, job.sourceName, job.deadline, ...(job.tags || [])].join(" ")
    );
    const matchesQuery = !query || haystack.includes(query) || getJobSearchScore(job, query) > 0;
    const matchesStatus = !status || job.status === status;
    const matchesSource = !source || job.sourceName === source;
    const matchesDateMode =
      !dateMode ||
      (dateMode === "expired" && isExpiredJob(job)) ||
      (dateMode === "missing_closing" && !job.closingDate) ||
      (dateMode === "inconsistent" && Boolean(job.inconsistentDates)) ||
      (dateMode === "fresh" && isFreshAdminJob(job));

    return matchesQuery && matchesStatus && matchesSource && matchesDateMode;
  });
}

function getFilteredJobs() {
  const query = searchInput?.value.trim() || "";
  const normalizedQuery = normalize(query);
  const city = cityFilter?.value || "";
  const type = typeFilter?.value || "";
  const source = sourceFilter?.value || "";
  const savedOnly = Boolean(savedOnlyFilter?.checked);
  const sortMode = sortFilter?.value || "recent";

  const filtered = jobs
    .map((job) => ({ job, searchScore: getJobSearchScore(job, normalizedQuery) }))
    .filter(({ job, searchScore }) => {
      const haystack = jobSearchCache.get(job.id)?.searchable || getJobSearchableText(job);
      const matchesQuery = !normalizedQuery || searchScore > 0 || haystack.includes(normalizedQuery);
      const matchesCity = !city || job.city === city || job.city === "Tout le Burkina" || job.city === "Burkina Faso";
      const matchesType =
        !type ||
        matchesSpecialJobFilter(job, type) ||
        normalize(job.type).includes(normalize(type)) ||
        normalize(job.category).includes(normalize(type));
      const matchesCategory = !activeCategory || matchesSpecialJobFilter(job, activeCategory) || job.category === activeCategory;
      const matchesSource = !source || job.sourceName === source;
      const matchesSaved = !savedOnly || savedJobs.has(job.id);
      const matchesFreshness = adminJobsList ? true : !isExpiredJob(job);

      return matchesQuery && matchesCity && matchesType && matchesCategory && matchesSource && matchesSaved && matchesFreshness;
    });

  return filtered
    .sort((a, b) => {
      if (sortMode === "relevance") return getVisibleMatchScore(b.job) - getVisibleMatchScore(a.job);
      if (normalizedQuery && a.searchScore !== b.searchScore) return b.searchScore - a.searchScore;
      if (sortMode === "title") return a.job.title.localeCompare(b.job.title, "fr");
      if (sortMode === "source") return (a.job.sourceName || "").localeCompare(b.job.sourceName || "", "fr");
      return new Date(b.job.collectedAt || 0) - new Date(a.job.collectedAt || 0);
    })
    .map(({ job }) => job);
}

function getVisibleMatchScore(job) {
  return getJobMatchDetails(job).score;
}

function getJobMatchDetails(job) {
  const query = searchInput?.value.trim() || "";
  const type = typeFilter?.value || activeCategory || "";
  const city = cityFilter?.value || "";
  const normalizedType = normalize(type);
  const queryScore = getJobSearchScore(job, normalize(query));
  const reasons = [];
  let score = query ? Math.min(100, 45 + queryScore * 3) : 62;

  if (query && queryScore > 0) {
    reasons.push(`Mot-cle rapproche : ${query}`);
  }
  if (type && (matchesSpecialJobFilter(job, type) || normalize(job.type).includes(normalize(type)) || normalize(job.category).includes(normalize(type)))) {
    score += 14;
    reasons.push(`Domaine compatible : ${type}`);
  }
  if (city && (job.city === city || job.city === "Tout le Burkina" || job.city === "Burkina Faso")) {
    score += 10;
    reasons.push(`Region couverte : ${city}`);
  }
  if (job.closingDate && !isExpiredJob(job)) {
    score += 6;
    reasons.push("Deadline encore active");
  }
  if (getSourceRecord(job.sourceName)) {
    score += 4;
    reasons.push("Source suivie par Emplois Burkina");
  }
  if (!reasons.length) {
    if (normalizedType && normalize(job.category).includes(normalizedType)) reasons.push(`Secteur proche : ${job.category}`);
    else reasons.push("Offre active dans le catalogue");
  }

  return {
    score: Math.max(48, Math.min(99, Math.round(score))),
    reasons: reasons.slice(0, 3),
  };
}

function renderJobCard(job, options = {}) {
  const isActive = job.id === activeJobId;
  const isSaved = savedJobs.has(job.id);
  const applyUrl = job.sourceUrl || job.canonicalUrl || "#";
  const hasApplyUrl = Boolean(applyUrl && applyUrl !== "#");
  const logoUrl = job.companyLogoUrl || job.sourceLogoUrl || "";
  const sourceDescriptor = getJobSourceDescriptor(job);
  const duplicateAttrs = options.duplicate ? ` aria-hidden="true"` : "";
  const duplicateInteractiveAttrs = options.duplicate ? ` tabindex="-1"` : "";
  const displayType = normalize(job.type) === "a verifier" ? "" : job.type;
  const match = getJobMatchDetails(job);
  const metaPills = [
    displayType ? `<span class="pill">${escapeHtml(displayType)}</span>` : "",
    job.closingDate ? `<span class="pill deadline-pill">Cloture : ${escapeHtml(formatJobDate(job.closingDate))}</span>` : "",
    job.openingDateConfirmed
      ? `<span class="pill">Ouverture verifiee</span>`
      : `<span class="pill">Ouverture a confirmer</span>`,
    hasApplyUrl ? `<span class="pill source-pill">${escapeHtml(sourceDescriptor.badge)}</span>` : "",
  ].join("");

  return `
    <article class="job-card ${isActive ? "active" : ""}" data-job-id="${escapeHtml(job.id)}" tabindex="${options.duplicate ? "-1" : "0"}" role="button" aria-label="Voir les details de ${escapeHtml(job.title)}"${duplicateAttrs}>
      <div class="job-card-heading">
        ${renderEntityLogo(job.company || job.sourceName, logoUrl)}
        <div>
          <p class="eyebrow">${escapeHtml(job.category || "Autre")}</p>
          <h3>${escapeHtml(job.title)}</h3>
          <p class="muted">${escapeHtml(job.company || "Organisation non precisee")} - ${escapeHtml(job.city || "Burkina Faso")}</p>
        </div>
        <div class="match-score" aria-label="Score de pertinence">
          <strong>${escapeHtml(match.score)}%</strong>
          <span>match</span>
        </div>
      </div>
      <div class="match-reasons" aria-label="Raisons du matching">
        ${match.reasons.map((reason) => `<span>${escapeHtml(reason)}</span>`).join("")}
      </div>
      ${renderDeadlineStrip(job)}
      ${renderTimeline(job, true)}
      <div class="job-meta">
        ${metaPills}
      </div>
      <div class="tag-row">
        ${(job.tags || []).slice(0, 4).map((tag) => `<span class="pill">${escapeHtml(tag)}</span>`).join("")}
      </div>
      <div class="job-actions">
        ${
          hasApplyUrl
            ? `<a class="nav-action inline-action" href="${escapeHtml(applyUrl)}" target="_blank" rel="noopener" data-track="source_apply_click" data-track-label="${escapeHtml(job.title)}"${duplicateInteractiveAttrs}>${escapeHtml(sourceDescriptor.actionLabel)}</a>`
            : `<button class="nav-action inline-action" type="button" disabled>Source indisponible</button>`
        }
        <button class="secondary-button" type="button" data-action="details" data-id="${escapeHtml(job.id)}"${duplicateInteractiveAttrs}>Détails</button>
        <a class="secondary-link" href="${escapeHtml(getJobPagePath(job))}"${duplicateInteractiveAttrs}>Fiche Emplois Burkina</a>
        <button class="secondary-button" type="button" data-action="save" data-id="${escapeHtml(job.id)}"${duplicateInteractiveAttrs}>
          ${isSaved ? "Sauvegarde" : "Favori"}
        </button>
      </div>
    </article>
  `;
}

function renderDetail(job) {
  if (!jobDetail) return;

  if (!job) {
    jobDetail.innerHTML = `
      <div class="empty-detail">
        <p class="eyebrow">Selection</p>
        <h3>Selectionnez une opportunite</h3>
        <p class="muted">La fiche affiche la ville, la deadline, la source et les actions utiles pour postuler.</p>
      </div>
    `;
    return;
  }

  const whatsappText = encodeURIComponent(
    `Bonjour Emplois Burkina, je veux recevoir les alertes pour: ${job.title} (${job.sourceName || "source"})`
  );
  const sourceDescriptor = getJobSourceDescriptor(job);
  const match = getJobMatchDetails(job);
  const openingDateDetail = formatJobDate(job.openingDate, "Non communiquee par la source");
  const sourceLink =
    job.sourceUrl && job.sourceUrl !== "#"
      ? `<a class="nav-action inline-action" href="${escapeHtml(job.sourceUrl)}" target="_blank" rel="noopener" data-track="source_apply_click" data-track-label="${escapeHtml(job.title)}">${escapeHtml(sourceDescriptor.actionLabel)}</a>`
      : "";
  const logoUrl = job.companyLogoUrl || job.sourceLogoUrl || "";

  jobDetail.innerHTML = `
    <div class="detail-sticky">
      <div class="detail-heading">
        ${renderEntityLogo(job.company || job.sourceName, logoUrl)}
        <div>
          <p class="eyebrow">${escapeHtml(job.category || "Opportunite")}</p>
          <h3>${escapeHtml(job.title)}</h3>
          <p class="muted">${escapeHtml(job.company || "Organisation non precisee")}</p>
        </div>
      </div>
      ${renderDeadlineStrip(job)}
      ${renderTimeline(job)}
      <dl class="detail-list">
        <div><dt>Score de matching</dt><dd>${escapeHtml(match.score)}% selon la recherche actuelle</dd></div>
        <div><dt>Pourquoi</dt><dd>${match.reasons.map(escapeHtml).join(" · ")}</dd></div>
        <div><dt>Ville</dt><dd>${escapeHtml(job.city || "Burkina Faso")}</dd></div>
        <div><dt>Date d'ouverture</dt><dd>${escapeHtml(openingDateDetail)}</dd></div>
        <div><dt>Date de cloture</dt><dd>${escapeHtml(formatJobDate(job.closingDate, "Consulter la source"))}</dd></div>
        <div><dt>Temps restant</dt><dd>${job.closingDate ? `<span data-countdown="${escapeHtml(job.closingDate)}">${escapeHtml(formatCountdown(job.closingDate))}</span>` : "Consulter la source"}</dd></div>
        <div><dt>Source</dt><dd>${escapeHtml(job.sourceName || "Emplois Burkina")}</dd></div>
        <div><dt>Verification</dt><dd>${escapeHtml(sourceDescriptor.badge)}</dd></div>
        <div><dt>Statut date</dt><dd>${job.openingDateConfirmed ? "Date d'ouverture confirmee" : "Date d'ouverture non communiquee par la source"}</dd></div>
        <div><dt>Collecte</dt><dd>${escapeHtml(displayDate(job.collectedAt))}</dd></div>
      </dl>
      <div class="tag-row">
        ${(job.tags || []).map((tag) => `<span class="pill">${escapeHtml(tag)}</span>`).join("")}
      </div>
      <p class="moderation-note reference-note">Verifiez la source avant de postuler.</p>
      <div class="detail-actions">
        ${sourceLink}
        <a class="secondary-link" href="${escapeHtml(getJobPagePath(job))}">Fiche Emplois Burkina</a>
        <a class="secondary-link" href="${buildWhatsAppUrl(decodeURIComponent(whatsappText))}" target="_blank" rel="noopener" data-track="whatsapp_alert" data-track-label="${escapeHtml(job.title)}">Alerte WhatsApp</a>
        <a class="secondary-link" href="contact.html">Signaler</a>
      </div>
    </div>
  `;
}

function renderEmploymentExplorer(activeJob, filteredJobs) {
  if (!employmentExplorer) return;

  const categoryCounts = Object.entries(countBy(jobs, (job) => job.category))
    .sort((a, b) => b[1] - a[1])
    .slice(0, 8);
  const terms = getSearchTermsFromJobs(filteredJobs.length ? filteredJobs : jobs);
  const similarButtons = activeJob
    ? [
        ["Du meme annonceur", "source", activeJob.sourceName, jobs.filter((job) => job.sourceName === activeJob.sourceName).length],
        ["Du meme secteur", "category", activeJob.category, jobs.filter((job) => job.category === activeJob.category).length],
        ["Du meme type contrat", "type", activeJob.type, jobs.filter((job) => job.type === activeJob.type).length],
        ["De la meme localite", "city", activeJob.city, jobs.filter((job) => job.city === activeJob.city).length],
      ].filter(([, , value]) => value)
    : [];

  employmentExplorer.innerHTML = `
    <article class="employment-panel similar-panel">
      <h3>Annonces similaires</h3>
      <div class="similar-actions">
        ${
          similarButtons.length
            ? similarButtons
                .map(
                  ([label, type, value, count]) => `
                    <button type="button" data-employment-search="${escapeHtml(value)}" data-employment-type="${escapeHtml(type)}">
                      <span>${escapeHtml(label)}</span>
                      <strong>${escapeHtml(value)}</strong>
                      <small>${count} offre${count > 1 ? "s" : ""}</small>
                    </button>
                  `,
                )
                .join("")
            : `<p class="muted">Selectionnez une offre pour afficher les rapprochements.</p>`
        }
      </div>
    </article>

    <article class="employment-panel sector-panel">
      <h3>Les annonces par secteur</h3>
      <div class="sector-wheel">
        ${categoryCounts
          .map(
            ([category, count]) => `
              <button type="button" data-employment-search="${escapeHtml(category)}" data-employment-type="category">
                <span>${escapeHtml(initials(category))}</span>
                <strong>${escapeHtml(category)}</strong>
                <small>${count}</small>
              </button>
            `,
          )
          .join("")}
      </div>
    </article>

    <article class="employment-panel word-panel">
      <h3>Les mots de l'emploi</h3>
      <div class="word-cloud">
        ${terms
          .map((item, index) => {
            const maxCount = Math.max(...terms.map((term) => term.count), 1);
            const ratio = item.count / maxCount;
            const level = Math.min(5, Math.max(1, Math.ceil(ratio * 5)));
            const size = 1 + ratio * 1.55;
            const drift = index % 2 === 0 ? 1 : -1;
            const ring = index === 0 ? 0 : index <= 6 ? 1 : index <= 15 ? 2 : 3;
            const ringStart = ring === 0 ? 0 : ring === 1 ? 1 : ring === 2 ? 7 : 16;
            const ringCount = ring === 0 ? 1 : ring === 1 ? 6 : ring === 2 ? 9 : 10;
            const position = index - ringStart;
            const angle = ring === 0 ? 0 : (Math.PI * 2 * position) / ringCount + ring * 0.36;
            const radiusX = ring === 0 ? 0 : 118 + ring * 112 + (index % 2) * 12;
            const radiusY = ring === 0 ? 0 : 54 + ring * 42 + (index % 3) * 8;
            const speed = (drift * (0.000035 + ring * 0.000012 + (index % 4) * 0.000003)).toFixed(6);
            return `<button class="word-level-${level} ${ring === 0 ? "word-center" : ""}" type="button" data-orbit-word data-orbit-angle="${angle.toFixed(4)}" data-orbit-radius-x="${radiusX}" data-orbit-radius-y="${radiusY}" data-orbit-speed="${speed}" data-orbit-phase="${(index * 0.21).toFixed(3)}" data-employment-search="${escapeHtml(item.term)}" data-employment-type="keyword" aria-label="Rechercher ${escapeHtml(item.term)}, ${Math.round(item.count)} occurrences" style="--word-order:${index}; --word-size:${size.toFixed(2)}rem;">${escapeHtml(item.term)}</button>`;
          })
          .join("")}
      </div>
      <button class="text-link" type="button" data-employment-search="" data-employment-type="reset">Tous les tags</button>
    </article>
  `;
  startWordCloudOrbit();
}

function getPageNumbers(current, total) {
  if (total <= 9) return Array.from({ length: total }, (_, index) => index + 1);

  const pages = new Set([1, total, current - 1, current, current + 1]);
  if (current <= 4) [2, 3, 4, 5].forEach((page) => pages.add(page));
  if (current >= total - 3) [total - 4, total - 3, total - 2, total - 1].forEach((page) => pages.add(page));

  return [...pages].filter((page) => page >= 1 && page <= total).sort((a, b) => a - b);
}

function renderJobsPagination(totalPages) {
  if (!jobsPagination) return;

  if (totalPages <= 1) {
    jobsPagination.innerHTML = "";
    jobsPagination.hidden = true;
    return;
  }

  jobsPagination.hidden = false;
  const pages = getPageNumbers(currentJobsPage, totalPages);
  let previousPage = 0;

  const pageButtons = pages
    .map((page) => {
      const separator = previousPage && page - previousPage > 1 ? `<span class="pagination-ellipsis">...</span>` : "";
      previousPage = page;
      return `${separator}<button class="pagination-page ${page === currentJobsPage ? "active" : ""}" type="button" data-page="${page}" aria-label="Page ${page}" ${page === currentJobsPage ? 'aria-current="page"' : ""}>${page}</button>`;
    })
    .join("");

  jobsPagination.innerHTML = `
    <button class="pagination-link" type="button" data-page="${Math.max(1, currentJobsPage - 1)}" ${currentJobsPage === 1 ? "disabled" : ""}>Precedent</button>
    ${pageButtons}
    <button class="pagination-link" type="button" data-page="${Math.min(totalPages, currentJobsPage + 1)}" ${currentJobsPage === totalPages ? "disabled" : ""}>Suivant</button>
    <button class="pagination-link" type="button" data-page="${totalPages}" ${currentJobsPage === totalPages ? "disabled" : ""}>Dernier</button>
  `;
}

function getSearchAlertCriteria(filteredCount = 0) {
  const query = searchInput?.value.trim() || "";
  const city = cityFilter?.value || "";
  const type = typeFilter?.value || activeCategory || "";
  const source = sourceFilter?.value || "";
  const sort = sortFilter?.value || "relevance";
  const summary = [
    query ? `mot-cle "${query}"` : "",
    city ? `region ${city}` : "",
    type ? `domaine ${type}` : "",
    source ? `source ${source}` : "",
  ].filter(Boolean);

  return {
    query,
    city,
    type,
    source,
    sort,
    label: summary.length ? summary.join(", ") : "toutes les offres actives",
    filteredCount,
  };
}

function renderSearchAlertPanel(filteredCount = 0) {
  if (!searchAlertPanel) return;
  const criteria = getSearchAlertCriteria(filteredCount);
  const hasFocusedSearch = Boolean(criteria.query || criteria.city || criteria.type || criteria.source);
  searchAlertPanel.innerHTML = `
    <div>
      <p class="eyebrow">Alerte recherche</p>
      <strong>${hasFocusedSearch ? "Surveiller cette recherche" : "Recevoir les nouvelles offres"}</strong>
      <span>${escapeHtml(criteria.filteredCount)} resultat${criteria.filteredCount > 1 ? "s" : ""} maintenant - ${escapeHtml(criteria.label)}.</span>
    </div>
    <form class="search-alert-form" data-lead-type="alert">
      <input name="phone" inputmode="tel" autocomplete="tel" placeholder="WhatsApp +226..." aria-label="Numero WhatsApp pour cette alerte" required />
      <button class="secondary-button" type="submit">Créer l'alerte</button>
      <p class="form-note" data-search-alert-message></p>
    </form>
  `;
}

function resetJobsPage() {
  currentJobsPage = 1;
}

function renderJobs() {
  if (!jobsList) return;

  const filtered = getFilteredJobs();
  const totalPages = Math.max(1, Math.ceil(filtered.length / JOBS_PER_PAGE));
  currentJobsPage = Math.min(Math.max(currentJobsPage, 1), totalPages);
  const pageStart = (currentJobsPage - 1) * JOBS_PER_PAGE;
  const visibleJobs = filtered.slice(pageStart, pageStart + JOBS_PER_PAGE);

  if (!activeJobId || !visibleJobs.some((job) => job.id === activeJobId)) {
    activeJobId = visibleJobs[0]?.id || "";
  }

  if (jobCount) jobCount.textContent = jobs.length;
  if (sourceCount) sourceCount.textContent = getVerifiedSourceCount(sources.length ? sources : getSources()) || sources.length || getSources().length;
  updateFilterCounts();
  updateSavedStorage();

  if (resultsSummary) {
    const label = filtered.length > 1 ? "opportunites trouvees" : "opportunite trouvee";
    const rangeStart = filtered.length ? pageStart + 1 : 0;
    const rangeEnd = Math.min(pageStart + visibleJobs.length, filtered.length);
    const pageLabel = filtered.length ? ` Affichage ${rangeStart}-${rangeEnd}.` : "";
    const datedCount = filtered.filter((job) => job.closingDate).length;
    const openingConfirmedCount = filtered.filter((job) => job.openingDateConfirmed).length;
    const trustedCount = filtered.filter((job) => ["official_link", "review_required"].includes(getSourceRecord(job.sourceName)?.collection)).length;
    const queryLabel = searchInput?.value.trim() ? ` Recherche : "${searchInput.value.trim()}".` : "";
    resultsSummary.textContent = `${filtered.length} ${label} sur ${jobs.length}.${pageLabel}${queryLabel} ${openingConfirmedCount} avec date d'ouverture confirmee. ${datedCount} avec date de cloture confirmee. ${trustedCount} issues de liens officiels ou de sources suivies.`;
  }
  renderSearchAlertPanel(filtered.length);

  jobsList.innerHTML = visibleJobs.length
    ? visibleJobs.map(renderJobCard).join("")
    : `<p class="muted">Aucune opportunite ne correspond encore a cette recherche. Essayez un metier simple comme macon, chauffeur, vendeuse, comptable, ONG ou concours.</p>`;

  renderJobsPagination(totalPages);
  const activeJob = jobs.find((job) => job.id === activeJobId);
  renderDetail(activeJob);
  renderEmploymentExplorer(activeJob, filtered);
  updateCountdowns();
  initVisualEnhancements();
}

function renderSourceDirectory() {
  if (!sourceGrid && !sourceMetrics) return;

  const sourceTypes = sources.reduce((acc, source) => {
    acc[source.type] = (acc[source.type] || 0) + 1;
    return acc;
  }, {});
  const automaticCount = sources.filter((source) => source.collection !== "manual_only").length;
  const manualCount = sources.length - automaticCount;
  const orderedSources = sortSourcesByPriority(sources);
  const activeFeedCount = internationalFeeds.filter((feed) => getFeedMonitoringState(feed).visibleCount > 0).length;
  const liveSyncCount = internationalFeeds.filter((feed) => getFeedMonitoringState(feed).hasLiveSync).length;

  if (sourceMetrics) {
    sourceMetrics.innerHTML = `
      <article><strong>${sources.length}</strong><span>sources surveillees</span></article>
      <article><strong>${activeFeedCount}</strong><span>flux avec offres visibles</span></article>
      <article><strong>${liveSyncCount || automaticCount}</strong><span>suivi automatise exploitable</span></article>
      <article><strong>${manualCount}</strong><span>controle humain</span></article>
      <article><strong>${Object.keys(sourceTypes).length}</strong><span>types de sources</span></article>
    `;
  }

  if (sourceGrid) {
    sourceGrid.innerHTML = orderedSources
      .map(
        (source) => {
          const descriptor = sourceReferenceDescriptor(source);
          return `
          <article class="source-card">
            <div>
              <p class="eyebrow">${getSourceTypeLabel(source.type)}</p>
              <h3>${escapeHtml(source.name)}</h3>
              <p class="muted">${escapeHtml(source.notes || "Source a verifier avant publication.")}</p>
            </div>
            <div class="job-meta">
              <span class="pill">${getCollectionLabel(source.collection)}</span>
              <span class="pill">${getSourceMonitoringLabel(source)}</span>
            </div>
            <a class="secondary-link" href="${escapeHtml(source.url)}" target="_blank" rel="noopener">${escapeHtml(descriptor.actionLabel)}</a>
          </article>
        `;
        }
      )
      .join("");
  }
  initVisualEnhancements();
}

function renderInstitutionFeedCard(source, options = {}) {
  const descriptor = sourceReferenceDescriptor(source);
  const feed = getInternationalFeed(source.id);
  const jobs = Array.isArray(options.jobs) ? sortFeedJobs(options.jobs).slice(0, 10) : getRenderableFeedJobs(feed, 10).visible;
  const feedState = getFeedMonitoringState(feed);
  const portalState = getFeedPortalState(feed);
  const animated = jobs.length > 1;
  const trackMarkup = jobs.length
    ? [...jobs, ...(animated ? jobs : [])]
        .map(
          (job) => {
            const summaryBits = [job.location, job.contract].filter(Boolean).join(" - ");
            const secondaryLabel = summaryBits || job.sourceLabel || source.name;
            const dateBits = [
              job.openingDate ? `Publie: ${formatJobDate(job.openingDate)}` : "",
              job.closingDate ? `Cloture: ${formatJobDate(job.closingDate)}` : "",
            ].filter(Boolean);
            const href = !portalState.unavailable && job.url ? ` href="${escapeHtml(job.url)}" target="_blank" rel="noopener"` : "";
            const tagName = portalState.unavailable ? "div" : "a";
            const stateClass = portalState.unavailable ? " is-disabled" : "";
            const statusLine = portalState.unavailable
              ? escapeHtml(portalState.message)
              : escapeHtml(dateBits.join(" | ") || "Date non lue");

            return `
            <${tagName} class="institution-feed-item${stateClass}"${href}>
              <strong>${escapeHtml(job.title)}</strong>
              <span>${escapeHtml(secondaryLabel)}</span>
              <small>${statusLine}</small>
            </${tagName}>
          `;
          },
        )
        .join("")
    : `<div class="institution-feed-empty">${
        feed?.error
          ? "La derniere synchronisation automatique n'a pas abouti pour cette source. Ouvrez directement la reference officielle pendant la reprise."
          : "Aucune offre ouverte n'a encore ete detectee automatiquement pour cette institution. Ouvrez la source officielle."
      }</div>`;

  const footerAction = portalState.unavailable
    ? `<span class="secondary-link is-disabled" aria-disabled="true">${escapeHtml("Portail temporairement indisponible")}</span>`
    : `<a class="secondary-link" href="${escapeHtml(source.url)}" target="_blank" rel="noopener">${escapeHtml(descriptor.actionLabel)}</a>`;

  return `
    <article class="source-card institution-source-card">
      <div>
        <p class="eyebrow">${getSourceTypeLabel(source.type)}</p>
        <h3>${escapeHtml(source.name)}</h3>
        <p class="muted">${escapeHtml(source.notes || "Source a verifier avant publication.")}</p>
      </div>
      <div class="job-meta">
        <span class="pill">${getCollectionLabel(source.collection)}</span>
        <span class="pill">${jobs.length} offre${jobs.length > 1 ? "s" : ""}</span>
        ${feedState.datedCount ? `<span class="pill">${feedState.datedCount} date${feedState.datedCount > 1 ? "s" : ""} lue${feedState.datedCount > 1 ? "s" : ""}</span>` : ""}
        ${feedState.isStale ? `<span class="pill">${escapeHtml("Dernier flux conserve")}</span>` : ""}
        ${feedState.hasError && !feedState.isStale ? `<span class="pill">${escapeHtml("Controle requis")}</span>` : ""}
        ${portalState.unavailable ? `<span class="pill">${escapeHtml("Maintenance externe")}</span>` : ""}
      </div>
      <div
        class="institution-feed-shell ${animated ? "is-animated" : ""}"
        data-feed-auto="${animated ? "true" : "false"}"
        aria-label="${escapeHtml("Liste d'offres defilante. Survolez puis utilisez la molette ou faites glisser pour monter et descendre.")}"
      >
        <div class="institution-feed-track">
          ${trackMarkup}
        </div>
      </div>
      ${footerAction}
    </article>
  `;
}

function renderAggregateTechFeedCard(entries = [], spotlight = {}) {
  const aggregateJobs = collectSpotlightAggregateJobs(entries, 10);
  const mergedJobs = [];
  const seen = new Set();

  aggregateJobs.forEach((job) => {
    const key = normalize(job.url || job.id || job.title);
    if (!key || seen.has(key)) return;
    seen.add(key);
    mergedJobs.push(job);
  });

  const aggregateSource = {
    id: `${spotlight.id}-aggregate`,
    name: "Offres internationales en informatique",
    type: "organization",
    collection: "review_required",
    notes:
      "Selection consolidee Emplois Burkina a partir de sources internationales reelles, diversifiees et suivies pour l'IT, la data, les systemes et la cybersecurite.",
    url: spotlight.actionHref || "jobs.html?focus=onu-consultance&q=informatique",
  };

  return renderInstitutionFeedCard(aggregateSource, {
    jobs: mergedJobs,
  });
}

function renderStrategicSourcePlaceholder(spotlight, message) {
  const keywordMarkup = spotlight.keywords
    .map((keyword) => `<span class="pill">${escapeHtml(keyword)}</span>`)
    .join("");
  const shortcutMarkup = (spotlight.searchShortcuts || [])
    .map(
      (shortcut) => `
        <button
          class="strategic-search-card"
          type="button"
          data-portal-focus="${escapeHtml(shortcut.focus || "")}"
          data-portal-query="${escapeHtml(shortcut.query || "")}"
        >
          <strong>${escapeHtml(shortcut.label)}</strong>
          <span>${escapeHtml(shortcut.note)}</span>
        </button>
      `
    )
    .join("");

  return `
    <section class="strategic-source-section strategic-source-band" id="${escapeHtml(spotlight.anchor)}">
      <div class="strategic-source-lead">
        <div>
          <p class="eyebrow">${escapeHtml(spotlight.eyebrow)}</p>
          <h3>${escapeHtml(spotlight.title)}</h3>
          <p class="muted">${escapeHtml(spotlight.description)}</p>
        </div>
        <div class="strategic-source-meta">
          <span class="pill">Synchronisation</span>
          <span class="pill">Sources reelles</span>
        </div>
      </div>
      <div class="strategic-search-grid">
        ${shortcutMarkup}
      </div>
      <div class="tag-row keyword-row">${keywordMarkup}</div>
      <div class="source-directory-grid spotlight-grid">
        <article class="source-card institution-source-card">
          <div>
            <p class="eyebrow">${escapeHtml(spotlight.eyebrow)}</p>
            <h3>Chargement des references</h3>
            <p class="muted">${escapeHtml(message)}</p>
          </div>
          <div class="job-meta">
            <span class="pill">Patientez</span>
            <span class="pill">Verification en cours</span>
          </div>
          <div class="institution-feed-shell">
            <div class="institution-feed-track">
              <div class="institution-feed-empty">Les liens officiels et les offres detectees s'afficheront ici automatiquement des que la synchronisation est terminee.</div>
            </div>
          </div>
          <a class="secondary-link" href="${escapeHtml(spotlight.actionHref)}">${escapeHtml(spotlight.actionLabel)}</a>
        </article>
      </div>
      <div class="strategic-source-actions">
        <a class="secondary-link" href="${escapeHtml(spotlight.actionHref)}">${escapeHtml(spotlight.actionLabel)}</a>
        <a class="secondary-link" href="conseils.html">Voir les conseils de candidature</a>
      </div>
    </section>
  `;
}

function renderStrategicSourceSections() {
  if (!strategicSourceSections) return;

  if (!sources.length) {
    strategicSourceSections.innerHTML = SOURCE_SPOTLIGHTS
      .map((spotlight) =>
        renderStrategicSourcePlaceholder(
          spotlight,
          "Les sources internationales sont en cours de chargement. La rubrique reste visible pour eviter tout ecran vide."
        )
      )
      .join("");
    initVisualEnhancements();
    return;
  }

  if (!internationalFeeds.length) {
    strategicSourceSections.innerHTML = SOURCE_SPOTLIGHTS
      .map((spotlight) =>
        renderStrategicSourcePlaceholder(
          spotlight,
          "Les flux d'offres internationales sont en cours de synchronisation. Les references officielles seront injectees automatiquement."
        )
      )
      .join("");
    initVisualEnhancements();
    return;
  }

  strategicSourceSections.innerHTML = SOURCE_SPOTLIGHTS.map((spotlight) => {
    const spotlightSegments = Array.isArray(spotlight.segments) && spotlight.segments.length
      ? spotlight.segments
      : [spotlight.id];
    const spotlightCandidates = sortSourcesForSpotlight(
      sources.filter((source) =>
        spotlightSegments.some((segment) => sourceHasSegment(source, segment)) &&
        (!spotlight.sourceTypes?.length || spotlight.sourceTypes.includes(source.type))
      ),
      spotlight
    );
    const spotlightSources = spotlightCandidates
      .map((source) => ({ source, feedJobs: getSpotlightFeedJobs(source, spotlight, 10) }))
      .filter(({ feedJobs }) => feedJobs.length > 0)
      .slice(0, spotlight.mode === "tech" ? Math.max(2, spotlight.limit) : spotlight.limit);
    const spotlightJobCount =
      spotlight.mode === "tech"
        ? (() => {
            const seen = new Set();
            return collectSpotlightAggregateJobs(spotlightSources, 18).filter((job) => {
              const key = normalize(job.url || job.id || job.title);
              if (!key || seen.has(key)) return false;
              seen.add(key);
              return true;
            }).length;
          })()
        : collectSpotlightAggregateJobs(spotlightSources, 18).length;
    const keywordMarkup = spotlight.keywords
      .map((keyword) => `<span class="pill">${escapeHtml(keyword)}</span>`)
      .join("");
    const shortcutMarkup = (spotlight.searchShortcuts || [])
      .map(
        (shortcut) => `
          <button
            class="strategic-search-card"
            type="button"
            data-portal-focus="${escapeHtml(shortcut.focus || "")}"
            data-portal-query="${escapeHtml(shortcut.query || "")}"
          >
            <strong>${escapeHtml(shortcut.label)}</strong>
            <span>${escapeHtml(shortcut.note)}</span>
          </button>
        `
      )
      .join("");
    const shouldRenderShortcutGrid = spotlight.mode !== "tech" && Boolean(shortcutMarkup);
    const spotlightCards =
      spotlight.mode === "tech"
        ? [
            ...spotlightSources
              .slice(0, 2)
              .map(({ source, feedJobs }) => renderInstitutionFeedCard(source, { jobs: feedJobs })),
            ...(spotlightSources.length
              ? [renderAggregateTechFeedCard(spotlightSources, spotlight)]
              : []),
          ]
        : spotlightSources.map(({ source, feedJobs }) => renderInstitutionFeedCard(source, { jobs: feedJobs }));

    const cardsMarkup = spotlightCards.length
      ? spotlightCards.join("")
      : `
        <article class="source-card institution-source-card">
          <div>
            <p class="eyebrow">${escapeHtml(spotlight.eyebrow)}</p>
            <h3>Flux en cours de synchronisation</h3>
            <p class="muted">Les institutions internationales sont bien configurees, mais aucune offre exploitable n'a encore ete chargee dans cette rubrique a cet instant.</p>
          </div>
          <div class="institution-feed-shell">
            <div class="institution-feed-track">
              <div class="institution-feed-empty">Rechargez la page dans quelques instants ou ouvrez directement les references officielles ci-dessous.</div>
            </div>
          </div>
          <div class="strategic-source-actions">
            <a class="secondary-link" href="${escapeHtml(spotlight.actionHref)}">${escapeHtml(spotlight.actionLabel)}</a>
          </div>
        </article>`;

    return `
      <section class="strategic-source-section strategic-source-band" id="${escapeHtml(spotlight.anchor)}">
        <div class="strategic-source-lead">
          <div>
            <p class="eyebrow">${escapeHtml(spotlight.eyebrow)}</p>
            <h3>${escapeHtml(spotlight.title)}</h3>
            <p class="muted">${escapeHtml(spotlight.description)}</p>
          </div>
          <div class="strategic-source-meta">
            <span class="pill">${spotlightSources.length} source${spotlightSources.length > 1 ? "s" : ""}</span>
            <span class="pill">${spotlightJobCount} offre${spotlightJobCount > 1 ? "s" : ""} reliee${spotlightJobCount > 1 ? "s" : ""}</span>
            <span class="pill">Liens reels</span>
          </div>
        </div>
        ${shouldRenderShortcutGrid ? `<div class="strategic-search-grid">${shortcutMarkup}</div>` : ""}
        <div class="tag-row keyword-row">${keywordMarkup}</div>
        <div class="source-directory-grid spotlight-grid">${cardsMarkup}</div>
        <div class="strategic-source-actions">
          <a class="secondary-link" href="${escapeHtml(spotlight.actionHref)}">${escapeHtml(spotlight.actionLabel)}</a>
          <a class="secondary-link" href="conseils.html">Voir les conseils de candidature</a>
        </div>
      </section>
    `;
  }).join("");

  initVisualEnhancements();
}

function getLeadLabel(kind) {
  const labels = {
    alert: "Alerte candidat",
    publish: "Publication",
    sponsor: "Commercial",
    contact: "Contact",
  };
  return labels[kind] || "Lead";
}

function leadContact(lead) {
  return lead.data?.contact || lead.data?.phone || lead.data?.email || "";
}

function leadName(lead) {
  return lead.data?.organization || lead.data?.name || lead.data?.title || "Sans nom";
}

function exportLeadsCsv() {
  const leads = readStorageArray(LEADS_KEY);
  const headers = ["date", "type", "nom", "contact", "valeur_fcfa", "statut", "details"];
  const rows = leads.map((lead) => [
    displayDate(lead.createdAt),
    getLeadLabel(lead.kind),
    leadName(lead),
    leadContact(lead),
    lead.valueFcfa || 0,
    lead.status,
    JSON.stringify(lead.data || {}),
  ]);
  const csv = [headers, ...rows]
    .map((row) => row.map((cell) => `"${String(cell).replaceAll('"', '""')}"`).join(","))
    .join("\n");
  const blob = new Blob([csv], { type: "text/csv;charset=utf-8" });
  const url = URL.createObjectURL(blob);
  const link = document.createElement("a");
  link.href = url;
  link.download = `emplois-burkina-leads-${new Date().toISOString().slice(0, 10)}.csv`;
  link.click();
  URL.revokeObjectURL(url);
}

function adminToken() {
  return localStorage.getItem("emplois-burkina.adminToken") || "";
}

async function fetchAdminJson(path) {
  const response = await fetch(path, {
    headers: {
      Authorization: `Bearer ${adminToken()}`,
    },
  });
  if (!response.ok) throw new Error("Admin API unavailable");
  return response.json();
}

async function loadServerAdminData() {
  try {
    const [{ leads }, { events }] = await Promise.all([
      fetchAdminJson("/api/admin/leads"),
      fetchAdminJson("/api/admin/events"),
    ]);
    writeStorageArray(LEADS_KEY, leads);
    writeStorageArray(EVENTS_KEY, events);
    renderAdmin();
    await loadSocialQueue();
    await loadAutomationStatus();
    await loadProductModules();
    await loadAnalyticsSummary();
    await loadAlertSegments();
    await loadVisibilityEngine();
    return true;
  } catch {
    return false;
  }
}

async function loadAnalyticsSummary() {
  if (!analyticsSummary && !analyticsTable) return;

  try {
    const summary = await fetchAdminJson("/api/admin/analytics/summary");
    const events = summary.events || {};
    const leads = summary.leads || {};
    const alertSegments = summary.alertSegments || {};

    if (analyticsSummary) {
      analyticsSummary.innerHTML = `
        <article><strong>${escapeHtml(events.last7Days || 0)}</strong><span>evenements 7 jours</span></article>
        <article><strong>${escapeHtml(events.sponsorSignals || 0)}</strong><span>signaux sponsor</span></article>
        <article><strong>${escapeHtml(leads.last7Days || 0)}</strong><span>leads 7 jours</span></article>
        <article><strong>${escapeHtml(alertSegments.active || 0)}</strong><span>segments alertes</span></article>
      `;
    }

    if (analyticsTable) {
      analyticsTable.innerHTML = events.topTypes?.length
        ? events.topTypes
            .map(
              ([type, count]) => `
                <tr>
                  <td>${escapeHtml(type)}</td>
                  <td>${escapeHtml(count)}</td>
                </tr>
              `,
            )
            .join("")
        : `<tr><td colspan="2">Aucun signal recent.</td></tr>`;
    }
  } catch {
    if (analyticsSummary) {
      analyticsSummary.innerHTML = `
        <article><strong>Token</strong><span>requis pour les analytics</span></article>
      `;
    }
    if (analyticsTable) analyticsTable.innerHTML = `<tr><td colspan="2">Token requis.</td></tr>`;
  }
}

async function loadAlertSegments() {
  if (!alertSegmentsSummary && !alertSegmentsTable) return;

  try {
    const { summary = {}, segments = [] } = await fetchAdminJson("/api/admin/alerts/segments");
    if (alertSegmentsSummary) {
      alertSegmentsSummary.innerHTML = `
        <article><strong>${escapeHtml(summary.active || 0)}</strong><span>segments actifs</span></article>
        <article><strong>${escapeHtml(summary.subscribers || 0)}</strong><span>abonnements alertes</span></article>
        <article><strong>${escapeHtml(summary.total || 0)}</strong><span>segments total</span></article>
      `;
    }
    if (alertSegmentsTable) {
      alertSegmentsTable.innerHTML = segments.length
        ? segments
            .slice(0, 12)
            .map(
              (segment) => `
                <tr>
                  <td><strong>${escapeHtml(segment.label)}</strong><br /><small>${escapeHtml(segment.id)}</small></td>
                  <td>${escapeHtml(segment.subscribers || 0)}</td>
                  <td>${escapeHtml(displayDate(segment.lastLeadAt))}</td>
                </tr>
              `,
            )
            .join("")
        : `<tr><td colspan="3">Aucun segment d'alerte pour le moment.</td></tr>`;
    }
  } catch {
    if (alertSegmentsSummary) {
      alertSegmentsSummary.innerHTML = `<article><strong>Token</strong><span>requis pour les segments</span></article>`;
    }
    if (alertSegmentsTable) alertSegmentsTable.innerHTML = `<tr><td colspan="3">Token requis.</td></tr>`;
  }
}

async function loadVisibilityEngine() {
  if (!visibilitySummary && !visibilityTable) return;

  try {
    const { report = {}, targets = [] } = await fetchAdminJson("/api/admin/growth/visibility");
    const totals = report.totals || {};
    if (visibilitySummary) {
      visibilitySummary.innerHTML = `
        <article><strong>${escapeHtml(report.score ?? 0)}/100</strong><span>score visibilite</span></article>
        <article><strong>${escapeHtml(totals.outreachTargets || targets.length || 0)}</strong><span>cibles partenaires</span></article>
        <article><strong>${escapeHtml(totals.sitemapUrls || 0)}</strong><span>URLs sitemap</span></article>
        <article><strong>${escapeHtml(totals.rateProducts || 0)}</strong><span>produits revenus</span></article>
      `;
    }

    if (visibilityTable) {
      visibilityTable.innerHTML = targets.length
        ? targets
            .slice(0, 12)
            .map(
              (target) => `
                <tr>
                  <td>${escapeHtml(target.name)}<br><span class="muted">${escapeHtml(target.type)}</span></td>
                  <td>${escapeHtml(target.angle)}</td>
                </tr>
              `,
            )
            .join("")
        : `<tr><td colspan="2">Aucune cible generee.</td></tr>`;
    }
  } catch {
    if (visibilitySummary) {
      visibilitySummary.innerHTML = `<article><strong>Token</strong><span>requis pour la visibilite</span></article>`;
    }
    if (visibilityTable) visibilityTable.innerHTML = `<tr><td colspan="2">Token requis.</td></tr>`;
  }
}

async function loadAutomationStatus() {
  if (!automationStatus) return;

  try {
    const status = await fetchAdminJson("/api/admin/automation/status");
    const state = status.automationState || {};
    const report = status.automationReport || {};
    const quality = status.automationQuality || report.quality || {};
    const offerQuality = status.offerQualityReport || {};
    const offerTotals = offerQuality.totals || {};
    const totals = report.totals || {};
    const duration = state.durationMs ? `${Math.round(state.durationMs / 1000)}s` : "-";
    automationStatus.innerHTML = `
      <article><strong>${escapeHtml(status.sources)}</strong><span>sources configurees</span></article>
      <article><strong>${escapeHtml(status.rawItems)}</strong><span>items bruts collectes</span></article>
      <article><strong>${escapeHtml(status.curatedJobs)}</strong><span>offres curees</span></article>
      <article><strong>${escapeHtml(status.needsReview)}</strong><span>a moderer</span></article>
      <article><strong>${escapeHtml(state.status || "idle")}</strong><span>etat automation</span></article>
      <article><strong>${escapeHtml(duration)}</strong><span>duree derniere run</span></article>
      <article><strong>${escapeHtml(totals.scraperErrors ?? "-")}</strong><span>erreurs scraper</span></article>
      <article><strong>${escapeHtml(totals.missingClosingDate ?? "-")}</strong><span>dates a completer</span></article>
      <article><strong>${escapeHtml(totals.closingSoon ?? "-")}</strong><span>deadlines proches</span></article>
      <article><strong>${escapeHtml(totals.seedSqlBytes ? `${Math.round(totals.seedSqlBytes / 1024)} KB` : "-")}</strong><span>seed PostgreSQL</span></article>
      <article><strong>${escapeHtml(status.sqlite?.enabled ? `${Math.round((status.sqlite.bytes || 0) / 1024)} KB` : "-")}</strong><span>SQLite locale</span></article>
      <article><strong>${escapeHtml(status.storage?.primary || (status.sqlite?.enabled ? "sqlite" : "json"))}</strong><span>stockage primaire</span></article>
      <article><strong>${escapeHtml(quality.score ?? "-")}/100</strong><span>score qualite</span></article>
      <article><strong>${escapeHtml(quality.failedCritical ?? "-")}</strong><span>checks critiques</span></article>
      <article><strong>${escapeHtml(quality.failedWarnings ?? "-")}</strong><span>warnings qualite</span></article>
      <article><strong>${escapeHtml(offerQuality.score ?? "-")}/100</strong><span>score offres</span></article>
      <article><strong>${escapeHtml(offerTotals.publishable ?? "-")}</strong><span>offres publiables</span></article>
      <article><strong>${escapeHtml(offerTotals.expired ?? "-")}</strong><span>offres expirees</span></article>
      <article><strong>${escapeHtml(offerTotals.closingCoveragePercent ?? "-")}%</strong><span>couverture deadlines</span></article>
    `;
    if (state.lastSuccessAt) {
      automationStatus.insertAdjacentHTML(
        "beforeend",
        `<article><strong>${escapeHtml(displayDate(state.lastSuccessAt))}</strong><span>dernier succes</span></article>`
      );
    }
    if (state.nextRunAt) {
      automationStatus.insertAdjacentHTML(
        "beforeend",
        `<article><strong>${escapeHtml(displayDate(state.nextRunAt))}</strong><span>prochain passage</span></article>`
      );
    }
    if (status.lastCollectedAt) {
      automationStatus.insertAdjacentHTML(
        "beforeend",
        `<article><strong>${escapeHtml(displayDate(status.lastCollectedAt))}</strong><span>derniere collecte</span></article>`
      );
    }
    if (dateReviewTable) {
      const queue = status.dateReviewQueue || [];
      dateReviewTable.innerHTML = queue.length
        ? queue
            .slice(0, 12)
            .map(
              (item) => `
                <tr>
                  <td>${escapeHtml(item.priority)}</td>
                  <td>${escapeHtml(item.title)}</td>
                  <td>${escapeHtml(item.sourceName)}</td>
                  <td>
                    <a class="secondary-link" href="${escapeHtml(item.sourceUrl)}" target="_blank" rel="noopener">Verifier</a>
                    <button class="secondary-button date-override-button" type="button" data-job-id="${escapeHtml(item.id)}">Corriger</button>
                  </td>
                </tr>
              `,
            )
            .join("")
        : `<tr><td colspan="4">Aucune date a verifier.</td></tr>`;
    }
  } catch {
    automationStatus.innerHTML = `
      <article><strong>Token</strong><span>requis pour lire le pipeline</span></article>
    `;
    if (dateReviewTable) {
      dateReviewTable.innerHTML = `<tr><td colspan="4">Token requis pour lire la file.</td></tr>`;
    }
  }
}

async function loadProductModules() {
  if (!moduleSummary && !moduleRoadmapTable) return;

  try {
    const payload = await fetchAdminJson("/api/product/modules");
    const summary = payload.summary || {};
    const modules = payload.modules || [];

    if (moduleSummary) {
      moduleSummary.innerHTML = `
        <article><strong>${escapeHtml(summary.total ?? "-")}</strong><span>modules produit</span></article>
        <article><strong>${escapeHtml(summary.criticalOpen ?? "-")}</strong><span>critiques ouverts</span></article>
        <article><strong>${escapeHtml(summary.inProgress ?? "-")}</strong><span>en developpement</span></article>
        <article><strong>${escapeHtml(summary.planned ?? "-")}</strong><span>planifies</span></article>
      `;
    }

    if (moduleRoadmapTable) {
      moduleRoadmapTable.innerHTML = modules.length
        ? modules
            .map(
              (module) => `
                <tr>
                  <td>
                    <strong>${escapeHtml(module.name)}</strong><br />
                    <small>${escapeHtml(module.backend)}</small>
                  </td>
                  <td>${escapeHtml(module.status)}</td>
                  <td>${escapeHtml(module.priority)}</td>
                  <td>${escapeHtml(module.nextMilestone)}</td>
                </tr>
              `,
            )
            .join("")
        : `<tr><td colspan="4">Aucun module configure.</td></tr>`;
    }
  } catch (error) {
    if (moduleSummary) {
      moduleSummary.innerHTML = `<article><strong>Erreur</strong><span>${escapeHtml(error.message || "lecture impossible")}</span></article>`;
    }
    if (moduleRoadmapTable) {
      moduleRoadmapTable.innerHTML = `<tr><td colspan="4">Impossible de charger les modules.</td></tr>`;
    }
  }
}

async function loadSocialQueue() {
  if (!socialQueueTable) return;

  try {
    const { queue, configured } = await fetchAdminJson("/api/admin/social/queue");
    socialQueueTable.innerHTML = queue.length
      ? queue
          .slice(0, 20)
          .map(
            (item) => `
              <tr>
                <td>${escapeHtml(item.title)}</td>
                <td>${escapeHtml(item.status)}</td>
                <td>${escapeHtml(item.sourceName || "")}</td>
              </tr>
            `
          )
          .join("")
      : `<tr><td colspan="3">Aucun post en attente.</td></tr>`;
    if (socialAdminMessage) {
      socialAdminMessage.textContent = `Facebook: ${configured.facebook ? "configure" : "non configure"} - Webhook: ${configured.webhook ? "configure" : "non configure"} - Live: ${configured.live ? "oui" : "non"}`;
      socialAdminMessage.dataset.state = "info";
    }
  } catch {
    socialQueueTable.innerHTML = `<tr><td colspan="3">Impossible de charger la file sociale.</td></tr>`;
  }
}

function renderAdmin() {
  const leads = readStorageArray(LEADS_KEY);
  const events = readStorageArray(EVENTS_KEY);
  const pipelineValue = leads.reduce((sum, lead) => sum + (lead.valueFcfa || 0), 0);
  const reviewJobs = jobs.filter((job) => job.status === "needs_review");
  const expiredJobs = jobs.filter((job) => isExpiredJob(job));
  const inconsistentJobs = jobs.filter((job) => job.inconsistentDates);
  const moderationJobs = jobs
    .slice()
    .sort((a, b) => Number(a.status === "needs_review") - Number(b.status === "needs_review"))
    .reverse();
  const filteredAdminJobs = getFilteredAdminJobs()
    .slice()
    .sort((a, b) => Number(a.status === "needs_review") - Number(b.status === "needs_review"))
    .reverse();

  if (leadCount) leadCount.textContent = leads.length;
  if (eventCount) eventCount.textContent = events.length;
  hydrateAdminSourceFilter();

  if (adminSummary) {
    adminSummary.innerHTML = `
      <article><strong>${leads.length}</strong><span>leads captures</span></article>
      <article><strong>${formatFcfa(pipelineValue)}</strong><span>pipeline potentiel</span></article>
      <article><strong>${reviewJobs.length}</strong><span>offres a moderer</span></article>
      <article><strong>${expiredJobs.length}</strong><span>expirees</span></article>
      <article><strong>${inconsistentJobs.length}</strong><span>dates incoherentes</span></article>
      <article><strong>${events.length}</strong><span>evenements suivis</span></article>
    `;
  }

  if (leadTable) {
    leadTable.innerHTML = leads.length
      ? leads
          .map(
            (lead) => `
              <tr>
                <td>${escapeHtml(displayDate(lead.createdAt))}</td>
                <td>${escapeHtml(getLeadLabel(lead.kind))}</td>
                <td>${escapeHtml(leadName(lead))}</td>
                <td>${escapeHtml(leadContact(lead))}</td>
                <td>${escapeHtml(formatFcfa(lead.valueFcfa))}</td>
              </tr>
            `
          )
          .join("")
      : `<tr><td colspan="5">Aucun lead local pour le moment.</td></tr>`;
  }

  if (adminJobsFilterSummary) {
    adminJobsFilterSummary.textContent = `${filteredAdminJobs.length} offre${filteredAdminJobs.length > 1 ? "s" : ""} affichee${filteredAdminJobs.length > 1 ? "s" : ""} sur ${moderationJobs.length}. ${reviewJobs.length} a moderer, ${expiredJobs.length} expiree${expiredJobs.length > 1 ? "s" : ""}, ${inconsistentJobs.length} avec dates incoherentes.`;
  }

  if (adminJobsList) {
    adminJobsList.innerHTML = filteredAdminJobs.length
      ? filteredAdminJobs
          .slice(0, 24)
          .map(
            (job) => `
              <article class="job-card" data-job-id="${escapeHtml(job.id)}">
                <p class="eyebrow">${escapeHtml(job.category || "A classer")}</p>
                <h3>${escapeHtml(job.title)}</h3>
                <p class="muted">${escapeHtml(job.company || job.sourceName || "")} - ${escapeHtml(job.city || "Burkina Faso")}</p>
                <div class="job-meta">
                  <span class="pill ${job.status === "needs_review" ? "warning" : ""}">${escapeHtml(job.status || "needs_review")}</span>
                  <span class="pill">${escapeHtml(job.sourceName || "Source")}</span>
                  ${isExpiredJob(job) ? `<span class="pill warning">Expiree</span>` : ""}
                  ${job.inconsistentDates ? `<span class="pill warning">Dates incoherentes</span>` : ""}
                  ${!job.closingDate ? `<span class="pill">Cloture absente</span>` : ""}
                </div>
                ${job.moderationNote ? `<p class="muted">${escapeHtml(job.moderationNote)}</p>` : ""}
                <div class="job-actions">
                  <a class="secondary-link" href="${escapeHtml(job.sourceUrl || "#")}" target="_blank" rel="noopener" data-track="admin_source_open" data-track-label="${escapeHtml(job.title)}">Verifier</a>
                  <button class="secondary-button moderation-button" type="button" data-job-id="${escapeHtml(job.id)}" data-status="validated">Valider</button>
                  <button class="secondary-button moderation-button" type="button" data-job-id="${escapeHtml(job.id)}" data-status="needs_review">Revoir</button>
                  <button class="secondary-button moderation-button" type="button" data-job-id="${escapeHtml(job.id)}" data-status="rejected">Rejeter</button>
                </div>
                <details class="admin-edit">
                  <summary>Modifier l'offre</summary>
                  <form class="admin-edit-form" data-job-id="${escapeHtml(job.id)}">
                    <label>Titre<input name="title" value="${escapeHtml(job.title || "")}" required /></label>
                    <label>Entreprise<input name="company" value="${escapeHtml(job.company || "")}" /></label>
                    <label>Ville<input name="city" value="${escapeHtml(job.city || "")}" /></label>
                    <label>Categorie<input name="category" value="${escapeHtml(job.category || "")}" /></label>
                    <label>Type<input name="type" value="${escapeHtml(job.type || "")}" /></label>
                    <label>Ouverture<input name="openingDate" type="date" value="${escapeHtml(job.openingDate || "")}" /></label>
                    <label>Cloture<input name="closingDate" type="date" value="${escapeHtml(job.closingDate || "")}" /></label>
                    <label>Source<input name="sourceName" value="${escapeHtml(job.sourceName || "")}" /></label>
                    <label>URL source<input name="sourceUrl" value="${escapeHtml(job.sourceUrl || "")}" /></label>
                    <label>Tags<input name="tags" value="${escapeHtml((job.tags || []).join(", "))}" /></label>
                    <button type="submit">Enregistrer</button>
                  </form>
                </details>
              </article>
            `
          )
          .join("")
      : `<p class="muted">Aucune offre ne correspond aux filtres de moderation.</p>`;
  }
}

function refreshPublicJobs() {
  jobs = mergePublicJobs(baseJobs.length ? baseJobs : jobs);
  jobSearchCache = buildJobSearchCache(jobs);
  hydrateSourceFilter();
  applyUrlSearchParams();
  renderPortalWidgets();
  renderStrategicSourceSections();
  renderJobs();
  renderAdmin();
}

function scheduleRenderJobs(immediate = false) {
  window.clearTimeout(jobsRenderTimer);
  const delay = immediate ? 0 : 90;
  jobsRenderTimer = window.setTimeout(() => {
    renderJobs();
  }, delay);
}

async function loadJobs() {
  if (!jobsList && !adminJobsList) return;
  try {
    const adminQuery = adminJobsList ? "?includeRejected=true&includeExpired=true&includeUndated=true" : "";
    const apiResponse = await fetch(`/api/jobs${adminQuery}`, adminJobsList ? { cache: "no-store" } : undefined);
    if (apiResponse.ok) {
      const payload = await apiResponse.json();
      baseJobs = payload.jobs?.length ? payload.jobs : fallbackJobs;
    } else {
      throw new Error("API jobs unavailable");
    }
  } catch {
    try {
      const response = await fetch("data/curated-jobs.json");
      if (!response.ok) throw new Error("Impossible de charger les offres");
      const loadedJobs = await response.json();
      baseJobs = loadedJobs.length ? loadedJobs : fallbackJobs;
    } catch (error) {
      baseJobs = fallbackJobs;
      if (resultsSummary) {
        resultsSummary.textContent =
          "Les offres locales sont affichees. Actualisez la page si la liste complete ne se charge pas.";
      }
    }
  }
  refreshPublicJobs();
}

async function loadSources() {
  if (!sourceGrid && !sourceMetrics && !strategicSourceSections) return;
  try {
    const response = await fetch("data/sources.json");
    if (!response.ok) throw new Error("Impossible de charger les sources");
    sources = await response.json();
  } catch {
    sources = [];
  }

  rebuildSourceIndex();
  if (sourceCount && sources.length) sourceCount.textContent = getVerifiedSourceCount(sources) || sources.length;
  renderSourceDirectory();
  refreshPublicJobs();
}

async function loadInternationalFeeds() {
  if (!strategicSourceSections) return;
  try {
    const response = await fetch("data/international-feeds.json");
    if (!response.ok) throw new Error("Impossible de charger les flux internationaux");
    internationalFeeds = await response.json();
  } catch {
    internationalFeeds = [];
  }

  refreshPublicJobs();
}

async function loadEmployerLogos() {
  if (!employerCarousel) return;
  try {
    const response = await fetch("data/employer-logos.json");
    if (!response.ok) throw new Error("Impossible de charger les logos");
    employerLogos = await response.json();
  } catch {
    employerLogos = [];
  }
  renderPortalWidgets();
}

if (quickSearch) {
  quickSearch.addEventListener("submit", (event) => {
    event.preventDefault();
    syncQuickCategoryFromType(typeFilter?.value || activeCategory || "");
    recordEvent("quick_search", {
      label: searchInput?.value || "recherche accueil",
      city: cityFilter?.value || "",
      category: activeCategory,
    });
    resetJobsPage();
    syncSearchUrl();
    renderJobs();
    document.querySelector("#offres")?.scrollIntoView({ behavior: "smooth" });
  });
}

document.addEventListener("click", (event) => {
  const button = event.target.closest("[data-search-query], [data-search-city], [data-search-type]");
  if (!button) return;

  const query = button.dataset.searchQuery || "";
  const city = button.dataset.searchCity || "";
  const type = button.dataset.searchType || "";

  if (searchInput) searchInput.value = query;
  if (cityFilter) {
    cityFilter.value =
      city && [...cityFilter.options].some((option) => option.value === city || option.textContent === city) ? city : "";
  }
  if (sourceFilter) sourceFilter.value = "";
  if (typeFilter) {
    typeFilter.value =
      type && [...typeFilter.options].some((option) => option.value === type || option.textContent === type) ? type : "";
  }
  setQuickCategory(type || "");

  recordEvent("search_chip_clicked", {
    label: query || type || city || "preset",
    city,
    type,
  });
  resetJobsPage();
  syncSearchUrl();
  renderJobs();
  document.querySelector("#offres")?.scrollIntoView({ behavior: "smooth" });
});

[searchInput, cityFilter, typeFilter, sourceFilter, sortFilter, savedOnlyFilter].forEach((control) => {
  control?.addEventListener("input", () => {
    resetJobsPage();
    scheduleRenderJobs();
  });
  control?.addEventListener("change", () => {
    recordEvent("job_filter_changed", {
      label: control.id || control.name || "filtre",
      value: control.type === "checkbox" ? String(control.checked) : control.value,
    });
    if (control === typeFilter) syncQuickCategoryFromType(control.value);
    resetJobsPage();
    syncSearchUrl();
    scheduleRenderJobs(true);
  });
});

filterButtons.forEach((button) => {
  button.addEventListener("click", () => {
    filterButtons.forEach((item) => item.classList.remove("active"));
    button.classList.add("active");
    activeCategory = button.dataset.category || "";
    if (typeFilter) typeFilter.value = activeCategory;
    recordEvent("category_filter_clicked", { label: activeCategory || "Toutes" });
    resetJobsPage();
    syncSearchUrl();
    scheduleRenderJobs(true);
  });
});

jobsPagination?.addEventListener("click", (event) => {
  const button = event.target.closest("button[data-page]");
  if (!button || button.disabled) return;

  currentJobsPage = Number(button.dataset.page) || 1;
  renderJobs();
  document.querySelector("#offres")?.scrollIntoView({ behavior: "smooth", block: "start" });
});

employmentExplorer?.addEventListener("click", (event) => {
  const button = event.target.closest("[data-employment-search]");
  if (!button) return;
  const type = button.dataset.employmentType || "keyword";
  if (type === "reset") {
    if (searchInput) searchInput.value = "";
    if (cityFilter) cityFilter.value = "";
    if (typeFilter) typeFilter.value = "";
    if (sourceFilter) sourceFilter.value = "";
    setQuickCategory("");
    resetJobsPage();
    syncSearchUrl();
    recordEvent("employment_explorer_reset", { label: "Tous les tags" });
    renderJobs();
    return;
  }
  applyExplorerSearch({ type, value: button.dataset.employmentSearch || "" });
});

jobsList?.addEventListener("click", (event) => {
  const button = event.target.closest("button[data-action]");
  const card = event.target.closest(".job-card");
  const id = button?.dataset.id || card?.dataset.jobId;
  if (!id) return;
  if (!button && event.target.closest("a, button, input, select, textarea")) return;

  if (button?.dataset.action === "save") {
    if (savedJobs.has(id)) savedJobs.delete(id);
    else savedJobs.add(id);
    recordEvent("job_saved", { label: id, saved: String(savedJobs.has(id)) });
  }

  activeJobId = id;
  recordEvent("job_selected", { label: id, source: jobs.find((job) => job.id === id)?.sourceName || "" });
  renderJobs();
  if (button?.dataset.action === "details" && window.matchMedia("(max-width: 900px)").matches) {
    jobDetail?.scrollIntoView({ behavior: "smooth", block: "start" });
  }
});

jobsList?.addEventListener("keydown", (event) => {
  if (!["Enter", " "].includes(event.key)) return;
  const card = event.target.closest(".job-card");
  if (!card || event.target.closest("a, button, input, select, textarea")) return;
  event.preventDefault();
  const id = card.dataset.jobId;
  if (!id) return;
  activeJobId = id;
  recordEvent("job_selected", { label: id, source: jobs.find((job) => job.id === id)?.sourceName || "", input: "keyboard" });
  renderJobs();
  if (window.matchMedia("(max-width: 900px)").matches) {
    jobDetail?.scrollIntoView({ behavior: "smooth", block: "start" });
  }
});

featuredJobsCarousel?.addEventListener("click", (event) => {
  const button = event.target.closest("button[data-action]");
  const card = event.target.closest(".job-card");
  const id = button?.dataset.id || card?.dataset.jobId;
  if (!id) return;
  if (!button && event.target.closest("a, button, input, select, textarea")) return;

  if (button?.dataset.action === "save") {
    if (savedJobs.has(id)) savedJobs.delete(id);
    else savedJobs.add(id);
    recordEvent("job_saved", { label: id, saved: String(savedJobs.has(id)), placement: "featured" });
  }

  activeJobId = id;
  recordEvent("job_selected", { label: id, placement: "featured" });
  renderJobs();
  document.querySelector("#offres")?.scrollIntoView({ behavior: "smooth", block: "start" });
});

document.addEventListener("click", (event) => {
  const button = event.target.closest("[data-portal-focus], [data-portal-query]");
  if (!button) return;
  applyPortalSearch({
    query: button.dataset.portalQuery || "",
    focus: button.dataset.portalFocus || "",
  });
});

function validateLead(kind, data) {
  const contact = data.phone || data.contact || data.email || "";
  if (kind === "alert" && !/(\+?\d[\d\s.-]{6,})/.test(contact)) {
    return "Ajoutez un numero WhatsApp valide.";
  }
  if (!Object.values(data).some((value) => String(value || "").trim())) {
    return "Veuillez remplir les informations demandees.";
  }
  return "";
}

function setFormState(form, message, text, state = "info") {
  if (!message) return;
  message.textContent = text;
  message.dataset.state = state;
  form.dataset.state = state;
}

function handleDemoForm(form, messageId, successText) {
  form.addEventListener("submit", async (event) => {
    event.preventDefault();
    const message = document.querySelector(messageId);
    const data = Object.fromEntries(new FormData(form).entries());
    const kind = form.dataset.leadType || "contact";
    const error = validateLead(kind, data);
    if (error) {
      setFormState(form, message, error, "error");
      return;
    }

    const submitButton = form.querySelector("button[type='submit']");
    submitButton?.setAttribute("disabled", "disabled");
    setFormState(form, message, "Envoi en cours...", "info");
    const lead = saveLead(kind, data);

    try {
      const serverId = await syncLeadToServer(lead);
      setFormState(form, message, serverId ? `${successText} Reference: ${serverId.slice(0, 8)}.` : successText, "success");
      form.reset();
    } catch {
      setFormState(form, message, successText, "success");
    } finally {
      submitButton?.removeAttribute("disabled");
    }
  });
}

if (alertForm) {
  handleDemoForm(
    alertForm,
    "#alertMessage",
    "Inscription enregistree. Vous serez contacte lorsque des opportunites correspondent a votre profil."
  );
}

document.addEventListener("submit", async (event) => {
  const form = event.target.closest(".search-alert-form");
  if (!form) return;
  event.preventDefault();

  const message = form.querySelector("[data-search-alert-message]");
  const submitButton = form.querySelector("button[type='submit']");
  const criteria = getSearchAlertCriteria(getFilteredJobs().length);
  const data = {
    ...Object.fromEntries(new FormData(form).entries()),
    name: "Alerte recherche Emplois Burkina",
    interest: criteria.type || criteria.query || "Toutes les offres",
    city: criteria.city || "Toutes les regions",
    searchQuery: criteria.query,
    source: criteria.source,
    sort: criteria.sort,
    matchedJobs: String(criteria.filteredCount),
    criteriaLabel: criteria.label,
  };
  const error = validateLead("alert", data);
  if (error) {
    setFormState(form, message, error, "error");
    return;
  }

  submitButton?.setAttribute("disabled", "disabled");
  setFormState(form, message, "Creation de l'alerte...", "info");
  const lead = saveLead("alert", data);
  try {
    const serverId = await syncLeadToServer(lead);
    setFormState(
      form,
      message,
      serverId ? `Alerte creee pour ${criteria.label}. Reference: ${serverId.slice(0, 8)}.` : `Alerte creee pour ${criteria.label}.`,
      "success",
    );
    form.reset();
  } catch {
    setFormState(form, message, `Alerte creee pour ${criteria.label}.`, "success");
  } finally {
    submitButton?.removeAttribute("disabled");
  }
});

if (publishForm) {
  handleDemoForm(
    publishForm,
    "#publishMessage",
    "Demande recue. L'equipe Emplois Burkina vous recontactera avec les prochaines etapes."
  );
}

if (sponsorForm) {
  handleDemoForm(
    sponsorForm,
    "#sponsorMessage",
    "Demande recue. L'equipe Emplois Burkina vous proposera le format le plus adapte."
  );
}

if (contactForm) {
  handleDemoForm(contactForm, "#contactMessage", "Message recu. L'equipe Emplois Burkina vous repondra des que possible.");
}

document.addEventListener("click", (event) => {
  const tracked = event.target.closest("[data-track], a[href^='http']");
  if (!tracked) return;
  recordEvent(tracked.dataset.track || "outbound_click", {
    label: tracked.dataset.trackLabel || tracked.textContent.trim(),
    href: tracked.href || "",
  });
});

menuButton?.addEventListener("click", () => {
  const isOpen = menuButton.getAttribute("aria-expanded") === "true";
  menuButton.setAttribute("aria-expanded", String(!isOpen));
  mainNav?.classList.toggle("open", !isOpen);
});

mainNav?.addEventListener("click", (event) => {
  if (!event.target.closest("a")) return;
  menuButton?.setAttribute("aria-expanded", "false");
  mainNav.classList.remove("open");
});

document.addEventListener("click", (event) => {
  const next = event.target.closest("[data-carousel-next]");
  const prev = event.target.closest("[data-carousel-prev]");
  const targetId = next?.dataset.carouselNext || prev?.dataset.carouselPrev;
  if (!targetId) return;

  const carousel = document.querySelector(`#${CSS.escape(targetId)}`);
  if (!carousel) return;
  const direction = next ? 1 : -1;
  carousel.classList.add("is-user-scrolling");
  carousel.scrollBy({ left: direction * Math.max(280, carousel.clientWidth * 0.82), behavior: "smooth" });
  window.setTimeout(() => carousel.classList.remove("is-user-scrolling"), 1400);
});

exportLeadsButton?.addEventListener("click", exportLeadsCsv);

clearDemoDataButton?.addEventListener("click", () => {
  localStorage.removeItem(LEADS_KEY);
  localStorage.removeItem(EVENTS_KEY);
  renderAdmin();
});

document.querySelector("#saveAdminTokenButton")?.addEventListener("click", () => {
  const input = document.querySelector("#adminTokenInput");
  localStorage.setItem("emplois-burkina.adminToken", input?.value || "");
  loadServerAdminData();
});

document.querySelector("#loadServerAdminButton")?.addEventListener("click", loadServerAdminData);

document.querySelector("#runAutomationButton")?.addEventListener("click", async () => {
  try {
    const response = await fetch("/api/admin/automation", {
      method: "POST",
      headers: {
        Authorization: `Bearer ${adminToken()}`,
      },
    });
    if (!response.ok) throw new Error("Automation refused");
    alert("Automation lancee cote serveur.");
    await loadAutomationStatus();
  } catch {
    alert("Impossible de lancer l'automation. Verifie le token admin et le serveur dynamique.");
  }
});

async function runAdminPost(path, body = {}) {
  const response = await fetch(path, {
    method: "POST",
    headers: {
      Authorization: `Bearer ${adminToken()}`,
      "Content-Type": "application/json",
    },
    body: JSON.stringify(body),
  });
  const result = await response.json();
  if (!response.ok) throw new Error(result.error || "Action refusee.");
  return result;
}

document.querySelector("#syncDbButton")?.addEventListener("click", async () => {
  try {
    const result = await runAdminPost("/api/admin/db/sync");
    alert(`DB locale synchronisee : ${result.jobs} offres, ${result.sources} sources.`);
    await loadAutomationStatus();
  } catch (error) {
    alert(error.message || "Impossible de synchroniser la DB locale.");
  }
});

document.querySelector("#syncSqliteButton")?.addEventListener("click", async () => {
  try {
    const button = document.querySelector("#syncSqliteButton");
    button?.setAttribute("disabled", "disabled");
    const result = await runAdminPost("/api/admin/db/sqlite/sync");
    const sizeKb = Math.round((result.sqlite?.bytes || 0) / 1024);
    alert(`SQLite synchronisee : ${sizeKb} KB.`);
    await loadAutomationStatus();
  } catch (error) {
    alert(error.message || "Impossible de synchroniser SQLite.");
  } finally {
    document.querySelector("#syncSqliteButton")?.removeAttribute("disabled");
  }
});

document.querySelector("#generateVisibilityButton")?.addEventListener("click", async () => {
  try {
    const button = document.querySelector("#generateVisibilityButton");
    button?.setAttribute("disabled", "disabled");
    const result = await runAdminPost("/api/admin/growth/visibility");
    alert(result.output || "Moteur de visibilite regenere.");
    await loadVisibilityEngine();
  } catch (error) {
    alert(error.message || "Impossible de regenerer la visibilite.");
  } finally {
    document.querySelector("#generateVisibilityButton")?.removeAttribute("disabled");
  }
});

document.addEventListener("click", async (event) => {
  const button = event.target.closest(".date-override-button");
  if (!button) return;

  const closingDate = prompt("Date de cloture confirmee (YYYY-MM-DD)");
  if (!closingDate) return;
  if (!/^\d{4}-\d{2}-\d{2}$/.test(closingDate.trim())) {
    alert("Format attendu : YYYY-MM-DD");
    return;
  }

  try {
    button.disabled = true;
    button.textContent = "Mise a jour...";
    const result = await runAdminPost("/api/admin/jobs/date-override", {
      jobId: button.dataset.jobId,
      closingDate: closingDate.trim(),
      note: "Correction admin depuis la file dates",
    });
    alert(`Date enregistree. Restant a verifier : ${result.remainingReview}`);
    await loadJobs();
    await loadAutomationStatus();
  } catch (error) {
    alert(error.message || "Impossible d'enregistrer la date.");
  } finally {
    button.disabled = false;
    button.textContent = "Corriger";
  }
});

document.addEventListener("click", async (event) => {
  const button = event.target.closest(".moderation-button");
  if (!button) return;

  const status = button.dataset.status || "";
  const note =
    status === "rejected"
      ? prompt("Note de rejet ou raison interne", "Source a verifier ou offre non publiable") || ""
      : "";

  try {
    button.disabled = true;
    button.textContent = "Enregistrement...";
    await runAdminPost("/api/admin/jobs/moderation", {
      jobId: button.dataset.jobId,
      status,
      note,
    });
    await loadJobs();
    await loadAutomationStatus();
  } catch (error) {
    alert(error.message || "Impossible d'enregistrer la moderation.");
  } finally {
    button.disabled = false;
    button.textContent = status === "validated" ? "Valider" : status === "rejected" ? "Rejeter" : "Revoir";
  }
});

document.addEventListener("submit", async (event) => {
  const form = event.target.closest(".admin-edit-form");
  if (!form) return;
  event.preventDefault();

  const submitButton = form.querySelector("button[type='submit']");
  const data = Object.fromEntries(new FormData(form).entries());
  data.jobId = form.dataset.jobId || "";

  try {
    submitButton?.setAttribute("disabled", "disabled");
    if (submitButton) submitButton.textContent = "Sauvegarde...";
    await runAdminPost("/api/admin/jobs/edit", data);
    await loadJobs();
    await loadAutomationStatus();
  } catch (error) {
    alert(error.message || "Impossible d'enregistrer l'offre.");
  } finally {
    submitButton?.removeAttribute("disabled");
    if (submitButton) submitButton.textContent = "Enregistrer";
  }
});

document.querySelector("#generateSocialQueueButton")?.addEventListener("click", async () => {
  try {
    setFormState(document.body, socialAdminMessage, "Preparation des posts...", "info");
    const result = await runAdminPost("/api/admin/social/queue");
    setFormState(document.body, socialAdminMessage, result.output || "File preparee.", "success");
    await loadSocialQueue();
  } catch (error) {
    setFormState(document.body, socialAdminMessage, error.message, "error");
  }
});

document.querySelector("#dryRunSocialButton")?.addEventListener("click", async () => {
  try {
    setFormState(document.body, socialAdminMessage, "Test de publication...", "info");
    const result = await runAdminPost("/api/admin/social/publish", { live: false });
    setFormState(document.body, socialAdminMessage, result.output || "Dry-run termine.", "success");
    await loadSocialQueue();
  } catch (error) {
    setFormState(document.body, socialAdminMessage, error.message, "error");
  }
});

document.querySelector("#publishSocialButton")?.addEventListener("click", async () => {
  try {
    setFormState(document.body, socialAdminMessage, "Publication en cours...", "info");
    const result = await runAdminPost("/api/admin/social/publish", { live: true });
    setFormState(document.body, socialAdminMessage, result.output || "Publication terminee.", "success");
    await loadSocialQueue();
  } catch (error) {
    setFormState(document.body, socialAdminMessage, error.message, "error");
  }
});

[adminJobSearchInput, adminJobStatusFilter, adminJobSourceFilter, adminJobDateFilter].forEach((control) => {
  control?.addEventListener("input", renderAdmin);
  control?.addEventListener("change", renderAdmin);
});

loadJobs();
loadEmployerLogos();
loadSources();
loadInternationalFeeds();
initNetworkStatus();
registerServiceWorker();
initVisualEnhancements();
setInterval(updateCountdowns, 1000);
if (leadTable || eventCount || adminSummary) {
  loadServerAdminData();
}
