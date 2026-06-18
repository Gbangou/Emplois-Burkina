import { access, mkdir, readFile, writeFile } from "node:fs/promises";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

const ROOT = fileURLToPath(new URL("..", import.meta.url));
const REPORT_FILE = join(ROOT, "docs", "PROJECT_AUDIT.md");

async function exists(path) {
  try {
    await access(path);
    return true;
  } catch {
    return false;
  }
}

async function read(path) {
  try {
    return await readFile(path, "utf8");
  } catch {
    return "";
  }
}

function add(checks, severity, name, passed, detail, recommendation = "") {
  checks.push({ severity, name, passed: Boolean(passed), detail, recommendation });
}

function includesAll(content, items) {
  return items.every((item) => content.includes(item));
}

function markdownTable(checks) {
  return [
    "| Severite | Check | Etat | Detail | Recommandation |",
    "| --- | --- | --- | --- | --- |",
    ...checks.map(
      (check) =>
        `| ${check.severity} | ${check.name} | ${check.passed ? "OK" : "A corriger"} | ${check.detail} | ${check.recommendation} |`,
    ),
  ].join("\n");
}

const requiredFiles = [
  "index.html",
  "jobs.html",
  "admin.html",
  "contacts.html",
  "conseils.html",
  "grille-tarifaire.html",
  "app.js",
  "server.mjs",
  "styles.css",
  "sitemap.xml",
  "robots.txt",
  "llms.txt",
  "site.webmanifest",
  "database/schema.sql",
  "database/seed.sql",
  "docs/MASTER_PROMPT.md",
  "docs/PROJECT_STATUS_AND_OPERATIONS.md",
  "docs/VISIBILITY_ENGINE.md",
  "docs/AUTOMATION_REPORT.md",
  "scripts/run-automation.mjs",
  "scripts/sync-sqlite-db.mjs",
  "scripts/generate-visibility-engine.mjs",
  "scripts/automation-quality-gate.mjs",
];

const expectedScripts = [
  "automate",
  "automate:daemon",
  "automate:quality",
  "automate:report",
  "visibility",
  "db:sync",
  "db:sqlite",
  "db:export",
  "growth",
  "social:queue",
  "check",
];

const expectedRoutes = [
  "/api/health",
  "/api/platform",
  "/api/db/status",
  "/api/jobs",
  "/api/quality/offers",
  "/api/leads",
  "/api/events",
  "/api/admin/db/sqlite/sync",
  "/api/admin/jobs/moderation",
  "/api/admin/jobs/edit",
  "/api/admin/analytics/summary",
  "/api/admin/growth/visibility",
  "/api/admin/automation",
  "/api/admin/social/queue",
];

const [packageJson, server, app, readme, masterPrompt, operations, sitemap, robots, visibility] = await Promise.all([
  read(join(ROOT, "package.json")),
  read(join(ROOT, "server.mjs")),
  read(join(ROOT, "app.js")),
  read(join(ROOT, "README.md")),
  read(join(ROOT, "docs", "MASTER_PROMPT.md")),
  read(join(ROOT, "docs", "PROJECT_STATUS_AND_OPERATIONS.md")),
  read(join(ROOT, "sitemap.xml")),
  read(join(ROOT, "robots.txt")),
  read(join(ROOT, "docs", "VISIBILITY_ENGINE.md")),
]);

const checks = [];
for (const file of requiredFiles) {
  add(checks, "critical", `file:${file}`, await exists(join(ROOT, file)), "Fichier requis", "Restaurer ou regenerer le fichier.");
}

for (const script of expectedScripts) {
  add(checks, "critical", `script:${script}`, packageJson.includes(`"${script}"`), "Script package.json attendu", "Ajouter le script npm.");
}

for (const route of expectedRoutes) {
  add(checks, "critical", `route:${route}`, server.includes(route), "Route API attendue", "Ajouter ou documenter la route.");
}

add(
  checks,
  "critical",
  "sqlite_runtime",
  server.includes("readSqliteDb") && server.includes("moderation_overrides"),
  "SQLite sert de lecture API et conserve les overrides de moderation",
  "Verifier server.mjs et scripts/sync-sqlite-db.mjs.",
);
add(
  checks,
  "critical",
  "security_baseline",
  includesAll(server, ["Content-Security-Policy", "rateLimit", "sameOrigin", "requireAdmin", "timingSafeEqual"]),
  "Headers, rate limit, origine et token admin",
  "Ne pas retirer les garde-fous serveur.",
);
add(
  checks,
  "warning",
  "admin_surfaces",
  includesAll(app, ["loadVisibilityEngine", "loadAnalyticsSummary", "moderation-button", "syncSqliteButton"]),
  "Admin expose analytics, visibilite, moderation et SQLite",
  "Completer app.js/admin.html si un panneau manque.",
);
add(
  checks,
  "warning",
  "seo_assets",
  sitemap.includes("<urlset") && robots.includes("Sitemap:") && sitemap.match(/<loc>/g)?.length >= 30,
  `${sitemap.match(/<loc>/g)?.length || 0} URLs sitemap`,
  "Enrichir le corpus avec plus d'offres et de pages SEO utiles.",
);
add(
  checks,
  "warning",
  "master_prompt_current_state",
  includesAll(masterPrompt, ["SQLite", "visibility", "moderation", "analytics"]),
  "Le master prompt doit refleter l'etat actuel",
  "Mettre a jour docs/MASTER_PROMPT.md.",
);
add(
  checks,
  "warning",
  "operations_current_state",
  includesAll(operations, ["moderation_overrides", "stockage primaire", "npm run visibility", "npm run db:sqlite"]),
  "Le guide operationnel couvre SQLite, visibilite et moderation",
  "Mettre a jour docs/PROJECT_STATUS_AND_OPERATIONS.md.",
);
add(
  checks,
  "warning",
  "readme_no_stale_next_steps",
  !readme.includes("Remplacer les donnees demo par une base Supabase"),
  "README ne doit pas presenter des acquis comme a faire",
  "Actualiser les prochaines etapes.",
);
add(
  checks,
  "info",
  "visibility_score_documented",
  /Score global : \d+\/100/.test(visibility),
  "Rapport de visibilite genere",
  "Executer npm run visibility.",
);

const failedCritical = checks.filter((check) => check.severity === "critical" && !check.passed);
const failedWarnings = checks.filter((check) => check.severity === "warning" && !check.passed);
const passed = checks.filter((check) => check.passed).length;
const score = Math.round((passed / checks.length) * 100);
const audit = {
  generatedAt: new Date().toISOString(),
  score,
  status: failedCritical.length ? "failed" : failedWarnings.length ? "warning" : "passed",
  failedCritical: failedCritical.length,
  failedWarnings: failedWarnings.length,
  checks,
};

const markdown = `# Audit projet JobFaso

Genere le : ${audit.generatedAt}

Score : ${audit.score}/100
Statut : ${audit.status}

## Resume

- Checks critiques en echec : ${audit.failedCritical}
- Warnings : ${audit.failedWarnings}
- Fichiers verifies : ${requiredFiles.length}
- Routes API attendues : ${expectedRoutes.length}
- Scripts npm attendus : ${expectedScripts.length}

## Checks

${markdownTable(checks)}
`;

await mkdir(dirname(REPORT_FILE), { recursive: true });
await writeFile(REPORT_FILE, markdown, "utf8");

console.log(`Project audit: ${audit.status} (${audit.score}/100)`);
console.log(`Audit report generated: ${REPORT_FILE}`);

if (failedCritical.length) {
  process.exitCode = 1;
}
