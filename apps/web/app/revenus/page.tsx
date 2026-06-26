import { ArrowRight, BarChart3, CircleDollarSign, Gauge, ShieldCheck, TrendingUp, WalletCards } from "lucide-react";
import type { Metadata } from "next";

import { SiteHeader } from "@/components/site-header";
import { NEXT_REVENUE_WORK, REVENUE_ASSUMPTIONS, REVENUE_SCENARIOS } from "@/lib/revenue-projections";

export const metadata: Metadata = {
  title: "Projections de revenus | Emplois Burkina",
  description:
    "Scenarios de revenus pour Emplois Burkina : AdSense, services optionnels, affiliation utile, rapports anonymises et trafic SEO."
};

const CHANNELS = [
  { icon: BarChart3, label: "AdSense", copy: "Revenu lie au volume de pages vues et a la qualite du trafic." },
  { icon: WalletCards, label: "Services", copy: "CV, lettre, entretien, pack ONG et aide optionnelle." },
  { icon: TrendingUp, label: "Affiliation", copy: "Formations et outils utiles, marques clairement." },
  { icon: ShieldCheck, label: "Rapports", copy: "Donnees marche anonymisees pour institutions et medias." }
];

export default function RevenueProjectionsPage() {
  return (
    <div className="min-h-screen bg-background">
      <SiteHeader />

      <section className="border-b border-border bg-white">
        <div className="container py-10 lg:py-14">
          <div className="grid gap-8 lg:grid-cols-[1fr_0.42fr] lg:items-end">
            <div>
              <div className="mb-3 flex items-center gap-2">
                <CircleDollarSign size={17} className="text-primary" />
                <p className="text-xs font-black uppercase tracking-widest text-primary">Projections revenus</p>
              </div>
              <h1 className="max-w-4xl text-3xl font-black leading-tight text-foreground lg:text-5xl">
                Des revenus automatisables, mais pas magiques.
              </h1>
              <p className="mt-4 max-w-3xl text-sm font-semibold leading-relaxed text-muted-foreground lg:text-base">
                Le modele credible combine trafic SEO, annonces sobres, services digitaux optionnels, affiliation utile et rapports anonymises. Les offres restent gratuites pour les candidats.
              </p>
            </div>
            <div className="rounded-xl border border-border bg-muted/30 p-5">
              <Gauge size={18} className="text-primary" />
              <p className="mt-4 text-sm font-black text-foreground">Lecture serieuse</p>
              <p className="mt-2 text-sm font-semibold leading-relaxed text-muted-foreground">
                Les fourchettes ci-dessous sont mensuelles. Le minimum reel au depart peut etre zero tant que l'audience, AdSense et les paiements ne sont pas actifs.
              </p>
            </div>
          </div>
        </div>
      </section>

      <section className="container py-8">
        <div className="grid gap-4 md:grid-cols-4">
          {CHANNELS.map((channel) => (
            <article key={channel.label} className="rounded-xl border border-border bg-white p-5 shadow-sm">
              <channel.icon size={18} className="text-primary" />
              <h2 className="mt-4 text-base font-black text-foreground">{channel.label}</h2>
              <p className="mt-2 text-sm font-semibold leading-relaxed text-muted-foreground">{channel.copy}</p>
            </article>
          ))}
        </div>
      </section>

      <section className="border-y border-border bg-muted/30 py-10">
        <div className="container">
          <div className="flex flex-col gap-3 md:flex-row md:items-end md:justify-between">
            <div>
              <p className="text-xs font-black uppercase tracking-widest text-primary">0-6 mois et 12 mois</p>
              <h2 className="mt-2 text-2xl font-black text-foreground">Scenarios mensuels projetes</h2>
            </div>
            <p className="max-w-xl text-sm font-semibold leading-relaxed text-muted-foreground">
              Le scenario a viser est le realiste ambitieux. Le scenario fort demande une execution rapide, beaucoup de contenu utile et une distribution sociale propre.
            </p>
          </div>

          <div className="mt-6 grid gap-5 xl:grid-cols-3">
            {REVENUE_SCENARIOS.map((scenario) => (
              <article key={scenario.id} className="rounded-xl border border-border bg-white p-5 shadow-sm">
                <div className="flex items-start justify-between gap-3">
                  <div>
                    <p className="text-xs font-black uppercase tracking-widest text-primary">{scenario.name}</p>
                    <h3 className="mt-2 text-lg font-black text-foreground">{scenario.monthTwelve.total}</h3>
                  </div>
                  <CircleDollarSign size={18} className="text-primary" />
                </div>
                <p className="mt-3 text-sm font-semibold leading-relaxed text-muted-foreground">{scenario.stance}</p>

                <div className="mt-5 grid gap-3">
                  <div className="rounded-xl border border-border bg-muted/20 p-4">
                    <p className="text-xs font-black uppercase tracking-widest text-muted-foreground">0-6 mois</p>
                    <dl className="mt-3 grid gap-2 text-xs font-bold text-muted-foreground">
                      <div className="flex justify-between gap-3"><dt>Trafic</dt><dd className="text-right">{scenario.monthsZeroToSix.traffic}</dd></div>
                      <div className="flex justify-between gap-3"><dt>AdSense</dt><dd className="text-right">{scenario.monthsZeroToSix.adsense}</dd></div>
                      <div className="flex justify-between gap-3"><dt>Services</dt><dd className="text-right">{scenario.monthsZeroToSix.services}</dd></div>
                      <div className="flex justify-between gap-3"><dt>Total</dt><dd className="text-right font-black text-foreground">{scenario.monthsZeroToSix.total}</dd></div>
                    </dl>
                  </div>

                  <div className="rounded-xl border border-border bg-white p-4">
                    <p className="text-xs font-black uppercase tracking-widest text-muted-foreground">A 12 mois</p>
                    <dl className="mt-3 grid gap-2 text-xs font-bold text-muted-foreground">
                      <div className="flex justify-between gap-3"><dt>Trafic</dt><dd className="text-right">{scenario.monthTwelve.traffic}</dd></div>
                      <div className="flex justify-between gap-3"><dt>AdSense</dt><dd className="text-right">{scenario.monthTwelve.adsense}</dd></div>
                      <div className="flex justify-between gap-3"><dt>Services</dt><dd className="text-right">{scenario.monthTwelve.services}</dd></div>
                      <div className="flex justify-between gap-3"><dt>Total</dt><dd className="text-right font-black text-primary">{scenario.monthTwelve.total}</dd></div>
                    </dl>
                  </div>
                </div>

                <div className="mt-4 grid gap-2">
                  {scenario.conditions.map((condition) => (
                    <div key={condition} className="flex gap-2 text-xs font-bold leading-relaxed text-muted-foreground">
                      <ShieldCheck size={13} className="mt-0.5 shrink-0 text-primary" />
                      <span>{condition}</span>
                    </div>
                  ))}
                </div>
              </article>
            ))}
          </div>
        </div>
      </section>

      <section className="container grid gap-6 py-10 lg:grid-cols-[0.9fr_1.1fr]">
        <div className="rounded-xl border border-border bg-white p-6 shadow-sm">
          <p className="text-xs font-black uppercase tracking-widest text-primary">Hypotheses sinceres</p>
          <h2 className="mt-2 text-2xl font-black text-foreground">Ce qui peut limiter les gains</h2>
          <div className="mt-5 grid gap-3">
            {REVENUE_ASSUMPTIONS.map((item) => (
              <div key={item} className="flex gap-3 rounded-xl border border-border bg-muted/20 p-4">
                <ShieldCheck size={16} className="mt-0.5 shrink-0 text-primary" />
                <p className="text-xs font-bold leading-relaxed text-muted-foreground">{item}</p>
              </div>
            ))}
          </div>
        </div>

        <div className="rounded-xl border border-border bg-foreground p-6 text-white">
          <p className="text-xs font-black uppercase tracking-widest text-white/70">Suite a construire</p>
          <h2 className="mt-2 text-2xl font-black">Priorites pour rendre ces revenus mesurables</h2>
          <div className="mt-5 grid gap-3">
            {NEXT_REVENUE_WORK.map((item, index) => (
              <div key={item} className="flex items-start gap-3 rounded-xl border border-white/10 bg-white/5 px-4 py-3">
                <span className="flex h-7 w-7 shrink-0 items-center justify-center rounded-lg bg-white text-[11px] font-black text-foreground">
                  {index + 1}
                </span>
                <p className="text-sm font-bold leading-snug text-white/72">{item}</p>
              </div>
            ))}
          </div>
          <a href="/services" className="mt-5 inline-flex h-11 items-center justify-center gap-2 rounded-xl bg-white px-5 text-sm font-black text-foreground transition-transform hover:-translate-y-0.5">
            Voir les services <ArrowRight size={15} />
          </a>
        </div>
      </section>
    </div>
  );
}
