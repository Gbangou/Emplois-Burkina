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
const PORT = Number(process.env.PORT || 8088);
const NODE_ENV = process.env.NODE_ENV || "development";
const ADMIN_TOKEN = process.env.JOBFASO_ADMIN_TOKEN || process.env.ADMIN_TOKEN || "";
const BODY_LIMIT = 64 * 1024;

const publicPaths = new Set([
  "/",
  "/index.html",
  "/annonceurs.html",
  "/contact.html",
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
  const safePath = pathname === "/" ? "/index.html" : pathname;
  const normalized = normalize(safePath).replace(/^([/\\])+/, "");
  const absolute = resolve(ROOT_DIR, normalized);
  return absolute.startsWith(ROOT_DIR + sep) || absolute === ROOT_DIR ? absolute : "";
}

function isPublicStaticPath(pathname) {
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

async function handleApi(req, res, url) {
  if (!rateLimit(req, res, "api", 120)) return;

  if (url.pathname === "/api/health") {
    sendJson(res, 200, { ok: true, environment: NODE_ENV, time: new Date().toISOString() });
    return;
  }

  if (url.pathname === "/api/config") {
    const config = await readJson(join(ROOT, "data", "site-config.json"), {});
    sendJson(res, 200, {
      siteName: config.siteName,
      baseUrl: config.baseUrl,
      country: config.country,
      description: config.description,
      hasWhatsApp: Boolean(config.whatsappNumber),
      hasAdsense: Boolean(config.adsenseClient),
    });
    return;
  }

  if (url.pathname === "/api/jobs" && req.method === "GET") {
    const jobs = await readJson(join(ROOT, "data", "curated-jobs.json"), []);
    sendJson(res, 200, { jobs });
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
    sendJson(res, 202, { ok: true, message: "Automation lancee en arriere-plan." });
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
