import { ArrowRight, BadgeCheck, BriefcaseBusiness, FileText, GraduationCap, Languages, MessageSquareText, ShieldCheck, WalletCards, Zap, type LucideIcon } from "lucide-react";
import type { Metadata } from "next";
import { SiteHeader } from "@/components/site-header";
import { LeadCaptureForm } from "@/components/lead-capture-form";
import { ServiceOrderCard } from "@/components/service-order-card";
import { REVENUE_CHANNELS, REVENUE_OPERATING_RULES, SERVICE_PRODUCTS, type RevenueChannel, type ServiceProduct } from "@/lib/revenue";

export const metadata: Metadata = {
  title: "Services candidats - CV, lettre, entretien et remote | Emplois Burkina",
  description:
    "Services utiles pour candidats : CV ATS, lettre de motivation, preparation entretien, candidatures ONG, remote et formations courtes."
};

const SERVICE_ICONS: Record<ServiceProduct["id"], LucideIcon> = {
  "cv-ats": FileText,
  lettre: MessageSquareText,
  "ong-international": Languages,
  entretien: BriefcaseBusiness
};

const CHANNEL_ICONS: Record<RevenueChannel["id"], LucideIcon> = {
  "adsense-content": FileText,
  "affiliate-tools": GraduationCap,
  "digital-services": WalletCards,
  "market-reports": BriefcaseBusiness
};

const PRINCIPLES = [
  { icon: ShieldCheck, label: "Offres gratuites", copy: "L'acces aux offres reste gratuit pour les candidats." },
  { icon: BadgeCheck, label: "Valeur optionnelle", copy: "Les services aident seulement ceux qui veulent renforcer leur dossier." },
  { icon: GraduationCap, label: "Affiliation utile", copy: "Les formations recommandees doivent etre pertinentes, verifiables et clairement marquees." }
];

const DEFAULT_SERVICE = SERVICE_PRODUCTS[0]!;

type ServicesPageProps = {
  searchParams?: Promise<Record<string, string | string[] | undefined>>;
};

function one(value: string | string[] | undefined) {
  return Array.isArray(value) ? value[0] || "" : value || "";
}

export default async function ServicesPage({ searchParams }: ServicesPageProps) {
  const params = (await searchParams) || {};
  const selectedId = one(params.service);
  const selected = SERVICE_PRODUCTS.find((service) => service.id === selectedId) || DEFAULT_SERVICE;

  return (
    <div className="min-h-screen bg-background">
      <SiteHeader />

      <section className="border-b border-border bg-white">
        <div className="container py-10 lg:py-14">
          <div className="grid gap-8 lg:grid-cols-[1.05fr_0.95fr] lg:items-end">
            <div>
              <div className="mb-3 flex items-center gap-2">
                <FileText size={17} className="text-primary" />
                <p className="text-xs font-black uppercase tracking-widest text-primary">Services candidats</p>
              </div>
              <h1 className="max-w-3xl text-3xl font-black leading-tight text-foreground lg:text-5xl">
                Des candidatures plus fortes sans rendre les offres payantes.
              </h1>
              <p className="mt-4 max-w-2xl text-sm font-semibold leading-relaxed text-muted-foreground lg:text-base">
                CV, lettre, entretien, candidatures ONG/remote et orientation formation. Une couche optionnelle pour monetiser la valeur sans bloquer l'acces aux opportunites.
              </p>
            </div>
            <div className="grid gap-3 sm:grid-cols-3 lg:grid-cols-1">
              {PRINCIPLES.map((item) => (
                <div key={item.label} className="flex gap-3 rounded-xl border border-border bg-muted/30 p-4">
                  <item.icon size={17} className="mt-0.5 shrink-0 text-primary" />
                  <div>
                    <p className="text-sm font-black text-foreground">{item.label}</p>
                    <p className="mt-0.5 text-xs font-semibold leading-relaxed text-muted-foreground">{item.copy}</p>
                  </div>
                </div>
              ))}
            </div>
          </div>
        </div>
      </section>

      <section className="container py-8">
        <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
          {SERVICE_PRODUCTS.map((service) => {
            const ServiceIcon = SERVICE_ICONS[service.id];

            return (
              <a
                key={service.name}
                href={`/services?service=${encodeURIComponent(service.id)}#demande`}
                className={`group rounded-xl border bg-white p-5 shadow-sm transition-all hover:-translate-y-0.5 hover:shadow-md ${
                  selected.id === service.id ? "border-primary ring-2 ring-primary/10" : "border-border hover:border-primary"
                }`}
              >
                <ServiceIcon size={18} className="text-primary" />
                <h2 className="mt-4 text-base font-black text-foreground">{service.name}</h2>
                <p className="mt-1 text-xl font-black text-primary">{service.price}</p>
                <p className="mt-2 text-sm font-semibold leading-relaxed text-muted-foreground">{service.copy}</p>
                <div className="mt-4 flex items-center justify-between border-t border-border pt-3 text-xs font-black text-muted-foreground">
                  <span>{service.delivery}</span>
                  <ArrowRight size={13} className="transition-transform group-hover:translate-x-0.5 group-hover:text-primary" />
                </div>
              </a>
            );
          })}
        </div>
      </section>

      <section className="border-t border-border bg-white py-10">
        <div className="container">
          <div className="flex flex-col gap-3 md:flex-row md:items-end md:justify-between">
            <div>
              <p className="text-xs font-black uppercase tracking-widest text-primary">Revenus digitaux legaux</p>
              <h2 className="mt-2 max-w-2xl text-2xl font-black leading-tight text-foreground lg:text-3xl">
                Un moteur de revenus qui grandit avec le trafic, sans bloquer les candidats.
              </h2>
            </div>
            <p className="max-w-xl text-sm font-semibold leading-relaxed text-muted-foreground">
              La strategie combine contenu SEO, annonces sobres, recommandations utiles, services optionnels et donnees agregees.
            </p>
          </div>
          <div className="mt-5">
            <a
              href="/grille-tarifaire"
              data-analytics-source="services_cta"
              data-analytics-label="pricing"
              className="inline-flex h-11 items-center justify-center gap-2 rounded-xl border border-border bg-white px-5 text-sm font-black text-foreground transition-transform hover:-translate-y-0.5 hover:border-primary"
            >
              Voir la grille tarifaire
              <ArrowRight size={15} />
            </a>
          </div>

          <div className="mt-6 grid gap-4 md:grid-cols-2 xl:grid-cols-4">
            {REVENUE_CHANNELS.map((channel) => {
              const ChannelIcon = CHANNEL_ICONS[channel.id];

              return (
                <article key={channel.id} className="rounded-xl border border-border bg-muted/20 p-5 shadow-sm">
                  <div className="flex items-start justify-between gap-3">
                    <ChannelIcon size={18} className="mt-1 shrink-0 text-primary" />
                    <span className="rounded-full bg-primary/10 px-3 py-1 text-[11px] font-black uppercase tracking-wide text-primary">
                      {channel.monthlyPotential}
                    </span>
                  </div>
                  <h3 className="mt-4 text-base font-black text-foreground">{channel.name}</h3>
                  <p className="mt-2 text-sm font-semibold leading-relaxed text-muted-foreground">{channel.model}</p>
                  <p className="mt-3 text-xs font-black uppercase tracking-wide text-muted-foreground">{channel.audience}</p>
                  <p className="mt-1 text-xs font-semibold leading-relaxed text-muted-foreground">{channel.activation}</p>
                  <div className="mt-4 flex flex-wrap gap-2">
                    {channel.guardrails.map((guardrail) => (
                      <span key={guardrail} className="rounded-full border border-border bg-white px-3 py-1 text-[11px] font-black text-muted-foreground">
                        {guardrail}
                      </span>
                    ))}
                  </div>
                </article>
              );
            })}
          </div>

          <div className="mt-5 grid gap-3 md:grid-cols-4">
            {REVENUE_OPERATING_RULES.map((rule) => (
              <div key={rule} className="flex gap-3 rounded-xl border border-border bg-white p-4">
                <ShieldCheck size={16} className="mt-0.5 shrink-0 text-primary" />
                <p className="text-xs font-bold leading-relaxed text-muted-foreground">{rule}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      <section className="container grid gap-8 py-10 lg:grid-cols-[0.92fr_1.08fr]">
        <div className="self-start rounded-xl border border-border bg-white p-6 shadow-sm">
          <p className="text-xs font-black uppercase tracking-widest text-primary">Monetisation directe</p>
          <h2 className="mt-2 text-2xl font-black text-foreground">Transformer les services en commandes payables.</h2>
          <p className="mt-3 text-sm font-semibold leading-relaxed text-muted-foreground">
            Le service reste optionnel. Cette etape cree une commande structuree avec montant, reference, statut et paiement Mobile Money a connecter.
          </p>
          <div className="mt-5 grid gap-3">
            <div className="rounded-xl border border-border bg-muted/30 p-4">
              <p className="text-sm font-black text-foreground">Prochaine integration</p>
              <p className="mt-1 text-xs font-semibold leading-relaxed text-muted-foreground">
                Brancher un prestataire de paiement disponible pour le Burkina Faso, puis automatiser confirmation et livraison.
              </p>
            </div>
            <div className="rounded-xl border border-border bg-muted/30 p-4">
              <p className="text-sm font-black text-foreground">Pourquoi c'est rentable</p>
              <p className="mt-1 text-xs font-semibold leading-relaxed text-muted-foreground">
                Un petit volume de commandes services peut rapporter plus qu'AdSense au debut, tout en gardant les offres gratuites.
              </p>
            </div>
          </div>
        </div>
        <ServiceOrderCard service={selected} />
      </section>

      <section className="border-y border-border bg-muted/30 py-10" id="demande">
        <div className="container grid gap-8 lg:grid-cols-[0.9fr_1.1fr]">
          <div>
            <p className="text-xs font-black uppercase tracking-widest text-primary">Demande rapide</p>
            <h2 className="mt-2 text-2xl font-black text-foreground">Transformer l'interet candidat en revenu mesurable</h2>
            <p className="mt-3 text-sm font-semibold leading-relaxed text-muted-foreground">
              Chaque demande alimente le pipeline. La prochaine etape sera le paiement Mobile Money, puis la livraison numerique automatisee.
            </p>
            <div className="mt-5 grid gap-3">
              <div className="flex gap-3 rounded-xl border border-border bg-white p-4">
                <WalletCards size={17} className="mt-0.5 shrink-0 text-primary" />
                <div>
                  <p className="text-sm font-black text-foreground">Paiement Mobile Money ready</p>
                  <p className="mt-0.5 text-xs font-semibold leading-relaxed text-muted-foreground">
                    La page capture deja le service choisi ; le prochain branchement est le paiement puis la livraison.
                  </p>
                </div>
              </div>
              <div className="flex gap-3 rounded-xl border border-border bg-white p-4">
                <Zap size={17} className="mt-0.5 shrink-0 text-primary" />
                <div>
                  <p className="text-sm font-black text-foreground">{selected.revenue}</p>
                  <p className="mt-0.5 text-xs font-semibold leading-relaxed text-muted-foreground">
                    Service selectionne : {selected.name} - {selected.price}.
                  </p>
                </div>
              </div>
            </div>
          </div>
          <div className="rounded-xl border border-border bg-white p-5">
            <LeadCaptureForm
              kind="candidate_service"
              submitLabel="Demander le service"
              nameLabel="Nom du candidat"
              namePlaceholder="Votre nom"
              emailLabel="Email"
              phoneLabel="WhatsApp"
              defaultInterest={selected.name}
              interestPlaceholder="Service souhaite : CV, lettre, ONG, entretien..."
              messagePlaceholder="Collez le poste vise, votre secteur, ou le lien de l'offre."
            />
          </div>
        </div>
      </section>
    </div>
  );
}
