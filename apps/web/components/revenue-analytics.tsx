"use client";

import { useEffect } from "react";
import { usePathname } from "next/navigation";

const TRACKED_PREFIXES = ["/services", "/grille-tarifaire", "/jobs", "/guides", "/marches", "/outils", "/formations", "/revenus", "/alertes"];

function sendEvent(payload: { type: "page_view" | "conversion_click" | "lead_submit"; path: string; target?: string; source?: string }) {
  const body = JSON.stringify(payload);

  if (typeof navigator !== "undefined" && "sendBeacon" in navigator) {
    const blob = new Blob([body], { type: "application/json" });
    navigator.sendBeacon("/api/analytics/events", blob);
    return;
  }

  fetch("/api/analytics/events", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body,
    keepalive: true
  }).catch(() => {});
}

function shouldTrack(href: string) {
  try {
    const url = new URL(href, window.location.origin);
    return url.origin === window.location.origin && TRACKED_PREFIXES.some((prefix) => url.pathname.startsWith(prefix));
  } catch {
    return false;
  }
}

export function RevenueAnalytics() {
  const pathname = usePathname();

  useEffect(() => {
    sendEvent({ type: "page_view", path: pathname || "/", source: "web" });
  }, [pathname]);

  useEffect(() => {
    function onClick(event: MouseEvent) {
      const target = event.target instanceof Element ? event.target.closest("a") : null;
      const href = target?.getAttribute("href");

      if (!target || !href || !shouldTrack(href)) return;

      const url = new URL(href, window.location.origin);
      const source = target.getAttribute("data-analytics-source") || "link";
      const label = target.getAttribute("data-analytics-label");
      sendEvent({
        type: "conversion_click",
        path: window.location.pathname,
        target: `${url.pathname}${url.search}${url.hash}`,
        source: label ? `${source}:${label}` : source
      });
    }

    document.addEventListener("click", onClick, { capture: true });
    return () => document.removeEventListener("click", onClick, { capture: true });
  }, []);

  return null;
}
