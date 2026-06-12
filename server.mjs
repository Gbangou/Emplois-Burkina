import { createHash, randomUUID, timingSafeEqual } from "node:crypto";
import { createReadStream } from "node:fs";
import { mkdir, readFile, stat, writeFile } from "node:fs/promises";
import { createServer } from "node:http";
import { extname, join, normalize, resolve, sep } from "node:path";
import { spawn } from "node:child_process";
import { fileURLToPath } from "node:url";

const ROOT = fileURLToPath(new URL(".", import.meta.url));
const ROOT_DIR = resolve(ROOT);
const DATA_DIR = join(ROOT, "data", "runtime");
const LEADS_FILE = join(DATA_DIR, "leads.json");
const EVENTS_FILE = join(DATA_DIR, "events.json");
const LOCAL_DB_FILE = join(DATA_DIR, "local-db.json");
const PORT = Number(process.env.PORT || 8088);
const NODE_ENV = process.env.NODE_ENV || "development";
const ADMIN_TOKEN = process.env.JOBFASO_ADMIN_TOKEN || process.env.ADMIN_TOKEN || "";
const BODY_LIMIT = 64 * 1024;

const publicPaths = new Set([
  "/",
  "/index.html",
  "/jobs.html",
  "/conseils.html",
  "/grille-tarifaire.html",
  "/annonceurs.html",
  "/contact.html",
  "/contacts.html",
  "/privacy.html",
  "/terms.html",
  "/admin.html",
  "/sitemap.xml",
  "/robots.txt",
]);
const publicDataPaths = new Set(["/data/curated-jobs.json", "/data/sources.json"]);

const contentTypes = {
  ".html": "text/html; charset=utf-8",
  ".css": "text/css; charset=utf-8",
  ".js": "application/javascript; charset=utf-8",
  ".json": "application/json; charset=utf-8",
  ".xml": "application/xml; charset=utf-8",
  ".txt": "text/plain; charset=utf-8",
  ".svg": "image/svg+xml",
  ".png": "image/png",
  ".jpg": "image/jpeg",
  ".jpeg": "image/jpeg",
  ".webp": "image/webp",
  ".ico": "image/x-icon",
};

const rateBuckets = new Map();

function securityHeaders() {
  const connectSrc = NODE_ENV === "development" ? "'self' http://127.0.0.1:* http://localhost:*" : "'self'";
  return {
    "Content-Security-Policy": [
      "default-src 'self'",
      "base-uri 'self'",
      "object-src 'none'",
      "frame-ancestors 'none'",
      "form-action 'self'",
      "img-src 'self' data: https://images.unsplash.com",
      "style-src 'self' 'unsafe-inline'",
      "script-src 'self' 'unsafe-inline' https://pagead2.googlesyndication.com",
      `connect-src ${connectSrc}`,
      "upgrade-insecure-requests",
    ].join("; "),
    "Cross-Origin-Opener-Policy": "same-origin",
    "Cross-Origin-Resource-Policy": "same-origin",
    "Permissions-Policy": "camera=(), microphone=(), geolocation=(), payment=()",
    "Referrer-Policy": "strict-origin-when-cross-origin",
    "X-Content-Type-Options": "nosniff",
    "X-Frame-Options": "DENY",
    "X-Permitted-Cross-Domain-Policies": "none",
  };
}

function send(res, status, body, headers = {}) {
  res.writeHead(status, {
    ...securityHeaders(),
    "Cache-Control": "no-store",
    ...headers,
  });
  res.end(body);
}

function sendJson(res, status, payload) {
  send(res, status, JSON.stringify(payload), { "Content-Type": "application/json; charset=utf-8" });
}

function clientIp(req) {
  return req.headers["x-forwarded-for"]?.split(",")[0]?.trim() || req.socket.remoteAddress || "unknown";
}

function rateLimit(req, res, keyPrefix, limit = 60, windowMs = 60_000) {
  const key = `${keyPrefix}:${clientIp(req)}`;
  const now = Date.now();
  const bucket = rateBuckets.get(key) || { count: 0, resetAt: now + windowMs };

  if (now > bucket.resetAt) {
    bucket.count = 0;
    bucket.resetAt = now + windowMs;
  }

  bucket.count += 1;
  rateBuckets.set(key, bucket);

  if (bucket.count > limit) {
    sendJson(res, 429, { error: "Trop de requetes. Reessayez plus tard." });
    return false;
  }

  return true;
}

function isSafePath(pathname) {
  if (pathname.includes("\0")) return false;
  const decoded = decodeURIComponent(pathname);
  return !decoded.split("/").includes("..");
}

function resolvePublicPath(pathname) {
  const aliases = {
    "/jobs/": "/jobs.html",
    "/jobs": "/jobs.html",
    "/toutes-les-offres-demploi/": "/jobs.html",
    "/toutes-les-offres-demploi": "/jobs.html",
    "/conseils/": "/conseils.html",
    "/conseils": "/conseils.html",
    "/grille-tarifaire/": "/grille-tarifaire.html",
    "/grille-tarifaire": "/grille-tarifaire.html",
    "/contacts/": "/contacts.html",
    "/contacts": "/contacts.html",
  };
  const safePath = pathname === "/" ? "/index.html" : aliases[pathname] || pathname;
  const normalized = normalize(safePath).replace(/^([/\\])+/, "");
  const absolute = resolve(ROOT_DIR, normalized);
  return absolute.startsWith(ROOT_DIR + sep) || absolute === ROOT_DIR ? absolute : "";
}

function isPublicStaticPath(pathname) {
  if (
    [
      "/jobs/",
      "/jobs",
      "/toutes-les-offres-demploi/",
      "/toutes-les-offres-demploi",
      "/conseils/",
      "/conseils",
      "/grille-tarifaire/",
      "/grille-tarifaire",
      "/contacts/",
      "/contacts",
    ].includes(pathname)
  ) {
    return true;
  }
  if (publicPaths.has(pathname)) return true;
  if (publicDataPaths.has(pathname)) return true;
  if (pathname.startsWith("/pages/") && pathname.endsWith(".html")) return true;
  if (pathname === "/app.js" || pathname === "/styles.css") return true;
  return false;
}

function safeEqual(a, b) {
  const left = Buffer.from(createHash("sha256").update(String(a)).digest("hex"));
  const right = Buffer.from(createHash("sha256").update(String(b)).digest("hex"));
  return timingSafeEqual(left, right);
}

function requireAdmin(req, res) {
  if (!ADMIN_TOKEN) {
    sendJson(res, 503, { error: "Admin token non configure sur le serveur." });
    return false;
  }

  const header = req.headers.authorization || "";
  const token = header.startsWith("Bearer ") ? header.slice(7) : "";
  if (!token || !safeEqual(token, ADMIN_TOKEN)) {
    sendJson(res, 401, { error: "Acces admin refuse." });
    return false;
  }

  return true;
}

function sameOrigin(req) {
  const origin = req.headers.origin;
  if (!origin) return true;
  const host = req.headers.host;
  try {
    return new URL(origin).host === host;
  } catch {
    return false;
  }
}

async function readJson(file, fallback) {
  try {
    return JSON.parse(await readFile(file, "utf8"));
  } catch {
    return fallback;
  }
}

async function writeJson(file, value) {
  await mkdir(DATA_DIR, { recursive: true });
  await writeFile(file, `${JSON.stringify(value, null, 2)}\n`, "utf8");
}

function countBy(items, getter) {
  return items.reduce((acc, item) => {
    const key = getter(item) || "Autre";
    acc[key] = (acc[key] || 0) + 1;
    return acc;
  }, {});
}

function publicConfig(config) {
  return {
    siteName: config.siteName,
    baseUrl: config.baseUrl,
    country: config.country,
    defaultCity: config.defaultCity,
    description: config.description,
    hasWhatsApp: Boolean(config.whatsappNumber),
    hasAdsense: Boolean(config.adsenseClient),
    social: {
      facebook: Boolean(config.social?.facebook),
      linkedin: Boolean(config.social?.linkedin),
      whatsappChannel: Boolean(config.social?.whatsappChannel),
    },
  };
}

function summarizeJobs(jobs) {
  const sourceCounts = countBy(jobs, (job) => job.sourceName);
  const categoryCounts = countBy(jobs, (job) => job.category);
  const cityCounts = countBy(jobs, (job) => job.city);
  return {
    total: jobs.length,
    withClosingDate: jobs.filter((job) => job.closingDate).length,
    needsReview: jobs.filter((job) => job.status === "needs_review").length,
    sources: Object.keys(sourceCounts).length,
    categories: Object.entries(categoryCounts).sort((a, b) => b[1] - a[1]),
    cities: Object.entries(cityCounts).sort((a, b) => b[1] - a[1]),
    sourceCounts: Object.entries(sourceCounts).sort((a, b) => b[1] - a[1]),
  };
}

async function buildLocalDb() {
  const [config, jobs, sources, rateCards, rawItems, leads, events] = await Promise.all([
    readJson(join(ROOT, "data", "site-config.json"), {}),
    readJson(join(ROOT, "data", "curated-jobs.json"), []),
    readJson(join(ROOT, "data", "sources.json"), []),
    readJson(join(ROOT, "data", "rate-card.json"), []),
    readJson(join(ROOT, "data", "raw-items.json"), []),
    readJson(LEADS_FILE, []),
    readJson(EVENTS_FILE, []),
  ]);
  const stats = summarizeJobs(jobs);
  return {
    version: 1,
    generatedAt: new Date().toISOString(),
    config: publicConfig(config),
    jobs,
    sources,
    rateCards,
    rawItemsCount: rawItems.length,
    leads,
    events,
    stats,
    monetization: {
      publicAdSlots: ["homepage_featured", "category_sponsor", "job_detail_rail", "guide_sponsor"],
      directSalesFirst: true,
      adsenseReady: Boolean(config.adsenseClient),
    },
  };
}

async function syncLocalDb(reason = "sync") {
  const db = await buildLocalDb();
  db.lastSyncReason = reason;
  await writeJson(LOCAL_DB_FILE, db);
  return db;
}

async function readLocalDb() {
  const db = await readJson(LOCAL_DB_FILE, null);
  if (db?.version) return db;
  return syncLocalDb("bootstrap");
}

async function readBody(req) {
  const chunks = [];
  let size = 0;

  for await (const chunk of req) {
    size += chunk.length;
    if (size > BODY_LIMIT) throw new Error("Payload too large");
    chunks.push(chunk);
  }

  const raw = Buffer.concat(chunks).toString("utf8");
  return raw ? JSON.parse(raw) : {};
}

function cleanText(value, max = 500) {
  return String(value || "")
    .replace(/[\u0000-\u001f\u007f]/g, " ")
    .replace(/\s+/g, " ")
    .trim()
    .slice(0, max);
}

function validateLead(payload) {
  const kind = cleanText(payload.kind, 40) || "contact";
  const data = payload.data && typeof payload.data === "object" ? payload.data : {};
  const cleaned = {};

  for (const [key, value] of Object.entries(data)) {
    cleaned[cleanText(key, 60)] = cleanText(value, 1000);
  }

  const contact = cleaned.contact || cleaned.phone || cleaned.email || "";
  if (!contact && kind !== "event") {
    return { error: "Contact requis." };
  }

  return {
    lead: {
      id: randomUUID(),
      kind,
      status: "new",
      valueFcfa: Number(payload.valueFcfa || 0) || 0,
      data: cleaned,
      ipHash: createHash("sha256").update(String(payload.ipHint || "")).digest("hex").slice(0, 16),
      createdAt: new Date().toISOString(),
    },
  };
}

async function appendEvent(type, payload = {}) {
  const events = await readJson(EVENTS_FILE, []);
  events.unshift({
    id: randomUUID(),
    type,
    payload,
    createdAt: new Date().toISOString(),
  });
  await writeJson(EVENTS_FILE, events.slice(0, 1000));
}

function runScript(script, args = []) {
  return new Promise((resolve, reject) => {
    const child = spawn(process.execPath, [script, ...args], {
      cwd: ROOT,
      shell: false,
      stdio: ["ignore", "pipe", "pipe"],
    });

    let stdout = "";
    let stderr = "";
    child.stdout.on("data", (chunk) => {
      stdout += chunk.toString();
    });
    child.stderr.on("data", (chunk) => {
      stderr += chunk.toString();
    });
    child.on("exit", (code) => {
      if (code === 0) resolve({ stdout: stdout.trim(), stderr: stderr.trim() });
      else reject(new Error(stderr.trim() || stdout.trim() || `${script} failed with exit code ${code}`));
    });
  });
}

async function handleApi(req, res, url) {
  if (!rateLimit(req, res, "api", 120)) return;

  if (url.pathname === "/api/health") {
    sendJson(res, 200, { ok: true, environment: NODE_ENV, time: new Date().toISOString() });
    return;
  }

  if (url.pathname === "/api/config") {
    const config = await readJson(join(ROOT, "data", "site-config.json"), {});
    sendJson(res, 200, publicConfig(config));
    return;
  }

  if (url.pathname === "/api/platform" && req.method === "GET") {
    const db = await readLocalDb();
    const featuredJobs = db.jobs
      .slice()
      .sort((a, b) => Number(Boolean(b.closingDate)) - Number(Boolean(a.closingDate)))
      .slice(0, 12);
    sendJson(res, 200, {
      config: db.config,
      stats: db.stats,
      jobs: db.jobs,
      featuredJobs,
      sources: db.stats.sourceCounts,
      categories: db.stats.categories,
      cities: db.stats.cities,
      rateCards: db.rateCards,
      monetization: db.monetization,
      generatedAt: db.generatedAt,
    });
    return;
  }

  if (url.pathname === "/api/db/status" && req.method === "GET") {
    const db = await readLocalDb();
    sendJson(res, 200, {
      ok: true,
      generatedAt: db.generatedAt,
      lastSyncReason: db.lastSyncReason,
      jobs: db.jobs.length,
      sources: db.sources.length,
      rawItems: db.rawItemsCount,
      leads: db.leads.length,
      events: db.events.length,
      rateCards: db.rateCards.length,
      withClosingDate: db.stats.withClosingDate,
    });
    return;
  }

  if (url.pathname === "/api/jobs" && req.method === "GET") {
    const db = await readLocalDb();
    const jobs = db.jobs;
    const query = cleanText(url.searchParams.get("q") || "", 100).toLowerCase();
    const city = cleanText(url.searchParams.get("city") || "", 100);
    const source = cleanText(url.searchParams.get("source") || "", 140);
    const category = cleanText(url.searchParams.get("category") || "", 80);
    const filtered = jobs.filter((job) => {
      const haystack = [job.title, job.company, job.city, job.category, job.type, job.sourceName, ...(job.tags || [])]
        .join(" ")
        .toLowerCase();
      return (
        (!query || haystack.includes(query)) &&
        (!city || job.city === city) &&
        (!source || job.sourceName === source) &&
        (!category || job.category === category)
      );
    });
    sendJson(res, 200, {
      jobs: filtered,
      total: jobs.length,
      sources: [...new Set(jobs.map((job) => job.sourceName).filter(Boolean))].length,
      withClosingDate: jobs.filter((job) => job.closingDate).length,
    });
    return;
  }

  if (url.pathname === "/api/admin/automation/status" && req.method === "GET") {
    if (!requireAdmin(req, res)) return;
    const [jobs, sources, rawItems, events] = await Promise.all([
      readJson(join(ROOT, "data", "curated-jobs.json"), []),
      readJson(join(ROOT, "data", "sources.json"), []),
      readJson(join(ROOT, "data", "raw-items.json"), []),
      readJson(EVENTS_FILE, []),
    ]);
    const lastJobDate = jobs
      .map((job) => new Date(job.collectedAt || 0).getTime())
      .filter(Boolean)
      .sort((a, b) => b - a)[0];

    sendJson(res, 200, {
      sources: sources.length,
      rawItems: rawItems.length,
      curatedJobs: jobs.length,
      needsReview: jobs.filter((job) => job.status === "needs_review").length,
      lastCollectedAt: lastJobDate ? new Date(lastJobDate).toISOString() : "",
      latestEvents: events.slice(0, 10),
    });
    return;
  }

  if (url.pathname === "/api/leads" && req.method === "POST") {
    if (!rateLimit(req, res, "lead", 20)) return;
    if (!sameOrigin(req)) {
      sendJson(res, 403, { error: "Origine refusee." });
      return;
    }

    try {
      const payload = await readBody(req);
      const validation = validateLead(payload);
      if (validation.error) {
        sendJson(res, 400, { error: validation.error });
        return;
      }

      const leads = await readJson(LEADS_FILE, []);
      leads.unshift(validation.lead);
      await writeJson(LEADS_FILE, leads.slice(0, 5000));
      await appendEvent("lead_created", { kind: validation.lead.kind, valueFcfa: validation.lead.valueFcfa });
      await syncLocalDb("lead_created");
      sendJson(res, 201, { ok: true, id: validation.lead.id });
    } catch {
      sendJson(res, 400, { error: "Requete invalide." });
    }
    return;
  }

  if (url.pathname === "/api/admin/leads" && req.method === "GET") {
    if (!requireAdmin(req, res)) return;
    const leads = await readJson(LEADS_FILE, []);
    sendJson(res, 200, { leads });
    return;
  }

  if (url.pathname === "/api/admin/events" && req.method === "GET") {
    if (!requireAdmin(req, res)) return;
    const events = await readJson(EVENTS_FILE, []);
    sendJson(res, 200, { events });
    return;
  }

  if (url.pathname === "/api/admin/db/sync" && req.method === "POST") {
    if (!requireAdmin(req, res)) return;
    if (!sameOrigin(req)) {
      sendJson(res, 403, { error: "Origine refusee." });
      return;
    }

    const db = await syncLocalDb("admin_sync");
    await appendEvent("db_synced", { by: "admin" });
    sendJson(res, 200, {
      ok: true,
      generatedAt: db.generatedAt,
      jobs: db.jobs.length,
      sources: db.sources.length,
      leads: db.leads.length,
      events: db.events.length,
    });
    return;
  }

  if (url.pathname === "/api/admin/automation" && req.method === "POST") {
    if (!requireAdmin(req, res)) return;
    if (!sameOrigin(req)) {
      sendJson(res, 403, { error: "Origine refusee." });
      return;
    }

    const child = spawn(process.execPath, ["scripts/run-automation.mjs"], {
      cwd: ROOT,
      shell: false,
      stdio: "ignore",
      detached: true,
    });
    child.unref();
    await appendEvent("automation_started", { by: "admin" });
    await syncLocalDb("automation_started");
    sendJson(res, 202, { ok: true, message: "Automation lancee en arriere-plan." });
    return;
  }

  if (url.pathname === "/api/admin/social/queue" && req.method === "GET") {
    if (!requireAdmin(req, res)) return;
    const queue = await readJson(join(ROOT, "data", "social", "queue.json"), []);
    const history = await readJson(join(ROOT, "data", "social", "history.json"), []);
    sendJson(res, 200, {
      queue: queue.slice(0, 50),
      history: history.slice(0, 20),
      configured: {
        facebook: Boolean(process.env.FACEBOOK_PAGE_ID && process.env.FACEBOOK_PAGE_ACCESS_TOKEN),
        webhook: Boolean(process.env.SOCIAL_WEBHOOK_URL),
        live: process.env.SOCIAL_PUBLISH_LIVE === "true",
      },
    });
    return;
  }

  if (url.pathname === "/api/admin/social/queue" && req.method === "POST") {
    if (!requireAdmin(req, res)) return;
    if (!sameOrigin(req)) {
      sendJson(res, 403, { error: "Origine refusee." });
      return;
    }

    try {
      const result = await runScript("scripts/generate-social-queue.mjs");
      await appendEvent("social_queue_generated", {});
      sendJson(res, 200, { ok: true, output: result.stdout });
    } catch (error) {
      sendJson(res, 500, { error: error.message });
    }
    return;
  }

  if (url.pathname === "/api/admin/social/publish" && req.method === "POST") {
    if (!requireAdmin(req, res)) return;
    if (!sameOrigin(req)) {
      sendJson(res, 403, { error: "Origine refusee." });
      return;
    }

    try {
      const payload = await readBody(req);
      const args = payload.live ? ["--live"] : [];
      const result = await runScript("scripts/publish-social.mjs", args);
      await appendEvent("social_publish_requested", { live: Boolean(payload.live) });
      sendJson(res, 200, { ok: true, output: result.stdout });
    } catch (error) {
      sendJson(res, 500, { error: error.message });
    }
    return;
  }

  sendJson(res, 404, { error: "Endpoint introuvable." });
}

async function serveStatic(req, res, url) {
  if (!isSafePath(url.pathname)) {
    send(res, 400, "Bad request", { "Content-Type": "text/plain; charset=utf-8" });
    return;
  }

  const publicPathname = url.pathname === "/" ? "/" : url.pathname;
  if (!isPublicStaticPath(publicPathname)) {
    send(res, 404, "Not found", { "Content-Type": "text/plain; charset=utf-8" });
    return;
  }

  const filePath = resolvePublicPath(url.pathname);
  if (!filePath) {
    send(res, 403, "Forbidden", { "Content-Type": "text/plain; charset=utf-8" });
    return;
  }

  try {
    const info = await stat(filePath);
    if (!info.isFile()) throw new Error("Not a file");

    const ext = extname(filePath).toLowerCase();
    const cacheable = !publicPaths.has(url.pathname) && [".css", ".js", ".png", ".jpg", ".jpeg", ".webp", ".svg"].includes(ext);
    res.writeHead(200, {
      ...securityHeaders(),
      "Content-Type": contentTypes[ext] || "application/octet-stream",
      "Cache-Control": cacheable ? "public, max-age=86400" : "no-cache",
    });
    createReadStream(filePath).pipe(res);
  } catch {
    send(res, 404, "Not found", { "Content-Type": "text/plain; charset=utf-8" });
  }
}

const server = createServer(async (req, res) => {
  try {
    const url = new URL(req.url || "/", `http://${req.headers.host || "localhost"}`);

    if (req.method === "OPTIONS") {
      send(res, 204, "");
      return;
    }

    if (url.pathname.startsWith("/api/")) {
      await handleApi(req, res, url);
      return;
    }

    if (!["GET", "HEAD"].includes(req.method || "")) {
      send(res, 405, "Method not allowed", { "Content-Type": "text/plain; charset=utf-8" });
      return;
    }

    await serveStatic(req, res, url);
  } catch (error) {
    console.error(error);
    sendJson(res, 500, { error: "Erreur serveur." });
  }
});

server.listen(PORT, () => {
  console.log(`JobFaso dynamic server running on http://127.0.0.1:${PORT}`);
  if (!ADMIN_TOKEN) {
    console.warn("JOBFASO_ADMIN_TOKEN non configure: les endpoints admin sont desactives.");
  }
});
