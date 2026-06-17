import { mkdir, readFile, readdir, unlink, writeFile } from "node:fs/promises";

const ROOT = new URL("../", import.meta.url);
const JOBS_FILE = new URL("data/curated-jobs.json", ROOT);
const CONFIG_FILE = new URL("data/site-config.json", ROOT);
const PAGES_DIR = new URL("pages/", ROOT);
const JOBS_DIR = new URL("pages/jobs/", ROOT);
const CATEGORIES_DIR = new URL("pages/categories/", ROOT);
const CITIES_DIR = new URL("pages/villes/", ROOT);
const GUIDES_DIR = new URL("pages/guides/", ROOT);
const KEYWORDS_DIR = new URL("pages/recherche/", ROOT);
const SITEMAP_FILE = new URL("sitemap.xml", ROOT);
const ROBOTS_FILE = new URL("robots.txt", ROOT);
const LLM_FILE = new URL("llms.txt", ROOT);
const MANIFEST_FILE = new URL("site.webmanifest", ROOT);
const INDEXNOW_FILE = new URL("indexnow-urls.txt", ROOT);
const ADS_TXT_FILE = new URL("ads.txt", ROOT);
const FEED_XML_FILE = new URL("feed.xml", ROOT);
const FEED_JSON_FILE = new URL("feed.json", ROOT);
const WELL_KNOWN_DIR = new URL(".well-known/", ROOT);
const SECURITY_FILE = new URL(".well-known/security.txt", ROOT);

const stopWords = new Set([
  "avec",
  "dans",
  "pour",
  "vous",
  "nous",
  "leur",
  "etre",
  "emploi",
  "burkina",
  "faso",
  "poste",
  "offre",
  "offres",
  "jobs",
  "job",
  "des",
  "les",
  "une",
  "sur",
  "par",
  "aux",
  "ses",
  "the",
  "and",
  "from",
  "with",
  "dans",
  "tout",
  "tous",
  "plus",
  "h",
  "f",
]);

const keywordAliases = {
  assistant: ["assistante", "administration", "bureau"],
  chauffeur: ["conducteur", "transport", "livraison"],
  comptable: ["comptabilite", "finance", "gestion"],
  consultant: ["consultance", "expert", "mission"],
  concours: ["recrutement public", "fonction publique"],
  enqueteur: ["terrain", "collecte", "chercheur"],
  informel: ["terrain", "artisan", "journalier"],
  logistique: ["stock", "fleet", "approvisionnement"],
  ong: ["humanitaire", "projet", "developpement"],
  remote: ["teletravail", "distance", "home based"],
  sante: ["medical", "clinique", "paramedical"],
  secretaire: ["secretariat", "assistant", "administration"],
  stage: ["stagiaire", "internship", "debutant"],
  teletravail: ["remote", "distance", "home based"],
  vente: ["commercial", "vendeur", "commerce"],
};

const categoryGuides = {
  Bureau: {
    title: "Emplois bureau au Burkina Faso",
    intro:
      "Retrouvez les opportunites de bureau, administration, commerce, finance, IT et gestion au Burkina Faso.",
  },
  ONG: {
    title: "Emplois ONG et humanitaire au Burkina Faso",
    intro:
      "Suivez les postes ONG, ONU, projets de developpement et organisations internationales lies au Burkina Faso.",
  },
  Concours: {
    title: "Concours au Burkina Faso",
    intro:
      "Centralisez les concours, communiques, resultats et liens officiels pour candidater sans rater les deadlines.",
  },
  Stage: {
    title: "Stages au Burkina Faso",
    intro:
      "Decouvrez les stages pour jeunes diplomes, etudiants et profils en debut de carriere.",
  },
  "Metiers terrain et informels": {
    title: "Metiers terrain et emplois informels au Burkina Faso",
    intro:
      "Missions et profils terrain : plombiers, soudeurs, macons, chauffeurs, artisans, ouvriers et services locaux.",
  },
  "BTP et chantier": {
    title: "Emplois BTP et chantier au Burkina Faso",
    intro:
      "Suivez les opportunites chantier, construction, genie civil, climatisation, topographie et travaux terrain.",
  },
  "Technique et maintenance": {
    title: "Emplois technique et maintenance au Burkina Faso",
    intro:
      "Offres pour techniciens, maintenance, froid, electricite, informatique terrain et support operationnel.",
  },
  "Transport et logistique": {
    title: "Emplois transport et logistique au Burkina Faso",
    intro:
      "Chauffeurs, conducteurs, magasiniers, fleet, stock, approvisionnement et logistique projet.",
  },
  "Commerce et vente": {
    title: "Emplois commerce et vente au Burkina Faso",
    intro:
      "Postes commerciaux, caissiers, vendeurs, recouvrement, relation client et marketing terrain.",
  },
  "Finance et administration": {
    title: "Emplois finance et administration au Burkina Faso",
    intro:
      "Comptabilite, secretariat, finance, juridique, gestion, administration et support bureau.",
  },
  Sante: {
    title: "Emplois sante au Burkina Faso",
    intro:
      "Offres medicales, paramedicales, pharmacie, clinique, projets sante et missions de terrain.",
  },
};

const evergreenGuides = [
  {
    slug: "faire-un-cv-au-burkina-faso",
    title: "Comment faire un bon CV au Burkina Faso",
    description:
      "Structure simple pour creer un CV clair, lisible et adapte aux recruteurs au Burkina Faso.",
    sections: [
      "Commencez par un titre professionnel precis et vos contacts a jour.",
      "Ajoutez vos experiences avec resultats concrets, dates et responsabilites.",
      "Gardez une page pour les profils debutants et deux pages maximum pour les profils experimentes.",
      "Adaptez le CV a chaque offre au lieu d'envoyer toujours le meme document.",
    ],
  },
  {
    slug: "eviter-fausses-offres-emploi",
    title: "Comment eviter les fausses offres d'emploi",
    description:
      "Signaux d'alerte, verification des sources et bons reflexes avant de candidater.",
    sections: [
      "Ne payez jamais des frais avant entretien ou contrat verifiable.",
      "Verifiez le site officiel de l'entreprise ou de l'organisation.",
      "Mefiez-vous des salaires trop eleves sans mission claire.",
      "Signalez les offres suspectes a JobFaso pour proteger les autres candidats.",
    ],
  },
  {
    slug: "postuler-ong-burkina",
    title: "Comment postuler a une ONG au Burkina Faso",
    description:
      "Conseils pour candidater aux ONG, projets internationaux et organisations humanitaires.",
    sections: [
      "Lisez les termes de reference et reprenez les competences demandees.",
      "Mettez en avant langues, gestion de projet, terrain, reporting et outils bureautiques.",
      "Preparez une lettre courte qui explique votre motivation pour la mission.",
      "Gardez des preuves de diplomes et attestations pretes en PDF.",
    ],
  },
  {
    slug: "preparer-un-concours",
    title: "Comment preparer un concours au Burkina Faso",
    description:
      "Organisation, documents, revision et suivi des communiques officiels.",
    sections: [
      "Suivez toujours les communiques officiels et les dates de depot.",
      "Preparez les documents administratifs avant la derniere semaine.",
      "Revisez avec un planning simple par matiere.",
      "Gardez une copie numerique de chaque document important.",
    ],
  },
  {
    slug: "rediger-une-lettre-de-motivation",
    title: "Rediger une lettre de motivation efficace",
    description:
      "Methode simple pour ecrire une lettre claire, courte et adaptee a l'offre visee.",
    sections: [
      "Commencez par le poste vise et la raison precise de votre candidature.",
      "Montrez deux ou trois competences directement liees a l'offre.",
      "Evitez les lettres longues : une page suffit dans la plupart des cas.",
      "Relisez les noms, dates, contacts et pieces jointes avant l'envoi.",
    ],
  },
  {
    slug: "preparer-un-entretien-emploi",
    title: "Preparer un entretien d'embauche",
    description:
      "Questions frequentes, attitude professionnelle et documents a preparer avant un entretien.",
    sections: [
      "Relisez l'offre, le site de l'organisation et les missions principales.",
      "Preparez une presentation courte de votre parcours en une minute.",
      "Donnez des exemples concrets pour prouver vos competences.",
      "Preparez vos diplomes, attestations, CV et references dans un dossier propre.",
    ],
  },
  {
    slug: "documents-pour-postuler",
    title: "Documents a preparer pour postuler",
    description:
      "Liste pratique des documents souvent demandes pour emplois, stages, ONG et concours.",
    sections: [
      "Gardez un CV PDF a jour, nomme clairement avec votre nom.",
      "Scannez diplomes, attestations, CNIB ou passeport selon les exigences de l'offre.",
      "Preparez une lettre de motivation modifiable rapidement.",
      "Rangez vos documents dans un dossier cloud ou une cle USB pour eviter les pertes.",
    ],
  },
  {
    slug: "secteurs-qui-recrutent-burkina-faso",
    title: "Secteurs qui recrutent au Burkina Faso",
    description:
      "Pistes pour suivre les secteurs actifs : ONG, administration, finance, IT, commerce, BTP et logistique.",
    sections: [
      "Les ONG et projets recrutent souvent des profils gestion, terrain, finance, suivi-evaluation et logistique.",
      "Les entreprises privees recherchent des profils commerce, comptabilite, IT, maintenance et administration.",
      "Les concours demandent une veille reguliere des communiques et deadlines officielles.",
      "Les villes comme Ouagadougou et Bobo-Dioulasso concentrent beaucoup d'offres, mais les missions terrain restent importantes.",
    ],
  },
];

function escapeHtml(value = "") {
  return String(value)
    .replaceAll("&", "&amp;")
    .replaceAll("<", "&lt;")
    .replaceAll(">", "&gt;")
    .replaceAll('"', "&quot;")
    .replaceAll("'", "&#039;");
}

function stripHtml(value = "") {
  return String(value).replace(/<[^>]*>/g, " ").replace(/\s+/g, " ").trim();
}

function slugify(value) {
  return String(value || "")
    .toLowerCase()
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .replace(/&/g, " et ")
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/^-+|-+$/g, "")
    .slice(0, 90);
}

function normalize(value = "") {
  return String(value || "")
    .toLowerCase()
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .replace(/[^a-z0-9\s-]/g, " ")
    .replace(/\s+/g, " ")
    .trim();
}

function displayDate(value) {
  const date = new Date(value);
  if (Number.isNaN(date.getTime())) return "Date a verifier";
  return new Intl.DateTimeFormat("fr-FR", {
    day: "2-digit",
    month: "long",
    year: "numeric",
  }).format(date);
}

function formatJobDate(value, fallback = "A verifier") {
  if (!value) return fallback;
  const date = new Date(`${String(value).slice(0, 10)}T00:00:00Z`);
  if (Number.isNaN(date.getTime())) return fallback;
  return displayDate(date.toISOString());
}

function daysUntil(value) {
  if (!value) return null;
  const target = new Date(`${String(value).slice(0, 10)}T23:59:59Z`);
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
      helper: "La source affiche des dates incoherentes. Verifiez avant de postuler.",
    };
  }

  const days = daysUntil(job.closingDate);
  if (days === null) return { label: "Cloture a verifier", tone: "neutral", helper: "Date de cloture non extraite." };
  if (days < 0) return { label: "Expiree", tone: "danger", helper: `Cloturee depuis ${Math.abs(days)} jour${Math.abs(days) > 1 ? "s" : ""}.` };
  if (days === 0) return { label: "Dernier jour", tone: "danger", helper: "La cloture est prevue aujourd'hui." };
  if (days <= 3) return { label: `${days} jour${days > 1 ? "s" : ""} restant${days > 1 ? "s" : ""}`, tone: "warning", helper: "Deadline proche." };
  return { label: `${days} jours restants`, tone: "success", helper: "Candidature encore ouverte." };
}

function timeline(job) {
  const state = deadlineState(job);
  return `<div class="job-timeline">
    <div><span>Ouverture</span><strong>${escapeHtml(formatJobDate(job.openingDate))}</strong></div>
    <div><span>Cloture</span><strong>${escapeHtml(formatJobDate(job.closingDate, job.deadline || "A verifier"))}</strong></div>
    <div class="countdown ${state.tone}"><span>Countdown</span><strong>${escapeHtml(state.label)}</strong></div>
  </div>`;
}

function absolute(config, path) {
  return `${config.baseUrl.replace(/\/$/, "")}/${path.replace(/^\//, "")}`;
}

function seoImage(config) {
  return `${config.baseUrl.replace(/\/$/, "")}/assets/jobfaso-og.svg`;
}

function feedDescription(job) {
  const source = job.sourceName || job.company || "Source verifiee";
  const opening = formatJobDate(job.openingDate, "A verifier");
  const closing = formatJobDate(job.closingDate, job.deadline || "A verifier");
  const category = job.category || "Opportunite";
  return `${job.title} - ${source} - ${job.city || "Burkina Faso"}. Categorie: ${category}. Ouverture: ${opening}. Cloture: ${closing}. Consultez la fiche JobFaso puis verifiez la source officielle avant de postuler.`;
}

function baseOrganizationSchema(config) {
  return {
    "@context": "https://schema.org",
    "@type": "Organization",
    name: config.siteName || "JobFaso",
    url: config.baseUrl,
    email: config.contactEmail,
    areaServed: config.country || "Burkina Faso",
    sameAs: [config.social?.facebook, config.social?.linkedin, config.social?.whatsappChannel].filter(Boolean),
  };
}

function withGraph(page, extra = []) {
  return JSON.stringify([...(Array.isArray(page.structuredData) ? page.structuredData : [page.structuredData].filter(Boolean)), ...extra]);
}

function layout(config, page) {
  const canonical = absolute(config, page.path);
  const adsense = config.adsenseClient
    ? `<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=${escapeHtml(config.adsenseClient)}" crossorigin="anonymous"></script>`
    : "";

  return `<!doctype html>
<html lang="fr">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>${escapeHtml(page.title)}</title>
    <meta name="description" content="${escapeHtml(page.description)}" />
    <meta name="robots" content="index,follow,max-snippet:-1,max-image-preview:large,max-video-preview:-1" />
    <meta name="theme-color" content="#0f6b3d" />
    <meta name="author" content="${escapeHtml(config.siteName || "JobFaso")}" />
    <link rel="canonical" href="${escapeHtml(canonical)}" />
    <link rel="alternate" hreflang="fr-BF" href="${escapeHtml(canonical)}" />
    <link rel="alternate" hreflang="x-default" href="${escapeHtml(canonical)}" />
    <link rel="alternate" type="application/rss+xml" title="${escapeHtml(config.siteName || "JobFaso")} RSS" href="${escapeHtml(absolute(config, "feed.xml"))}" />
    <link rel="alternate" type="application/feed+json" title="${escapeHtml(config.siteName || "JobFaso")} JSON Feed" href="${escapeHtml(absolute(config, "feed.json"))}" />
    <link rel="manifest" href="../../site.webmanifest" />
    <meta property="og:title" content="${escapeHtml(page.title)}" />
    <meta property="og:description" content="${escapeHtml(page.description)}" />
    <meta property="og:url" content="${escapeHtml(canonical)}" />
    <meta property="og:type" content="${escapeHtml(page.ogType || "website")}" />
    <meta property="og:locale" content="fr_BF" />
    <meta property="og:site_name" content="${escapeHtml(config.siteName || "JobFaso")}" />
    <meta property="og:image" content="${escapeHtml(seoImage(config))}" />
    <meta property="og:image:alt" content="${escapeHtml(config.siteName || "JobFaso")} - Offres d'emploi et recrutement au Burkina Faso" />
    <meta name="twitter:card" content="summary_large_image" />
    <meta name="twitter:title" content="${escapeHtml(page.title)}" />
    <meta name="twitter:description" content="${escapeHtml(page.description)}" />
    <meta name="twitter:image" content="${escapeHtml(seoImage(config))}" />
    ${adsense}
    <link rel="stylesheet" href="../../styles.css" />
    <script type="application/ld+json">${withGraph(page, [baseOrganizationSchema(config)])}</script>
  </head>
  <body>
    <header class="topbar">
      <a class="brand" href="../../index.html" aria-label="Accueil JobFaso">
        <span class="brand-mark">JF</span>
        <span><strong>JobFaso</strong><small>Emploi Burkina</small></span>
      </a>
      <button class="menu-button" type="button" aria-expanded="false" aria-controls="mainNav">Menu</button>
      <nav class="nav" id="mainNav" aria-label="Navigation principale">
        <a href="../../jobs.html">Offres</a>
        <a href="../../annonceurs.html">Recruteurs</a>
        <a href="../../conseils.html">Guides</a>
        <a href="../../contacts.html">Contact</a>
      </nav>
      <a class="nav-action" href="../../annonceurs.html">Publier une offre</a>
    </header>
    ${page.body}
    <footer class="footer">
      <strong>JobFaso</strong>
      <span><a href="../../privacy.html">Confidentialite</a> - <a href="../../terms.html">Mentions legales</a></span>
    </footer>
    <script src="../../app.js"></script>
  </body>
</html>
`;
}

function sponsorBlock() {
  return `<aside class="ad-rail sponsor-panel" aria-label="Espace partenaire">
    <p class="eyebrow">Partenaire</p>
    <strong>Espace sponsorise disponible</strong>
    <p>Formations, cabinets RH et services utiles peuvent toucher une audience qualifiee sans bloquer l'acces candidat.</p>
    <a class="secondary-link" href="../../annonceurs.html">Demander cet emplacement</a>
  </aside>`;
}

function jobCard(job) {
  return `<article class="job-card">
    <p class="eyebrow">${escapeHtml(job.category || "Opportunite")}</p>
    <h3>${escapeHtml(job.title)}</h3>
    <p class="muted">${escapeHtml(job.company || "Organisation")} - ${escapeHtml(job.city || "Burkina Faso")}</p>
    ${timeline(job)}
    <div class="job-meta">
      <span class="pill">${escapeHtml(job.type || "A verifier")}</span>
      <span class="pill">${escapeHtml(formatJobDate(job.closingDate, job.deadline || "Deadline a verifier"))}</span>
    </div>
    <a class="secondary-link" href="../jobs/${slugify(job.title)}-${job.id.slice(0, 8)}.html">Voir la fiche</a>
  </article>`;
}

function generatedJobPath(job) {
  return `pages/jobs/${slugify(job.title)}-${job.id.slice(0, 8)}.html`;
}

function compactJobCards(jobs) {
  return jobs
    .slice(0, 4)
    .map(
      (job) => `<a class="mini-job" href="../../${generatedJobPath(job)}">
        <strong>${escapeHtml(job.title)}</strong>
        <span>${escapeHtml(job.company || job.sourceName || "Organisation")} - ${escapeHtml(job.city || "Burkina Faso")}</span>
      </a>`
    )
    .join("");
}

function tokenizeForKeywords(value = "") {
  return normalize(value)
    .split(" ")
    .filter((token) => token.length >= 4 && !stopWords.has(token) && !/^\d+$/.test(token));
}

function keywordCandidates(jobs) {
  const counts = new Map();

  for (const job of jobs) {
    const tokens = new Set([
      ...tokenizeForKeywords(job.title),
      ...tokenizeForKeywords(job.category),
      ...(Array.isArray(job.tags) ? job.tags.flatMap((tag) => tokenizeForKeywords(tag)) : []),
    ]);

    for (const token of tokens) {
      counts.set(token, (counts.get(token) || 0) + 1);
    }
  }

  const manualPriority = Object.keys(keywordAliases);
  return manualPriority.filter((term) => counts.has(term));
}

function keywordStructuredData(config, keyword, path, jobs) {
  return [
    {
      "@context": "https://schema.org",
      "@type": "CollectionPage",
      name: `Emploi ${keyword} au Burkina Faso`,
      description: `Offres, missions et opportunites ${keyword} au Burkina Faso sur JobFaso.`,
      url: absolute(config, path),
    },
    {
      "@context": "https://schema.org",
      "@type": "ItemList",
      itemListElement: jobs.slice(0, 10).map((job, index) => ({
        "@type": "ListItem",
        position: index + 1,
        url: absolute(config, generatedJobPath(job)),
        name: stripHtml(job.title),
      })),
    },
  ];
}

function keywordPageBody(keyword, jobs) {
  const aliases = keywordAliases[keyword] || [];
  const aliasesText = aliases.length ? `Mots proches : ${aliases.join(", ")}.` : "";
  return `<main>
    <section class="page-hero compact listing-hero">
      <p class="eyebrow">Recherche metier</p>
      <h1>Emploi ${escapeHtml(keyword)} au Burkina Faso</h1>
      <p class="lead">Retrouvez les offres ${escapeHtml(keyword)}, les opportunites proches et les sources verifiees sur JobFaso. ${escapeHtml(aliasesText)}</p>
    </section>
    <section class="section content-with-rail">
      <div class="content-main">
        <article class="catalog-intro-card">
          <strong>Requetes proches prises en compte</strong>
          <span>${escapeHtml(aliasesText || "Cette page aide les moteurs a relier les recherches precises et les formulations voisines aux bonnes offres.")}</span>
        </article>
        <div class="job-grid">${jobs.map(jobCard).join("")}</div>
      </div>
      ${sponsorBlock()}
    </section>
  </main>`;
}

function relatedJobs(currentJob, jobs) {
  return jobs
    .filter((job) => job.id !== currentJob.id && (job.category === currentJob.category || job.sourceName !== currentJob.sourceName))
    .slice(0, 8);
}

function guideArticle(guide, jobs) {
  return `<article class="content-main article-body guide-article">
    <div class="guide-intro-card">
      <p class="eyebrow">A faire maintenant</p>
      <h2>Plan d'action</h2>
      <p>Suivez ces etapes puis revenez aux offres pour postuler avec un dossier plus solide.</p>
    </div>
    <div class="step-list">
      ${guide.sections
        .map(
          (section, index) => `<section class="step-item">
            <span>${index + 1}</span>
            <div>
              <h3>${escapeHtml(section.split(".")[0])}</h3>
              <p>${escapeHtml(section)}</p>
            </div>
          </section>`
        )
        .join("")}
    </div>
    <div class="checklist-card">
      <h2>Checklist rapide</h2>
      <ul>
        <li>Verifier la deadline et la source officielle.</li>
        <li>Adapter le CV au poste vise.</li>
        <li>Nommer les fichiers proprement avant envoi.</li>
        <li>Garder une copie de chaque candidature envoyee.</li>
      </ul>
    </div>
    <div class="related-panel">
      <div>
        <p class="eyebrow">Offres recentes</p>
        <h2>Passer a l'action</h2>
      </div>
      <div class="mini-job-grid">${compactJobCards(jobs)}</div>
    </div>
    <div class="action-panel">
      <div>
        <strong>Recevoir les nouvelles opportunites</strong>
        <p>Ajoutez votre domaine et votre ville pour ne pas rater les prochaines deadlines.</p>
      </div>
      <div class="detail-actions">
        <a class="nav-action" href="../../index.html#alertes">Recevoir les alertes</a>
        <a class="secondary-link" href="../../index.html#offres">Voir les offres</a>
      </div>
    </div>
  </article>`;
}

function jobStructuredData(config, job, path) {
  const datePosted = new Date(job.collectedAt || Date.now()).toISOString().slice(0, 10);
  return {
    "@context": "https://schema.org/",
    "@type": "JobPosting",
    title: stripHtml(job.title),
    description: stripHtml(
      `${job.title}. Opportunite detectee par JobFaso. Verifiez les details et postulez depuis la source officielle.`
    ),
    identifier: {
      "@type": "PropertyValue",
      name: job.sourceName || "JobFaso",
      value: job.id,
    },
    datePosted: job.openingDate || datePosted,
    employmentType: job.type && job.type !== "A verifier" ? job.type : "OTHER",
    validThrough: job.closingDate || undefined,
    hiringOrganization: {
      "@type": "Organization",
      name: job.company || job.sourceName || "Organisation",
      sameAs: job.sourceUrl || config.baseUrl,
    },
    jobLocation: {
      "@type": "Place",
      address: {
        "@type": "PostalAddress",
        addressLocality: job.city || config.defaultCity,
        addressCountry: "BF",
      },
    },
    url: absolute(config, path),
  };
}

async function writePage(config, path, page) {
  const file = new URL(path, ROOT);
  await mkdir(new URL("./", file), { recursive: true });
  await writeFile(file, layout(config, { ...page, path }), "utf8");
}

async function cleanupGeneratedDirectory(directory, urls, prefix) {
  const expected = new Set(
    urls
      .filter((url) => url.startsWith(prefix))
      .map((url) => url.slice(prefix.length))
  );
  const entries = await readdir(directory, { withFileTypes: true });

  for (const entry of entries) {
    if (!entry.isFile() || !entry.name.endsWith(".html") || expected.has(entry.name)) continue;
    await unlink(new URL(entry.name, directory));
  }
}

async function main() {
  const jobs = JSON.parse(await readFile(JOBS_FILE, "utf8"));
  const config = JSON.parse(await readFile(CONFIG_FILE, "utf8"));
  const urls = [
    "index.html",
    "jobs.html",
    "conseils.html",
    "grille-tarifaire.html",
    "annonceurs.html",
    "contacts.html",
    "contact.html",
    "privacy.html",
    "terms.html",
  ];

  await mkdir(PAGES_DIR, { recursive: true });
  await mkdir(JOBS_DIR, { recursive: true });
  await mkdir(CATEGORIES_DIR, { recursive: true });
  await mkdir(CITIES_DIR, { recursive: true });
  await mkdir(GUIDES_DIR, { recursive: true });
  await mkdir(KEYWORDS_DIR, { recursive: true });
  await mkdir(WELL_KNOWN_DIR, { recursive: true });

  for (const job of jobs) {
    const path = generatedJobPath(job);
    const similarJobs = relatedJobs(job, jobs);
    urls.push(path);
    await writePage(config, path, {
      title: `${job.title} - ${job.city || "Burkina Faso"} | JobFaso`,
      description: `${job.title} chez ${job.company || job.sourceName || "une organisation"} au ${job.city || "Burkina Faso"}. Consultez la source officielle et recevez les alertes JobFaso.`,
      structuredData: jobStructuredData(config, job, path),
      ogType: "article",
      body: `<main>
        <section class="page-hero compact detail-hero">
          <p class="eyebrow"><a href="../../index.html">Accueil</a> / <a href="../../jobs.html">Offres</a> / ${escapeHtml(job.category || "Offre")}</p>
          <h1>${escapeHtml(job.title)}</h1>
          <p class="lead">${escapeHtml(job.company || job.sourceName || "Organisation")} - ${escapeHtml(job.city || "Burkina Faso")}</p>
          <div class="hero-actions">
            <a class="nav-action" href="${escapeHtml(job.sourceUrl)}" target="_blank" rel="noopener">Postuler a la source</a>
            <a class="secondary-link on-dark" href="../../index.html#alertes">Recevoir les alertes</a>
          </div>
        </section>
        <section class="section content-with-rail">
          <article class="content-main article-body">
            <p class="moderation-note">Cette fiche resume une opportunite reperee par JobFaso. Verifiez toujours la source officielle avant de postuler.</p>
            ${timeline(job)}
            <dl class="detail-list">
              <div><dt>Organisation</dt><dd>${escapeHtml(job.company || job.sourceName || "A verifier")}</dd></div>
              <div><dt>Ville</dt><dd>${escapeHtml(job.city || "Burkina Faso")}</dd></div>
              <div><dt>Date d'ouverture</dt><dd>${escapeHtml(formatJobDate(job.openingDate))}</dd></div>
              <div><dt>Date de cloture</dt><dd>${escapeHtml(formatJobDate(job.closingDate, job.deadline || "A verifier"))}</dd></div>
              <div><dt>Etat</dt><dd>${escapeHtml(deadlineState(job).helper)}</dd></div>
              <div><dt>Source</dt><dd>${escapeHtml(job.sourceName || "Source officielle")}</dd></div>
              <div><dt>Collecte</dt><dd>${escapeHtml(displayDate(job.collectedAt))}</dd></div>
            </dl>
            ${
              job.excerpt
                ? `<h2>Extrait de l'offre</h2><p>${escapeHtml(job.excerpt)}</p>`
                : `<h2>Resume</h2><p>Les informations detaillees doivent etre confirmees sur la source officielle avant envoi de candidature.</p>`
            }
            <h2>Conseil candidature</h2>
            <p>Preparez un CV clair, une lettre courte et verifiez que le poste correspond bien a votre profil avant d'envoyer vos documents.</p>
            <div class="checklist-card">
              <h2>Avant de postuler</h2>
              <ul>
                <li>Verifier le nom de l'organisation et le lien officiel.</li>
                <li>Adapter votre CV au titre du poste.</li>
                <li>Ne jamais payer de frais suspects pour candidater.</li>
              </ul>
            </div>
            <div class="detail-actions">
              <a class="nav-action" href="${escapeHtml(job.sourceUrl)}" target="_blank" rel="noopener">Ouvrir la source officielle</a>
              <a class="secondary-link" href="../../index.html#alertes">Recevoir les alertes</a>
              <a class="secondary-link" href="../../contacts.html">Signaler un probleme</a>
            </div>
            <div class="related-panel">
              <div>
                <p class="eyebrow">Dans la meme rubrique</p>
                <h2>Offres similaires</h2>
              </div>
              <div class="mini-job-grid">${compactJobCards(similarJobs)}</div>
            </div>
          </article>
          ${sponsorBlock()}
        </section>
      </main>`,
    });
  }

  const categories = [...new Set(jobs.map((job) => job.category || "Autre"))].sort();
  for (const category of categories) {
    const categoryJobs = jobs.filter((job) => (job.category || "Autre") === category);
    const guide = categoryGuides[category] || {
      title: `Offres ${category} au Burkina Faso`,
      intro: `Retrouvez les opportunites ${category} suivies par JobFaso.`,
    };
    const path = `pages/categories/${slugify(category)}.html`;
    urls.push(path);
    await writePage(config, path, {
      title: `${guide.title} | JobFaso`,
      description: `${guide.intro} Alertes WhatsApp, sources verifiees et opportunites recentes.`,
      structuredData: {
        "@context": "https://schema.org",
        "@type": "CollectionPage",
        name: guide.title,
        description: guide.intro,
      },
      body: `<main>
        <section class="page-hero compact listing-hero">
          <p class="eyebrow">Categorie</p>
          <h1>${escapeHtml(guide.title)}</h1>
          <p class="lead">${escapeHtml(guide.intro)}</p>
        </section>
        <section class="section content-with-rail">
          <div class="content-main">
            <div class="job-grid">${categoryJobs.map(jobCard).join("")}</div>
          </div>
          ${sponsorBlock()}
        </section>
      </main>`,
    });
  }

  const cities = [...new Set(jobs.map((job) => job.city || "Burkina Faso"))].sort();
  for (const city of cities) {
    const cityJobs = jobs.filter((job) => (job.city || "Burkina Faso") === city);
    const path = `pages/villes/${slugify(city)}.html`;
    urls.push(path);
    await writePage(config, path, {
      title: `Emploi ${city} | JobFaso`,
      description: `Offres d'emploi, concours, stages et missions a ${city}. Recevez les alertes JobFaso sur WhatsApp.`,
      structuredData: {
        "@context": "https://schema.org",
        "@type": "CollectionPage",
        name: `Emploi ${city}`,
      },
      body: `<main>
        <section class="page-hero compact listing-hero">
          <p class="eyebrow">Ville</p>
          <h1>Emploi ${escapeHtml(city)}</h1>
          <p class="lead">Offres recentes, sources utiles et alertes WhatsApp pour ${escapeHtml(city)}.</p>
        </section>
        <section class="section content-with-rail">
          <div class="content-main">
            <div class="job-grid">${cityJobs.map(jobCard).join("")}</div>
          </div>
          ${sponsorBlock()}
        </section>
      </main>`,
    });
  }

  const keywords = keywordCandidates(jobs);
  for (const keyword of keywords) {
    const aliases = keywordAliases[keyword] || [];
    const terms = new Set([keyword, ...aliases].map((item) => normalize(item)));
    const keywordJobs = jobs
      .filter((job) => {
        const haystack = normalize([job.title, job.category, job.city, ...(job.tags || [])].join(" "));
        return [...terms].some((term) => haystack.includes(term));
      })
      .slice(0, 18);
    if (!keywordJobs.length) continue;

    const path = `pages/recherche/${slugify(keyword)}.html`;
    urls.push(path);
    await writePage(config, path, {
      title: `Emploi ${keyword} au Burkina Faso | JobFaso`,
      description: `Offres ${keyword}, recherches proches et opportunites verifiees au Burkina Faso. ${aliases.length ? `Mots lies : ${aliases.join(", ")}.` : ""}`,
      structuredData: keywordStructuredData(config, keyword, path, keywordJobs),
      body: keywordPageBody(keyword, keywordJobs),
    });
  }

  for (const guide of evergreenGuides) {
    const path = `pages/guides/${guide.slug}.html`;
    urls.push(path);
    await writePage(config, path, {
      title: `${guide.title} | JobFaso`,
      description: guide.description,
      structuredData: {
        "@context": "https://schema.org",
        "@type": "Article",
        headline: guide.title,
        description: guide.description,
        author: { "@type": "Organization", name: "JobFaso" },
      },
      body: `<main>
        <section class="page-hero compact guide-hero">
          <p class="eyebrow">Guide candidat</p>
          <h1>${escapeHtml(guide.title)}</h1>
          <p class="lead">${escapeHtml(guide.description)}</p>
        </section>
        <section class="section content-with-rail">
          ${guideArticle(guide, jobs)}
          ${sponsorBlock()}
        </section>
      </main>`,
    });
  }

  await cleanupGeneratedDirectory(JOBS_DIR, urls, "pages/jobs/");
  await cleanupGeneratedDirectory(CATEGORIES_DIR, urls, "pages/categories/");
  await cleanupGeneratedDirectory(CITIES_DIR, urls, "pages/villes/");
  await cleanupGeneratedDirectory(KEYWORDS_DIR, urls, "pages/recherche/");

  const today = new Date().toISOString().slice(0, 10);
  const sitemap = `<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
${urls
  .map(
    (path) => `  <url>
    <loc>${absolute(config, path)}</loc>
    <lastmod>${today}</lastmod>
    <changefreq>${path.startsWith("pages/jobs/") ? "daily" : "weekly"}</changefreq>
    <priority>${path === "index.html" ? "1.0" : path === "jobs.html" ? "0.9" : path.startsWith("pages/jobs/") ? "0.8" : "0.7"}</priority>
  </url>`
  )
  .join("\n")}
</urlset>
`;

  await writeFile(SITEMAP_FILE, sitemap, "utf8");
  await writeFile(
    ROBOTS_FILE,
    `User-agent: *\nAllow: /\nDisallow: /admin.html\nDisallow: /api/\nDisallow: /data/runtime/\nDisallow: /data/social/\n\nSitemap: ${absolute(config, "sitemap.xml")}\nHost: ${new URL(config.baseUrl).host}\n`,
    "utf8"
  );
  await writeFile(
    LLM_FILE,
    `# ${config.siteName || "JobFaso"}\n\n${config.description}\n\n## Core pages\n- ${absolute(config, "index.html")}\n- ${absolute(config, "jobs.html")}\n- ${absolute(config, "conseils.html")}\n- ${absolute(config, "grille-tarifaire.html")}\n- ${absolute(config, "contacts.html")}\n\n## Fresh job feeds\n- ${absolute(config, "sitemap.xml")}\n- ${absolute(config, "data/curated-jobs.json")}\n- ${absolute(config, "feed.xml")}\n- ${absolute(config, "feed.json")}\n\nJobFaso aggregates public job opportunities, concours, internships and local missions in Burkina Faso. Candidates should always verify official sources before applying.\n`,
    "utf8"
  );
  await writeFile(
    MANIFEST_FILE,
    `${JSON.stringify(
      {
        name: `${config.siteName || "JobFaso"} - Emploi Burkina Faso`,
        short_name: config.siteName || "JobFaso",
        description: config.description,
        start_url: "/",
        scope: "/",
        display: "standalone",
        background_color: "#f7faf7",
        theme_color: "#0f6b3d",
        lang: "fr-BF",
        categories: ["business", "productivity"],
      },
      null,
      2
    )}\n`,
    "utf8"
  );
  await writeFile(INDEXNOW_FILE, `${urls.map((path) => absolute(config, path)).join("\n")}\n`, "utf8");
  const adsensePublisher = String(config.adsenseClient || "").replace(/^ca-/, "");
  const adsTxt = adsensePublisher.startsWith("pub-")
    ? `google.com, ${adsensePublisher}, DIRECT, f08c47fec0942fa0\n`
    : "# Configurez adsenseClient dans data/site-config.json pour generer ads.txt automatiquement.\n";
  await writeFile(ADS_TXT_FILE, adsTxt, "utf8");

  const rssItems = jobs
    .slice(0, 50)
    .map((job) => {
      const link = absolute(config, generatedJobPath(job));
      const pubDate = new Date(job.collectedAt || Date.now()).toUTCString();
      return `  <item>
    <title>${escapeHtml(job.title)}</title>
    <link>${escapeHtml(link)}</link>
    <guid isPermaLink="true">${escapeHtml(link)}</guid>
    <description>${escapeHtml(feedDescription(job))}</description>
    <category>${escapeHtml(job.category || "Opportunite")}</category>
    <pubDate>${escapeHtml(pubDate)}</pubDate>
  </item>`;
    })
    .join("\n");

  await writeFile(
    FEED_XML_FILE,
    `<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0">
  <channel>
    <title>${escapeHtml(config.siteName || "JobFaso")}</title>
    <link>${escapeHtml(config.baseUrl)}</link>
    <description>${escapeHtml(config.description || "Offres d'emploi et recrutement au Burkina Faso.")}</description>
    <language>fr-BF</language>
    <lastBuildDate>${new Date().toUTCString()}</lastBuildDate>
${rssItems}
  </channel>
</rss>
`,
    "utf8"
  );

  await writeFile(
    FEED_JSON_FILE,
    `${JSON.stringify(
      {
        version: "https://jsonfeed.org/version/1.1",
        title: config.siteName || "JobFaso",
        home_page_url: config.baseUrl,
        feed_url: absolute(config, "feed.json"),
        description: config.description || "Offres d'emploi, concours, stages et missions au Burkina Faso.",
        language: "fr-BF",
        authors: [{ name: config.siteName || "JobFaso" }],
        items: jobs.slice(0, 50).map((job) => ({
          id: absolute(config, generatedJobPath(job)),
          url: absolute(config, generatedJobPath(job)),
          title: job.title,
          content_text: feedDescription(job),
          summary: stripHtml(job.excerpt || ""),
          date_published: new Date(job.collectedAt || Date.now()).toISOString(),
          tags: [job.category, ...(job.tags || [])].filter(Boolean),
        })),
      },
      null,
      2
    )}\n`,
    "utf8"
  );

  await writeFile(
    SECURITY_FILE,
    `Contact: mailto:${config.contactEmail || "contact@jobfaso.com"}
Expires: ${new Date(Date.now() + 180 * 24 * 60 * 60 * 1000).toISOString()}
Preferred-Languages: fr, en
Canonical: ${absolute(config, ".well-known/security.txt")}
Policy: ${absolute(config, "privacy.html")}
`,
    "utf8"
  );

  console.log(`Generated SEO pages: ${urls.length}`);
  console.log(`Sitemap: ${SITEMAP_FILE.pathname}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
