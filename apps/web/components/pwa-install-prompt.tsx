"use client";

import { useEffect, useState } from "react";
import { Download, X } from "lucide-react";

type BeforeInstallPromptEvent = Event & {
  prompt: () => Promise<void>;
  userChoice: Promise<{ outcome: "accepted" | "dismissed"; platform: string }>;
};

const DISMISS_KEY = "eb_pwa_install_dismissed_at";
const DISMISS_DAYS = 14;

function isStandalone() {
  return window.matchMedia("(display-mode: standalone)").matches || (navigator as Navigator & { standalone?: boolean }).standalone;
}

function recentlyDismissed() {
  const raw = localStorage.getItem(DISMISS_KEY);
  if (!raw) return false;
  const dismissedAt = Number(raw);
  if (!Number.isFinite(dismissedAt)) return false;
  return Date.now() - dismissedAt < DISMISS_DAYS * 86400000;
}

function track(source: string) {
  fetch("/api/analytics/events", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({
      type: "conversion_click",
      path: window.location.pathname,
      target: "/",
      source
    })
  }).catch(() => {});
}

export function PwaInstallPrompt() {
  const [event, setEvent] = useState<BeforeInstallPromptEvent | null>(null);
  const [visible, setVisible] = useState(false);

  useEffect(() => {
    if (isStandalone() || recentlyDismissed()) return;

    function onBeforeInstallPrompt(rawEvent: Event) {
      rawEvent.preventDefault();
      setEvent(rawEvent as BeforeInstallPromptEvent);
      window.setTimeout(() => setVisible(true), 2500);
    }

    window.addEventListener("beforeinstallprompt", onBeforeInstallPrompt);
    return () => window.removeEventListener("beforeinstallprompt", onBeforeInstallPrompt);
  }, []);

  async function install() {
    if (!event) return;
    setVisible(false);
    await event.prompt();
    const choice = await event.userChoice.catch(() => null);
    track(choice?.outcome === "accepted" ? "pwa_install:accepted" : "pwa_install:dismissed");
    if (choice?.outcome !== "accepted") localStorage.setItem(DISMISS_KEY, String(Date.now()));
    setEvent(null);
  }

  function dismiss() {
    localStorage.setItem(DISMISS_KEY, String(Date.now()));
    track("pwa_install:manual_dismiss");
    setVisible(false);
  }

  if (!visible || !event) return null;

  return (
    <div className="fixed inset-x-3 bottom-20 z-50 mx-auto max-w-md rounded-xl border border-border bg-white p-4 shadow-xl lg:bottom-5">
      <div className="flex items-start gap-3">
        <div className="flex h-10 w-10 shrink-0 items-center justify-center rounded-xl bg-primary/10 text-primary">
          <Download size={18} />
        </div>
        <div className="min-w-0 flex-1">
          <p className="text-sm font-black text-foreground">Installer Emplois Burkina</p>
          <p className="mt-1 text-xs font-semibold leading-relaxed text-muted-foreground">
            Acces plus rapide aux offres, alertes et services, meme avec une connexion lente.
          </p>
          <div className="mt-3 flex gap-2">
            <button
              type="button"
              onClick={install}
              className="inline-flex h-9 items-center justify-center rounded-lg bg-primary px-4 text-xs font-black text-primary-foreground"
            >
              Installer
            </button>
            <button
              type="button"
              onClick={dismiss}
              className="inline-flex h-9 items-center justify-center rounded-lg border border-border px-4 text-xs font-black text-muted-foreground"
            >
              Plus tard
            </button>
          </div>
        </div>
        <button
          type="button"
          onClick={dismiss}
          className="flex h-8 w-8 shrink-0 items-center justify-center rounded-lg text-muted-foreground hover:bg-muted"
          aria-label="Fermer"
        >
          <X size={15} />
        </button>
      </div>
    </div>
  );
}
