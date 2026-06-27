import { ArrowRight, Bot, Gauge, RadioTower, ShieldCheck, type LucideIcon } from "lucide-react";
import type { AutomationOverview, ScrapingOverview } from "@emplois-burkina/domain";

type HomeScrapingPulseProps = {
  scraping: ScrapingOverview;
  automation: AutomationOverview;
};

function Metric({ label, value, icon: Icon }: { label: string; value: string | number; icon: LucideIcon }) {
  return (
    <article className="rounded-xl border border-white/10 bg-white/10 p-4 text-white">
      <Icon size={17} className="text-emerald-300" />
      <p className="mt-3 text-2xl font-black">{value}</p>
      <p className="mt-1 text-[11px] font-black uppercase tracking-wide text-white/60">{label}</p>
    </article>
  );
}

export function HomeScrapingPulse({ scraping, automation }: HomeScrapingPulseProps) {
  const topSources = scraping.topSources.slice(0, 4);

  return (
    <section className="border-y border-border bg-foreground text-white">
      <div className="container grid gap-8 py-10 lg:grid-cols-[0.85fr_1.15fr] lg:items-center">
        <div>
          <p className="inline-flex items-center gap-2 text-xs font-black uppercase tracking-widest text-emerald-300">
            <RadioTower size={15} />
            Scraping pulse
          </p>
          <h2 className="mt-3 max-w-2xl text-2xl font-black leading-tight lg:text-3xl">
            Un moteur de collecte actif, utile et monétisable.
          </h2>
          <p className="mt-3 max-w-xl text-sm font-semibold leading-relaxed text-white/68">
            Les sources sont suivies, scorées et reliées aux canaux web/mobile. Les meilleures offres nourrissent le SEO,
            les alertes WhatsApp et les services candidats sans rendre les offres payantes.
          </p>
          <div className="mt-5 flex flex-wrap gap-2">
            <a
              href="/operations"
              className="inline-flex h-10 items-center justify-center gap-2 rounded-xl bg-white px-4 text-sm font-black text-foreground transition-transform hover:-translate-y-0.5"
            >
              Voir les opérations
              <ArrowRight size={15} />
            </a>
            <a
              href="/services"
              data-analytics-source="home_scraping_pulse"
              data-analytics-label="services"
              className="inline-flex h-10 items-center justify-center gap-2 rounded-xl border border-white/15 px-4 text-sm font-black text-white transition-colors hover:bg-white/10"
            >
              Services candidats
            </a>
          </div>
        </div>

        <div className="grid gap-4">
          <div className="grid gap-3 sm:grid-cols-4">
            <Metric label="Items collectés" value={scraping.rawItems} icon={Bot} />
            <Metric label="Sources actives" value={scraping.automatedSources} icon={RadioTower} />
            <Metric label="Santé moyenne" value={`${scraping.healthAverage}%`} icon={Gauge} />
            <Metric label="Prêtes à publier" value={automation.readyToPublish} icon={ShieldCheck} />
          </div>

          <div className="grid gap-2 rounded-xl border border-white/10 bg-white/5 p-4">
            <div className="flex items-center justify-between gap-3">
              <h3 className="text-sm font-black">Sources en tête</h3>
              <span className="text-[11px] font-black uppercase tracking-wide text-white/48">Qualité + volume</span>
            </div>
            <div className="grid gap-2 md:grid-cols-2">
              {topSources.map((source) => (
                <div key={source.id} className="rounded-lg border border-white/10 bg-white/7 px-3 py-2">
                  <div className="flex items-center justify-between gap-3">
                    <p className="min-w-0 truncate text-xs font-black text-white">{source.name}</p>
                    <span className="shrink-0 text-xs font-black text-emerald-300">{source.healthScore}%</span>
                  </div>
                  <p className="mt-1 text-[11px] font-semibold text-white/55">
                    {source.publishedJobs} offres - {source.rawItems} items
                  </p>
                </div>
              ))}
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
