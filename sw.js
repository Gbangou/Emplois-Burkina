const CACHE_VERSION = "emplois-burkina-pwa-v1";
const APP_SHELL = [
  "/",
  "/index.html",
  "/jobs.html",
  "/annonceurs.html",
  "/contacts.html",
  "/styles.css",
  "/app.js",
  "/site.webmanifest",
  "/assets/emplois-burkina-og.svg",
  "/data/curated-jobs.json",
  "/data/sources.json",
  "/data/employer-logos.json",
  "/data/international-feeds.json",
];

const RUNTIME_CACHE_PREFIX = "emplois-burkina-runtime-";
const RUNTIME_CACHE = `${RUNTIME_CACHE_PREFIX}${CACHE_VERSION}`;

function isSameOrigin(request) {
  return new URL(request.url).origin === self.location.origin;
}

function isCacheableRequest(request) {
  if (!isSameOrigin(request) || request.method !== "GET") return false;
  const url = new URL(request.url);
  if (url.pathname.startsWith("/api/admin/")) return false;
  if (url.pathname === "/admin.html") return false;
  return true;
}

async function cacheFirst(request) {
  const cache = await caches.open(CACHE_VERSION);
  const cached = await cache.match(request);
  if (cached) return cached;

  const response = await fetch(request);
  if (response.ok) cache.put(request, response.clone());
  return response;
}

async function staleWhileRevalidate(request) {
  const cache = await caches.open(RUNTIME_CACHE);
  const cached = await cache.match(request);
  const fresh = fetch(request)
    .then((response) => {
      if (response.ok) cache.put(request, response.clone());
      return response;
    })
    .catch(() => cached);

  return cached || fresh;
}

async function navigationFallback(request) {
  try {
    const response = await fetch(request);
    const cache = await caches.open(RUNTIME_CACHE);
    if (response.ok) cache.put(request, response.clone());
    return response;
  } catch {
    const cache = await caches.open(CACHE_VERSION);
    return (await cache.match("/jobs.html")) || (await cache.match("/index.html")) || Response.error();
  }
}

self.addEventListener("install", (event) => {
  event.waitUntil(
    caches
      .open(CACHE_VERSION)
      .then((cache) => cache.addAll(APP_SHELL))
      .then(() => self.skipWaiting()),
  );
});

self.addEventListener("activate", (event) => {
  event.waitUntil(
    caches
      .keys()
      .then((keys) =>
        Promise.all(
          keys
            .filter((key) => key !== CACHE_VERSION && key !== RUNTIME_CACHE)
            .filter((key) => key.startsWith("emplois-burkina-") || key.startsWith(RUNTIME_CACHE_PREFIX))
            .map((key) => caches.delete(key)),
        ),
      )
      .then(() => self.clients.claim()),
  );
});

self.addEventListener("message", (event) => {
  if (event.data?.type === "SKIP_WAITING") self.skipWaiting();
});

self.addEventListener("fetch", (event) => {
  const { request } = event;
  if (!isCacheableRequest(request)) return;

  const url = new URL(request.url);
  if (request.mode === "navigate") {
    event.respondWith(navigationFallback(request));
    return;
  }

  if (["/styles.css", "/app.js", "/site.webmanifest"].includes(url.pathname) || url.pathname.startsWith("/assets/")) {
    event.respondWith(cacheFirst(request));
    return;
  }

  if (url.pathname.startsWith("/api/") || url.pathname.startsWith("/data/")) {
    event.respondWith(staleWhileRevalidate(request));
  }
});
