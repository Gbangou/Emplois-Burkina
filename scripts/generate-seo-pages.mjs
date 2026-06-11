import { mkdir, readFile, writeFile } from "node:fs/promises";

const ROOT = new URL("../", import.meta.url);
const JOBS_FILE = new URL("data/curated-jobs.json", ROOT);
const CONFIG_FILE = new URL("data/site-config.json", ROOT);
const PAGES_DIR = new URL("pages/", ROOT);
const JOBS_DIR = new URL("pages/jobs/", ROOT);
const CATEGORIES_DIR = new URL("pages/categories/", ROOT);
const CITIES_DIR = new URL("pages/villes/", ROOT);
const GUIDES_DIR = new URL("pages/guides/", ROOT);
const SITEMAP_FILE = new URL("sitemap.xml", ROOT);
const ROBOTS_FILE = new URL("robots.txt", ROOT);

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
  "Metier terrain": {
    title: "Metiers terrain et missions locales au Burkina Faso",
    intro:
      "Missions et profils terrain : ouvriers, techniciens, chauffeurs, artisans et services locaux.",
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

function displayDate(value) {
  const date = new Date(value);
  if (Number.isNaN(date.getTime())) return "Date a verifier";
  return new Intl.DateTimeFormat("fr-FR", {
    day: "2-digit",
    month: "long",
    year: "numeric",
  }).format(date);
}

function absolute(config, path) {
  return `${config.baseUrl.replace(/\/$/, "")}/${path.replace(/^\//, "")}`;
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
    <link rel="canonical" href="${escapeHtml(canonical)}" />
    <meta property="og:title" content="${escapeHtml(page.title)}" />
    <meta property="og:description" content="${escapeHtml(page.description)}" />
    <meta property="og:url" content="${escapeHtml(canonical)}" />
    <meta property="og:type" content="website" />
    ${adsense}
    <link rel="stylesheet" href="../../styles.css" />
    ${page.structuredData ? `<script type="application/ld+json">${JSON.stringify(page.structuredData)}</script>` : ""}
  </head>
  <body>
    <header class="topbar">
      <a class="brand" href="../../index.html" aria-label="Accueil JobFaso">
        <span class="brand-mark">JF</span>
        <span><strong>JobFaso</strong><small>Emploi Burkina</small></span>
      </a>
      <button class="menu-button" type="button" aria-expanded="false" aria-controls="mainNav">Menu</button>
      <nav class="nav" id="mainNav" aria-label="Navigation principale">
        <a href="../../index.html#offres">Offres</a>
        <a href="../../annonceurs.html">Recruteurs</a>
        <a href="../guides/faire-un-cv-au-burkina-faso.html">Guides</a>
        <a href="../../contact.html">Contact</a>
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
    <div class="job-meta">
      <span class="pill">${escapeHtml(job.type || "A verifier")}</span>
      <span class="pill">${escapeHtml(job.deadline || "Deadline a verifier")}</span>
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
    datePosted,
    employmentType: job.type && job.type !== "A verifier" ? job.type : "OTHER",
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

async function main() {
  const jobs = JSON.parse(await readFile(JOBS_FILE, "utf8"));
  const config = JSON.parse(await readFile(CONFIG_FILE, "utf8"));
  const urls = ["index.html", "annonceurs.html", "contact.html", "privacy.html", "terms.html"];

  await mkdir(PAGES_DIR, { recursive: true });
  await mkdir(JOBS_DIR, { recursive: true });
  await mkdir(CATEGORIES_DIR, { recursive: true });
  await mkdir(CITIES_DIR, { recursive: true });
  await mkdir(GUIDES_DIR, { recursive: true });

  for (const job of jobs) {
    const path = generatedJobPath(job);
    urls.push(path);
    await writePage(config, path, {
      title: `${job.title} - ${job.city || "Burkina Faso"} | JobFaso`,
      description: `${job.title} chez ${job.company || job.sourceName || "une organisation"} au ${job.city || "Burkina Faso"}. Consultez la source officielle et recevez les alertes JobFaso.`,
      structuredData: jobStructuredData(config, job, path),
      body: `<main>
        <section class="page-hero compact detail-hero">
          <p class="eyebrow">${escapeHtml(job.category || "Offre")}</p>
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
            <dl class="detail-list">
              <div><dt>Organisation</dt><dd>${escapeHtml(job.company || job.sourceName || "A verifier")}</dd></div>
              <div><dt>Ville</dt><dd>${escapeHtml(job.city || "Burkina Faso")}</dd></div>
              <div><dt>Deadline</dt><dd>${escapeHtml(job.deadline || "A verifier")}</dd></div>
              <div><dt>Source</dt><dd>${escapeHtml(job.sourceName || "Source officielle")}</dd></div>
              <div><dt>Collecte</dt><dd>${escapeHtml(displayDate(job.collectedAt))}</dd></div>
            </dl>
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
              <a class="secondary-link" href="../../contact.html">Signaler un probleme</a>
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

  const today = new Date().toISOString().slice(0, 10);
  const sitemap = `<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
${urls
  .map(
    (path) => `  <url>
    <loc>${absolute(config, path)}</loc>
    <lastmod>${today}</lastmod>
  </url>`
  )
  .join("\n")}
</urlset>
`;

  await writeFile(SITEMAP_FILE, sitemap, "utf8");
  await writeFile(ROBOTS_FILE, `User-agent: *\nAllow: /\n\nSitemap: ${absolute(config, "sitemap.xml")}\n`, "utf8");

  console.log(`Generated SEO pages: ${urls.length}`);
  console.log(`Sitemap: ${SITEMAP_FILE.pathname}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
