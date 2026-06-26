import { ArrowLeft, ArrowRight, BarChart3, Bell, Briefcase, MapPin, SearchCheck, ShieldCheck } from "lucide-react";
import type { Metadata } from "next";
import { notFound } from "next/navigation";
import type { JobOpportunity } from "@emplois-burkina/domain";

import { JobCard } from "@/components/job-card";
import { SiteHeader } from "@/components/site-header";
import { getJobs } from "@/lib/data";
import { getMarketPage, MARKET_PAGES, type MarketPage } from "@/lib/market-pages";

type MarketDetailProps = {
  params: Promise<{ slug: string }>;
};

export function generateStaticParams() {
  return MARKET_PAGES.map((page) => ({ slug: page.slug }));
}

export async function generateMetadata({ params }: MarketDetailProps): Promise<Metadata> {
  const { slug } = await params;
  const page = getMarketPage(slug);

  if (!page) {
    return {};
  }

  return {
    title: `${page.title} | Emplois Burkina`,
    description: page.description
  };
}

function lower(value?: string) {
  return (value || "").toLowerCase();
}

function matchesMarket(job: JobOpportunity, page: MarketPage) {
  if (page.filter.city && job.city !== page.filter.city) {
    return false;
  }

  const haystack = lower([job.title, job.company, job.city, job.category, job.type, ...(job.tags || [])].join(" "));
  const categoryMatch = page.filter.categoryIncludes?.some((item) => lower(job.category).includes(lower(item)));
  const queryMatch = page.filter.queryTerms?.some((term) => haystack.includes(lower(term)));

  if (page.filter.categoryIncludes?.length || page.filter.queryTerms?.length) {
    return Boolean(categoryMatch || queryMatch);
  }

  return true;
}

function jobsHref(page: MarketPage) {
  if (page.filter.city) {
    return `/jobs?city=${encodeURIComponent(page.filter.city)}`;
  }

  const category = page.filter.categoryIncludes?.[0];
  if (category) {
    return `/jobs?category=${encodeURIComponent(category)}`;
  }

  const q = page.filter.queryTerms?.[0] || "";
  return `/jobs?q=${encodeURIComponent(q)}`;
}

export default async function MarketDetailPage({ params }: MarketDetailProps) {
  const { slug } = await params;
  const page = getMarketPage(slug);

  if (!page) {
    notFound();
  }

  const jobs = await getJobs();
  const relatedJobs = jobs.filter((job) => matchesMarket(job, page)).slice(0, 6);
  const trusted = relatedJobs.filter((job) => (job.confidenceScore || 0) >= 80).length;
  const withDeadline = relatedJobs.filter((job) => Boolean(job.closingDate || job.deadline)).length;
  const allJobsHref = jobsHref(page);

  return (
    <div className="min-h-screen bg-background">
      <SiteHeader />

      <section className="border-b border-border bg-white">
        <div className="container py-8 lg:py-12">
          <a href="/marches" className="mb-6 inline-flex items-center gap-2 text-sm font-black text-primary hover:underline">
            <ArrowLeft size={14} /> Tous les marches
          </a>

          <div className="grid gap-8 lg:grid-cols-[1fr_0.38fr] lg:items-start">
            <div>
              <div className="mb-3 flex items-center gap-2">
                <BarChart3 size={17} className="text-primary" />
                <p className="text-xs font-black uppercase tracking-widest text-primary">Page marche</p>
              </div>
              <h1 className="max-w-4xl text-3xl font-black leading-tight text-foreground lg:text-5xl">{page.title}</h1>
              <p className="mt-4 max-w-3xl text-sm font-semibold leading-relaxed text-muted-foreground lg:text-base">
                {page.description}
              </p>
              <div className="mt-5 flex flex-wrap gap-2">
                <span className="rounded-full border border-border bg-muted/40 px-3 py-1 text-xs font-black text-muted-foreground">
                  {relatedJobs.length} offres liees
                </span>
                <span className="rounded-full border border-border bg-muted/40 px-3 py-1 text-xs font-black text-muted-foreground">
                  {trusted} tres fiables
                </span>
                <span className="rounded-full border border-border bg-muted/40 px-3 py-1 text-xs font-black text-muted-foreground">
                  {withDeadline} avec deadline
                </span>
              </div>
            </div>

            <aside className="rounded-xl border border-border bg-muted/30 p-5">
              <SearchCheck size={18} className="text-primary" />
              <p className="mt-4 text-sm font-black text-foreground">Angle revenu</p>
              <p className="mt-2 text-sm font-semibold leading-relaxed text-muted-foreground">{page.revenueAngle}</p>
              <div className="mt-4 grid gap-2">
                <a href={allJobsHref} className="inline-flex h-10 items-center justify-center gap-2 rounded-xl bg-primary px-4 text-sm font-black text-primary-foreground transition-transform hover:-translate-y-0.5">
                  Voir les offres <ArrowRight size={14} />
                </a>
                <a href={page.serviceHref} className="inline-flex h-10 items-center justify-center gap-2 rounded-xl border border-border bg-white px-4 text-sm font-black text-foreground transition-colors hover:bg-accent">
                  Aide optionnelle <ArrowRight size={14} />
                </a>
              </div>
            </aside>
          </div>
        </div>
      </section>

      <main className="container grid gap-8 py-10 lg:grid-cols-[1fr_0.36fr]">
        <div className="grid gap-8">
          <section>
            <div className="mb-5 flex flex-col gap-2 md:flex-row md:items-end md:justify-between">
              <div>
                <p className="text-xs font-black uppercase tracking-widest text-primary">Offres associees</p>
                <h2 className="mt-2 text-2xl font-black text-foreground">Opportunites pertinentes</h2>
              </div>
              <a href={allJobsHref} className="inline-flex items-center gap-2 text-sm font-black text-primary hover:underline">
                Tout explorer <ArrowRight size={14} />
              </a>
            </div>

            {relatedJobs.length > 0 ? (
              <div className="grid gap-4 md:grid-cols-2 xl:grid-cols-3">
                {relatedJobs.map((job) => (
                  <JobCard key={job.id} job={job} compact />
                ))}
              </div>
            ) : (
              <div className="rounded-xl border border-border bg-white p-6">
                <Briefcase size={18} className="text-primary" />
                <h3 className="mt-4 text-lg font-black text-foreground">Aucune offre active dans cette selection</h3>
                <p className="mt-2 text-sm font-semibold leading-relaxed text-muted-foreground">
                  La page reste utile pour capter la recherche et peut etre enrichie automatiquement quand de nouvelles offres arrivent.
                </p>
              </div>
            )}
          </section>

          <section className="grid gap-4 md:grid-cols-2">
            {page.contentBlocks.map((block) => (
              <article key={block.title} className="rounded-xl border border-border bg-white p-5 shadow-sm">
                <ShieldCheck size={18} className="text-primary" />
                <h2 className="mt-4 text-lg font-black text-foreground">{block.title}</h2>
                <p className="mt-2 text-sm font-semibold leading-relaxed text-muted-foreground">{block.body}</p>
              </article>
            ))}
          </section>
        </div>

        <aside className="grid gap-4 self-start lg:sticky lg:top-24">
          <div className="rounded-xl border border-border bg-white p-5 shadow-sm">
            <Bell size={18} className="text-primary" />
            <h2 className="mt-4 text-base font-black text-foreground">Alertes gratuites</h2>
            <p className="mt-2 text-sm font-semibold leading-relaxed text-muted-foreground">
              Les candidats peuvent suivre ce marche sans payer l'acces aux offres.
            </p>
            <a href="/jobs#alertes" className="mt-4 inline-flex h-10 w-full items-center justify-center gap-2 rounded-xl border border-border text-sm font-black text-foreground transition-colors hover:bg-accent">
              Activer une alerte <ArrowRight size={14} />
            </a>
          </div>

          <div className="rounded-xl border border-border bg-white p-5 shadow-sm">
            <MapPin size={18} className="text-primary" />
            <h2 className="mt-4 text-base font-black text-foreground">Guide associe</h2>
            <p className="mt-2 text-sm font-semibold leading-relaxed text-muted-foreground">
              Lire le contenu pratique pour ameliorer le dossier avant de postuler.
            </p>
            <a href={page.guideHref} className="mt-4 inline-flex h-10 w-full items-center justify-center gap-2 rounded-xl bg-foreground text-sm font-black text-white transition-transform hover:-translate-y-0.5">
              Lire le guide <ArrowRight size={14} />
            </a>
          </div>
        </aside>
      </main>
    </div>
  );
}
