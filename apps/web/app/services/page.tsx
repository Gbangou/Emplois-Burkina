import { ArrowRight, BadgeCheck, BriefcaseBusiness, FileText, GraduationCap, Languages, MessageSquareText, ShieldCheck } from "lucide-react";
import type { Metadata } from "next";
import { SiteHeader } from "@/components/site-header";
import { LeadCaptureForm } from "@/components/lead-capture-form";

export const metadata: Metadata = {
  title: "Services candidats - CV, lettre, entretien et remote | Emplois Burkina",
  description:
    "Services utiles pour candidats : CV ATS, lettre de motivation, preparation entretien, candidatures ONG, remote et formations courtes."
};

const SERVICES = [
  {
    name: "CV ATS Express",
    price: "2 000 FCFA",
    icon: FileText,
    copy: "CV clair, lisible, adapte au poste vise et pret a envoyer."
  },
  {
    name: "Lettre ciblee",
    price: "1 500 FCFA",
    icon: MessageSquareText,
    copy: "Lettre courte, specifique et coherente avec l'offre choisie."
  },
  {
    name: "Pack ONG / International",
    price: "5 000 FCFA",
    icon: Languages,
    copy: "CV, lettre et checklist pour ONG, ONU, remote ou consulting."
  },
  {
    name: "Preparation entretien",
    price: "3 000 FCFA",
    icon: BriefcaseBusiness,
    copy: "Questions probables, pitch personnel et reponses courtes."
  }
];

const PRINCIPLES = [
  { icon: ShieldCheck, label: "Offres gratuites", copy: "L'acces aux offres reste gratuit pour les candidats." },
  { icon: BadgeCheck, label: "Valeur optionnelle", copy: "Les services aident seulement ceux qui veulent renforcer leur dossier." },
  { icon: GraduationCap, label: "Affiliation utile", copy: "Les formations recommandees doivent etre pertinentes, verifiables et clairement marquees." }
];

export default function ServicesPage() {
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
          {SERVICES.map((service) => (
            <div key={service.name} className="rounded-xl border border-border bg-white p-5 shadow-sm">
              <service.icon size={18} className="text-primary" />
              <h2 className="mt-4 text-base font-black text-foreground">{service.name}</h2>
              <p className="mt-1 text-xl font-black text-primary">{service.price}</p>
              <p className="mt-2 text-sm font-semibold leading-relaxed text-muted-foreground">{service.copy}</p>
            </div>
          ))}
        </div>
      </section>

      <section className="border-y border-border bg-muted/30 py-10">
        <div className="container grid gap-8 lg:grid-cols-[0.9fr_1.1fr]">
          <div>
            <p className="text-xs font-black uppercase tracking-widest text-primary">Demande rapide</p>
            <h2 className="mt-2 text-2xl font-black text-foreground">Transformer l'interet candidat en revenu mesurable</h2>
            <p className="mt-3 text-sm font-semibold leading-relaxed text-muted-foreground">
              Chaque demande alimente le pipeline. La prochaine etape sera le paiement Mobile Money, puis la livraison numerique automatisee.
            </p>
            <a href="/jobs" className="mt-5 inline-flex h-10 items-center gap-2 rounded-xl border border-border bg-white px-4 text-sm font-black text-foreground hover:border-primary hover:text-primary">
              Voir les offres <ArrowRight size={14} />
            </a>
          </div>
          <div className="rounded-xl border border-border bg-white p-5">
            <LeadCaptureForm
              kind="candidate_service"
              submitLabel="Demander le service"
              interestPlaceholder="Service souhaite : CV, lettre, ONG, entretien..."
              messagePlaceholder="Collez le poste vise, votre secteur, ou le lien de l'offre."
            />
          </div>
        </div>
      </section>
    </div>
  );
}
