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
    sourceName: "Demo JobFaso",
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
    sourceName: "Demo JobFaso",
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
    sourceName: "Demo JobFaso",
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
    sourceName: "Demo JobFaso",
    sourceUrl: "#",
    tags: ["Construction", "Experience", "Terrain"],
    status: "validated",
    collectedAt: "2026-06-09T11:20:01.631Z",
  },
];

let jobs = [];
let sources = [];
let activeCategory = "";
let activeJobId = "";
let currentJobsPage = 1;
let savedJobs = new Set(JSON.parse(localStorage.getItem("jobfaso.savedJobs") || "[]"));
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
const sourceMetrics = document.querySelector("#sourceMetrics");
const sourceGrid = document.querySelector("#sourceGrid");
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
const employerCarousel = document.querySelector("#employerCarousel");
const featuredJobsCarousel = document.querySelector("#featuredJobsCarousel");
const profileCarousel = document.querySelector("#profileCarousel");
const categoryStats = document.querySelector("#categoryStats");
const regionStats = document.querySelector("#regionStats");

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

function recordEvent(type, payload = {}) {
  const events = readStorageArray(EVENTS_KEY);
  events.unshift({
    id: `${Date.now()}-${Math.random().toString(16).slice(2)}`,
    type,
    payload,
    createdAt: new Date().toISOString(),
  });
  writeStorageArray(EVENTS_KEY, events.slice(0, 250));
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

function formatJobDate(value, fallback = "A verifier") {
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
      label: "Cloture a verifier",
      tone: "neutral",
      helper: "La date de cloture n'a pas encore ete extraite.",
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
      label: "Dernier jour",
      tone: "danger",
      helper: "La cloture est prevue aujourd'hui.",
    };
  }
  if (days <= 3) {
    return {
      label: `${days} jour${days > 1 ? "s" : ""} restant${days > 1 ? "s" : ""}`,
      tone: "warning",
      helper: "Deadline proche.",
    };
  }
  return {
    label: `${days} jours restants`,
    tone: "success",
    helper: "Candidature encore ouverte.",
  };
}

function renderTimeline(job, compact = false) {
  const state = deadlineState(job);
  return `
    <div class="job-timeline ${compact ? "compact" : ""}">
      <div>
        <span>Ouverture</span>
        <strong>${escapeHtml(formatJobDate(job.openingDate))}</strong>
      </div>
      <div>
        <span>Cloture</span>
        <strong>${escapeHtml(formatJobDate(job.closingDate))}</strong>
      </div>
      <div class="countdown ${state.tone}">
        <span>Countdown</span>
        <strong>${escapeHtml(state.label)}</strong>
      </div>
    </div>
  `;
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

function countBy(items, getter) {
  return items.reduce((acc, item) => {
    const key = getter(item) || "Autre";
    acc[key] = (acc[key] || 0) + 1;
    return acc;
  }, {});
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

function renderPortalWidgets() {
  if (employerCarousel) {
    const sourceCounts = Object.entries(countBy(jobs, (job) => job.sourceName))
      .sort((a, b) => b[1] - a[1] || a[0].localeCompare(b[0], "fr"))
      .slice(0, 16);
    employerCarousel.innerHTML = sourceCounts
      .map(
        ([source, count]) => `
          <article class="logo-card">
            <span>${escapeHtml(initials(source))}</span>
            <strong>${escapeHtml(source)}</strong>
            <small>${count} offre${count > 1 ? "s" : ""}</small>
          </article>
        `
      )
      .join("");
  }

  if (featuredJobsCarousel) {
    const featured = jobs
      .slice()
      .sort((a, b) => Number(Boolean(b.closingDate)) - Number(Boolean(a.closingDate)))
      .slice(0, 10);
    featuredJobsCarousel.innerHTML = featured.map(renderJobCard).join("");
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
}

function getSourceTypeLabel(type) {
  const labels = {
    aggregator: "Agregateur",
    classifieds: "Petites annonces",
    government: "Officiel",
    job_board: "Portail emploi",
    marketplace: "Marketplace",
    media: "Media",
    ngo: "ONG / ONU",
    organization: "Organisation",
    recruiter: "Cabinet RH",
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

function getFilteredJobs() {
  const query = normalize(searchInput?.value.trim());
  const city = cityFilter?.value || "";
  const type = typeFilter?.value || "";
  const source = sourceFilter?.value || "";
  const savedOnly = Boolean(savedOnlyFilter?.checked);
  const sortMode = sortFilter?.value || "recent";

  const filtered = jobs.filter((job) => {
    const haystack = normalize(
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
        ...(job.tags || []),
      ].join(" ")
    );
    const matchesQuery = !query || haystack.includes(query);
    const matchesCity = !city || job.city === city || job.city === "Tout le Burkina" || job.city === "Burkina Faso";
    const matchesType = !type || normalize(job.type).includes(normalize(type)) || normalize(job.category).includes(normalize(type));
    const matchesCategory = !activeCategory || job.category === activeCategory;
    const matchesSource = !source || job.sourceName === source;
    const matchesSaved = !savedOnly || savedJobs.has(job.id);

    return matchesQuery && matchesCity && matchesType && matchesCategory && matchesSource && matchesSaved;
  });

  return filtered.sort((a, b) => {
    if (sortMode === "title") return a.title.localeCompare(b.title, "fr");
    if (sortMode === "source") return (a.sourceName || "").localeCompare(b.sourceName || "", "fr");
    return new Date(b.collectedAt || 0) - new Date(a.collectedAt || 0);
  });
}

function renderJobCard(job) {
  const isActive = job.id === activeJobId;
  const isSaved = savedJobs.has(job.id);
  const reviewLabel = job.status === "needs_review" ? "Verification en cours" : "Source indiquee";

  return `
    <article class="job-card ${isActive ? "active" : ""}" data-job-id="${escapeHtml(job.id)}">
      <div>
        <p class="eyebrow">${escapeHtml(job.category || "Autre")}</p>
        <h3>${escapeHtml(job.title)}</h3>
        <p class="muted">${escapeHtml(job.company || "Organisation non precisee")} - ${escapeHtml(job.city || "Burkina Faso")}</p>
      </div>
      ${renderTimeline(job, true)}
      <div class="job-meta">
        <span class="pill">${escapeHtml(job.type || "Non precise")}</span>
        <span class="pill">${escapeHtml(formatJobDate(job.closingDate, job.deadline || "A verifier"))}</span>
        <span class="pill warning">${reviewLabel}</span>
      </div>
      <div class="tag-row">
        ${(job.tags || []).slice(0, 4).map((tag) => `<span class="pill">${escapeHtml(tag)}</span>`).join("")}
      </div>
      <div class="job-actions">
        <button type="button" data-action="details" data-id="${escapeHtml(job.id)}">Voir</button>
        <a class="secondary-link" href="${escapeHtml(getJobPagePath(job))}">Fiche</a>
        <button class="secondary-button" type="button" data-action="save" data-id="${escapeHtml(job.id)}">
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
  const sourceLink =
    job.sourceUrl && job.sourceUrl !== "#"
      ? `<a class="nav-action inline-action" href="${escapeHtml(job.sourceUrl)}" target="_blank" rel="noopener">Ouvrir la source</a>`
      : "";

  jobDetail.innerHTML = `
    <div class="detail-sticky">
      <p class="eyebrow">${escapeHtml(job.category || "Opportunite")}</p>
      <h3>${escapeHtml(job.title)}</h3>
      <p class="muted">${escapeHtml(job.company || "Organisation non precisee")}</p>
      ${renderTimeline(job)}
      <dl class="detail-list">
        <div><dt>Ville</dt><dd>${escapeHtml(job.city || "Burkina Faso")}</dd></div>
        <div><dt>Date d'ouverture</dt><dd>${escapeHtml(formatJobDate(job.openingDate))}</dd></div>
        <div><dt>Date de cloture</dt><dd>${escapeHtml(formatJobDate(job.closingDate, job.deadline || "Non communiquee"))}</dd></div>
        <div><dt>Etat</dt><dd>${escapeHtml(deadlineState(job).helper)}</dd></div>
        <div><dt>Source</dt><dd>${escapeHtml(job.sourceName || "JobFaso")}</dd></div>
        <div><dt>Collecte</dt><dd>${escapeHtml(displayDate(job.collectedAt))}</dd></div>
      </dl>
      <div class="tag-row">
        ${(job.tags || []).map((tag) => `<span class="pill">${escapeHtml(tag)}</span>`).join("")}
      </div>
      <p class="moderation-note">
        Ne payez jamais de frais suspects pour postuler. Verifiez toujours les consignes depuis la source officielle.
      </p>
      <div class="detail-actions">
        ${sourceLink}
        <a class="secondary-link" href="${escapeHtml(getJobPagePath(job))}">Fiche complete</a>
        <a class="secondary-link" href="${buildWhatsAppUrl(decodeURIComponent(whatsappText))}" target="_blank" rel="noopener" data-track="whatsapp_alert" data-track-label="${escapeHtml(job.title)}">Alerte WhatsApp</a>
        <a class="secondary-link" href="contact.html">Signaler</a>
      </div>
    </div>
  `;
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
  if (sourceCount) sourceCount.textContent = sources.length || getSources().length;
  updateSavedStorage();

  if (resultsSummary) {
    const label = filtered.length > 1 ? "opportunites trouvees" : "opportunite trouvee";
    const rangeStart = filtered.length ? pageStart + 1 : 0;
    const rangeEnd = Math.min(pageStart + visibleJobs.length, filtered.length);
    const pageLabel = filtered.length ? ` Affichage ${rangeStart}-${rangeEnd}.` : "";
    resultsSummary.textContent = `${filtered.length} ${label} sur ${jobs.length}.${pageLabel}`;
  }

  jobsList.innerHTML = visibleJobs.length
    ? visibleJobs.map(renderJobCard).join("")
    : `<p class="muted">Aucune opportunite ne correspond encore a cette recherche.</p>`;

  renderJobsPagination(totalPages);
  renderDetail(jobs.find((job) => job.id === activeJobId));
}

function renderSourceDirectory() {
  if (!sourceGrid || !sourceMetrics) return;

  const sourceTypes = sources.reduce((acc, source) => {
    acc[source.type] = (acc[source.type] || 0) + 1;
    return acc;
  }, {});
  const automaticCount = sources.filter((source) => source.collection !== "manual_only").length;
  const manualCount = sources.length - automaticCount;

  sourceMetrics.innerHTML = `
    <article><strong>${sources.length}</strong><span>sources surveillees</span></article>
    <article><strong>${automaticCount}</strong><span>suivi automatise possible</span></article>
    <article><strong>${manualCount}</strong><span>controle humain</span></article>
    <article><strong>${Object.keys(sourceTypes).length}</strong><span>types de sources</span></article>
  `;

  sourceGrid.innerHTML = sources
    .slice()
    .sort((a, b) => a.priority - b.priority || a.name.localeCompare(b.name, "fr"))
    .map(
      (source) => `
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
          <a class="secondary-link" href="${escapeHtml(source.url)}" target="_blank" rel="noopener">Ouvrir</a>
        </article>
      `
    )
    .join("");
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
  link.download = `jobfaso-leads-${new Date().toISOString().slice(0, 10)}.csv`;
  link.click();
  URL.revokeObjectURL(url);
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
    return true;
  } catch {
    return false;
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

function renderAdmin() {
  const leads = readStorageArray(LEADS_KEY);
  const events = readStorageArray(EVENTS_KEY);
  const pipelineValue = leads.reduce((sum, lead) => sum + (lead.valueFcfa || 0), 0);
  const reviewJobs = jobs.filter((job) => job.status === "needs_review");

  if (leadCount) leadCount.textContent = leads.length;
  if (eventCount) eventCount.textContent = events.length;

  if (adminSummary) {
    adminSummary.innerHTML = `
      <article><strong>${leads.length}</strong><span>leads captures</span></article>
      <article><strong>${formatFcfa(pipelineValue)}</strong><span>pipeline potentiel</span></article>
      <article><strong>${reviewJobs.length}</strong><span>offres a moderer</span></article>
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

  if (adminJobsList) {
    adminJobsList.innerHTML = reviewJobs.length
      ? reviewJobs
          .slice(0, 24)
          .map(
            (job) => `
              <article class="job-card">
                <p class="eyebrow">${escapeHtml(job.category || "A classer")}</p>
                <h3>${escapeHtml(job.title)}</h3>
                <p class="muted">${escapeHtml(job.company || job.sourceName || "")} - ${escapeHtml(job.city || "Burkina Faso")}</p>
                <div class="job-meta">
                  <span class="pill warning">A moderer</span>
                  <span class="pill">${escapeHtml(job.sourceName || "Source")}</span>
                </div>
                <a class="secondary-link" href="${escapeHtml(job.sourceUrl || "#")}" target="_blank" rel="noopener" data-track="admin_source_open" data-track-label="${escapeHtml(job.title)}">Verifier la source</a>
              </article>
            `
          )
          .join("")
      : `<p class="muted">Aucune offre a moderer chargee.</p>`;
  }
}

async function loadJobs() {
  if (!jobsList && !adminJobsList) return;
  try {
    const apiResponse = await fetch("/api/jobs", { cache: "no-store" });
    if (apiResponse.ok) {
      const payload = await apiResponse.json();
      jobs = payload.jobs?.length ? payload.jobs : fallbackJobs;
    } else {
      throw new Error("API jobs unavailable");
    }
  } catch {
    try {
      const response = await fetch("data/curated-jobs.json", { cache: "no-store" });
      if (!response.ok) throw new Error("Impossible de charger les offres");
      const loadedJobs = await response.json();
      jobs = loadedJobs.length ? loadedJobs : fallbackJobs;
    } catch (error) {
      jobs = fallbackJobs;
      if (resultsSummary) {
        resultsSummary.textContent =
          "Les offres locales sont affichees. Actualisez la page si la liste complete ne se charge pas.";
      }
    }
  }
  hydrateSourceFilter();
  renderPortalWidgets();
  renderJobs();
  renderAdmin();
}

async function loadSources() {
  if (!sourceGrid) return;
  try {
    const response = await fetch("data/sources.json", { cache: "no-store" });
    if (!response.ok) throw new Error("Impossible de charger les sources");
    sources = await response.json();
  } catch {
    sources = [];
  }

  if (sourceCount && sources.length) sourceCount.textContent = sources.length;
  renderSourceDirectory();
  renderAdmin();
}

if (quickSearch) {
  quickSearch.addEventListener("submit", (event) => {
    event.preventDefault();
    resetJobsPage();
    renderJobs();
    document.querySelector("#offres")?.scrollIntoView({ behavior: "smooth" });
  });
}

[searchInput, cityFilter, typeFilter, sourceFilter, sortFilter, savedOnlyFilter].forEach((control) => {
  control?.addEventListener("input", () => {
    resetJobsPage();
    renderJobs();
  });
  control?.addEventListener("change", () => {
    resetJobsPage();
    renderJobs();
  });
});

filterButtons.forEach((button) => {
  button.addEventListener("click", () => {
    filterButtons.forEach((item) => item.classList.remove("active"));
    button.classList.add("active");
    activeCategory = button.dataset.category || "";
    resetJobsPage();
    renderJobs();
  });
});

jobsPagination?.addEventListener("click", (event) => {
  const button = event.target.closest("button[data-page]");
  if (!button || button.disabled) return;

  currentJobsPage = Number(button.dataset.page) || 1;
  renderJobs();
  document.querySelector("#offres")?.scrollIntoView({ behavior: "smooth", block: "start" });
});

jobsList?.addEventListener("click", (event) => {
  const button = event.target.closest("button[data-action]");
  const card = event.target.closest(".job-card");
  const id = button?.dataset.id || card?.dataset.jobId;
  if (!id) return;

  if (button?.dataset.action === "save") {
    if (savedJobs.has(id)) savedJobs.delete(id);
    else savedJobs.add(id);
  }

  activeJobId = id;
  renderJobs();
  if (button?.dataset.action === "details" && window.matchMedia("(max-width: 900px)").matches) {
    jobDetail?.scrollIntoView({ behavior: "smooth", block: "start" });
  }
});

featuredJobsCarousel?.addEventListener("click", (event) => {
  const button = event.target.closest("button[data-action]");
  const card = event.target.closest(".job-card");
  const id = button?.dataset.id || card?.dataset.jobId;
  if (!id) return;

  if (button?.dataset.action === "save") {
    if (savedJobs.has(id)) savedJobs.delete(id);
    else savedJobs.add(id);
  }

  activeJobId = id;
  renderJobs();
  document.querySelector("#offres")?.scrollIntoView({ behavior: "smooth", block: "start" });
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
  carousel.scrollBy({ left: direction * Math.max(280, carousel.clientWidth * 0.82), behavior: "smooth" });
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

loadJobs();
loadSources();
if (leadTable || eventCount || adminSummary) {
  loadServerAdminData();
}
