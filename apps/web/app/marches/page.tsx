import { ArrowRight, BarChart3, BriefcaseBusiness, MapPin, SearchCheck, ShieldCheck } from "lucide-react";
import type { Metadata } from "next";

import { SiteHeader } from "@/components/site-header";
import { MARKET_PAGES } from "@/lib/market-pages";

export const metadata: Metadata = {
  title: "Marches emploi par ville et secteur | Emplois Burkina",
  description:
    "Pages emploi par ville, secteur et mode de travail pour suivre les opportunites au Burkina Faso et attirer un trafic qualifie."
};

const GROUP_LABELS = {
  city: "Villes",
  sector: "Secteurs",
  work_mode: "Remote"
} as const;

export default function MarketIndexPage() {
  return (
    <div className="min-h-screen bg-background">
      <SiteHeader />

      <section className="border-b border-border bg-white">
        <div className="container py-10 lg:py-14">
          <div className="grid gap-8 lg:grid-cols-[1fr_0.42fr] lg:items-end">
            <div>
              <div className="mb-3 flex items-center gap-2">
                <BarChart3 size={17} className="text-primary" />
                <p className="text-xs font-black uppercase tracking-widest text-primary">Marches emploi</p>
              </div>
              <h1 className="max-w-4xl text-3xl font-black leading-tight text-foreground lg:text-5xl">
                Des pages locales et sectorielles pour capter la demande Google.
              </h1>
              <p className="mt-4 max-w-3xl text-sm font-semibold leading-relaxed text-muted-foreground lg:text-base">
                Chaque page marche regroupe les offres pertinentes, donne du contexte utile et ouvre une suite naturelle vers alertes, guides, services optionnels et recommandations.
              </p>
            </div>
            <div className="rounded-xl border border-border bg-muted/30 p-5">
              <SearchCheck size={18} className="text-primary" />
              <p className="mt-4 text-sm font-black text-foreground">Objectif revenu</p>
              <p className="mt-2 text-sm font-semibold leading-relaxed text-muted-foreground">
                Multiplier les portes d'entree organiques sans creer de contenu vide: ville, secteur, remote, concours et besoins candidats.
              </p>
            </div>
          </div>
        </div>
      </section>

      <section className="container py-8">
        <div className="grid gap-4 md:grid-cols-3">
          {[
            { icon: MapPin, title: "Pages locales", copy: "Ouagadougou, Bobo-Dioulasso et futures villes actives." },
            { icon: BriefcaseBusiness, title: "Pages secteurs", copy: "ONG, concours, tech, finance, sante et autres recherches recurrentes." },
            { icon: ShieldCheck, title: "Monetisation propre", copy: "Acces gratuit aux offres, revenus via contenu, services optionnels et trafic." }
          ].map((item) => (
            <article key={item.title} className="rounded-xl border border-border bg-white p-5 shadow-sm">
              <item.icon size={18} className="text-primary" />
              <h2 className="mt-4 text-base font-black text-foreground">{item.title}</h2>
              <p className="mt-2 text-sm font-semibold leading-relaxed text-muted-foreground">{item.copy}</p>
            </article>
          ))}
        </div>
      </section>

      <section className="border-y border-border bg-muted/30 py-10">
        <div className="container">
          <div className="grid gap-4 md:grid-cols-2 xl:grid-cols-4">
            {MARKET_PAGES.map((page) => (
              <a key={page.slug} href={`/marches/${page.slug}`} className="group rounded-xl border border-border bg-white p-5 shadow-sm transition-all hover:-translate-y-0.5 hover:border-primary hover:shadow-md">
                <div className="flex items-start justify-between gap-3">
                  <span className="rounded-full bg-primary/10 px-3 py-1 text-[11px] font-black uppercase tracking-wide text-primary">
                    {GROUP_LABELS[page.kind]}
                  </span>
                  <ArrowRight size={14} className="mt-1 text-muted-foreground transition-transform group-hover:translate-x-0.5 group-hover:text-primary" />
                </div>
                <h2 className="mt-4 text-lg font-black leading-snug text-foreground group-hover:text-primary">{page.title}</h2>
                <p className="mt-2 text-sm font-semibold leading-relaxed text-muted-foreground">{page.description}</p>
                <div className="mt-4 border-t border-border pt-3 text-xs font-bold text-muted-foreground">
                  {page.revenueAngle}
                </div>
              </a>
            ))}
          </div>
        </div>
      </section>
    </div>
  );
}
