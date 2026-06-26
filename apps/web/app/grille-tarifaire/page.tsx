import { ArrowRight, BadgeCheck, CircleDollarSign, Clock3, FileText, ShieldCheck, Sparkles, WalletCards } from "lucide-react";
import type { Metadata } from "next";
import { SiteHeader } from "@/components/site-header";
import { SERVICE_PRODUCTS } from "@/lib/revenue";

export const metadata: Metadata = {
  title: "Grille tarifaire services candidats | Emplois Burkina",
  description:
    "Tarifs transparents des services candidats Emplois Burkina : CV ATS, lettre ciblee, pack ONG international et preparation entretien.",
  alternates: {
    canonical: "/grille-tarifaire"
  },
  openGraph: {
    title: "Grille tarifaire Emplois Burkina",
    description: "Services candidats optionnels, prix clairs et commandes traçables.",
    url: "/grille-tarifaire",
    type: "website"
  }
};

const GUARANTEES = [
  "Les offres d'emploi restent gratuites.",
  "Les services sont optionnels et clairement presentes.",
  "Aucune promesse de recrutement, visa ou selection n'est vendue.",
  "Les donnees personnelles servent uniquement a traiter la demande."
];

const STEPS = [
  { icon: FileText, title: "Choisir", copy: "Le candidat choisit le service utile selon son besoin immediat." },
  { icon: WalletCards, title: "Commander", copy: "Une reference de commande est creee pour le suivi et le paiement Mobile Money." },
  { icon: Clock3, title: "Livrer", copy: "La prochaine brique automatisera confirmation, production et livraison numerique." }
];

const offerCatalogJsonLd = {
  "@context": "https://schema.org",
  "@type": "OfferCatalog",
  name: "Services candidats Emplois Burkina",
  url: "https://emplois-burkina.com/grille-tarifaire",
  itemListElement: SERVICE_PRODUCTS.map((service) => ({
    "@type": "Offer",
    itemOffered: {
      "@type": "Service",
      name: service.name,
      description: service.copy,
      provider: {
        "@type": "Organization",
        name: "Emplois Burkina"
      }
    },
    priceCurrency: "XOF",
    price: service.price.replace(/[^\d]/g, ""),
    availability: "https://schema.org/InStock",
    url: `https://emplois-burkina.com/services?service=${service.id}#paiement`
  }))
};

export default function PricingPage() {
  return (
    <div className="min-h-screen bg-background">
      <SiteHeader />

      <section className="border-b border-border bg-white">
        <div className="container py-10 lg:py-14">
          <div className="grid gap-8 lg:grid-cols-[1fr_0.45fr] lg:items-end">
            <div>
              <div className="mb-3 flex items-center gap-2">
                <CircleDollarSign size={17} className="text-primary" />
                <p className="text-xs font-black uppercase tracking-widest text-primary">Grille tarifaire</p>
              </div>
              <h1 className="max-w-4xl text-3xl font-black leading-tight text-foreground lg:text-5xl">
                Des prix simples pour monetiser la valeur sans rendre les offres payantes.
              </h1>
              <p className="mt-4 max-w-3xl text-sm font-semibold leading-relaxed text-muted-foreground lg:text-base">
                Les candidats peuvent consulter les offres gratuitement. Les services ci-dessous sont une aide
                optionnelle pour ceux qui veulent ameliorer vite leur dossier.
              </p>
            </div>
            <aside className="rounded-xl border border-border bg-muted/30 p-5">
              <Sparkles size={18} className="text-primary" />
              <p className="mt-4 text-sm font-black text-foreground">Objectif business</p>
              <p className="mt-2 text-sm font-semibold leading-relaxed text-muted-foreground">
                Une page tarifaire claire reduit les questions manuelles et augmente les commandes traçables.
              </p>
            </aside>
          </div>
        </div>
      </section>

      <main className="container py-8">
        <section className="grid gap-4 md:grid-cols-2 xl:grid-cols-4">
          {SERVICE_PRODUCTS.map((service) => (
            <article key={service.id} className="flex flex-col rounded-xl border border-border bg-white p-5 shadow-sm">
              <div className="flex items-start justify-between gap-3">
                <BadgeCheck size={18} className="text-primary" />
                <span className="rounded-full border border-border bg-muted/30 px-3 py-1 text-[11px] font-black uppercase tracking-wide text-muted-foreground">
                  {service.delivery}
                </span>
              </div>
              <h2 className="mt-4 text-lg font-black text-foreground">{service.name}</h2>
              <p className="mt-2 text-3xl font-black text-primary">{service.price}</p>
              <p className="mt-3 text-sm font-semibold leading-relaxed text-muted-foreground">{service.copy}</p>
              <p className="mt-3 text-xs font-black uppercase tracking-wide text-muted-foreground">{service.revenue}</p>
              <a
                href={`/services?service=${service.id}#paiement`}
                data-analytics-source="pricing_cta"
                data-analytics-label={service.id}
                className="mt-5 inline-flex h-10 items-center justify-center gap-2 rounded-xl bg-primary px-4 text-sm font-black text-primary-foreground transition-transform hover:-translate-y-0.5"
              >
                Commander
                <ArrowRight size={15} />
              </a>
            </article>
          ))}
        </section>

        <section className="mt-8 grid gap-5 lg:grid-cols-[0.85fr_1.15fr]">
          <div className="rounded-xl border border-border bg-white p-5 shadow-sm">
            <div className="flex items-center gap-2">
              <ShieldCheck size={17} className="text-primary" />
              <h2 className="text-base font-black text-foreground">Garde-fous commerciaux</h2>
            </div>
            <div className="mt-4 grid gap-3">
              {GUARANTEES.map((item) => (
                <p key={item} className="flex gap-2 rounded-lg border border-border bg-muted/30 p-3 text-xs font-bold leading-relaxed text-muted-foreground">
                  <ShieldCheck size={13} className="mt-0.5 shrink-0 text-primary" />
                  {item}
                </p>
              ))}
            </div>
          </div>

          <div className="rounded-xl border border-border bg-foreground p-5 text-white shadow-sm">
            <p className="text-xs font-black uppercase tracking-widest text-white/70">Automatisation revenu</p>
            <h2 className="mt-2 text-2xl font-black">Un parcours simple a connecter au paiement Mobile Money.</h2>
            <div className="mt-5 grid gap-3 md:grid-cols-3">
              {STEPS.map((step) => (
                <div key={step.title} className="rounded-xl border border-white/10 bg-white/5 p-4">
                  <step.icon size={18} className="text-white" />
                  <p className="mt-3 text-sm font-black">{step.title}</p>
                  <p className="mt-2 text-xs font-bold leading-relaxed text-white/70">{step.copy}</p>
                </div>
              ))}
            </div>
            <a
              href="/services"
              data-analytics-source="pricing_cta"
              data-analytics-label="services_all"
              className="mt-5 inline-flex h-11 items-center justify-center gap-2 rounded-xl bg-white px-5 text-sm font-black text-foreground transition-transform hover:-translate-y-0.5"
            >
              Voir les services
              <ArrowRight size={15} />
            </a>
          </div>
        </section>
      </main>

      <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: JSON.stringify(offerCatalogJsonLd) }} />
    </div>
  );
}
