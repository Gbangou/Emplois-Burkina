import { Bell, CheckCircle, Clock, LockKeyhole, MapPin, SearchCheck, ShieldCheck, Smartphone } from "lucide-react";
import type { Metadata } from "next";
import { LeadCaptureForm } from "@/components/lead-capture-form";
import { SiteHeader } from "@/components/site-header";

export const metadata: Metadata = {
  title: "Alertes emploi gratuites WhatsApp | Emplois Burkina",
  description:
    "Recevez les nouvelles offres d'emploi, concours, stages, ONG et opportunites remote au Burkina Faso selon votre ville, secteur et metier.",
  alternates: {
    canonical: "/alertes"
  },
  openGraph: {
    title: "Alertes emploi gratuites WhatsApp",
    description: "Recevez les offres pertinentes sans verifier plusieurs sites chaque jour.",
    url: "https://emplois-burkina.com/alertes",
    type: "website"
  }
};

const BENEFITS = [
  { icon: SearchCheck, title: "Moins de recherche manuelle", body: "Les offres pertinentes arrivent selon vos criteres: metier, ville, secteur et type d'opportunite." },
  { icon: Clock, title: "Meilleure reaction", body: "Les deadlines passent vite. Une alerte augmente vos chances de voir l'offre assez tot." },
  { icon: ShieldCheck, title: "Sources filtrees", body: "Les alertes privilegient les offres publiees, lisibles et suffisamment fiables." },
  { icon: LockKeyhole, title: "Respect de la vie privee", body: "Le numero sert aux alertes demandees. Pas de vente de contacts candidats." }
];

const SEGMENTS = [
  "ONG / Humanitaire",
  "Concours",
  "Informatique / Tech",
  "Finance / Comptabilite",
  "Sante",
  "Remote",
  "Stages",
  "Ouagadougou",
  "Bobo-Dioulasso"
];

export default function AlertesPage() {
  return (
    <div className="min-h-screen bg-background">
      <SiteHeader />

      <section className="border-b border-border bg-white">
        <div className="container grid gap-8 py-10 lg:grid-cols-[1fr_0.44fr] lg:items-end lg:py-14">
          <div>
            <div className="mb-3 flex items-center gap-2">
              <Bell size={17} className="text-primary" />
              <p className="text-xs font-black uppercase tracking-widest text-primary">Alertes gratuites</p>
            </div>
            <h1 className="max-w-4xl text-3xl font-black leading-tight text-foreground lg:text-5xl">
              Recevez les bonnes offres sans verifier tous les sites chaque jour.
            </h1>
            <p className="mt-4 max-w-3xl text-sm font-semibold leading-relaxed text-muted-foreground lg:text-base">
              Choisissez vos criteres. Emplois Burkina garde les offres gratuites et vous aide a revenir au bon moment, quand une opportunite pertinente arrive.
            </p>
            <div className="mt-5 flex flex-wrap gap-2">
              {SEGMENTS.map((segment) => (
                <a
                  key={segment}
                  href={`/jobs?q=${encodeURIComponent(segment)}`}
                  className="rounded-full border border-border bg-muted/40 px-3 py-1 text-xs font-black text-muted-foreground transition-colors hover:border-primary hover:text-primary"
                >
                  {segment}
                </a>
              ))}
            </div>
          </div>

          <aside className="rounded-xl border border-emerald-200 bg-emerald-50 p-5">
            <Smartphone size={20} className="text-emerald-700" />
            <p className="mt-4 text-sm font-black text-emerald-950">Pourquoi c'est important</p>
            <p className="mt-2 text-sm font-semibold leading-relaxed text-emerald-900/75">
              Les alertes transforment un visiteur ponctuel en audience recurrente. Cela augmente les retours, les pages vues utiles et la valeur de la plateforme sans faire payer l'acces aux offres.
            </p>
          </aside>
        </div>
      </section>

      <main className="container grid gap-8 py-10 lg:grid-cols-[0.92fr_1.08fr]">
        <section className="grid gap-4 self-start">
          {BENEFITS.map((benefit) => (
            <article key={benefit.title} className="rounded-xl border border-border bg-white p-5 shadow-sm">
              <benefit.icon size={18} className="text-primary" />
              <h2 className="mt-4 text-base font-black text-foreground">{benefit.title}</h2>
              <p className="mt-2 text-sm font-semibold leading-relaxed text-muted-foreground">{benefit.body}</p>
            </article>
          ))}
        </section>

        <section className="rounded-xl border border-border bg-white p-5 shadow-sm">
          <div className="mb-5 flex flex-col gap-2 border-b border-border pb-5 sm:flex-row sm:items-end sm:justify-between">
            <div>
              <p className="text-xs font-black uppercase tracking-widest text-primary">Activation</p>
              <h2 className="mt-2 text-2xl font-black text-foreground">Creer une alerte emploi</h2>
            </div>
            <span className="inline-flex items-center gap-1.5 rounded-full border border-border bg-muted/40 px-3 py-1 text-xs font-black text-muted-foreground">
              <CheckCircle size={12} className="text-emerald-600" /> Gratuit
            </span>
          </div>

          <LeadCaptureForm
            kind="alert"
            submitLabel="Activer mon alerte"
            nameLabel="Nom"
            namePlaceholder="Votre nom"
            emailLabel="Email optionnel"
            phoneLabel="WhatsApp"
            interestPlaceholder="Metier ou mots-cles"
            messagePlaceholder="Ville, secteur, niveau, contrat souhaite..."
          />

          <div className="mt-5 grid gap-3 rounded-xl border border-border bg-muted/30 p-4">
            <div className="flex gap-3">
              <MapPin size={16} className="mt-0.5 shrink-0 text-primary" />
              <p className="text-xs font-semibold leading-relaxed text-muted-foreground">
                Conseil: ajoutez au moins une ville ou un secteur pour recevoir des alertes plus pertinentes.
              </p>
            </div>
            <div className="flex gap-3">
              <LockKeyhole size={16} className="mt-0.5 shrink-0 text-primary" />
              <p className="text-xs font-semibold leading-relaxed text-muted-foreground">
                Vos informations servent a l'alerte demandee. Les donnees candidates ne sont pas revendues.
              </p>
            </div>
          </div>
        </section>
      </main>
    </div>
  );
}
