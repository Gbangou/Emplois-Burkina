import { ArrowUpRight, Bot, RadioTower, SearchCheck, ShieldCheck, Smartphone, TrendingUp } from "lucide-react";
import type { ScrapingBusinessPlan } from "@/lib/scraping-business";

type ScrapingBusinessBoardProps = {
  plan: ScrapingBusinessPlan;
};

function Metric({ label, value, icon: Icon }: { label: string; value: string | number; icon: React.ElementType }) {
  return (
    <article className="rounded-xl border border-border bg-white p-4 shadow-sm">
      <Icon size={17} className="text-primary" />
      <p className="mt-3 text-2xl font-black text-foreground">{value}</p>
      <p className="mt-1 text-xs font-black uppercase tracking-wide text-muted-foreground">{label}</p>
    </article>
  );
}

export function ScrapingBusinessBoard({ plan }: ScrapingBusinessBoardProps) {
  return (
    <section className="section">
      <div className="section-head">
        <div>
          <p className="eyebrow">Scraping business</p>
          <h2>Transformer les sources en trafic, audience mobile et revenus.</h2>
        </div>
        <p>
          Cette lecture priorise les segments qui peuvent produire du contenu SEO, des alertes mobiles,
          des conversions services et des donnees marche anonymisees.
        </p>
      </div>

      <div className="grid gap-4 md:grid-cols-4">
        <Metric label="Sources totales" value={plan.totalSources} icon={SearchCheck} />
        <Metric label="Sources automatisees" value={plan.automatedSources} icon={Bot} />
        <Metric label="Pretes SEO" value={plan.seoReadySources} icon={TrendingUp} />
        <Metric label="Potentiel mobile" value={plan.mobileReadySources} icon={Smartphone} />
      </div>

      <div className="mt-4 grid gap-4 xl:grid-cols-[1.1fr_0.9fr]">
        <div className="rounded-xl border border-border bg-white p-4 shadow-sm">
          <div className="flex items-center gap-2">
            <RadioTower size={17} className="text-primary" />
            <h3 className="text-sm font-black text-foreground">Segments a plus fort potentiel</h3>
          </div>
          <div className="mt-3 grid gap-3">
            {plan.topSegments.map((segment) => (
              <article key={segment.id} className="rounded-lg border border-border bg-muted/30 p-3">
                <div className="flex flex-col gap-2 sm:flex-row sm:items-start sm:justify-between">
                  <div>
                    <div className="flex flex-wrap gap-2">
                      <span className="rounded-full border border-border bg-white px-2 py-0.5 text-[10px] font-black uppercase tracking-wide text-muted-foreground">
                        {segment.priority}
                      </span>
                      <span className="rounded-full bg-primary/10 px-2 py-0.5 text-[10px] font-black uppercase tracking-wide text-primary">
                        {segment.monetizationScore}% business
                      </span>
                    </div>
                    <h4 className="mt-2 text-sm font-black text-foreground">{segment.name}</h4>
                  </div>
                  <p className="shrink-0 text-xs font-black text-muted-foreground">
                    {segment.automatedCount}/{segment.sourceCount} auto
                  </p>
                </div>
                <p className="mt-2 text-xs font-semibold leading-relaxed text-muted-foreground">{segment.revenueAngle}</p>
                <p className="mt-2 flex gap-2 text-xs font-bold leading-relaxed text-muted-foreground">
                  <ArrowUpRight size={13} className="mt-0.5 shrink-0 text-primary" />
                  {segment.nextAction}
                </p>
              </article>
            ))}
          </div>
        </div>

        <div className="rounded-xl border border-border bg-white p-4 shadow-sm">
          <div className="flex items-center gap-2">
            <ShieldCheck size={17} className="text-primary" />
            <h3 className="text-sm font-black text-foreground">Sources a upgrader prudemment</h3>
          </div>
          <div className="mt-3 grid gap-2">
            {plan.upgradeCandidates.map((source) => (
              <article key={source.id} className="rounded-lg border border-border bg-muted/30 p-3">
                <div className="flex items-center justify-between gap-3">
                  <p className="min-w-0 truncate text-xs font-black text-foreground">{source.name}</p>
                  <span className="shrink-0 rounded-full border border-border bg-white px-2 py-0.5 text-[10px] font-black uppercase tracking-wide text-muted-foreground">
                    P{source.priority}
                  </span>
                </div>
                <p className="mt-1 text-[11px] font-bold uppercase tracking-wide text-muted-foreground">{source.type}</p>
                <p className="mt-2 text-xs font-semibold leading-relaxed text-muted-foreground">{source.reason}</p>
              </article>
            ))}
          </div>
        </div>
      </div>

      <div className="mt-4 grid gap-3 md:grid-cols-4">
        {plan.businessActions.map((action) => (
          <p key={action} className="rounded-xl border border-border bg-muted/30 p-4 text-xs font-bold leading-relaxed text-muted-foreground">
            {action}
          </p>
        ))}
      </div>
    </section>
  );
}
