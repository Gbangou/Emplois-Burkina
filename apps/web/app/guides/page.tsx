import { ArrowRight, BookOpenCheck, FileText, GraduationCap, SearchCheck, ShieldCheck, WalletCards } from "lucide-react";
import type { Metadata } from "next";

import { SiteHeader } from "@/components/site-header";
import { GUIDES } from "@/lib/guides";

export const metadata: Metadata = {
  title: "Guides emploi, CV, concours et remote | Emplois Burkina",
  description:
    "Guides pratiques pour trouver un emploi, creer un CV ATS, postuler aux ONG, suivre les concours et chercher du remote depuis le Burkina Faso."
};

const REVENUE_PILLARS = [
  { icon: SearchCheck, title: "Trafic SEO durable", copy: "Des sujets recherches toute l'annee, meme quand les offres expirent." },
  { icon: FileText, title: "Services optionnels", copy: "CV, lettre et preparation restent utiles sans rendre les offres payantes." },
  { icon: GraduationCap, title: "Affiliation utile", copy: "Formations et outils recommandes seulement quand ils servent le candidat." },
  { icon: WalletCards, title: "Publicite sobre", copy: "Pages pretes pour AdSense avec contenu utile en priorite." }
];

export default function GuidesPage() {
  return (
    <div className="min-h-screen bg-background">
      <SiteHeader />

      <section className="border-b border-border bg-white">
        <div className="container py-10 lg:py-14">
          <div className="max-w-3xl">
            <div className="mb-3 flex items-center gap-2">
              <BookOpenCheck size={17} className="text-primary" />
              <p className="text-xs font-black uppercase tracking-widest text-primary">Guides emploi</p>
            </div>
            <h1 className="text-3xl font-black leading-tight text-foreground lg:text-5xl">
              Du contenu utile qui attire du trafic et finance les offres gratuites.
            </h1>
            <p className="mt-4 text-sm font-semibold leading-relaxed text-muted-foreground lg:text-base">
              CV ATS, lettres ONG, remote, concours et preparation candidat. Ces pages sont faites pour etre trouvees par Google, aider les candidats, puis monetiser proprement par contenu, services optionnels et recommandations utiles.
            </p>
          </div>
        </div>
      </section>

      <section className="container py-8">
        <div className="grid gap-4 md:grid-cols-2 xl:grid-cols-4">
          {REVENUE_PILLARS.map((pillar) => (
            <article key={pillar.title} className="rounded-xl border border-border bg-white p-5 shadow-sm">
              <pillar.icon size={18} className="text-primary" />
              <h2 className="mt-4 text-base font-black text-foreground">{pillar.title}</h2>
              <p className="mt-2 text-sm font-semibold leading-relaxed text-muted-foreground">{pillar.copy}</p>
            </article>
          ))}
        </div>
      </section>

      <section className="border-y border-border bg-muted/30 py-10">
        <div className="container">
          <div className="flex flex-col gap-3 md:flex-row md:items-end md:justify-between">
            <div>
              <p className="text-xs font-black uppercase tracking-widest text-primary">Bibliotheque SEO</p>
              <h2 className="mt-2 text-2xl font-black text-foreground">Pages a fort potentiel de recherche</h2>
            </div>
            <p className="max-w-xl text-sm font-semibold leading-relaxed text-muted-foreground">
              Chaque guide cible une intention claire, puis propose une suite naturelle: offre gratuite, service optionnel, alerte ou recommandation.
            </p>
          </div>

          <div className="mt-6 grid gap-4 md:grid-cols-2">
            {GUIDES.map((guide) => (
              <a key={guide.slug} href={`/guides/${guide.slug}`} className="group rounded-xl border border-border bg-white p-5 shadow-sm transition-all hover:-translate-y-0.5 hover:border-primary hover:shadow-md">
                <div className="flex items-start justify-between gap-3">
                  <BookOpenCheck size={18} className="mt-1 shrink-0 text-primary" />
                  <span className="rounded-full bg-primary/10 px-3 py-1 text-[11px] font-black uppercase tracking-wide text-primary">
                    Gratuit
                  </span>
                </div>
                <h3 className="mt-4 text-lg font-black leading-snug text-foreground group-hover:text-primary">{guide.title}</h3>
                <p className="mt-2 text-sm font-semibold leading-relaxed text-muted-foreground">{guide.description}</p>
                <div className="mt-4 grid gap-2 border-t border-border pt-4 text-xs font-bold text-muted-foreground">
                  <p>Audience: {guide.audience}</p>
                  <p>Monetisation: {guide.revenuePath}</p>
                </div>
                <div className="mt-4 flex items-center justify-between text-xs font-black text-primary">
                  <span>Lire le guide</span>
                  <ArrowRight size={13} className="transition-transform group-hover:translate-x-0.5" />
                </div>
              </a>
            ))}
          </div>
        </div>
      </section>

      <section className="container py-10">
        <div className="rounded-xl border border-border bg-foreground p-6 text-white">
          <div className="flex flex-col gap-5 md:flex-row md:items-center md:justify-between">
            <div>
              <div className="mb-3 flex items-center gap-2 text-white">
                <ShieldCheck size={16} />
                <p className="text-xs font-black uppercase tracking-widest">Regle business</p>
              </div>
              <h2 className="text-2xl font-black">Les offres restent gratuites. La valeur finance la plateforme.</h2>
              <p className="mt-2 max-w-2xl text-sm font-semibold leading-relaxed text-white/70">
                Le contenu attire, les annonces sobres monetisent le trafic, les services optionnels aident les candidats qui le veulent, et les donnees agregees peuvent devenir des rapports utiles.
              </p>
            </div>
            <a href="/services" className="inline-flex h-11 shrink-0 items-center justify-center gap-2 rounded-xl bg-white px-5 text-sm font-black text-foreground transition-transform hover:-translate-y-0.5">
              Voir les services <ArrowRight size={15} />
            </a>
          </div>
        </div>
      </section>
    </div>
  );
}
