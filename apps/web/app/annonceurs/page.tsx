import {
  ArrowRight,
  BarChart3,
  Bell,
  CheckCircle,
  CreditCard,
  FileText,
  Megaphone,
  MessageSquare,
  Send,
  Share2,
  ShieldCheck,
  Users,
  Zap
} from "lucide-react";
import type { Metadata } from "next";
import { SiteHeader } from "@/components/site-header";
import { Badge } from "@/components/ui/badge";
import { Card, CardContent } from "@/components/ui/card";
import { LeadCaptureForm } from "@/components/lead-capture-form";

export const metadata: Metadata = {
  title: "Publier une annonce | Emplois Burkina — Recruteurs Burkina Faso",
  description: "Publiez vos offres d'emploi sur Emplois Burkina. Diffusion WhatsApp, Facebook, catalogue et alertes candidats. Paiement Mobile Money."
};

const PACKAGES = [
  {
    name: "Annonce Standard",
    price: "25 000",
    currency: "FCFA",
    period: "30 jours",
    desc: "Idéal pour les PME et organisations locales.",
    features: [
      "Vérification et publication en 24h",
      "Page offre dédiée avec SEO",
      "Diffusion dans le catalogue",
      "Visible sur la recherche",
      "Score de confiance attribué"
    ],
    icon: FileText,
    color: "text-blue-600",
    bg: "bg-blue-50",
    border: "border-blue-200",
    cta: "Choisir Standard"
  },
  {
    name: "Offre Sponsorisée",
    price: "75 000",
    currency: "FCFA",
    period: "30 jours",
    desc: "Le choix des ONG, cabinets et entreprises sérieuses.",
    features: [
      "Tout ce qui est inclus dans Standard",
      "Mise en avant 7 jours sur la home",
      "Diffusion WhatsApp ciblée par ville/secteur",
      "Partage automatique sur Facebook",
      "Rapport de performance inclus"
    ],
    icon: Megaphone,
    color: "text-white",
    bg: "bg-foreground",
    border: "border-transparent",
    featured: true,
    cta: "Choisir Sponsorisé"
  },
  {
    name: "Campagne Recrutement",
    price: "150 000+",
    currency: "FCFA",
    period: "selon volume",
    desc: "Pour les recrutements complexes et les grands volumes.",
    features: [
      "Tout ce qui est inclus dans Sponsorisé",
      "Formulaire candidature intégré",
      "Shortlist et export des candidatures",
      "Suivi opérationnel dédié",
      "Rapport avancé + benchmark"
    ],
    icon: Users,
    color: "text-violet-600",
    bg: "bg-violet-50",
    border: "border-violet-200",
    cta: "Demander un devis"
  }
];

const PROCESS = [
  { step: "01", label: "Brief", desc: "Décrivez le poste, la ville, le profil cible et votre délai." },
  { step: "02", label: "Vérification", desc: "Notre équipe vérifie l'offre et vous contacte si besoin." },
  { step: "03", label: "Publication", desc: "L'offre est publiée et mise en ligne sous 24h." },
  { step: "04", label: "Diffusion", desc: "WhatsApp, Facebook, catalogue — distribution automatique." },
  { step: "05", label: "Rapport", desc: "Vues, leads et candidatures disponibles dans votre espace." }
];

const PROOF = [
  { icon: ShieldCheck, label: "Offres vérifiées", desc: "Toute annonce passe une modération avant publication." },
  { icon: Share2, label: "Multi-canal", desc: "WhatsApp, Facebook, Telegram, catalogue et SEO." },
  { icon: BarChart3, label: "Mesurable", desc: "Vues, clics, leads — tout est tracé." },
  { icon: CreditCard, label: "Mobile Money", desc: "Paiement par Orange Money, Moov ou virement." }
];

export default function AdvertisersPage() {
  return (
    <div className="min-h-screen bg-background">
      <SiteHeader />

      {/* ── HERO ── */}
      <section className="relative overflow-hidden border-b border-border">
        <div className="absolute inset-0"
          style={{ background: "linear-gradient(135deg, #07171e 0%, #0c3d26 100%)" }} />
        <div className="absolute inset-0 opacity-10"
          style={{ backgroundImage: "radial-gradient(circle at 1px 1px, rgba(255,255,255,0.15) 1px, transparent 0)", backgroundSize: "32px 32px" }} />

        <div className="container relative py-16 lg:py-20">
          <div className="grid lg:grid-cols-2 gap-10 items-center">
            <div>
              <Badge className="mb-4 bg-white/10 text-white border-white/20">
                Espace recruteur
              </Badge>
              <h1 className="font-black text-white leading-tight mb-4"
                style={{ fontSize: "clamp(2rem, 4vw, 3rem)" }}>
                Trouvez les bons profils au Burkina Faso
              </h1>
              <p className="text-white/70 font-semibold leading-relaxed mb-6 text-lg">
                Publiez votre annonce et atteignez des milliers de candidats via WhatsApp,
                Facebook et le catalogue Emplois Burkina — sans effort de votre côté.
              </p>
              <div className="flex flex-wrap gap-3">
                {["Vérification rapide", "Mobile Money", "Multi-canal", "Sans abonnement"].map((t) => (
                  <span key={t} className="inline-flex items-center gap-1.5 bg-white/10 border border-white/15 text-white/90 rounded-full px-3 py-1.5 text-sm font-black">
                    <CheckCircle size={12} /> {t}
                  </span>
                ))}
              </div>
            </div>

            {/* Process steps */}
            <div className="grid gap-2">
              {PROCESS.map((p, i) => (
                <div key={p.step}
                  className="flex items-center gap-4 p-4 rounded-xl bg-white/5 border border-white/10 hover:bg-white/8 transition-colors">
                  <span className="w-9 h-9 rounded-xl flex items-center justify-center text-xs font-black text-white shrink-0"
                    style={{ background: i === 2 ? "linear-gradient(135deg, #128449, #00a7a5)" : "rgba(255,255,255,0.1)" }}>
                    {p.step}
                  </span>
                  <div>
                    <p className="font-black text-white text-sm">{p.label}</p>
                    <p className="text-white/60 text-xs font-semibold">{p.desc}</p>
                  </div>
                </div>
              ))}
            </div>
          </div>
        </div>
      </section>

      {/* ── PACKAGES ── */}
      <section className="container py-16">
        <div className="text-center mb-10">
          <p className="text-xs font-black text-primary uppercase tracking-widest mb-2 flex items-center justify-center gap-2">
            <span className="w-1.5 h-1.5 rounded-full bg-primary" />
            Tarifs
          </p>
          <h2 className="text-2xl lg:text-3xl font-black text-foreground">
            Des offres adaptées à votre besoin
          </h2>
          <p className="text-muted-foreground font-semibold mt-2 max-w-xl mx-auto">
            Paiement par Mobile Money (Orange, Moov) ou virement bancaire. Sans engagement.
          </p>
        </div>

        <div className="grid gap-5 sm:grid-cols-2 lg:grid-cols-3 max-w-5xl mx-auto">
          {PACKAGES.map((pack) => (
            <div
              key={pack.name}
              className={`relative rounded-2xl border p-6 grid gap-5 ${pack.border} ${pack.featured ? "shadow-xl" : "shadow-sm"}`}
              style={{ background: pack.featured ? "#07171e" : "white" }}
            >
              {pack.featured && (
                <div className="absolute -top-3 left-1/2 -translate-x-1/2">
                  <span className="inline-flex items-center gap-1 bg-primary text-white rounded-full px-3 py-1 text-xs font-black shadow-md">
                    <Zap size={10} /> Le plus populaire
                  </span>
                </div>
              )}

              <div>
                <div className={`w-11 h-11 rounded-xl flex items-center justify-center mb-4 ${pack.featured ? "bg-white/10" : pack.bg}`}>
                  <pack.icon size={20} className={pack.featured ? "text-emerald-400" : pack.color} />
                </div>
                <h3 className={`font-black text-lg ${pack.featured ? "text-white" : "text-foreground"}`}>{pack.name}</h3>
                <p className={`text-sm font-semibold mt-1 ${pack.featured ? "text-white/60" : "text-muted-foreground"}`}>{pack.desc}</p>
              </div>

              <div>
                <p className={`font-black leading-none ${pack.featured ? "text-white" : "text-foreground"}`}
                  style={{ fontSize: "clamp(1.6rem, 3vw, 2rem)" }}>
                  {pack.price}{" "}
                  <span className={`text-sm font-bold ${pack.featured ? "text-white/60" : "text-muted-foreground"}`}>
                    {pack.currency}
                  </span>
                </p>
                <p className={`text-xs font-semibold mt-1 ${pack.featured ? "text-white/50" : "text-muted-foreground"}`}>
                  {pack.period}
                </p>
              </div>

              <ul className="grid gap-2.5">
                {pack.features.map((f, i) => (
                  <li key={f} className="flex items-start gap-2.5 text-sm">
                    <CheckCircle size={14} className={`shrink-0 mt-0.5 ${i === 0 && pack.name !== "Annonce Standard" ? "text-white/30" : pack.featured ? "text-emerald-400" : "text-emerald-600"}`} />
                    <span className={pack.featured ? "text-white/80 font-semibold" : "text-muted-foreground font-semibold"}>
                      {f}
                    </span>
                  </li>
                ))}
              </ul>

              <a
                href="#demande"
                className={`flex items-center justify-center gap-2 h-11 rounded-xl font-black text-sm transition-all hover:-translate-y-0.5 ${
                  pack.featured
                    ? "text-white"
                    : `${pack.color} border`
                }`}
                style={{
                  background: pack.featured ? "linear-gradient(135deg, #128449, #006fa3)" : "transparent",
                  borderColor: pack.featured ? "transparent" : "currentColor",
                  opacity: 0.9
                }}
              >
                {pack.cta} <ArrowRight size={14} />
              </a>
            </div>
          ))}
        </div>
      </section>

      {/* ── PROOF ── */}
      <section className="border-y border-border py-12" style={{ background: "linear-gradient(180deg, #f8fafb, #fff)" }}>
        <div className="container">
          <div className="grid gap-5 sm:grid-cols-2 lg:grid-cols-4">
            {PROOF.map((item) => (
              <div key={item.label} className="flex gap-4 items-start p-5 rounded-xl bg-white border border-border">
                <div className="w-10 h-10 rounded-xl bg-muted flex items-center justify-center shrink-0">
                  <item.icon size={18} className="text-primary" />
                </div>
                <div>
                  <p className="font-black text-foreground text-sm">{item.label}</p>
                  <p className="text-xs text-muted-foreground font-semibold mt-0.5 leading-relaxed">{item.desc}</p>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* ── FORM ── */}
      <section className="container py-16" id="demande">
        <div className="grid lg:grid-cols-2 gap-10 max-w-5xl mx-auto">
          <div>
            <p className="text-xs font-black text-primary uppercase tracking-widest mb-2 flex items-center gap-2">
              <Send size={12} /> Demande rapide
            </p>
            <h2 className="text-2xl lg:text-3xl font-black text-foreground mb-3">
              Envoyez votre demande maintenant
            </h2>
            <p className="text-muted-foreground font-semibold leading-relaxed mb-6">
              Décrivez votre besoin — poste, ville, profil, délai. Notre équipe vous répond
              en moins de 24h avec une proposition adaptée.
            </p>

            {/* Contact WhatsApp */}
            <Card className="border-emerald-200 bg-emerald-50/50">
              <CardContent className="p-4 flex items-center gap-4">
                <div className="w-10 h-10 rounded-xl bg-emerald-100 flex items-center justify-center shrink-0">
                  <MessageSquare size={18} className="text-emerald-700" />
                </div>
                <div className="flex-1">
                  <p className="font-black text-emerald-900 text-sm">Contacter sur WhatsApp</p>
                  <p className="text-xs text-emerald-800/70 font-semibold">Réponse rapide · Lun–Sam 8h–18h</p>
                </div>
                <a
                  href="https://wa.me/22670000000?text=Bonjour+Emplois Burkina,+je+souhaite+publier+une+annonce"
                  target="_blank"
                  rel="noopener noreferrer"
                  className="flex items-center gap-1.5 h-9 px-3 rounded-xl font-black text-xs text-white shrink-0"
                  style={{ background: "linear-gradient(135deg, #128449, #00a7a5)" }}
                >
                  Écrire <ArrowRight size={12} />
                </a>
              </CardContent>
            </Card>

            {/* Paiement */}
            <div className="mt-4 p-4 rounded-xl border border-border bg-muted/30">
              <p className="text-xs font-black text-muted-foreground uppercase tracking-wide mb-2">Paiements acceptés</p>
              <div className="flex flex-wrap gap-2">
                {["Orange Money", "Moov Money", "Virement bancaire", "Espèces (bureau)"].map((m) => (
                  <span key={m} className="text-xs font-black bg-white border border-border rounded-lg px-2.5 py-1.5 text-foreground">
                    {m}
                  </span>
                ))}
              </div>
            </div>
          </div>

          <div>
            <Card>
              <CardContent className="p-6">
                <LeadCaptureForm
                  kind="publish"
                  submitLabel="Envoyer la demande"
                  interestPlaceholder="Type d'annonce (Standard, Sponsorisé, Campagne...)"
                  messagePlaceholder="Décrivez le poste, le profil recherché, la ville, le délai et votre budget"
                />
              </CardContent>
            </Card>
          </div>
        </div>
      </section>

      {/* Footer simple */}
      <div className="border-t border-border py-8">
        <div className="container flex flex-col sm:flex-row items-center justify-between gap-3">
          <p className="text-sm text-muted-foreground font-semibold">
            <a href="/" className="font-black text-foreground hover:text-primary">Emplois Burkina</a> · Plateforme emploi Burkina Faso
          </p>
          <div className="flex gap-4 text-sm font-semibold text-muted-foreground">
            <a href="/jobs" className="hover:text-foreground">Offres</a>
            <a href="/privacy" className="hover:text-foreground">Confidentialité</a>
            <a href="/contact" className="hover:text-foreground">Contact</a>
          </div>
        </div>
      </div>
    </div>
  );
}
