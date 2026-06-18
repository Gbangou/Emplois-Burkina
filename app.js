import {
  INTERNATIONAL_ELIGIBILITY_BLOCKERS,
  INTERNATIONAL_TECH_EXCLUSION_PATTERNS,
  INTERNATIONAL_TECH_PATTERNS,
  INTERNATIONAL_TECH_TITLE_PATTERNS,
  SEARCH_EQUIVALENTS,
  SOURCE_SPOTLIGHTS,
  SPECIAL_JOB_FILTER_LABEL,
  SPECIAL_JOB_FILTERS,
} from "./assets/js/app-config.js";
import {
  boundedDistance,
  daysUntil,
  displayDate,
  escapeHtml,
  formatCountdown,
  formatFcfa,
  formatJobDate,
  normalize,
  readStorageArray,
  slugify,
  tokenizeNormalized,
  writeStorageArray,
} from "./assets/js/app-utils.js";
import { createSearchHelpers } from "./assets/js/search-helpers.js";
import { createFeedHelpers } from "./assets/js/feed-helpers.js";
import { createAdminHelpers } from "./assets/js/admin-helpers.js";
import { createSourceRenderers } from "./assets/js/source-renderers.js";
import { demoProfiles, fallbackJobs } from "./assets/js/demo-data.js";

let jobs = [];
let baseJobs = [];
let sources = [];
let employerLogos = [];
let internationalFeeds = [];
let internationalBenchmarks = null;
let sourceIndex = new Map();
let jobSearchCache = new Map();
let activeCategory = "";
let activeJobId = "";
let currentJobsPage = 1;
let wordCloudAnimationFrame = 0;
let jobsRenderTimer = 0;
let savedJobs = new Set(JSON.parse(localStorage.getItem("jobfaso.savedJobs") || "[]"));
const institutionFeedControllers = new WeakMap();
const WHATSAPP_NUMBER = "";
const LEADS_KEY = "jobfaso.leads";
const EVENTS_KEY = "jobfaso.events";
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
const analyticsSummary = document.querySelector("#analyticsSummary");
const analyticsTable = document.querySelector("#analyticsTable");
const visibilitySummary = document.querySelector("#visibilitySummary");
const visibilityTable = document.querySelector("#visibilityTable");
const offerQualitySummary = document.querySelector("#offerQualitySummary");
const offerQualityIssues = document.querySelector("#offerQualityIssues");
const offerQualityTable = document.querySelector("#offerQualityTable");
const employerCarousel = document.querySelector("#employerCarousel");
const featuredJobsCarousel = document.querySelector("#featuredJobsCarousel");
const profileCarousel = document.querySelector("#profileCarousel");
const categoryStats = document.querySelector("#categoryStats");
const regionStats = document.querySelector("#regionStats");
const heroJobCount = document.querySelector("#heroJobCount");
const heroTrustedCount = document.querySelector("#heroTrustedCount");
const benchmarkMetrics = document.querySelector("#benchmarkMetrics");
const prioritySourceList = document.querySelector("#prioritySourceList");
const benchmarkCategoryGrid = document.querySelector("#benchmarkCategoryGrid");
const benchmarkJourneyStrip = document.querySelector("#benchmarkJourneyStrip");
const adminJobSearchInput = document.querySelector("#adminJobSearchInput");
const adminJobStatusFilter = document.querySelector("#adminJobStatusFilter");
const adminJobSourceFilter = document.querySelector("#adminJobSourceFilter");
const adminJobDateFilter = document.querySelector("#adminJobDateFilter");
const adminJobsFilterSummary = document.querySelector("#adminJobsFilterSummary");

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

const {
  collectPublicSpotlightJobs,
  collectSpotlightAggregateJobs,
  countFeedJobsWithDates,
  getFeedMonitoringState,
  getFeedPortalState,
  getInternationalFeed,
  getRenderableFeedJobs,
  getSpotlightFeedJobs,
  isFreshSpotlightJob,
  isInternationalTechJob,
  isLikelyInternationallyEligible,
  isVisibleFeedJob,
  matchesSpotlightFeedJob,
  mergePublicJobs,
  sortFeedJobs,
  sortSourcesForSpotlight,
} = createFeedHelpers({
  getSources: () => sources,
  getSourceIndex: () => sourceIndex,
  getSourceRecord,
  getPublicJobs: () => jobs,
  getInternationalFeeds: () => internationalFeeds,
  sourceHasSegment,
  normalize,
  daysUntil,
  formatJobDate,
  internationalTechPatterns: INTERNATIONAL_TECH_PATTERNS,
  internationalEligibilityBlockers: INTERNATIONAL_ELIGIBILITY_BLOCKERS,
  internationalTechTitlePatterns: INTERNATIONAL_TECH_TITLE_PATTERNS,
  internationalTechExclusionPatterns: INTERNATIONAL_TECH_EXCLUSION_PATTERNS,
});

const {
  buildJobSearchCache,
  getJobSearchScore,
  getJobSearchableText,
  matchesSpecialJobFilter,
  matchesSpotlightJob,
} = createSearchHelpers({
  searchEquivalents: SEARCH_EQUIVALENTS,
  specialJobFilters: SPECIAL_JOB_FILTERS,
  getJobSearchCache: () => jobSearchCache,
  getSourceRecord,
  getSourceSegments,
  normalize,
  tokenizeNormalized,
  boundedDistance,
});

const {
  exportLeadsCsv,
  handleDemoForm,
  renderAdmin,
  setFormState,
} = createAdminHelpers({
  adminJobSourceFilter,
  adminJobSearchInput,
  adminJobStatusFilter,
  adminJobDateFilter,
  leadCount,
  eventCount,
  adminSummary,
  leadTable,
  adminJobsFilterSummary,
  adminJobsList,
  readStorageArray,
  leadsKey: LEADS_KEY,
  eventsKey: EVENTS_KEY,
  getJobs: () => jobs,
  normalize,
  getJobSearchScore,
  isExpiredJob,
  escapeHtml,
  displayDate,
  formatFcfa,
  saveLead,
  syncLeadToServer,
});

const {
  renderSourceDirectory,
  renderStrategicSourceSections,
  sourceReferenceDescriptor,
} = createSourceRenderers({
  getSources: () => sources,
  getInternationalFeeds: () => internationalFeeds,
  sourceGrid,
  sourceMetrics,
  strategicSourceSections,
  sourceSpotlights: SOURCE_SPOTLIGHTS,
  sortSourcesByPriority,
  sortSourcesForSpotlight,
  getFeedMonitoringState,
  getRenderableFeedJobs,
  getFeedPortalState,
  getSpotlightFeedJobs,
  collectSpotlightAggregateJobs,
  getInternationalFeed,
  sortFeedJobs,
  getVerifiedSourceCount,
  sourceHasSegment,
  normalize,
  escapeHtml,
  formatJobDate,
  initVisualEnhancements,
});

function sortSourcesByPriority(list = []) {
  return list
    .slice()
    .sort((a, b) => a.priority - b.priority || a.name.localeCompare(b.name, "fr"));
}

function getVerifiedSourceCount(list = sources) {
  return list.filter((source) => ["official_link", "review_required"].includes(source?.collection)).length;
}

function getJobSourceDescriptor(job) {
  return sourceReferenceDescriptor(getSourceRecord(job.sourceName));
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

function isExpiredJob(job) {
  if (job?.expired) return true;
  const days = daysUntil(job?.closingDate);
  return typeof days === "number" && days < 0;
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

function displayJobLocation(job = {}) {
  const city = String(job.city || "").trim();
  if (!city || /courant|mois|date|email|http|www|login|connexion|recherche/i.test(city) || city.length > 56) {
    return "Burkina Faso";
  }
  if (/\b(RDC|Mali|Niger|Senegal|Tchad|Benin|Cameroun|Rwanda|Ethiopie|Mauritanie|Liban|Afghanistan|Ghana)\b/i.test(city)) {
    return `International - ${city}`;
  }
  return city;
}

function jobVerificationState(job = {}) {
  if (job.status === "validated" && job.closingDateConfirmed) {
    return {
      label: "Verifiee",
      tone: "verified",
      helper: "Offre et date confirmees par la moderation JobFaso.",
    };
  }
  if (job.closingDateConfirmed || job.closingDate) {
    return {
      label: "Source suivie",
      tone: "review",
      helper: "Date extraite de la source. Relisez l'annonce officielle avant de postuler.",
    };
  }
  return {
    label: "A verifier",
    tone: "warning",
    helper: "Date limite absente ou non confirmee. Ouvrez la source officielle.",
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

function getJobPagePath(job) {
  return `pages/jobs/${slugify(job.title)}-${String(job.id).slice(0, 8)}.html`;
}

function updateSavedStorage() {
  localStorage.setItem("jobfaso.savedJobs", JSON.stringify([...savedJobs]));
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

function applyUrlSearchParams() {
  const params = new URLSearchParams(window.location.search);
  const query = params.get("q") || params.get("search") || "";
  const category = params.get("category") || "";
  const city = params.get("city") || "";
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
  renderJobs();
  document.querySelector("#offres")?.scrollIntoView({ behavior: "smooth", block: "start" });
}

function applyPortalSearch({ query = "", focus = "", category = "", type = "" }) {
  if (searchInput) searchInput.value = query;

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
  renderJobs();
  document.querySelector("#offres")?.scrollIntoView({ behavior: "smooth", block: "start" });
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

function getBenchmarkAccentClass(value = "") {
  return `benchmark-accent-${normalize(value || "blue") || "blue"}`;
}

function renderInternationalBenchmarks() {
  if (!benchmarkMetrics && !prioritySourceList && !benchmarkCategoryGrid && !benchmarkJourneyStrip) return;
  const benchmark = internationalBenchmarks || {};
  const metrics = benchmark.metrics || {};
  const categories = Array.isArray(benchmark.categories) ? benchmark.categories : [];
  const prioritySources = Array.isArray(benchmark.prioritySources) ? benchmark.prioritySources : [];
  const journeys = Array.isArray(benchmark.journeys) ? benchmark.journeys : [];

  if (benchmarkMetrics) {
    const items = [
      [metrics.sites || 0, "plateformes benchmarkees"],
      [metrics.prioritySources || 0, "sources prioritaires"],
      [metrics.trackedByJobFaso || 0, "deja reliees a JobFaso"],
      [metrics.profileFits || 0, "profils SI/cyber couverts"],
    ];
    benchmarkMetrics.innerHTML = items
      .map(
        ([value, label]) => `
          <article>
            <strong>${escapeHtml(value)}</strong>
            <span>${escapeHtml(label)}</span>
          </article>
        `
      )
      .join("");
  }

  if (prioritySourceList) {
    prioritySourceList.innerHTML = prioritySources.length
      ? prioritySources
          .slice(0, 10)
          .map(
            (source) => `
              <a href="${escapeHtml(source.url)}" target="_blank" rel="noopener" class="priority-source-card">
                <span>${escapeHtml(String(source.rank).padStart(2, "0"))}</span>
                <strong>${escapeHtml(source.name)}</strong>
                <small>${escapeHtml(source.reason)}</small>
              </a>
            `
          )
          .join("")
      : `<p class="muted">Les sources prioritaires seront disponibles apres synchronisation.</p>`;
  }

  if (benchmarkCategoryGrid) {
    benchmarkCategoryGrid.innerHTML = categories.length
      ? categories
          .map(
            (category) => `
              <article class="benchmark-category-card ${getBenchmarkAccentClass(category.accent)}">
                <div>
                  <p class="eyebrow">${escapeHtml(category.bestFor || "Benchmark")}</p>
                  <h3>${escapeHtml(category.label)}</h3>
                </div>
                <div class="benchmark-site-list">
                  ${(category.sites || [])
                    .slice(0, 5)
                    .map(
                      (site) => `
                        <a href="${escapeHtml(site.url)}" target="_blank" rel="noopener">
                          <span>${escapeHtml(site.name)}</span>
                          <small>${escapeHtml(site.trackedByJobFaso ? "Suivi par JobFaso" : site.bestFor || "Source externe")}</small>
                        </a>
                      `
                    )
                    .join("")}
                </div>
              </article>
            `
          )
          .join("")
      : `<p class="muted">Aucun benchmark international charge.</p>`;
  }

  if (benchmarkJourneyStrip) {
    benchmarkJourneyStrip.innerHTML = journeys.length
      ? journeys
          .map(
            (journey) => `
              <article>
                <span>${escapeHtml(journey.label)}</span>
                <strong>${escapeHtml(journey.query)}</strong>
                <p>${escapeHtml((journey.steps || []).join(" - "))}</p>
                <button type="button" data-portal-query="${escapeHtml(journey.query)}" data-portal-focus="${escapeHtml(journey.focus || "onu-consultance")}">
                  Lancer ce parcours
                </button>
              </article>
            `
          )
          .join("")
      : "";
  }
}

function initScrollStoryMotion() {
  if (window.matchMedia("(prefers-reduced-motion: reduce)").matches) return;
  const stories = [...document.querySelectorAll(".scroll-story")];
  if (!stories.length) return;

  const updateStoryMotion = () => {
    window.jobFasoStoryMotionFrame = 0;
    const viewportHeight = window.innerHeight || 1;
    stories.forEach((story) => {
      const rect = story.getBoundingClientRect();
      const progress = Math.min(1, Math.max(0, (viewportHeight - rect.top) / (viewportHeight + rect.height)));
      const centered = progress - 0.5;
      story.style.setProperty("--story-copy-shift", `${Math.round(centered * -42)}px`);
      story.style.setProperty("--story-photo-shift", `${Math.round(centered * 58)}px`);
    });
  };

  const requestStoryMotion = () => {
    if (window.jobFasoStoryMotionFrame) return;
    window.jobFasoStoryMotionFrame = window.requestAnimationFrame(updateStoryMotion);
  };

  if (!window.jobFasoStoryMotionBound) {
    window.addEventListener("scroll", requestStoryMotion, { passive: true });
    window.addEventListener("resize", requestStoryMotion);
    window.jobFasoStoryMotionBound = true;
  }

  requestStoryMotion();
}

function initVisualEnhancements() {
  if (typeof window === "undefined") return;
  initInstitutionFeedControls();
  initScrollStoryMotion();
  if (!("IntersectionObserver" in window)) return;
  const selectors = [
    ".hero-surface",
    ".hero-flow-image",
    ".hero-photo-badge",
    ".hero-floating-card",
    ".finder-audience-grid article",
    ".finder-process-lead",
    ".process-photo",
    ".finder-process-grid article",
    ".benchmark-metrics article",
    ".priority-source-card",
    ".benchmark-category-card",
    ".benchmark-journey-strip article",
    ".scroll-story",
    ".scroll-story-card",
    ".story-photo",
    ".portal-heading",
    ".portal-stats article",
    ".trust-strip article",
    ".job-card",
    ".source-card",
    ".profile-card",
    ".logo-card",
  ];
  const elements = document.querySelectorAll(selectors.join(", "));
  if (!elements.length) return;

  if (!window.jobFasoRevealObserver) {
    window.jobFasoRevealObserver = new IntersectionObserver(
      (entries) => {
        for (const entry of entries) {
          if (!entry.isIntersecting) continue;
          entry.target.classList.add("is-visible");
          window.jobFasoRevealObserver.unobserve(entry.target);
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
    window.jobFasoRevealObserver.observe(element);
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

function hydrateSourceFilter() {
  if (!sourceFilter) return;
  const current = sourceFilter.value;
  sourceFilter.innerHTML = `<option value="">Toutes les sources</option>${getSources()
    .map((source) => `<option value="${escapeHtml(source)}">${escapeHtml(source)}</option>`)
    .join("")}`;
  sourceFilter.value = current;
}

function updateFilterCounts() {
  if (!filterButtons.length) return;
  filterButtons.forEach((button) => {
    const category = button.dataset.category || "";
    const count = category
      ? jobs.filter((job) => matchesSpecialJobFilter(job, category) || job.category === category).length
      : jobs.length;
    button.dataset.count = String(count);
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
      if (normalizedQuery && a.searchScore !== b.searchScore) return b.searchScore - a.searchScore;
      if (sortMode === "title") return a.job.title.localeCompare(b.job.title, "fr");
      if (sortMode === "source") return (a.job.sourceName || "").localeCompare(b.job.sourceName || "", "fr");
      return new Date(b.job.collectedAt || 0) - new Date(a.job.collectedAt || 0);
    })
    .map(({ job }) => job);
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
  const verification = jobVerificationState(job);
  const location = displayJobLocation(job);
  const metaPills = [
    displayType ? `<span class="pill">${escapeHtml(displayType)}</span>` : "",
    job.closingDate ? `<span class="pill deadline-pill">Cloture : ${escapeHtml(formatJobDate(job.closingDate))}</span>` : "",
    job.openingDateConfirmed
      ? `<span class="pill">Ouverture verifiee</span>`
      : `<span class="pill">Ouverture a confirmer</span>`,
    hasApplyUrl ? `<span class="pill source-pill">${escapeHtml(sourceDescriptor.badge)}</span>` : "",
    `<span class="pill verification-pill ${verification.tone}">${escapeHtml(verification.label)}</span>`,
  ].join("");

  return `
    <article class="job-card ${isActive ? "active" : ""}" data-job-id="${escapeHtml(job.id)}" tabindex="${options.duplicate ? "-1" : "0"}" role="button" aria-label="Voir les details de ${escapeHtml(job.title)}"${duplicateAttrs}>
      <div class="job-card-heading">
        ${renderEntityLogo(job.company || job.sourceName, logoUrl)}
        <div>
          <p class="eyebrow">${escapeHtml(job.category || "Autre")}</p>
          <h3>${escapeHtml(job.title)}</h3>
          <p class="muted">${escapeHtml(job.company || "Organisation non precisee")} - ${escapeHtml(location)}</p>
        </div>
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
        <a class="secondary-link" href="${escapeHtml(getJobPagePath(job))}"${duplicateInteractiveAttrs}>Fiche JobFaso</a>
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
    `Bonjour JobFaso, je veux recevoir les alertes pour: ${job.title} (${job.sourceName || "source"})`
  );
  const sourceDescriptor = getJobSourceDescriptor(job);
  const openingDateDetail = formatJobDate(job.openingDate, "Non communiquee par la source");
  const sourceLink =
    job.sourceUrl && job.sourceUrl !== "#"
      ? `<a class="nav-action inline-action" href="${escapeHtml(job.sourceUrl)}" target="_blank" rel="noopener" data-track="source_apply_click" data-track-label="${escapeHtml(job.title)}">${escapeHtml(sourceDescriptor.actionLabel)}</a>`
      : "";
  const logoUrl = job.companyLogoUrl || job.sourceLogoUrl || "";
  const verification = jobVerificationState(job);
  const location = displayJobLocation(job);

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
        <div><dt>Localisation</dt><dd>${escapeHtml(location)}</dd></div>
        <div><dt>Date d'ouverture</dt><dd>${escapeHtml(openingDateDetail)}</dd></div>
        <div><dt>Date de cloture</dt><dd>${escapeHtml(formatJobDate(job.closingDate, "Consulter la source"))}</dd></div>
        <div><dt>Temps restant</dt><dd>${job.closingDate ? `<span data-countdown="${escapeHtml(job.closingDate)}">${escapeHtml(formatCountdown(job.closingDate))}</span>` : "Consulter la source"}</dd></div>
        <div><dt>Source</dt><dd>${escapeHtml(job.sourceName || "JobFaso")}</dd></div>
        <div><dt>Verification</dt><dd>${escapeHtml(sourceDescriptor.badge)}</dd></div>
        <div><dt>Controle JobFaso</dt><dd>${escapeHtml(verification.label)} - ${escapeHtml(verification.helper)}</dd></div>
        <div><dt>Statut date</dt><dd>${job.openingDateConfirmed ? "Date d'ouverture confirmee" : "Date d'ouverture non communiquee par la source"}</dd></div>
        <div><dt>Collecte</dt><dd>${escapeHtml(displayDate(job.collectedAt))}</dd></div>
      </dl>
      <div class="tag-row">
        ${(job.tags || []).map((tag) => `<span class="pill">${escapeHtml(tag)}</span>`).join("")}
      </div>
      <p class="moderation-note reference-note">Verifiez la source avant de postuler.</p>
      <div class="detail-actions">
        ${sourceLink}
        <a class="secondary-link" href="${escapeHtml(getJobPagePath(job))}">Fiche JobFaso</a>
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
    resultsSummary.textContent = `${filtered.length} ${label} sur ${jobs.length}.${pageLabel} ${openingConfirmedCount} avec date d'ouverture confirmee. ${datedCount} avec date de cloture confirmee. ${trustedCount} issues de liens officiels ou de sources suivies.`;
  }

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

function adminToken() {
  return localStorage.getItem("jobfaso.adminToken") || "";
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
    await loadAnalyticsSummary();
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

    if (analyticsSummary) {
      analyticsSummary.innerHTML = `
        <article><strong>${escapeHtml(events.last7Days || 0)}</strong><span>evenements 7 jours</span></article>
        <article><strong>${escapeHtml(events.sponsorSignals || 0)}</strong><span>signaux sponsor</span></article>
        <article><strong>${escapeHtml(leads.last7Days || 0)}</strong><span>leads 7 jours</span></article>
        <article><strong>${escapeHtml(formatFcfa(leads.pipelineValue || 0))}</strong><span>pipeline total</span></article>
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

function formatQualityIssue(issueId = "") {
  const labels = {
    expired: "Delai depasse",
    feed_expired: "Delai depasse",
    missing_closing_date: "Date absente",
    feed_missing_closing_date: "Date absente",
    inconsistent_dates: "Dates incoherentes",
    missing_source: "Source absente",
    not_validated: "Non validee",
    suspicious_city: "Ville douteuse",
    foreign_city_without_context: "International a confirmer",
    feed_source_error: "Source a relancer",
    feed_missing_source: "Source absente",
  };
  return labels[issueId] || issueId.replaceAll("_", " ");
}

function qualitySeverityClass(issues = []) {
  if (issues.some((issue) => issue.severity === "critical")) return "critical";
  if (issues.some((issue) => issue.severity === "high")) return "warning";
  return "review";
}

async function loadOfferQualityReport() {
  if (!offerQualitySummary && !offerQualityIssues && !offerQualityTable) return;

  try {
    const response = await fetch("/api/quality/offers");
    if (!response.ok) throw new Error("Offer quality report unavailable");
    const report = await response.json();
    const curated = report.curated || {};
    const feeds = report.internationalFeeds || {};
    const topIssues = [...(curated.topIssues || []), ...(feeds.topIssues || [])];
    const reviewItems = [
      ...(curated.reviewItems || []).map((item) => ({ ...item, scope: "Curated" })),
      ...(feeds.reviewItems || []).map((item) => ({ ...item, scope: "Flux international" })),
    ];

    if (offerQualitySummary) {
      offerQualitySummary.innerHTML = `
        <article><strong>${escapeHtml(curated.total ?? 0)}</strong><span>offres curees</span></article>
        <article><strong>${escapeHtml(curated.withIssues ?? 0)}</strong><span>a revoir</span></article>
        <article><strong>${escapeHtml(curated.critical ?? 0)}</strong><span>critiques</span></article>
        <article><strong>${escapeHtml(feeds.jobs ?? 0)}</strong><span>jobs internationaux</span></article>
        <article><strong>${escapeHtml(feeds.withIssues ?? 0)}</strong><span>flux a controler</span></article>
        <article><strong>${escapeHtml(displayDate(report.generatedAt))}</strong><span>rapport genere</span></article>
      `;
    }

    if (offerQualityIssues) {
      offerQualityIssues.innerHTML = topIssues.length
        ? topIssues
            .slice(0, 8)
            .map(
              ([issue, count]) =>
                `<span><strong>${escapeHtml(count)}</strong> ${escapeHtml(formatQualityIssue(issue))}</span>`,
            )
            .join("")
        : `<span>Aucune anomalie detectee.</span>`;
    }

    if (offerQualityTable) {
      offerQualityTable.innerHTML = reviewItems.length
        ? reviewItems
            .slice(0, 18)
            .map((item) => {
              const issues = Array.isArray(item.issues) ? item.issues : [];
              return `
                <tr>
                  <td>
                    <strong>${escapeHtml(item.title || "Offre sans titre")}</strong>
                    <br><span class="muted">${escapeHtml(item.scope)} - ${escapeHtml(item.city || "Localisation a confirmer")}</span>
                  </td>
                  <td>${escapeHtml(item.closingDate ? displayDate(item.closingDate) : "Date a confirmer")}</td>
                  <td>
                    <div class="quality-tags">
                      ${issues
                        .map(
                          (issue) =>
                            `<span class="quality-tag ${qualitySeverityClass([issue])}">${escapeHtml(formatQualityIssue(issue.id))}</span>`,
                        )
                        .join("")}
                    </div>
                  </td>
                  <td>
                    ${
                      item.sourceUrl
                        ? `<a class="secondary-link" href="${escapeHtml(item.sourceUrl)}" target="_blank" rel="noopener">${escapeHtml(item.sourceName || "Verifier")}</a>`
                        : escapeHtml(item.sourceName || "Source a confirmer")
                    }
                  </td>
                </tr>
              `;
            })
            .join("")
        : `<tr><td colspan="4">Aucune offre a revoir.</td></tr>`;
    }
  } catch {
    if (offerQualitySummary) {
      offerQualitySummary.innerHTML = `<article><strong>Audit</strong><span>rapport indisponible</span></article>`;
    }
    if (offerQualityIssues) offerQualityIssues.innerHTML = `<span>Impossible de lire le rapport qualite.</span>`;
    if (offerQualityTable) offerQualityTable.innerHTML = `<tr><td colspan="4">Rapport indisponible.</td></tr>`;
  }
}

async function loadAutomationStatus() {
  if (!automationStatus) return;

  try {
    const status = await fetchAdminJson("/api/admin/automation/status");
    const state = status.automationState || {};
    const report = status.automationReport || {};
    const quality = status.automationQuality || report.quality || {};
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

async function loadJobs(options = {}) {
  const { refresh = true } = options;
  if (!jobsList && !adminJobsList) return;
  try {
    const adminQuery = adminJobsList ? "?includeRejected=true&includeExpired=true" : "";
    const apiResponse = await fetch(`/api/jobs${adminQuery}`);
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
  if (refresh) refreshPublicJobs();
}

async function loadSources(options = {}) {
  const { refresh = true } = options;
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
  if (refresh) {
    renderSourceDirectory();
    refreshPublicJobs();
  }
}

async function loadInternationalFeeds(options = {}) {
  const { refresh = true } = options;
  if (!strategicSourceSections) return;
  try {
    const response = await fetch("data/international-feeds.json");
    if (!response.ok) throw new Error("Impossible de charger les flux internationaux");
    internationalFeeds = await response.json();
  } catch {
    internationalFeeds = [];
  }

  if (refresh) refreshPublicJobs();
}

async function loadInternationalBenchmarks(options = {}) {
  const { refresh = true } = options;
  if (!benchmarkMetrics && !prioritySourceList && !benchmarkCategoryGrid && !benchmarkJourneyStrip) return;
  try {
    const response = await fetch("/api/international-benchmarks");
    if (!response.ok) throw new Error("Impossible de charger les benchmarks internationaux");
    internationalBenchmarks = await response.json();
  } catch {
    try {
      const response = await fetch("data/international-benchmarks.json");
      if (!response.ok) throw new Error("Impossible de charger les benchmarks internationaux");
      internationalBenchmarks = await response.json();
    } catch {
      internationalBenchmarks = null;
    }
  }

  if (refresh) {
    renderInternationalBenchmarks();
    initVisualEnhancements();
  }
}

async function loadEmployerLogos(options = {}) {
  const { refresh = true } = options;
  if (!employerCarousel) return;
  try {
    const response = await fetch("data/employer-logos.json");
    if (!response.ok) throw new Error("Impossible de charger les logos");
    employerLogos = await response.json();
  } catch {
    employerLogos = [];
  }
  if (refresh) renderPortalWidgets();
}

async function bootstrapApp() {
  await Promise.all([
    loadJobs({ refresh: false }),
    loadEmployerLogos({ refresh: false }),
    loadSources({ refresh: false }),
    loadInternationalFeeds({ refresh: false }),
    loadInternationalBenchmarks({ refresh: false }),
  ]);

  if (sourceGrid || sourceMetrics || strategicSourceSections) {
    renderSourceDirectory();
  }

  refreshPublicJobs();
  renderInternationalBenchmarks();
  initVisualEnhancements();

  if (leadTable || eventCount || adminSummary) {
    loadServerAdminData();
  }

  if (offerQualitySummary || offerQualityIssues || offerQualityTable) {
    loadOfferQualityReport();
  }
}

if (quickSearch) {
  quickSearch.addEventListener("submit", (event) => {
    event.preventDefault();
    recordEvent("quick_search", {
      label: searchInput?.value || "recherche accueil",
      city: cityFilter?.value || "",
      category: activeCategory,
    });
    resetJobsPage();
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

  if (searchInput && query) searchInput.value = query;
  if (cityFilter && city && [...cityFilter.options].some((option) => option.value === city || option.textContent === city)) {
    cityFilter.value = city;
  }
  if (typeFilter && type && [...typeFilter.options].some((option) => option.value === type || option.textContent === type)) {
    typeFilter.value = type;
  }

  recordEvent("search_chip_clicked", {
    label: query || type || city || "preset",
    city,
    type,
  });
  resetJobsPage();
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
    resetJobsPage();
    scheduleRenderJobs(true);
  });
});

filterButtons.forEach((button) => {
  button.addEventListener("click", () => {
    filterButtons.forEach((item) => item.classList.remove("active"));
    button.classList.add("active");
    activeCategory = button.dataset.category || "";
    recordEvent("category_filter_clicked", { label: activeCategory || "Toutes" });
    resetJobsPage();
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

if (alertForm) {
  handleDemoForm(
    alertForm,
    "#alertMessage",
    "Inscription enregistree. Vous serez contacte lorsque des opportunites correspondent a votre profil."
  );
}

if (publishForm) {
  handleDemoForm(
    publishForm,
    "#publishMessage",
    "Demande recue. L'equipe JobFaso vous recontactera avec les prochaines etapes."
  );
}

if (sponsorForm) {
  handleDemoForm(
    sponsorForm,
    "#sponsorMessage",
    "Demande recue. L'equipe JobFaso vous proposera le format le plus adapte."
  );
}

if (contactForm) {
  handleDemoForm(contactForm, "#contactMessage", "Message recu. L'equipe JobFaso vous repondra des que possible.");
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
  localStorage.setItem("jobfaso.adminToken", input?.value || "");
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

bootstrapApp();
setInterval(updateCountdowns, 1000);
