import { ArrowLeft, ArrowRight, BadgeCheck, BookOpenCheck, SearchCheck, ShieldCheck, WalletCards } from "lucide-react";
import type { Metadata } from "next";
import { notFound } from "next/navigation";

import { SiteHeader } from "@/components/site-header";
import { AdSenseSlot } from "@/components/adsense-slot";
import { RecommendationPanel } from "@/components/recommendation-panel";
import { getGuide, GUIDES } from "@/lib/guides";
import { getGuideRecommendations } from "@/lib/recommendations";

type GuidePageProps = {
  params: Promise<{ slug: string }>;
};

export function generateStaticParams() {
  return GUIDES.map((guide) => ({ slug: guide.slug }));
}

export async function generateMetadata({ params }: GuidePageProps): Promise<Metadata> {
  const { slug } = await params;
  const guide = getGuide(slug);

  if (!guide) {
    return {};
  }

  return {
    title: `${guide.title} | Emplois Burkina`,
    description: guide.description,
    keywords: guide.keywords
  };
}

export default async function GuideDetailPage({ params }: GuidePageProps) {
  const { slug } = await params;
  const guide = getGuide(slug);

  if (!guide) {
    notFound();
  }

  const adsenseClient = process.env.NEXT_PUBLIC_ADSENSE_CLIENT || process.env.ADSENSE_CLIENT;
  const recommendations = getGuideRecommendations(guide);
  const url = `https://emplois-burkina.com/guides/${guide.slug}`;
  const jsonLd = {
    "@context": "https://schema.org",
    "@graph": [
      {
        "@type": "Article",
        headline: guide.title,
        description: guide.description,
        url,
        inLanguage: "fr-BF",
        publisher: { "@id": "https://emplois-burkina.com/#organization" },
        mainEntityOfPage: url
      },
      {
        "@type": "BreadcrumbList",
        itemListElement: [
          { "@type": "ListItem", position: 1, name: "Accueil", item: "https://emplois-burkina.com" },
          { "@type": "ListItem", position: 2, name: "Guides", item: "https://emplois-burkina.com/guides" },
          { "@type": "ListItem", position: 3, name: guide.title, item: url }
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
          <a href="/guides" className="mb-6 inline-flex items-center gap-2 text-sm font-black text-primary hover:underline">
            <ArrowLeft size={14} /> Tous les guides
          </a>
          <div className="grid gap-8 lg:grid-cols-[1fr_0.36fr] lg:items-start">
            <div>
              <div className="mb-3 flex items-center gap-2">
                <BookOpenCheck size={17} className="text-primary" />
                <p className="text-xs font-black uppercase tracking-widest text-primary">Guide pratique</p>
              </div>
              <h1 className="max-w-4xl text-3xl font-black leading-tight text-foreground lg:text-5xl">{guide.title}</h1>
              <p className="mt-4 max-w-3xl text-sm font-semibold leading-relaxed text-muted-foreground lg:text-base">
                {guide.description}
              </p>
              <div className="mt-5 flex flex-wrap gap-2">
                {guide.keywords.map((keyword) => (
                  <span key={keyword} className="rounded-full border border-border bg-muted/40 px-3 py-1 text-xs font-black text-muted-foreground">
                    {keyword}
                  </span>
                ))}
              </div>
            </div>

            <aside className="rounded-xl border border-border bg-muted/30 p-5">
              <p className="text-xs font-black uppercase tracking-widest text-primary">Chemin de revenu</p>
              <p className="mt-2 text-sm font-black text-foreground">{guide.revenuePath}</p>
              <p className="mt-3 text-xs font-semibold leading-relaxed text-muted-foreground">
                Le guide reste gratuit. Les revenus viennent du trafic, des annonces sobres, des recommandations utiles et de l'aide optionnelle.
              </p>
              <a href={guide.serviceHref} className="mt-4 inline-flex h-10 w-full items-center justify-center gap-2 rounded-xl bg-primary px-4 text-sm font-black text-primary-foreground transition-transform hover:-translate-y-0.5">
                Suite utile <ArrowRight size={14} />
              </a>
            </aside>
          </div>
        </div>
      </section>

      <main className="container grid gap-8 py-10 lg:grid-cols-[1fr_0.34fr]">
        <article className="grid gap-5">
          {guide.sections.map((section, index) => (
            <div key={section.title} className="grid gap-5">
              <section className="rounded-xl border border-border bg-white p-6 shadow-sm">
                <div className="flex items-start gap-4">
                  <span className="flex h-9 w-9 shrink-0 items-center justify-center rounded-xl bg-primary text-sm font-black text-primary-foreground">
                    {index + 1}
                  </span>
                  <div>
                    <h2 className="text-xl font-black text-foreground">{section.title}</h2>
                    <p className="mt-3 text-sm font-semibold leading-7 text-muted-foreground">{section.body}</p>
                  </div>
                </div>
              </section>
              {index === 1 && (
                <AdSenseSlot
                  clientId={adsenseClient}
                  slot={process.env.NEXT_PUBLIC_ADSENSE_SLOT_GUIDE_INLINE}
                  format="horizontal"
                />
              )}
            </div>
          ))}

          <section className="rounded-xl border border-border bg-white p-6 shadow-sm">
            <div className="flex items-start gap-4">
              <ShieldCheck size={22} className="mt-1 shrink-0 text-primary" />
              <div>
                <h2 className="text-xl font-black text-foreground">Rappel important</h2>
                <p className="mt-3 text-sm font-semibold leading-7 text-muted-foreground">
                  Un bon dossier augmente les chances, mais ne garantit jamais un emploi. Les offres doivent rester verifiees, les paiements suspects evites, et les informations personnelles protegees.
                </p>
              </div>
            </div>
          </section>

          <RecommendationPanel items={recommendations} />
        </article>

        <aside className="grid gap-4 self-start lg:sticky lg:top-24">
          <AdSenseSlot
            clientId={adsenseClient}
            slot={process.env.NEXT_PUBLIC_ADSENSE_SLOT_GUIDE_SIDEBAR}
            format="rectangle"
          />
          <div className="rounded-xl border border-border bg-white p-5 shadow-sm">
            <SearchCheck size={18} className="text-primary" />
            <h2 className="mt-4 text-base font-black text-foreground">Intention recherche</h2>
            <p className="mt-2 text-sm font-semibold leading-relaxed text-muted-foreground">{guide.searchIntent}</p>
          </div>
          <div className="rounded-xl border border-border bg-white p-5 shadow-sm">
            <WalletCards size={18} className="text-primary" />
            <h2 className="mt-4 text-base font-black text-foreground">Aide optionnelle</h2>
            <p className="mt-2 text-sm font-semibold leading-relaxed text-muted-foreground">
              Besoin d'un CV, d'une lettre ou d'un pack international pret a envoyer ?
            </p>
            <a href={guide.serviceHref} className="mt-4 inline-flex h-10 w-full items-center justify-center gap-2 rounded-xl border border-border text-sm font-black text-foreground transition-colors hover:bg-accent">
              Demander <ArrowRight size={14} />
            </a>
          </div>
          <div className="rounded-xl border border-border bg-muted/30 p-5">
            <BadgeCheck size={18} className="text-primary" />
            <h2 className="mt-4 text-base font-black text-foreground">Principe</h2>
            <p className="mt-2 text-sm font-semibold leading-relaxed text-muted-foreground">
              Acces gratuit au contenu, monetisation par volume, valeur optionnelle et confiance.
            </p>
          </div>
        </aside>
      </main>
    </div>
  );
}
