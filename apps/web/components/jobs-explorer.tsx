"use client";

import { useCallback, useEffect, useRef, useState } from "react";
import {
  Bell, BookmarkCheck, BookmarkPlus, Filter,
  LayoutGrid, LayoutList, Loader2, Search, SlidersHorizontal, X
} from "lucide-react";
import type { JobOpportunity } from "@emplois-burkina/domain";
import { JobCard } from "@/components/job-card";
import { AlertModal } from "@/components/alert-modal";
import { Badge } from "@/components/ui/badge";
import { Input } from "@/components/ui/input";
import { Select } from "@/components/ui/select";
import { JobCardSkeleton } from "@/components/ui/skeleton";
import { cn } from "@/lib/utils";

type Props = {
  categories: string[];
  cities: string[];
  initialQuery?: string;
  initialCity?: string;
  initialCategory?: string;
  initialSort?: string;
};

const SORT_OPTIONS = [
  { value: "relevance", label: "Pertinence" },
  { value: "recent", label: "Plus récentes" },
  { value: "confidence", label: "Plus fiables" },
  { value: "deadline", label: "Deadline proche" }
];

const FAV_KEY = "eb_favorites";

function readFavs(): string[] {
  try { return JSON.parse(localStorage.getItem(FAV_KEY) || "[]"); } catch { return []; }
}

export function JobsExplorer({ categories, cities, initialQuery = "", initialCity = "", initialCategory = "", initialSort = "relevance" }: Props) {
  const [query, setQuery] = useState(initialQuery);
  const [city, setCity] = useState(initialCity);
  const [category, setCategory] = useState(initialCategory);
  const [sort, setSort] = useState(initialSort);
  const [view, setView] = useState<"grid" | "list">("grid");
  const [filtersOpen, setFiltersOpen] = useState(false);
  const [alertOpen, setAlertOpen] = useState(false);
  const [favs, setFavs] = useState<string[]>([]);

  // Infinite scroll state
  const [jobs, setJobs] = useState<JobOpportunity[]>([]);
  const [page, setPage] = useState(0);
  const [total, setTotal] = useState(0);
  const [hasMore, setHasMore] = useState(true);
  const [loading, setLoading] = useState(false);
  const [initialLoading, setInitialLoading] = useState(true);
  const [newItemIds, setNewItemIds] = useState<Set<string>>(new Set());

  const loaderRef = useRef<HTMLDivElement>(null);
  const abortRef = useRef<AbortController | null>(null);

  // Debounced fetch trigger
  const fetchRef = useRef<ReturnType<typeof setTimeout> | null>(null);

  useEffect(() => { setFavs(readFavs()); }, []);

  const fetchJobs = useCallback(async (pageNum: number, reset: boolean) => {
    if (abortRef.current) abortRef.current.abort();
    const ctrl = new AbortController();
    abortRef.current = ctrl;
    setLoading(true);

    try {
      const params = new URLSearchParams({
        q: query, city, category, sort,
        page: String(pageNum), limit: "12"
      });
      const res = await fetch(`/api/jobs?${params}`, { signal: ctrl.signal });
      if (!res.ok) throw new Error();
      const data = await res.json() as { jobs: JobOpportunity[]; total: number; hasMore: boolean };
      setJobs((prev) => {
        const next = reset ? data.jobs : [...prev, ...data.jobs];
        if (!reset) {
          const ids = new Set(data.jobs.map((j) => j.id));
          setNewItemIds(ids);
          setTimeout(() => setNewItemIds(new Set()), 800);
        }
        return next;
      });
      setTotal(data.total);
      setHasMore(data.hasMore);
    } catch (err) {
      if ((err as Error).name !== "AbortError") {
        setHasMore(false);
      }
    } finally {
      setLoading(false);
      setInitialLoading(false);
    }
  }, [query, city, category, sort]);

  // Reset and reload when filters change
  useEffect(() => {
    setInitialLoading(true);
    setPage(0);
    if (fetchRef.current) clearTimeout(fetchRef.current);
    fetchRef.current = setTimeout(() => { void fetchJobs(0, true); }, 250);
    return () => { if (fetchRef.current) clearTimeout(fetchRef.current); };
  }, [query, city, category, sort, fetchJobs]);

  // Load next page when sentinel is visible
  useEffect(() => {
    if (!hasMore || loading) return;
    const sentinel = loaderRef.current;
    if (!sentinel) return;

    const obs = new IntersectionObserver(
      (entries) => {
        if (entries[0]?.isIntersecting && hasMore && !loading) {
          const next = page + 1;
          setPage(next);
          void fetchJobs(next, false);
        }
      },
      { threshold: 0.1, rootMargin: "200px" }
    );
    obs.observe(sentinel);
    return () => obs.disconnect();
  }, [hasMore, loading, page, fetchJobs]);

  function toggleFav(id: string) {
    const next = favs.includes(id) ? favs.filter((f) => f !== id) : [id, ...favs];
    setFavs(next);
    localStorage.setItem(FAV_KEY, JSON.stringify(next));
  }

  const hasActiveFilters = Boolean(query || city || category);

  return (
    <div className="flex gap-6 items-start">

      {/* ── Sidebar desktop ── */}
      <aside className="hidden lg:block w-64 shrink-0 sticky top-20">
        <div className="rounded-2xl border border-border bg-white p-5 grid gap-5">
          <p className="font-black text-foreground text-sm flex items-center gap-2">
            <SlidersHorizontal size={14} className="text-primary" />
            Filtres
          </p>

          <div className="grid gap-4">
            <div className="grid gap-1.5">
              <label className="text-xs font-black text-muted-foreground uppercase tracking-wide">Mot-clé</label>
              <div className="relative">
                <Search size={13} className="absolute left-3 top-1/2 -translate-y-1/2 text-muted-foreground pointer-events-none" />
                <Input value={query} onChange={(e) => setQuery(e.target.value)} placeholder="Titre, secteur…" className="pl-8 h-9 text-xs" />
              </div>
            </div>

            <div className="grid gap-1.5">
              <label className="text-xs font-black text-muted-foreground uppercase tracking-wide">Ville</label>
              <Select value={city} onChange={(e) => setCity(e.target.value)} className="h-9 text-xs">
                <option value="">Toutes les villes</option>
                {cities.map((c) => <option key={c}>{c}</option>)}
              </Select>
            </div>

            <div className="grid gap-1.5">
              <label className="text-xs font-black text-muted-foreground uppercase tracking-wide">Secteur</label>
              <Select value={category} onChange={(e) => setCategory(e.target.value)} className="h-9 text-xs">
                <option value="">Tous les secteurs</option>
                {categories.map((c) => <option key={c}>{c}</option>)}
              </Select>
            </div>

            <div className="grid gap-1.5">
              <label className="text-xs font-black text-muted-foreground uppercase tracking-wide">Trier par</label>
              <Select value={sort} onChange={(e) => setSort(e.target.value)} className="h-9 text-xs">
                {SORT_OPTIONS.map((o) => <option key={o.value} value={o.value}>{o.label}</option>)}
              </Select>
            </div>
          </div>

          {hasActiveFilters && (
            <button
              onClick={() => { setQuery(""); setCity(""); setCategory(""); setSort("relevance"); }}
              className="text-xs font-black text-destructive hover:underline text-left flex items-center gap-1"
            >
              <X size={10} /> Effacer les filtres
            </button>
          )}

          <div className="border-t border-border pt-4">
            <button
              onClick={() => setAlertOpen(true)}
              className="flex items-center justify-center gap-2 w-full h-9 rounded-lg border border-border text-xs font-black text-muted-foreground hover:bg-muted transition-colors"
            >
              <Bell size={13} /> Créer une alerte WhatsApp
            </button>
          </div>

          <div className="rounded-xl bg-muted/60 p-4">
            <p className="text-2xl font-black text-foreground tabular-nums">{total}</p>
            <p className="text-xs text-muted-foreground font-semibold mt-0.5">
              offre{total !== 1 ? "s" : ""} {hasActiveFilters ? "filtrées" : "disponibles"}
            </p>
          </div>
        </div>
      </aside>

      {/* ── Main content ── */}
      <div className="flex-1 min-w-0">

        {/* Toolbar */}
        <div className="flex items-center gap-2 mb-4 flex-wrap">
          {/* Mobile search */}
          <div className="flex gap-2 flex-1 min-w-0 lg:hidden">
            <div className="relative flex-1">
              <Search size={13} className="absolute left-3 top-1/2 -translate-y-1/2 text-muted-foreground" />
              <Input value={query} onChange={(e) => setQuery(e.target.value)} placeholder="Rechercher…" className="pl-8 h-9 text-xs" />
            </div>
            <button
              onClick={() => setFiltersOpen(!filtersOpen)}
              className="flex items-center justify-center w-9 h-9 rounded-lg border border-border text-muted-foreground hover:bg-muted"
            >
              <Filter size={14} />
            </button>
          </div>

          {/* Total (desktop) */}
          <p className="hidden lg:block text-sm font-semibold text-muted-foreground whitespace-nowrap">
            <strong className="text-foreground font-black">{total}</strong> offre{total !== 1 ? "s" : ""}
          </p>

          {/* View + sort */}
          <div className="flex items-center gap-2 ml-auto shrink-0">
            <div className="hidden sm:flex border border-border rounded-lg overflow-hidden">
              {(["grid", "list"] as const).map((v) => (
                <button
                  key={v}
                  onClick={() => setView(v)}
                  className={cn("px-2.5 py-1.5 transition-colors", v !== "grid" && "border-l border-border",
                    view === v ? "bg-primary text-white" : "text-muted-foreground hover:bg-muted")}
                >
                  {v === "grid" ? <LayoutGrid size={13} /> : <LayoutList size={13} />}
                </button>
              ))}
            </div>
            <div className="hidden sm:block">
              <Select value={sort} onChange={(e) => setSort(e.target.value)} className="h-9 text-xs">
                {SORT_OPTIONS.map((o) => <option key={o.value} value={o.value}>{o.label}</option>)}
              </Select>
            </div>
            <button
              onClick={() => setAlertOpen(true)}
              className="flex items-center gap-1.5 h-9 px-3 rounded-lg border border-border text-xs font-black text-muted-foreground hover:bg-muted transition-colors whitespace-nowrap"
            >
              <Bell size={12} /> Alerte
            </button>
          </div>
        </div>

        {/* Mobile filters drawer */}
        {filtersOpen && (
          <div className="lg:hidden mb-4 p-4 rounded-xl border border-border bg-white grid gap-3 animate-slide-in">
            <div className="grid grid-cols-2 gap-3">
              <div className="grid gap-1">
                <label className="text-xs font-black text-muted-foreground uppercase">Ville</label>
                <Select value={city} onChange={(e) => setCity(e.target.value)} className="h-9 text-xs">
                  <option value="">Toutes</option>
                  {cities.map((c) => <option key={c}>{c}</option>)}
                </Select>
              </div>
              <div className="grid gap-1">
                <label className="text-xs font-black text-muted-foreground uppercase">Secteur</label>
                <Select value={category} onChange={(e) => setCategory(e.target.value)} className="h-9 text-xs">
                  <option value="">Tous</option>
                  {categories.map((c) => <option key={c}>{c}</option>)}
                </Select>
              </div>
            </div>
            <Select value={sort} onChange={(e) => setSort(e.target.value)} className="h-9 text-xs">
              {SORT_OPTIONS.map((o) => <option key={o.value} value={o.value}>{o.label}</option>)}
            </Select>
            {hasActiveFilters && (
              <button onClick={() => { setQuery(""); setCity(""); setCategory(""); }}
                className="text-xs font-black text-destructive text-left flex items-center gap-1">
                <X size={10} /> Effacer
              </button>
            )}
          </div>
        )}

        {/* Active filter badges */}
        {hasActiveFilters && (
          <div className="flex flex-wrap gap-2 mb-4">
            {query && <Badge variant="secondary" className="gap-1 text-xs">{query} <button onClick={() => setQuery("")} className="opacity-60 hover:opacity-100 ml-0.5">×</button></Badge>}
            {city && <Badge variant="secondary" className="gap-1 text-xs">{city} <button onClick={() => setCity("")} className="opacity-60 hover:opacity-100 ml-0.5">×</button></Badge>}
            {category && <Badge variant="secondary" className="gap-1 text-xs">{category} <button onClick={() => setCategory("")} className="opacity-60 hover:opacity-100 ml-0.5">×</button></Badge>}
          </div>
        )}

        {/* Initial skeleton */}
        {initialLoading && (
          <div className={cn("grid gap-4", view === "grid" ? "grid-cols-1 sm:grid-cols-2 xl:grid-cols-3" : "grid-cols-1")}>
            {Array.from({ length: 6 }).map((_, i) => <JobCardSkeleton key={i} />)}
          </div>
        )}

        {/* Job grid with animations */}
        {!initialLoading && jobs.length > 0 && (
          <div className={cn("grid gap-4", view === "grid" ? "grid-cols-1 sm:grid-cols-2 xl:grid-cols-3" : "grid-cols-1")}>
            {jobs.map((job) => (
              <div
                key={job.id}
                className={cn(
                  "relative transition-all duration-500",
                  newItemIds.has(job.id) ? "animate-slide-in" : ""
                )}
              >
                {/* Fav button */}
                <button
                  onClick={() => toggleFav(job.id)}
                  aria-label={favs.includes(job.id) ? "Retirer des favoris" : "Ajouter aux favoris"}
                  className={cn(
                    "absolute top-3 right-3 z-10 w-8 h-8 rounded-full flex items-center justify-center border transition-colors",
                    favs.includes(job.id)
                      ? "bg-primary text-white border-primary"
                      : "bg-white/90 text-muted-foreground border-border hover:text-primary hover:border-primary"
                  )}
                >
                  {favs.includes(job.id)
                    ? <BookmarkCheck size={13} />
                    : <BookmarkPlus size={13} />}
                </button>
                <JobCard job={job} compact={view === "list"} />
              </div>
            ))}
          </div>
        )}

        {/* Empty state */}
        {!initialLoading && jobs.length === 0 && !loading && (
          <div className="flex flex-col items-center justify-center py-20 gap-4 text-center">
            <div className="w-16 h-16 rounded-full bg-muted flex items-center justify-center">
              <Search size={22} className="text-muted-foreground" />
            </div>
            <div>
              <p className="font-black text-foreground">Aucune offre trouvée</p>
              <p className="text-sm text-muted-foreground font-semibold mt-1">
                Essayez d'élargir la ville, le secteur ou le mot-clé.
              </p>
            </div>
            <button
              onClick={() => { setQuery(""); setCity(""); setCategory(""); }}
              className="h-9 px-4 rounded-xl border border-border text-sm font-black hover:bg-muted transition-colors"
            >
              Voir toutes les offres
            </button>
          </div>
        )}

        {/* Infinite scroll sentinel */}
        <div ref={loaderRef} className="flex justify-center py-8">
          {loading && !initialLoading && (
            <div className="flex items-center gap-2 text-sm text-muted-foreground font-semibold">
              <Loader2 size={16} className="animate-spin text-primary" />
              Chargement d'autres offres…
            </div>
          )}
          {!hasMore && jobs.length > 0 && (
            <p className="text-xs text-muted-foreground font-semibold">
              ✓ Toutes les {total} offres affichées
            </p>
          )}
        </div>
      </div>

      <AlertModal open={alertOpen} onClose={() => setAlertOpen(false)} defaultQuery={query} defaultCity={city} />
    </div>
  );
}
