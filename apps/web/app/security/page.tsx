import { AlertTriangle, ArrowRight, BadgeCheck, DatabaseZap, EyeOff, FileCheck2, LockKeyhole, ServerCog, ShieldCheck, UserCheck } from "lucide-react";
import type { Metadata } from "next";

import { SiteHeader } from "@/components/site-header";

export const metadata: Metadata = {
  title: "Securite et confiance | Emplois Burkina",
  description:
    "Architecture secure by design pour Emplois Burkina : protection des donnees, anti-arnaque, moderation, headers de securite et transparence."
};

const SECURITY_LAYERS = [
  {
    icon: ShieldCheck,
    title: "Offres verifiees",
    copy: "Score de confiance, source visible, moderation des offres douteuses et prevention des fausses annonces."
  },
  {
    icon: LockKeyhole,
    title: "Acces admin ferme",
    copy: "Les surfaces internes sont bloquees en production sans secret admin dedie."
  },
  {
    icon: EyeOff,
    title: "Donnees minimales",
    copy: "Collecte limitee aux besoins utiles : alertes, contact, service demande et suivi technique."
  },
  {
    icon: DatabaseZap,
    title: "Leads proteges",
    copy: "Les contacts candidats ne sont pas exposables publiquement et les champs soumis sont limites."
  },
  {
    icon: ServerCog,
    title: "Headers modernes",
    copy: "CSP, anti-clickjacking, nosniff, permissions policy et referrer policy appliques globalement."
  },
  {
    icon: FileCheck2,
    title: "Sources propres",
    copy: "Scraping de contenus publics, source originale preservee et respect des donnees privees."
  }
];

const TRUST_RULES = [
  "Ne jamais vendre de donnees personnelles candidat.",
  "Ne jamais promettre un emploi, un visa ou un gain garanti.",
  "Garder les offres accessibles gratuitement.",
  "Marquer clairement les recommandations et futurs liens affilies.",
  "Utiliser uniquement des statistiques agregees pour les rapports marche.",
  "Bloquer les demandes de paiement suspectes et les sources non fiables."
];

const SECURITY_ROADMAP = [
  "Rate limiting persistant par IP et endpoint critique.",
  "Journal d'audit admin avec export et detection d'anomalies.",
  "Validation schema stricte sur toutes les API publiques.",
  "Moderation assistee par IA pour liens, emails, telephones et promesses douteuses.",
  "Backups chiffres, rotation de secrets et monitoring d'erreurs.",
  "Programme de signalement public pour offres frauduleuses."
];

export default function SecurityPage() {
  return (
    <div className="min-h-screen bg-background">
      <SiteHeader />

      <section className="border-b border-border bg-white">
        <div className="container py-10 lg:py-14">
          <div className="grid gap-8 lg:grid-cols-[1fr_0.42fr] lg:items-end">
            <div>
              <div className="mb-3 flex items-center gap-2">
                <ShieldCheck size={17} className="text-primary" />
                <p className="text-xs font-black uppercase tracking-widest text-primary">Secure by design</p>
              </div>
              <h1 className="max-w-4xl text-3xl font-black leading-tight text-foreground lg:text-5xl">
                Une plateforme emploi rentable doit d'abord etre fiable.
              </h1>
              <p className="mt-4 max-w-3xl text-sm font-semibold leading-relaxed text-muted-foreground lg:text-base">
                Emplois Burkina est pense pour proteger les candidats, rassurer les recruteurs, soutenir le SEO, reduire les abus et permettre une monetisation legale sans exploiter les utilisateurs.
              </p>
            </div>
            <div className="rounded-xl border border-emerald-200 bg-emerald-50 p-5">
              <BadgeCheck size={18} className="text-emerald-700" />
              <p className="mt-4 text-sm font-black text-emerald-900">Principe central</p>
              <p className="mt-2 text-sm font-semibold leading-relaxed text-emerald-800">
                Gratuit pour chercher les offres. Revenu par contenu, valeur optionnelle, publicite sobre et donnees anonymisees.
              </p>
            </div>
          </div>
        </div>
      </section>

      <section className="container py-8">
        <div className="grid gap-4 md:grid-cols-2 xl:grid-cols-3">
          {SECURITY_LAYERS.map((layer) => (
            <article key={layer.title} className="rounded-xl border border-border bg-white p-5 shadow-sm">
              <layer.icon size={19} className="text-primary" />
              <h2 className="mt-4 text-base font-black text-foreground">{layer.title}</h2>
              <p className="mt-2 text-sm font-semibold leading-relaxed text-muted-foreground">{layer.copy}</p>
            </article>
          ))}
        </div>
      </section>

      <section className="border-y border-border bg-muted/30 py-10">
        <div className="container grid gap-8 lg:grid-cols-[0.9fr_1.1fr]">
          <div>
            <div className="mb-3 flex items-center gap-2">
              <UserCheck size={17} className="text-primary" />
              <p className="text-xs font-black uppercase tracking-widest text-primary">Regles de confiance</p>
            </div>
            <h2 className="text-2xl font-black text-foreground">Ce que l'app ne doit jamais sacrifier pour gagner de l'argent.</h2>
            <p className="mt-3 text-sm font-semibold leading-relaxed text-muted-foreground">
              Le revenu durable depend de la confiance. Un job board qui abuse des candidats perd Google, AdSense, les partenaires et la reputation.
            </p>
          </div>

          <div className="grid gap-3 sm:grid-cols-2">
            {TRUST_RULES.map((rule) => (
              <div key={rule} className="flex gap-3 rounded-xl border border-border bg-white p-4">
                <ShieldCheck size={16} className="mt-0.5 shrink-0 text-primary" />
                <p className="text-xs font-bold leading-relaxed text-muted-foreground">{rule}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      <section className="container py-10">
        <div className="grid gap-6 lg:grid-cols-[1fr_0.42fr]">
          <div className="rounded-xl border border-border bg-white p-6 shadow-sm">
            <div className="mb-3 flex items-center gap-2">
              <AlertTriangle size={17} className="text-primary" />
              <p className="text-xs font-black uppercase tracking-widest text-primary">Roadmap securite</p>
            </div>
            <h2 className="text-2xl font-black text-foreground">Prochaines protections a industrialiser</h2>
            <div className="mt-5 grid gap-3">
              {SECURITY_ROADMAP.map((item, index) => (
                <div key={item} className="flex items-start gap-3 rounded-xl border border-border bg-muted/20 px-4 py-3">
                  <span className="flex h-7 w-7 shrink-0 items-center justify-center rounded-lg bg-foreground text-[11px] font-black text-white">
                    {index + 1}
                  </span>
                  <p className="text-sm font-bold leading-snug text-muted-foreground">{item}</p>
                </div>
              ))}
            </div>
          </div>

          <aside className="rounded-xl border border-border bg-foreground p-6 text-white">
            <LockKeyhole size={19} />
            <h2 className="mt-4 text-xl font-black">Design cible</h2>
            <p className="mt-3 text-sm font-semibold leading-relaxed text-white/70">
              Authentification forte pour admin, validation stricte, moderation anti-fraude, audit trail, sauvegardes, secrets separes, monitoring, et pages publiques rapides qui respectent la confidentialite.
            </p>
            <div className="mt-5 grid gap-2">
              <a href="/privacy" className="inline-flex h-10 items-center justify-center gap-2 rounded-xl bg-white px-4 text-sm font-black text-foreground transition-transform hover:-translate-y-0.5">
                Confidentialite <ArrowRight size={14} />
              </a>
              <a href="/contact" className="inline-flex h-10 items-center justify-center gap-2 rounded-xl border border-white/15 text-sm font-black text-white transition-colors hover:bg-white/10">
                Signaler un abus <ArrowRight size={14} />
              </a>
            </div>
          </aside>
        </div>
      </section>
    </div>
  );
}
