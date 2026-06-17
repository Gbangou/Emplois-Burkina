import { readFile, writeFile } from "node:fs/promises";

const ROOT = new URL("../", import.meta.url);
const CONFIG_FILE = new URL("data/site-config.json", ROOT);

const pages = [
  {
    path: "index.html",
    title: "JobFaso - Emploi, recrutement, concours et stages au Burkina Faso",
    description:
      "JobFaso centralise les offres d'emploi, concours, stages, metiers informels et solutions de recrutement au Burkina Faso avec alertes et sources verifiees.",
    schemaType: "WebSite",
  },
  {
    path: "jobs.html",
    title: "Offres d'emploi au Burkina Faso - JobFaso",
    description:
      "Toutes les offres d'emploi, stages, concours, missions terrain et metiers informels collectes par JobFaso au Burkina Faso.",
    schemaType: "CollectionPage",
  },
  {
    path: "conseils.html",
    title: "Conseils emploi Burkina Faso - CV, entretien, concours | JobFaso",
    description:
      "Guides pratiques pour CV, lettres, entretiens, concours, ONG et candidatures professionnelles au Burkina Faso.",
    schemaType: "CollectionPage",
  },
  {
    path: "grille-tarifaire.html",
    title: "Tarifs recruteurs et publicite emploi - JobFaso",
    description:
      "Packs annonces, offres sponsorisees, diffusion WhatsApp, publicite native et solutions recruteurs sur JobFaso.",
    schemaType: "Product",
  },
  {
    path: "contacts.html",
    title: "Contact JobFaso - Publier, signaler ou proposer une source",
    description:
      "Contactez JobFaso pour publier une offre, signaler une annonce, proposer une source emploi ou devenir partenaire.",
    schemaType: "ContactPage",
  },
  {
    path: "contact.html",
    title: "Contact JobFaso - Recruteurs, candidats et partenaires",
    description:
      "Formulaire de contact JobFaso pour candidats, recruteurs, sources emploi et partenaires au Burkina Faso.",
    schemaType: "ContactPage",
  },
  {
    path: "annonceurs.html",
    title: "Publier une offre d'emploi au Burkina Faso - JobFaso",
    description:
      "Publiez une annonce, sponsorisez une offre, recevez des leads candidats et touchez une audience emploi au Burkina Faso.",
    schemaType: "Service",
  },
  {
    path: "privacy.html",
    title: "Confidentialite - JobFaso",
    description: "Politique de confidentialite JobFaso pour candidats, recruteurs et visiteurs.",
    schemaType: "WebPage",
  },
  {
    path: "terms.html",
    title: "Mentions legales et conditions - JobFaso",
    description: "Conditions d'utilisation, moderation, responsabilites et regles de publication JobFaso.",
    schemaType: "WebPage",
  },
];

function escapeHtml(value = "") {
  return String(value)
    .replaceAll("&", "&amp;")
    .replaceAll("<", "&lt;")
    .replaceAll(">", "&gt;")
    .replaceAll('"', "&quot;");
}

function absolute(config, path) {
  return `${config.baseUrl.replace(/\/$/, "")}/${path.replace(/^\//, "")}`;
}

function imageUrl(config) {
  return absolute(config, "assets/jobfaso-og.svg");
}

function schema(config, page) {
  const sameAs = [config.social?.facebook, config.social?.linkedin, config.social?.whatsappChannel].filter(Boolean);
  const base = {
    "@context": "https://schema.org",
    "@type": page.schemaType,
    name: page.title,
    description: page.description,
    url: absolute(config, page.path),
    inLanguage: "fr-BF",
    isPartOf: {
      "@type": "WebSite",
      name: config.siteName || "JobFaso",
      url: config.baseUrl,
      potentialAction:
        page.path === "index.html"
          ? {
              "@type": "SearchAction",
              target: `${config.baseUrl.replace(/\/$/, "")}/jobs.html?q={search_term_string}`,
              "query-input": "required name=search_term_string",
            }
          : undefined,
    },
    publisher: {
      "@type": "Organization",
      name: config.siteName || "JobFaso",
      url: config.baseUrl,
      email: config.contactEmail,
      areaServed: config.country || "Burkina Faso",
      sameAs,
    },
  };

  if (page.schemaType === "Product") {
    base["@type"] = "Service";
    base.serviceType = "Publication d'offres d'emploi et publicite recruteur";
    base.areaServed = config.country || "Burkina Faso";
  }

  return JSON.stringify(base);
}

function seoBlock(config, page) {
  const canonical = absolute(config, page.path);
  return `    <title>${escapeHtml(page.title)}</title>
    <meta name="description" content="${escapeHtml(page.description)}" />
    <meta name="robots" content="index,follow,max-snippet:-1,max-image-preview:large,max-video-preview:-1" />
    <meta name="theme-color" content="#0f6b3d" />
    <meta name="author" content="${escapeHtml(config.siteName || "JobFaso")}" />
    <link rel="canonical" href="${escapeHtml(canonical)}" />
    <link rel="alternate" hreflang="fr-BF" href="${escapeHtml(canonical)}" />
    <link rel="alternate" hreflang="x-default" href="${escapeHtml(canonical)}" />
    <link rel="alternate" type="application/rss+xml" title="${escapeHtml(config.siteName || "JobFaso")} RSS" href="${escapeHtml(absolute(config, "feed.xml"))}" />
    <link rel="alternate" type="application/feed+json" title="${escapeHtml(config.siteName || "JobFaso")} JSON Feed" href="${escapeHtml(absolute(config, "feed.json"))}" />
    <link rel="manifest" href="site.webmanifest" />
    <meta property="og:title" content="${escapeHtml(page.title)}" />
    <meta property="og:description" content="${escapeHtml(page.description)}" />
    <meta property="og:url" content="${escapeHtml(canonical)}" />
    <meta property="og:type" content="website" />
    <meta property="og:locale" content="fr_BF" />
    <meta property="og:site_name" content="${escapeHtml(config.siteName || "JobFaso")}" />
    <meta property="og:image" content="${escapeHtml(imageUrl(config))}" />
    <meta property="og:image:alt" content="${escapeHtml(config.siteName || "JobFaso")} - Offres d'emploi et recrutement au Burkina Faso" />
    <meta name="twitter:card" content="summary_large_image" />
    <meta name="twitter:title" content="${escapeHtml(page.title)}" />
    <meta name="twitter:description" content="${escapeHtml(page.description)}" />
    <meta name="twitter:image" content="${escapeHtml(imageUrl(config))}" />
    <script type="application/ld+json">${schema(config, page)}</script>`;
}

function injectSeo(html, config, page) {
  const cleaned = html
    .replace(/\s*<title>[\s\S]*?<\/title>/i, "")
    .replace(/\s*<meta\s+name=["']description["'][^>]*>/gi, "")
    .replace(/\s*<meta\s+name=["']robots["'][^>]*>/gi, "")
    .replace(/\s*<meta\s+name=["']theme-color["'][^>]*>/gi, "")
    .replace(/\s*<link\s+rel=["']canonical["'][^>]*>/gi, "")
    .replace(/\s*<link\s+rel=["']alternate["'][^>]*>/gi, "")
    .replace(/\s*<link\s+rel=["']manifest["'][^>]*>/gi, "")
    .replace(/\s*<meta\s+(?:property|name)=["'](?:og|twitter):[^>]*>/gi, "")
    .replace(/\s*<script\s+type=["']application\/ld\+json["'][\s\S]*?<\/script>/gi, "");

  return cleaned.replace(/(\s*<link\s+rel=["']stylesheet["'][^>]*>)/i, `${seoBlock(config, page)}\n$1`);
}

const config = JSON.parse(await readFile(CONFIG_FILE, "utf8"));

for (const page of pages) {
  const file = new URL(page.path, ROOT);
  const html = await readFile(file, "utf8");
  await writeFile(file, injectSeo(html, config, page), "utf8");
}

console.log(`Enhanced static SEO: ${pages.length} pages`);
