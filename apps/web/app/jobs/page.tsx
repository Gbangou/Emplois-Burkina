import { Briefcase, CheckCircle, SlidersHorizontal } from "lucide-react";
import type { Metadata } from "next";
import { SiteHeader } from "@/components/site-header";
import { Badge } from "@/components/ui/badge";
import { JobsExplorer } from "@/components/jobs-explorer";
import { getJobs, scoreJob } from "@/lib/data";

export const metadata: Metadata = {
  title: "Offres d'emploi au Burkina Faso | Emplois Burkina",
  description: "Parcourez toutes les offres d'emploi, concours et stages au Burkina Faso. Filtrez par ville, secteur et type. Offres vérifiées avec score de confiance."
};

type JobsPageProps = {
  searchParams?: Promise<Record<string, string | string[] | undefined>>;
};

function one(value: string | string[] | undefined) {
  return Array.isArray(value) ? value[0] || "" : value || "";
}

export default async function JobsPage({ searchParams }: JobsPageProps) {
  const params = (await searchParams) || {};
  const q = one(params.q).trim();
  const city = one(params.city).trim();
  const category = one(params.category).trim();
  const sort = one(params.sort).trim() || "relevance";

  const jobs = await getJobs();
  const categories = Array.from(new Set(jobs.map((j) => j.category).filter(Boolean))).sort() as string[];
  const cities = Array.from(new Set(jobs.map((j) => j.city).filter(Boolean))).sort() as string[];

  const filtered = jobs
    .filter((j) => !q || [j.title, j.company, j.city, j.category, j.type, ...(j.tags || [])].join(" ").toLowerCase().includes(q.toLowerCase()))
    .filter((j) => !city || j.city === city)
    .filter((j) => !category || j.category === category)
    .sort((a, b) => {
      if (sort === "deadline") return String(a.closingDate || "9999").localeCompare(String(b.closingDate || "9999"));
      if (sort === "confidence") return (b.confidenceScore || 0) - (a.confidenceScore || 0);
      return scoreJob(b, q) - scoreJob(a, q);
    });

  const dated = filtered.filter((j) => Boolean(j.closingDate)).length;
  const trusted = filtered.filter((j) => (j.confidenceScore || 0) >= 80).length;

  return (
    <div className="min-h-screen bg-background">
      <SiteHeader />

      {/* Page hero */}
      <div className="border-b border-border bg-white">
        <div className="container py-8">
          <div className="flex flex-col sm:flex-row sm:items-end justify-between gap-4">
            <div>
              <div className="flex items-center gap-2 mb-2">
                <Briefcase size={16} className="text-primary" />
                <p className="text-xs font-black text-primary uppercase tracking-widest">Catalogue offres</p>
              </div>
              <h1 className="text-2xl lg:text-3xl font-black text-foreground">
                Offres d'emploi au Burkina Faso
              </h1>
              <p className="text-muted-foreground font-semibold mt-1 text-sm">
                {q || city || category
                  ? `${filtered.length} résultats${q ? ` pour "${q}"` : ""}${city ? ` à ${city}` : ""}${category ? ` · ${category}` : ""}`
                  : "Emploi formel, informel, ONG, concours — tout le pays."}
              </p>
            </div>

            {/* Stats */}
            <div className="flex gap-3 flex-wrap">
              <div className="flex items-center gap-2 bg-emerald-50 border border-emerald-200 rounded-xl px-4 py-2.5">
                <CheckCircle size={14} className="text-emerald-600 shrink-0" />
                <div>
                  <p className="text-lg font-black text-emerald-800 leading-none">{filtered.length}</p>
                  <p className="text-xs text-emerald-700 font-semibold">offres actives</p>
                </div>
              </div>
              <div className="flex items-center gap-2 bg-blue-50 border border-blue-200 rounded-xl px-4 py-2.5">
                <SlidersHorizontal size={14} className="text-blue-600 shrink-0" />
                <div>
                  <p className="text-lg font-black text-blue-800 leading-none">{dated}</p>
                  <p className="text-xs text-blue-700 font-semibold">avec deadline</p>
                </div>
              </div>
              <div className="hidden sm:flex items-center gap-2 bg-violet-50 border border-violet-200 rounded-xl px-4 py-2.5">
                <CheckCircle size={14} className="text-violet-600 shrink-0" />
                <div>
                  <p className="text-lg font-black text-violet-800 leading-none">{trusted}</p>
                  <p className="text-xs text-violet-700 font-semibold">très fiables</p>
                </div>
              </div>
            </div>
          </div>

          {/* Active filters */}
          {(q || city || category) && (
            <div className="flex flex-wrap gap-2 mt-4">
              <span className="text-xs font-black text-muted-foreground">Filtres actifs :</span>
              {q && <Badge variant="secondary">Recherche : {q}</Badge>}
              {city && <Badge variant="secondary">Ville : {city}</Badge>}
              {category && <Badge variant="secondary">Secteur : {category}</Badge>}
              <a href="/jobs" className="text-xs font-black text-destructive hover:underline">
                Effacer tout
              </a>
            </div>
          )}
        </div>
      </div>

      {/* Explorer */}
      <div className="container py-6">
        <JobsExplorer
          categories={categories}
          cities={cities}
          initialQuery={q}
          initialCity={city}
          initialCategory={category}
          initialSort={sort}
        />
      </div>
    </div>
  );
}
