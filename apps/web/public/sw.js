const CACHE = "emplois-burkina-v3";
const STATIC = ["/", "/jobs", "/alertes", "/outils", "/formations", "/services", "/grille-tarifaire", "/offline"];

self.addEventListener("install", (e) => {
  e.waitUntil(
    caches.open(CACHE).then((c) => c.addAll(STATIC)).then(() => self.skipWaiting())
  );
});

self.addEventListener("activate", (e) => {
  e.waitUntil(
    caches.keys().then((keys) =>
      Promise.all(keys.filter((k) => k !== CACHE).map((k) => caches.delete(k)))
    ).then(() => self.clients.claim())
  );
});

self.addEventListener("fetch", (e) => {
  const { request } = e;
  if (request.method !== "GET") return;
  if (request.url.includes("/api/")) {
    e.respondWith(
      fetch(request).catch(() =>
        new Response(JSON.stringify({ ok: false, offline: true }), {
          headers: { "Content-Type": "application/json" }
        })
      )
    );
    return;
  }
  e.respondWith(
    caches.match(request).then((cached) => {
      if (cached) return cached;
      return fetch(request).then((resp) => {
        if (resp.ok && request.url.startsWith(self.location.origin)) {
          const clone = resp.clone();
          caches.open(CACHE).then((c) => c.put(request, clone));
        }
        return resp;
      }).catch(() => caches.match("/offline") || new Response("Hors ligne", { status: 503 }));
    })
  );
});
