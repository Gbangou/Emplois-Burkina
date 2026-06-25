"use client";

import { useEffect, useRef, useState } from "react";
import { ArrowRight, Bell, Briefcase, Building2, MapPin, Search, Sparkles, X } from "lucide-react";

type QuickJob = {
  id: string;
  title: string;
  company?: string;
  city?: string;
  category?: string;
};

const QUICK_LINKS = [
  { label: "Explorer les offres", href: "/jobs", icon: Briefcase, color: "var(--green)" },
  { label: "Activer une alerte", href: "/jobs#alertes", icon: Bell, color: "var(--gold)" },
  { label: "Publier une annonce", href: "/annonceurs", icon: Building2, color: "var(--blue)" },
  { label: "Tableau de bord", href: "/operations", icon: Sparkles, color: "var(--violet)" }
];

export function CommandPalette() {
  const [open, setOpen] = useState(false);
  const [query, setQuery] = useState("");
  const [jobs, setJobs] = useState<QuickJob[]>([]);
  const [loading, setLoading] = useState(false);
  const inputRef = useRef<HTMLInputElement>(null);
  const debounceRef = useRef<ReturnType<typeof setTimeout> | null>(null);

  useEffect(() => {
    const handler = (e: KeyboardEvent) => {
      if ((e.metaKey || e.ctrlKey) && e.key === "k") {
        e.preventDefault();
        setOpen((v) => !v);
      }
      if (e.key === "Escape") setOpen(false);
    };
    document.addEventListener("keydown", handler);
    return () => document.removeEventListener("keydown", handler);
  }, []);

  useEffect(() => {
    if (open) {
      setTimeout(() => inputRef.current?.focus(), 50);
    } else {
      setQuery("");
      setJobs([]);
    }
  }, [open]);

  useEffect(() => {
    if (debounceRef.current) clearTimeout(debounceRef.current);
    if (!query.trim()) { setJobs([]); return; }
    setLoading(true);
    debounceRef.current = setTimeout(async () => {
      try {
        const res = await fetch(`/api/search?q=${encodeURIComponent(query)}&limit=6`);
        if (res.ok) {
          const data = await res.json() as { jobs: QuickJob[] };
          setJobs(data.jobs || []);
        }
      } catch { /* ignore */ }
      setLoading(false);
    }, 220);
  }, [query]);

  if (!open) return (
    <button
      onClick={() => setOpen(true)}
      aria-label="Recherche rapide (Ctrl+K)"
      className="fixed bottom-24 right-4 z-40 lg:hidden flex items-center gap-2 bg-white border border-line shadow-lg rounded-full px-4 py-3 text-sm font-black text-muted hover:text-ink hover:border-line-strong transition-all"
      style={{ boxShadow: "0 8px 32px rgba(16,37,47,0.14)" }}
    >
      <Search size={16} style={{ color: "var(--cyan)" }} />
      <span className="hidden sm:inline">Rechercher</span>
    </button>
  );

  return (
    <div
      className="fixed inset-0 z-50 flex items-start justify-center pt-[12vh] px-4"
      style={{ background: "rgba(7,23,30,0.52)", backdropFilter: "blur(8px)" }}
      onClick={(e) => { if (e.target === e.currentTarget) setOpen(false); }}
    >
      <div
        className="w-full max-w-xl rounded-xl overflow-hidden"
        style={{
          background: "var(--surface)",
          border: "1px solid var(--line-strong)",
          boxShadow: "var(--shadow-lg)"
        }}
      >
        {/* Search input */}
        <div className="flex items-center gap-3 px-4 py-3 border-b" style={{ borderColor: "var(--line)" }}>
          <Search size={18} style={{ color: "var(--cyan)", flexShrink: 0 }} />
          <input
            ref={inputRef}
            value={query}
            onChange={(e) => setQuery(e.target.value)}
            placeholder="Métier, ville, concours, organisation…"
            className="flex-1 bg-transparent outline-none text-base font-semibold placeholder:text-muted/60"
            style={{ color: "var(--ink)" }}
            onKeyDown={(e) => {
              if (e.key === "Enter" && query.trim()) {
                window.location.href = `/jobs?q=${encodeURIComponent(query)}`;
              }
            }}
          />
          <button
            onClick={() => setOpen(false)}
            className="p-1 rounded hover:bg-line/50 transition-colors"
            aria-label="Fermer"
          >
            <X size={16} style={{ color: "var(--muted)" }} />
          </button>
        </div>

        <div className="max-h-[60vh] overflow-y-auto">
          {/* Job results */}
          {jobs.length > 0 && (
            <div className="px-2 py-2">
              <p className="px-2 py-1 text-xs font-black uppercase tracking-wide" style={{ color: "var(--muted)" }}>
                Offres
              </p>
              {jobs.map((job) => (
                <a
                  key={job.id}
                  href={`/jobs/${job.id}`}
                  onClick={() => setOpen(false)}
                  className="flex items-center gap-3 px-3 py-2.5 rounded-lg hover:bg-surface-soft transition-colors group"
                >
                  <span
                    className="flex-shrink-0 w-8 h-8 rounded-lg flex items-center justify-center text-xs font-black"
                    style={{ background: "var(--bg)", color: "var(--green)" }}
                  >
                    <Briefcase size={14} />
                  </span>
                  <div className="flex-1 min-w-0">
                    <p className="font-black text-sm truncate" style={{ color: "var(--ink-strong)" }}>{job.title}</p>
                    <p className="text-xs font-semibold truncate" style={{ color: "var(--muted)" }}>
                      {[job.company, job.city].filter(Boolean).join(" · ")}
                    </p>
                  </div>
                  <ArrowRight size={14} className="opacity-0 group-hover:opacity-100 transition-opacity flex-shrink-0" style={{ color: "var(--cyan)" }} />
                </a>
              ))}
              {query && (
                <a
                  href={`/jobs?q=${encodeURIComponent(query)}`}
                  onClick={() => setOpen(false)}
                  className="flex items-center gap-2 px-3 py-2 mt-1 rounded-lg text-sm font-black transition-colors"
                  style={{ color: "var(--green-deep)", background: "rgba(18,132,73,0.06)" }}
                >
                  <MapPin size={13} />
                  Voir tous les résultats pour «&nbsp;{query}&nbsp;»
                </a>
              )}
            </div>
          )}

          {loading && (
            <div className="flex items-center gap-2 px-4 py-3 text-sm" style={{ color: "var(--muted)" }}>
              <span className="inline-block w-3 h-3 rounded-full animate-pulse" style={{ background: "var(--cyan)" }} />
              Recherche en cours…
            </div>
          )}

          {/* Quick links */}
          {!query && (
            <div className="px-2 py-2">
              <p className="px-2 py-1 text-xs font-black uppercase tracking-wide" style={{ color: "var(--muted)" }}>
                Accès rapide
              </p>
              {QUICK_LINKS.map((link) => (
                <a
                  key={link.href}
                  href={link.href}
                  onClick={() => setOpen(false)}
                  className="flex items-center gap-3 px-3 py-2.5 rounded-lg hover:bg-surface-soft transition-colors group"
                >
                  <span
                    className="flex-shrink-0 w-8 h-8 rounded-lg flex items-center justify-center"
                    style={{ background: `${link.color}18`, color: link.color }}
                  >
                    <link.icon size={15} />
                  </span>
                  <span className="font-bold text-sm flex-1" style={{ color: "var(--ink)" }}>{link.label}</span>
                  <ArrowRight size={13} className="opacity-0 group-hover:opacity-100 transition-opacity" style={{ color: "var(--muted)" }} />
                </a>
              ))}
            </div>
          )}
        </div>

        <div
          className="flex items-center justify-between px-4 py-2 text-xs font-bold border-t"
          style={{ borderColor: "var(--line)", color: "var(--muted)", background: "var(--bg)" }}
        >
          <span>↵ Rechercher · Esc Fermer</span>
          <kbd className="px-1.5 py-0.5 rounded text-[10px] font-black border" style={{ borderColor: "var(--line)", color: "var(--muted)" }}>
            Ctrl+K
          </kbd>
        </div>
      </div>
    </div>
  );
}
