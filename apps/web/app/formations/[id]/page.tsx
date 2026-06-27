import { ArrowLeft, ArrowRight, BadgeCheck, CheckCircle2, GraduationCap, SearchCheck, ShieldCheck, WalletCards } from "lucide-react";
import type { Metadata } from "next";
import { notFound } from "next/navigation";

import { AdSenseSlot } from "@/components/adsense-slot";
import { SiteHeader } from "@/components/site-header";
import {
  AFFILIATE_GUARDRAILS,
  AFFILIATE_RECOMMENDATIONS,
  getAffiliateRecommendation
} from "@/lib/affiliate-recommendations";

type FormationDetailProps = {
  params: Promise<{ id: string }>;
};

export function generateStaticParams() {
  return AFFILIATE_RECOMMENDATIONS.map((item) => ({ id: item.id }));
}

export async function generateMetadata({ params }: FormationDetailProps): Promise<Metadata> {
  const { id } = await params;
  const item = getAffiliateRecommendation(id);

  if (!item) {
    return {};
  }

  return {
    title: `${item.title} | Formations utiles Emplois Burkina`,
    description: `${item.value} Pour ${item.audience.toLowerCase()}.`,
    alternates: {
      canonical: `/formations/${item.id}`
    },
    openGraph: {
      title: item.title,
      description: item.value,
      url: `/formations/${item.id}`,
      type: "article"
    }
  };
}

export default async function FormationDetailPage({ params }: FormationDetailProps) {
  const { id } = await params;
  const item = getAffiliateRecommendation(id);

  if (!item) {
    notFound();
  }

  const adsenseClient = process.env.NEXT_PUBLIC_ADSENSE_CLIENT || process.env.ADSENSE_CLIENT;
  const url = `https://emplois-burkina.com/formations/${item.id}`;
  const jsonLd = {
    "@context": "https://schema.org",
    "@graph": [
      {
        "@type": "Article",
        headline: item.title,
        description: item.value,
        url,
        inLanguage: "fr-BF",
        publisher: { "@id": "https://emplois-burkina.com/#organization" },
        mainEntityOfPage: url
      },
      {
        "@type": "BreadcrumbList",
        itemListElement: [
          { "@type": "ListItem", position: 1, name: "Accueil", item: "https://emplois-burkina.com" },
          { "@type": "ListItem", position: 2, name: "Formations", item: "https://emplois-burkina.com/formations" },
          { "@type": "ListItem", position: 3, name: item.title, item: url }
        ]
      }
    ]
  };

  return (
    <div className="min-h-screen bg-background">
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }}
      />
      <SiteHeader />

      <section className="border-b border-border bg-white">
        <div className="container py-8 lg:py-12">
          <a href="/formations" className="mb-6 inline-flex items-center gap-2 text-sm font-black text-primary hover:underline">
            <ArrowLeft size={14} /> Toutes les formations
          </a>

          <div className="grid gap-8 lg:grid-cols-[1fr_0.38fr] lg:items-start">
            <div>
              <div className="mb-3 flex items-center gap-2">
                <item.icon size={18} className="text-primary" />
                <p className="text-xs font-black uppercase tracking-widest text-primary">Recommandation utile</p>
              </div>
              <h1 className="max-w-4xl text-3xl font-black leading-tight text-foreground lg:text-5xl">{item.title}</h1>
              <p className="mt-4 max-w-3xl text-sm font-semibold leading-relaxed text-muted-foreground lg:text-base">
                {item.value}
              </p>
              <div className="mt-5 flex flex-wrap gap-2">
                <span className="rounded-full border border-border bg-muted/40 px-3 py-1 text-xs font-black text-muted-foreground">
                  {item.category}
                </span>
                <span className="rounded-full border border-border bg-muted/40 px-3 py-1 text-xs font-black text-muted-foreground">
                  confiance {item.trustScore}/100
                </span>
                <span className="rounded-full border border-border bg-muted/40 px-3 py-1 text-xs font-black text-muted-foreground">
                  {item.payoutReadiness}
                </span>
              </div>
            </div>

            <aside className="rounded-xl border border-border bg-muted/30 p-5">
              <WalletCards size={18} className="text-primary" />
              <p className="mt-4 text-sm font-black text-foreground">Chemin revenu</p>
              <p className="mt-2 text-sm font-semibold leading-relaxed text-muted-foreground">{item.revenueModel}</p>
              <a
                href={item.href}
                rel={item.sponsored ? "sponsored" : undefined}
                data-analytics-source="affiliate_detail"
                data-analytics-label={item.id}
                className="mt-4 inline-flex h-10 w-full items-center justify-center gap-2 rounded-xl bg-primary px-4 text-sm font-black text-primary-foreground transition-transform hover:-translate-y-0.5"
              >
                Continuer <ArrowRight size={14} />
              </a>
            </aside>
          </div>
        </div>
      </section>

      <main className="container grid gap-8 py-10 lg:grid-cols-[1fr_0.34fr]">
        <article className="grid gap-5">
          <section className="rounded-xl border border-border bg-white p-6 shadow-sm">
            <div className="flex items-start gap-4">
              <SearchCheck size={22} className="mt-1 shrink-0 text-primary" />
              <div>
                <h2 className="text-xl font-black text-foreground">Pourquoi cette page peut attirer du trafic</h2>
                <p className="mt-3 text-sm font-semibold leading-7 text-muted-foreground">{item.searchIntent}</p>
              </div>
            </div>
          </section>

          <section className="rounded-xl border border-border bg-white p-6 shadow-sm">
            <div className="flex items-start gap-4">
              <GraduationCap size={22} className="mt-1 shrink-0 text-primary" />
              <div className="w-full">
                <h2 className="text-xl font-black text-foreground">Checklist avant de choisir</h2>
                <div className="mt-4 grid gap-3 md:grid-cols-2">
                  {item.checklist.map((point) => (
                    <p key={point} className="flex gap-2 rounded-xl border border-border bg-muted/30 p-3 text-xs font-bold leading-relaxed text-muted-foreground">
                      <CheckCircle2 size={14} className="mt-0.5 shrink-0 text-primary" />
                      {point}
                    </p>
                  ))}
                </div>
              </div>
            </div>
          </section>

          <AdSenseSlot
            clientId={adsenseClient}
            slot={process.env.NEXT_PUBLIC_ADSENSE_SLOT_FORMATION_INLINE}
            format="horizontal"
          />

          <section className="rounded-xl border border-border bg-foreground p-6 text-white">
            <div className="flex items-start gap-4">
              <ShieldCheck size={22} className="mt-1 shrink-0" />
              <div>
                <h2 className="text-xl font-black">Transparence et securite</h2>
                <p className="mt-3 text-sm font-semibold leading-7 text-white/70">
                  Cette recommandation ne garantit pas un emploi. Elle sert a mieux preparer un dossier ou une competence.
                  Les liens sponsorises doivent rester marques, utiles et verifiables.
                </p>
              </div>
            </div>
          </section>
        </article>

        <aside className="grid gap-4 self-start lg:sticky lg:top-24">
          <AdSenseSlot
            clientId={adsenseClient}
            slot={process.env.NEXT_PUBLIC_ADSENSE_SLOT_FORMATION_SIDEBAR}
            format="rectangle"
          />
          <div className="rounded-xl border border-border bg-white p-5 shadow-sm">
            <BadgeCheck size={18} className="text-primary" />
            <h2 className="mt-4 text-base font-black text-foreground">Audience cible</h2>
            <p className="mt-2 text-sm font-semibold leading-relaxed text-muted-foreground">{item.audience}</p>
          </div>
          <div className="rounded-xl border border-border bg-white p-5 shadow-sm">
            <ShieldCheck size={18} className="text-primary" />
            <h2 className="mt-4 text-base font-black text-foreground">Regles partenaires</h2>
            <div className="mt-3 grid gap-2">
              {AFFILIATE_GUARDRAILS.slice(0, 3).map((rule) => (
                <p key={rule} className="text-xs font-bold leading-relaxed text-muted-foreground">{rule}</p>
              ))}
            </div>
          </div>
          <div className="rounded-xl border border-border bg-muted/30 p-5">
            <WalletCards size={18} className="text-primary" />
            <h2 className="mt-4 text-base font-black text-foreground">Conversion</h2>
            <p className="mt-2 text-sm font-semibold leading-relaxed text-muted-foreground">
              Le bon partenaire ou service doit generer une valeur mesurable sans bloquer les offres gratuites.
            </p>
            <a
              href={item.href}
              data-analytics-source="affiliate_sidebar"
              data-analytics-label={item.id}
              className="mt-4 inline-flex h-10 w-full items-center justify-center gap-2 rounded-xl border border-border bg-white text-sm font-black text-foreground transition-colors hover:bg-accent"
            >
              Voir la suite <ArrowRight size={14} />
            </a>
          </div>
        </aside>
      </main>
    </div>
  );
}
