import { ArrowRight, BadgeCheck, GraduationCap, Scale, ShieldCheck, Sparkles, WalletCards } from "lucide-react";
import type { Metadata } from "next";
import { SiteHeader } from "@/components/site-header";
import {
  AFFILIATE_GUARDRAILS,
  AFFILIATE_RECOMMENDATIONS,
  getAffiliateSummary
} from "@/lib/affiliate-recommendations";

export const metadata: Metadata = {
  title: "Formations utiles et outils candidats | Emplois Burkina",
  description:
    "Formations, outils CV, anglais, remote et bureautique recommandes pour candidats au Burkina Faso, avec recommandations marquees et monétisation responsable.",
  alternates: {
    canonical: "/formations"
  },
  openGraph: {
    title: "Formations utiles pour trouver un emploi",
    description: "Selection responsable de formations et outils candidats, prete pour affiliation utile et revenus passifs propres.",
    url: "/formations",
    type: "website"
  }
};

const summary = getAffiliateSummary();

const itemListJsonLd = {
  "@context": "https://schema.org",
  "@type": "ItemList",
  name: "Formations et outils recommandes par Emplois Burkina",
  itemListElement: AFFILIATE_RECOMMENDATIONS.map((item, index) => ({
    "@type": "ListItem",
    position: index + 1,
    name: item.title,
    url: `https://emplois-burkina.com${item.href}`
  }))
};

export default function FormationsPage() {
  return (
    <div className="min-h-screen bg-background">
      <SiteHeader />

      <section className="border-b border-border bg-white">
        <div className="container py-10 lg:py-14">
          <div className="grid gap-8 lg:grid-cols-[1fr_0.42fr] lg:items-end">
            <div>
              <div className="mb-3 flex items-center gap-2">
                <GraduationCap size={17} className="text-primary" />
                <p className="text-xs font-black uppercase tracking-widest text-primary">Affiliation utile</p>
              </div>
              <h1 className="max-w-4xl text-3xl font-black leading-tight text-foreground lg:text-5xl">
                Des formations et outils qui peuvent rapporter sans vendre l'acces aux offres.
              </h1>
              <p className="mt-4 max-w-3xl text-sm font-semibold leading-relaxed text-muted-foreground lg:text-base">
                Cette page transforme l'audience emploi en revenus responsables : CV, anglais, remote et bureautique.
                Chaque recommandation doit rester utile, marquee et verifiable avant de devenir un vrai lien affilie.
              </p>
            </div>
            <aside className="rounded-xl border border-border bg-muted/30 p-5">
              <WalletCards size={18} className="text-primary" />
              <p className="mt-4 text-sm font-black text-foreground">Potentiel passif</p>
              <p className="mt-2 text-4xl font-black text-primary">{summary.count}</p>
              <p className="mt-2 text-xs font-semibold leading-relaxed text-muted-foreground">
                categories pretes a monetiser par affiliation, services internes ou packs numeriques.
              </p>
            </aside>
          </div>
        </div>
      </section>

      <main className="container py-8">
        <section className="grid gap-4 md:grid-cols-4">
          <article className="rounded-xl border border-border bg-white p-4 shadow-sm">
            <GraduationCap size={17} className="text-primary" />
            <p className="mt-3 text-2xl font-black text-foreground">{summary.count}</p>
            <p className="mt-1 text-xs font-black uppercase tracking-wide text-muted-foreground">Recommandations</p>
          </article>
          <article className="rounded-xl border border-border bg-white p-4 shadow-sm">
            <ShieldCheck size={17} className="text-primary" />
            <p className="mt-3 text-2xl font-black text-foreground">{summary.averageTrust}%</p>
            <p className="mt-1 text-xs font-black uppercase tracking-wide text-muted-foreground">Confiance moyenne</p>
          </article>
          <article className="rounded-xl border border-border bg-white p-4 shadow-sm">
            <BadgeCheck size={17} className="text-primary" />
            <p className="mt-3 text-2xl font-black text-foreground">{summary.ready}</p>
            <p className="mt-1 text-xs font-black uppercase tracking-wide text-muted-foreground">Pretes a vendre</p>
          </article>
          <article className="rounded-xl border border-border bg-white p-4 shadow-sm">
            <Scale size={17} className="text-primary" />
            <p className="mt-3 text-2xl font-black text-foreground">{summary.sponsored}</p>
            <p className="mt-1 text-xs font-black uppercase tracking-wide text-muted-foreground">Sponsors actifs</p>
          </article>
        </section>

        <section className="mt-8 grid gap-4 md:grid-cols-2">
          {AFFILIATE_RECOMMENDATIONS.map((item) => (
            <article key={item.id} className="rounded-xl border border-border bg-white p-5 shadow-sm">
              <div className="flex items-start justify-between gap-3">
                <item.icon size={19} className="mt-1 shrink-0 text-primary" />
                <span className="rounded-full bg-primary/10 px-3 py-1 text-[11px] font-black uppercase tracking-wide text-primary">
                  {item.payoutReadiness}
                </span>
              </div>
              <h2 className="mt-4 text-xl font-black leading-tight text-foreground">{item.title}</h2>
              <p className="mt-2 text-sm font-semibold leading-relaxed text-muted-foreground">{item.value}</p>
              <div className="mt-4 grid gap-2 border-t border-border pt-4 text-xs font-bold leading-relaxed text-muted-foreground">
                <p>Audience : {item.audience}</p>
                <p>Modele revenu : {item.revenueModel}</p>
                <p>Confiance : {item.trustScore}/100</p>
              </div>
              <div className="mt-5 flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between">
                <span className="inline-flex w-fit items-center gap-2 rounded-full border border-border bg-muted/30 px-3 py-1 text-[11px] font-black uppercase tracking-wide text-muted-foreground">
                  <Sparkles size={12} />
                  {item.sponsored ? "Lien sponsorise" : "Recommandation interne"}
                </span>
                <a
                  href={item.href}
                  rel={item.sponsored ? "sponsored" : undefined}
                  data-analytics-source="affiliate_recommendation"
                  data-analytics-label={item.id}
                  className="inline-flex h-10 items-center justify-center gap-2 rounded-xl bg-primary px-4 text-sm font-black text-primary-foreground transition-transform hover:-translate-y-0.5"
                >
                  Voir la solution
                  <ArrowRight size={15} />
                </a>
              </div>
            </article>
          ))}
        </section>

        <section className="mt-8 rounded-xl border border-border bg-foreground p-6 text-white">
          <div className="grid gap-6 lg:grid-cols-[0.8fr_1.2fr] lg:items-start">
            <div>
              <div className="mb-3 flex items-center gap-2">
                <ShieldCheck size={16} />
                <p className="text-xs font-black uppercase tracking-widest text-white/75">Regles de confiance</p>
              </div>
              <h2 className="text-2xl font-black leading-tight">La rentabilite ne doit pas casser la confiance.</h2>
              <p className="mt-3 text-sm font-semibold leading-relaxed text-white/70">
                Les recommandations peuvent devenir une source de revenu passive, mais seulement si elles restent utiles,
                transparentes et conformes aux exigences des moteurs de recherche.
              </p>
            </div>
            <div className="grid gap-3 sm:grid-cols-2">
              {AFFILIATE_GUARDRAILS.map((rule) => (
                <p key={rule} className="rounded-xl border border-white/10 bg-white/5 p-4 text-xs font-bold leading-relaxed text-white/70">
                  {rule}
                </p>
              ))}
            </div>
          </div>
        </section>
      </main>

      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(itemListJsonLd) }}
      />
    </div>
  );
}
