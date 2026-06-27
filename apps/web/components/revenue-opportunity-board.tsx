import { ArrowRight, BadgeCheck, CircleDollarSign, Target } from "lucide-react";
import type { RevenueOpportunity } from "@/lib/revenue-opportunities";

type RevenueOpportunityBoardProps = {
  opportunities: RevenueOpportunity[];
};

export function RevenueOpportunityBoard({ opportunities }: RevenueOpportunityBoardProps) {
  const top = opportunities[0];

  return (
    <section className="section">
      <div className="section-head">
        <div>
          <p className="eyebrow">Priorisation business</p>
          <h2>Ce qu'il faut pousser en premier pour maximiser les revenus.</h2>
        </div>
        <p>
          Score interne base sur surfaces SEO, signaux de clics, canaux disponibles et readiness monetisation.
        </p>
      </div>

      {top && (
        <div className="mb-4 rounded-xl border border-border bg-foreground p-5 text-white">
          <div className="flex flex-col gap-4 md:flex-row md:items-center md:justify-between">
            <div>
              <p className="text-xs font-black uppercase tracking-widest text-white/70">Priorite actuelle</p>
              <h3 className="mt-2 text-2xl font-black">{top.title}</h3>
              <p className="mt-2 max-w-3xl text-sm font-semibold leading-relaxed text-white/70">{top.why}</p>
            </div>
            <div className="shrink-0 rounded-xl border border-white/10 bg-white/5 p-4 text-center">
              <p className="text-3xl font-black">{top.score}/100</p>
              <p className="mt-1 text-[11px] font-black uppercase text-white/60">score revenu</p>
            </div>
          </div>
        </div>
      )}

      <div className="grid gap-4 lg:grid-cols-2">
        {opportunities.map((item) => (
          <article key={item.id} className="rounded-xl border border-border bg-white p-4 shadow-sm">
            <div className="flex items-start justify-between gap-3">
              <div>
                <p className="text-xs font-black uppercase tracking-widest text-primary">{item.channel}</p>
                <h3 className="mt-2 text-base font-black text-foreground">{item.title}</h3>
              </div>
              <span className="flex h-12 w-12 shrink-0 items-center justify-center rounded-xl bg-primary/10 text-sm font-black text-primary">
                {item.score}
              </span>
            </div>
            <div className="mt-4 grid gap-2 text-xs font-bold leading-relaxed text-muted-foreground">
              <p className="flex gap-2">
                <CircleDollarSign size={14} className="mt-0.5 shrink-0 text-primary" />
                {item.expectedImpact}
              </p>
              <p className="flex gap-2">
                <BadgeCheck size={14} className="mt-0.5 shrink-0 text-primary" />
                {item.why}
              </p>
              <p className="flex gap-2">
                <Target size={14} className="mt-0.5 shrink-0 text-primary" />
                {item.nextStep}
              </p>
            </div>
            <a href={item.href} className="mt-4 inline-flex h-10 items-center justify-center gap-2 rounded-xl border border-border px-4 text-sm font-black text-foreground transition-colors hover:bg-accent">
              Ouvrir <ArrowRight size={14} />
            </a>
          </article>
        ))}
      </div>
    </section>
  );
}
