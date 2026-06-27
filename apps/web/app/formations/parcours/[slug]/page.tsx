import { ArrowLeft, ArrowRight, BadgeCheck, BookOpenCheck, GraduationCap, SearchCheck, ShieldCheck, WalletCards } from "lucide-react";
import type { Metadata } from "next";
import { notFound } from "next/navigation";

import { AdSenseSlot } from "@/components/adsense-slot";
import { SiteHeader } from "@/components/site-header";
import { getAffiliateProgram, getAffiliateRecommendation } from "@/lib/affiliate-recommendations";
import { FORMATION_INTENT_PAGES, getFormationIntentPage } from "@/lib/formation-intents";

type FormationIntentProps = {
  params: Promise<{ slug: string }>;
};

export function generateStaticParams() {
  return FORMATION_INTENT_PAGES.map((page) => ({ slug: page.slug }));
}

export async function generateMetadata({ params }: FormationIntentProps): Promise<Metadata> {
  const { slug } = await params;
  const page = getFormationIntentPage(slug);

  if (!page) return {};

  return {
    title: `${page.title} | Emplois Burkina`,
    description: page.description,
    keywords: page.keywords,
    alternates: {
      canonical: `/formations/parcours/${page.slug}`
    },
    openGraph: {
      title: page.title,
      description: page.description,
      url: `/formations/parcours/${page.slug}`,
      type: "article"
    }
  };
}

export default async function FormationIntentPage({ params }: FormationIntentProps) {
  const { slug } = await params;
  const page = getFormationIntentPage(slug);

  if (!page) {
    notFound();
  }

  const recommendation = getAffiliateRecommendation(page.primaryRecommendationId);
  const programs = page.secondaryProgramIds
    .map((id) => getAffiliateProgram(id))
    .filter(Boolean);
  const adsenseClient = process.env.NEXT_PUBLIC_ADSENSE_CLIENT || process.env.ADSENSE_CLIENT;
  const url = `https://emplois-burkina.com/formations/parcours/${page.slug}`;
  const jsonLd = {
    "@context": "https://schema.org",
    "@graph": [
      {
        "@type": "Article",
        headline: page.title,
        description: page.description,
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
          { "@type": "ListItem", position: 3, name: page.title, item: url }
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
                <GraduationCap size={18} className="text-primary" />
                <p className="text-xs font-black uppercase tracking-widest text-primary">Parcours rentable</p>
              </div>
              <h1 className="max-w-4xl text-3xl font-black leading-tight text-foreground lg:text-5xl">{page.title}</h1>
              <p className="mt-4 max-w-3xl text-sm font-semibold leading-relaxed text-muted-foreground lg:text-base">
                {page.description}
              </p>
              <div className="mt-5 flex flex-wrap gap-2">
                {page.keywords.map((keyword) => (
                  <span key={keyword} className="rounded-full border border-border bg-muted/40 px-3 py-1 text-xs font-black text-muted-foreground">
                    {keyword}
                  </span>
                ))}
              </div>
            </div>

            <aside className="rounded-xl border border-border bg-muted/30 p-5">
              <WalletCards size={18} className="text-primary" />
              <p className="mt-4 text-sm font-black text-foreground">Chemin revenu</p>
              <p className="mt-2 text-sm font-semibold leading-relaxed text-muted-foreground">{page.intent}</p>
              <div className="mt-4 grid gap-2">
                {recommendation && (
                  <a
                    href={`/api/affiliate/${recommendation.id}`}
                    data-analytics-source="formation_intent"
                    data-analytics-label={page.slug}
                    className="inline-flex h-10 items-center justify-center gap-2 rounded-xl bg-primary px-4 text-sm font-black text-primary-foreground transition-transform hover:-translate-y-0.5"
                  >
                    Voir la recommandation <ArrowRight size={14} />
                  </a>
                )}
                <a href={page.serviceHref} className="inline-flex h-10 items-center justify-center gap-2 rounded-xl border border-border bg-white px-4 text-sm font-black text-foreground transition-colors hover:bg-accent">
                  Aide optionnelle <ArrowRight size={14} />
                </a>
              </div>
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
                <h2 className="text-xl font-black text-foreground">Intention recherche</h2>
                <p className="mt-3 text-sm font-semibold leading-7 text-muted-foreground">{page.intent}</p>
              </div>
            </div>
          </section>

          <section className="grid gap-4 md:grid-cols-2">
            {page.blocks.map((block) => (
              <article key={block.title} className="rounded-xl border border-border bg-white p-5 shadow-sm">
                <ShieldCheck size={18} className="text-primary" />
                <h2 className="mt-4 text-lg font-black text-foreground">{block.title}</h2>
                <p className="mt-2 text-sm font-semibold leading-relaxed text-muted-foreground">{block.body}</p>
              </article>
            ))}
          </section>

          <AdSenseSlot
            clientId={adsenseClient}
            slot={process.env.NEXT_PUBLIC_ADSENSE_SLOT_FORMATION_INLINE}
            format="horizontal"
          />
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
            <p className="mt-2 text-sm font-semibold leading-relaxed text-muted-foreground">{page.audience}</p>
          </div>
          {recommendation && (
            <div className="rounded-xl border border-border bg-white p-5 shadow-sm">
              <BookOpenCheck size={18} className="text-primary" />
              <h2 className="mt-4 text-base font-black text-foreground">{recommendation.title}</h2>
              <p className="mt-2 text-sm font-semibold leading-relaxed text-muted-foreground">{recommendation.value}</p>
              <a href={`/formations/${recommendation.id}`} className="mt-4 inline-flex h-10 w-full items-center justify-center gap-2 rounded-xl border border-border text-sm font-black text-foreground transition-colors hover:bg-accent">
                Lire la fiche <ArrowRight size={14} />
              </a>
            </div>
          )}
          <div className="rounded-xl border border-border bg-muted/30 p-5">
            <WalletCards size={18} className="text-primary" />
            <h2 className="mt-4 text-base font-black text-foreground">Programmes lies</h2>
            <div className="mt-3 grid gap-2">
              {programs.map((program) => (
                <a key={program!.id} href={program!.applyUrl} rel="nofollow sponsored" className="rounded-lg border border-border bg-white px-3 py-2 text-xs font-black text-foreground hover:bg-accent">
                  {program!.name}
                </a>
              ))}
            </div>
          </div>
        </aside>
      </main>
    </div>
  );
}
