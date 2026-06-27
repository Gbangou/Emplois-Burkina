import { ArrowRight, BadgeCheck, Bot, Gauge, Globe2, SearchCheck, ShieldCheck, Smartphone, TrendingUp, WalletCards } from "lucide-react";
import type { Metadata } from "next";
import { SiteHeader } from "@/components/site-header";
import { getHomeData } from "@/lib/data";
import { getScrapingBusinessPlan } from "@/lib/scraping-business";

export const metadata: Metadata = {
  title: "Comparatif emploi Burkina Faso - pourquoi Emplois Burkina | Emplois Burkina",
  description:
    "Comparatif honnête des plateformes emploi au Burkina Faso : design, scraping, mobile, confiance, SEO, services candidats et revenus digitaux.",
  alternates: {
    canonical: "/comparatif"
  },
  openGraph: {
    title: "Emplois Burkina face aux plateformes emploi classiques",
    description: "Une lecture claire des forces, gaps et priorités pour bâtir une plateforme emploi haut de gamme.",
    url: "/comparatif",
    type: "website"
  }
};

const COMPETITOR_STRENGTHS = [
  "Notoriété existante et habitudes utilisateurs déjà installées.",
  "Volume d'offres visible sur certains portails généralistes.",
  "Espaces recruteurs, CVthèques, alertes email et pages commerciales déjà comprises par le marché.",
  "Présence ancienne dans les recherches Google sur les mots clés emploi Burkina."
];

const PREMIUM_EDGES = [
  {
    icon: Bot,
    title: "Scraping piloté",
    copy: "Sources suivies, santé de collecte, étapes de pipeline, stale status et priorité business visibles dans les opérations."
  },
  {
    icon: ShieldCheck,
    title: "Confiance visible",
    copy: "Score de confiance, source officielle, modération, antifraude et noindex des offres faibles ou expirées."
  },
  {
    icon: Smartphone,
    title: "Mobile-first",
    copy: "PWA installable, dock mobile, raccourcis vers offres, alertes, outils CV et services candidats."
  },
  {
    icon: WalletCards,
    title: "Monétisation utile",
    copy: "Offres gratuites, services optionnels, Mobile Money préparé, funnel revenus et analytics first-party."
  }
];

const GAP_CLOSERS = [
  "Augmenter le volume d'offres fraîches via sources officielles, RSS/API, partenariats et revue humaine.",
  "Publier chaque semaine des guides SEO utiles sur concours, ONG, salaires, villes, métiers et remote.",
  "Connecter paiement Mobile Money réel, confirmation et livraison numérique automatisée.",
  "Construire des canaux sociaux réguliers : WhatsApp, Facebook, LinkedIn, Telegram et email digest.",
  "Obtenir des backlinks locaux : écoles, médias, associations, centres de formation et institutions."
];

function Metric({ label, value, icon: Icon }: { label: string; value: string | number; icon: React.ElementType }) {
  return (
    <article className="rounded-xl border border-border bg-white p-4 shadow-sm">
      <Icon size={17} className="text-primary" />
      <p className="mt-3 text-2xl font-black text-foreground">{value}</p>
      <p className="mt-1 text-xs font-black uppercase tracking-wide text-muted-foreground">{label}</p>
    </article>
  );
}

export default async function ComparisonPage() {
  const [{ scraping, summary }, businessPlan] = await Promise.all([
    getHomeData(),
    getScrapingBusinessPlan()
  ]);

  const premiumScore = Math.min(95, Math.round(
    scraping.healthAverage * 0.32 +
    Math.min(100, summary.jobs * 1.8) * 0.18 +
    Math.min(100, businessPlan.automatedSources * 4) * 0.2 +
    Math.min(100, businessPlan.seoReadySources * 4) * 0.15 +
    15
  ));

  return (
    <div className="min-h-screen bg-background">
      <SiteHeader />

      <section className="border-b border-border bg-white">
        <div className="container py-10 lg:py-14">
          <div className="grid gap-8 lg:grid-cols-[1fr_0.42fr] lg:items-end">
            <div>
              <div className="mb-3 flex items-center gap-2">
                <Gauge size={17} className="text-primary" />
                <p className="text-xs font-black uppercase tracking-widest text-primary">Comparatif sérieux</p>
              </div>
              <h1 className="max-w-4xl text-3xl font-black leading-tight text-foreground lg:text-5xl">
                Emplois Burkina vise le haut de gamme, mais la preuve se construit par l'exécution.
              </h1>
              <p className="mt-4 max-w-3xl text-sm font-semibold leading-relaxed text-muted-foreground lg:text-base">
                Les plateformes installées ont l'avantage de l'ancienneté et du volume. Emplois Burkina doit gagner par
                design moderne, scraping responsable, vitesse mobile, confiance, SEO et revenus utiles.
              </p>
            </div>
            <aside className="rounded-xl border border-border bg-muted/30 p-5">
              <TrendingUp size={18} className="text-primary" />
              <p className="mt-4 text-sm font-black text-foreground">Score premium actuel</p>
              <p className="mt-2 text-4xl font-black text-primary">{premiumScore}/100</p>
              <p className="mt-2 text-xs font-semibold leading-relaxed text-muted-foreground">
                Score interne basé sur santé scraping, volume, automation et readiness SEO.
              </p>
            </aside>
          </div>
        </div>
      </section>

      <main className="container py-8">
        <section className="grid gap-4 md:grid-cols-4">
          <Metric label="Offres actives" value={summary.jobs} icon={SearchCheck} />
          <Metric label="Sources suivies" value={businessPlan.totalSources} icon={Globe2} />
          <Metric label="Sources automatisées" value={businessPlan.automatedSources} icon={Bot} />
          <Metric label="Santé scraping" value={`${scraping.healthAverage}%`} icon={Gauge} />
        </section>

        <section className="mt-8 grid gap-5 lg:grid-cols-[0.9fr_1.1fr]">
          <div className="rounded-xl border border-border bg-white p-5 shadow-sm">
            <p className="text-xs font-black uppercase tracking-widest text-primary">Ce que les concurrents ont encore</p>
            <h2 className="mt-2 text-2xl font-black text-foreground">Les avantages à dépasser.</h2>
            <div className="mt-5 grid gap-3">
              {COMPETITOR_STRENGTHS.map((item) => (
                <p key={item} className="flex gap-2 rounded-lg border border-border bg-muted/30 p-3 text-xs font-bold leading-relaxed text-muted-foreground">
                  <BadgeCheck size={13} className="mt-0.5 shrink-0 text-primary" />
                  {item}
                </p>
              ))}
            </div>
          </div>

          <div className="rounded-xl border border-border bg-foreground p-5 text-white shadow-sm">
            <p className="text-xs font-black uppercase tracking-widest text-white/70">Différenciation premium</p>
            <h2 className="mt-2 text-2xl font-black">Là où Emplois Burkina peut devenir supérieur.</h2>
            <div className="mt-5 grid gap-3 sm:grid-cols-2">
              {PREMIUM_EDGES.map((edge) => (
                <article key={edge.title} className="rounded-xl border border-white/10 bg-white/5 p-4">
                  <edge.icon size={18} className="text-emerald-300" />
                  <h3 className="mt-3 text-sm font-black">{edge.title}</h3>
                  <p className="mt-2 text-xs font-bold leading-relaxed text-white/70">{edge.copy}</p>
                </article>
              ))}
            </div>
          </div>
        </section>

        <section className="mt-8 rounded-xl border border-border bg-white p-5 shadow-sm">
          <div className="flex flex-col gap-3 md:flex-row md:items-end md:justify-between">
            <div>
              <p className="text-xs font-black uppercase tracking-widest text-primary">Suite haut de gamme</p>
              <h2 className="mt-2 text-2xl font-black text-foreground">Les priorités qui feront vraiment la différence.</h2>
            </div>
            <a
              href="/operations"
              className="inline-flex h-10 items-center justify-center gap-2 rounded-xl bg-primary px-4 text-sm font-black text-primary-foreground transition-transform hover:-translate-y-0.5"
            >
              Voir l'exécution
              <ArrowRight size={15} />
            </a>
          </div>

          <div className="mt-5 grid gap-3 md:grid-cols-5">
            {GAP_CLOSERS.map((item, index) => (
              <article key={item} className="rounded-xl border border-border bg-muted/30 p-4">
                <span className="flex h-8 w-8 items-center justify-center rounded-lg bg-foreground text-xs font-black text-white">
                  {index + 1}
                </span>
                <p className="mt-3 text-xs font-bold leading-relaxed text-muted-foreground">{item}</p>
              </article>
            ))}
          </div>
        </section>
      </main>
    </div>
  );
}
