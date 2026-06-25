import {
  ArrowRight,
  Bell,
  Bot,
  Briefcase,
  Building2,
  CheckCircle,
  Globe,
  MapPin,
  Rss,
  Share2,
  ShieldCheck,
  TrendingUp,
  Zap
} from "lucide-react";

import { HomeHero } from "@/components/home-hero";
import { LiveTicker } from "@/components/live-ticker";
import { SiteHeader } from "@/components/site-header";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { getHomeData } from "@/lib/data";

const CATEGORIES = [
  { label: "ONG / Humanitaire", color: "bg-blue-100 text-blue-800 hover:bg-blue-200", icon: "🌍" },
  { label: "Informatique / Tech", color: "bg-violet-100 text-violet-800 hover:bg-violet-200", icon: "💻" },
  { label: "Finance / Comptabilité", color: "bg-emerald-100 text-emerald-800 hover:bg-emerald-200", icon: "📊" },
  { label: "BTP / Génie civil", color: "bg-orange-100 text-orange-800 hover:bg-orange-200", icon: "🏗️" },
  { label: "Santé / Médical", color: "bg-red-100 text-red-800 hover:bg-red-200", icon: "🏥" },
  { label: "Education / Formation", color: "bg-yellow-100 text-yellow-800 hover:bg-yellow-200", icon: "📚" },
  { label: "Agriculture", color: "bg-lime-100 text-lime-800 hover:bg-lime-200", icon: "🌾" },
  { label: "Commerce / Vente", color: "bg-pink-100 text-pink-800 hover:bg-pink-200", icon: "🛒" },
  { label: "Mines / Géologie", color: "bg-stone-100 text-stone-800 hover:bg-stone-200", icon: "⛏️" },
  { label: "Droit / Juridique", color: "bg-indigo-100 text-indigo-800 hover:bg-indigo-200", icon: "⚖️" }
];

const HOW_IT_WORKS = [
  { step: "01", icon: Globe, title: "Collecte multi-sources", desc: "Scraping automatique de dizaines de sources : sites ministériels, ONG, cabinets, plateformes internationales, groupes Facebook, RSS.", color: "text-blue-600", bg: "bg-blue-50" },
  { step: "02", icon: Bot, title: "IA + modération", desc: "Dédoublonnage, classification par secteur, détection de fraude, score de confiance et validation humaine avant publication.", color: "text-violet-600", bg: "bg-violet-50" },
  { step: "03", icon: Zap, title: "Publication instantanée", desc: "Offres publiées sur le catalogue, diffusées sur WhatsApp, partagées sur les réseaux sociaux — automatiquement.", color: "text-emerald-600", bg: "bg-emerald-50" },
  { step: "04", icon: Bell, title: "Alertes personnalisées", desc: "Chaque candidat reçoit uniquement les offres qui correspondent à son métier, sa ville et son secteur.", color: "text-amber-600", bg: "bg-amber-50" }
];

const FEATURES = [
  { icon: ShieldCheck, title: "Offres vérifiées", desc: "Chaque offre a un score de confiance visible. Les arnaques sont détectées et bloquées.", color: "text-emerald-600" },
  { icon: Globe, title: "Sources larges", desc: "Informel, formel, international, local, gouvernemental, ONG — rien n'est exclu.", color: "text-blue-600" },
  { icon: Share2, title: "Auto-publication sociale", desc: "Les meilleures offres sont postées automatiquement sur pages Facebook, groupes WhatsApp et canaux Telegram.", color: "text-violet-600" },
  { icon: TrendingUp, title: "Analytics recruteur", desc: "Vues, leads, taux de réponse, benchmark concurrentiel — tableau de bord complet.", color: "text-amber-600" },
  { icon: MapPin, title: "Toutes les villes", desc: "Ouagadougou, Bobo, Koudougou, Banfora et toutes les communes — pas seulement la capitale.", color: "text-red-600" },
  { icon: Rss, title: "Flux RSS & API", desc: "Exportez les offres vers votre propre app, chatbot ou système de notification.", color: "text-cyan-600" }
];

function ConfidenceDot({ score }: { score: number }) {
  const color = score >= 85 ? "bg-emerald-500" : score >= 65 ? "bg-blue-500" : "bg-amber-500";
  return <span className={`inline-block w-2 h-2 rounded-full ${color}`} />;
}

export default async function HomePage() {
  const { featured, summary, urgent, stream } = await getHomeData();

  return (
    <div className="min-h-screen bg-background">
      {/* SiteHeader is fixed/sticky — renders its own h-16 spacer */}
      <SiteHeader />

      {/* ── HERO ─────────────────────────────── */}
      <HomeHero jobs={summary.jobs} sources={summary.trustedSources} deadlines={summary.deadlineReady} />

      {/* ── LIVE TICKER ─────────────────────── */}
      {stream.length > 0 && <LiveTicker jobs={stream} />}

      {/* ── CATEGORIES ──────────────────────────────────── */}
      <section className="border-b border-border bg-white">
        <div className="container py-4">
          <div className="flex items-center gap-2.5 overflow-x-auto scrollbar-hide">
            <span className="text-[10px] font-black text-muted-foreground uppercase tracking-[0.15em] shrink-0 pr-1 border-r border-border mr-0.5">
              Secteurs
            </span>
            {CATEGORIES.map((cat) => (
              <a
                key={cat.label}
                href={`/jobs?category=${encodeURIComponent(cat.label)}`}
                className={`shrink-0 inline-flex items-center gap-1.5 px-3 py-1.5 rounded-full text-[11px] font-black transition-all hover:scale-105 hover:shadow-sm ${cat.color}`}
              >
                <span className="text-sm leading-none">{cat.icon}</span>
                {cat.label}
              </a>
            ))}
          </div>
        </div>
      </section>

      {/* ── FEATURED JOBS ──────────────────────────────── */}
      <section className="container py-14">
        <div className="flex items-end justify-between mb-8">
          <div>
            <p className="text-xs font-black text-primary uppercase tracking-widest mb-2 flex items-center gap-2">
              <span className="w-1.5 h-1.5 rounded-full bg-primary inline-block" />
              Offres sélectionnées
            </p>
            <h2 className="text-2xl lg:text-3xl font-black text-foreground">
              Les meilleures opportunités du moment
            </h2>
          </div>
          <Button variant="outline" asChild className="hidden sm:inline-flex shrink-0">
            <a href="/jobs">
              Voir tout <ArrowRight size={14} />
            </a>
          </Button>
        </div>

        <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
          {featured.slice(0, 6).map((job) => {
            const deadline = job.closingDate || job.deadline;
            const isUrgent = deadline && new Date(deadline) < new Date(Date.now() + 7 * 86400000);
            const score = job.confidenceScore ?? 72;
            return (
              <a key={job.id} href={`/jobs/${job.id}`} className="group block">
                <Card className="h-full hover:shadow-md hover:-translate-y-0.5 transition-all duration-200 border-border">
                  {/* Top accent bar */}
                  <div className="h-1 rounded-t-xl" style={{ background: "linear-gradient(90deg, #128449, #00a7a5, #e0a928)" }} />
                  <CardContent className="p-5 grid gap-3">
                    {/* Category + score */}
                    <div className="flex items-center justify-between gap-2">
                      <Badge variant="success" className="text-xs">
                        {job.category || "Opportunité"}
                      </Badge>
                      <div className="flex items-center gap-1.5 text-xs font-black text-muted-foreground">
                        <ConfidenceDot score={score} />
                        {score}%
                      </div>
                    </div>

                    {/* Title */}
                    <div>
                      <h3 className="font-black text-foreground leading-snug group-hover:text-primary transition-colors line-clamp-2">
                        {job.title}
                      </h3>
                      <p className="text-sm text-muted-foreground font-semibold mt-1">
                        {job.company || "Organisation à vérifier"}
                      </p>
                    </div>

                    {/* Meta pills */}
                    <div className="flex flex-wrap gap-1.5">
                      {job.city && (
                        <span className="inline-flex items-center gap-1 bg-muted rounded-md px-2 py-1 text-xs font-semibold text-muted-foreground">
                          <MapPin size={10} /> {job.city}
                        </span>
                      )}
                      {job.type && (
                        <span className="inline-flex items-center gap-1 bg-muted rounded-md px-2 py-1 text-xs font-semibold text-muted-foreground">
                          <Briefcase size={10} /> {job.type}
                        </span>
                      )}
                      {deadline && (
                        <span className={`inline-flex items-center gap-1 rounded-md px-2 py-1 text-xs font-black ${isUrgent ? "bg-red-50 text-red-700" : "bg-muted text-muted-foreground font-semibold"}`}>
                          {isUrgent && "⚡ "}{deadline}
                        </span>
                      )}
                    </div>

                    {/* Footer */}
                    <div className="flex items-center justify-between pt-1 border-t border-border">
                      <span className="flex items-center gap-1.5 text-xs font-semibold text-muted-foreground">
                        <CheckCircle size={11} className="text-emerald-500" />
                        {job.sourceName || "Source vérifiée"}
                      </span>
                      <span className="text-xs font-black text-primary flex items-center gap-1 opacity-0 group-hover:opacity-100 transition-opacity">
                        Voir <ArrowRight size={11} />
                      </span>
                    </div>
                  </CardContent>
                </Card>
              </a>
            );
          })}
        </div>

        {/* Urgent jobs strip */}
        {urgent.length > 0 && (
          <div className="mt-6 rounded-xl border border-red-200 bg-red-50 p-4">
            <div className="flex items-center gap-2 mb-3">
              <span className="flex items-center gap-1.5 text-sm font-black text-red-700">
                <Zap size={14} /> Offres urgentes — délai &lt; 7 jours
              </span>
            </div>
            <div className="flex gap-3 overflow-x-auto pb-1">
              {urgent.slice(0, 4).map((job) => (
                <a key={job.id} href={`/jobs/${job.id}`}
                  className="shrink-0 bg-white border border-red-200 rounded-xl px-4 py-3 hover:shadow-sm transition-shadow min-w-48">
                  <p className="font-black text-sm text-foreground line-clamp-1">{job.title}</p>
                  <p className="text-xs text-muted-foreground mt-0.5">{job.city} · {job.closingDate || job.deadline}</p>
                </a>
              ))}
            </div>
          </div>
        )}

        <div className="mt-6 text-center">
          <Button size="lg" variant="outline" asChild>
            <a href="/jobs">
              Explorer les {summary.jobs} offres disponibles <ArrowRight size={16} />
            </a>
          </Button>
        </div>
      </section>

      {/* ── HOW IT WORKS ──────────────────────────────── */}
      <section className="py-16 border-y border-border" style={{ background: "linear-gradient(180deg, #f8fafb, #ffffff)" }}>
        <div className="container">
          <div className="text-center mb-10">
            <p className="text-xs font-black text-primary uppercase tracking-widest mb-2 flex items-center justify-center gap-2">
              <span className="w-1.5 h-1.5 rounded-full bg-primary inline-block" />
              Comment ça marche
            </p>
            <h2 className="text-2xl lg:text-3xl font-black text-foreground">
              De la source à l'alerte WhatsApp en quelques minutes
            </h2>
            <p className="text-muted-foreground font-semibold mt-3 max-w-xl mx-auto">
              Un pipeline automatisé qui collecte, vérifie, publie et distribue les offres
              sans intervention manuelle.
            </p>
          </div>

          <div className="grid gap-6 sm:grid-cols-2 lg:grid-cols-4">
            {HOW_IT_WORKS.map((step) => (
              <Card key={step.step} className="border-border hover:shadow-md transition-shadow">
                <CardContent className="p-6 grid gap-4">
                  <div className="flex items-start justify-between">
                    <div className={`w-11 h-11 rounded-xl flex items-center justify-center ${step.bg}`}>
                      <step.icon size={20} className={step.color} />
                    </div>
                    <span className="text-3xl font-black text-border">{step.step}</span>
                  </div>
                  <div>
                    <h3 className="font-black text-foreground mb-1.5">{step.title}</h3>
                    <p className="text-sm text-muted-foreground font-semibold leading-relaxed">{step.desc}</p>
                  </div>
                </CardContent>
              </Card>
            ))}
          </div>
        </div>
      </section>

      {/* ── FEATURES GRID ─────────────────────────────── */}
      <section className="container py-16">
        <div className="text-center mb-10">
          <p className="text-xs font-black text-primary uppercase tracking-widest mb-2 flex items-center justify-center gap-2">
            <span className="w-1.5 h-1.5 rounded-full bg-primary inline-block" />
            Fonctionnalités
          </p>
          <h2 className="text-2xl lg:text-3xl font-black text-foreground">
            Tout ce qu'une plateforme emploi sérieuse doit avoir
          </h2>
        </div>
        <div className="grid gap-5 sm:grid-cols-2 lg:grid-cols-3">
          {FEATURES.map((feat) => (
            <div key={feat.title} className="flex gap-4 p-5 rounded-xl border border-border hover:bg-accent/30 transition-colors">
              <div className="shrink-0 w-10 h-10 rounded-xl bg-muted flex items-center justify-center">
                <feat.icon size={18} className={feat.color} />
              </div>
              <div>
                <h3 className="font-black text-foreground mb-1">{feat.title}</h3>
                <p className="text-sm text-muted-foreground font-semibold leading-relaxed">{feat.desc}</p>
              </div>
            </div>
          ))}
        </div>
      </section>

      {/* ── WHATSAPP ALERT CTA ────────────────────────── */}
      <section className="py-16 border-y border-border"
        style={{ background: "linear-gradient(135deg, #0a5636, #006fa3)" }}>
        <div className="container">
          <div className="flex flex-col lg:flex-row items-center justify-between gap-8">
            <div className="text-white text-center lg:text-left">
              <div className="inline-flex items-center gap-2 bg-white/15 border border-white/20 rounded-full px-4 py-2 text-sm font-black text-white mb-4">
                <Bell size={14} className="text-yellow-400" />
                Alertes WhatsApp gratuites
              </div>
              <h2 className="text-2xl lg:text-3xl font-black mb-3">
                Recevez les offres directement sur WhatsApp
              </h2>
              <p className="text-white/75 font-semibold max-w-lg">
                Choisissez votre secteur et votre ville. On vous envoie uniquement les nouvelles
                offres pertinentes — pas de spam, désinscription en 1 clic.
              </p>
              <div className="flex flex-wrap gap-3 mt-4 justify-center lg:justify-start">
                {["Gratuit", "Sans inscription", "Désinscription facile"].map((t) => (
                  <span key={t} className="inline-flex items-center gap-1.5 bg-white/15 text-white/90 rounded-full px-3 py-1.5 text-xs font-black">
                    <CheckCircle size={11} /> {t}
                  </span>
                ))}
              </div>
            </div>
            <div className="w-full lg:w-auto shrink-0">
              <Card className="w-full lg:w-80">
                <CardContent className="p-5 grid gap-3">
                  <p className="font-black text-foreground text-sm">Activer mon alerte</p>
                  <input
                    type="tel"
                    placeholder="+226 70 00 00 00"
                    className="w-full rounded-lg border border-input px-3 py-2.5 text-sm font-medium focus:outline-none focus:ring-2 focus:ring-ring"
                  />
                  <select className="w-full rounded-lg border border-input px-3 py-2.5 text-sm font-medium bg-white focus:outline-none">
                    <option value="">Toutes les villes</option>
                    {["Ouagadougou", "Bobo-Dioulasso", "Koudougou", "Banfora"].map((c) => (
                      <option key={c}>{c}</option>
                    ))}
                  </select>
                  <Button className="w-full" size="lg">
                    <Bell size={15} /> Recevoir les alertes
                  </Button>
                  <p className="text-center text-xs text-muted-foreground">Gratuit · Aucun spam</p>
                </CardContent>
              </Card>
            </div>
          </div>
        </div>
      </section>

      {/* ── RECRUITER CTA ─────────────────────────────── */}
      <section className="container py-16">
        <div className="rounded-2xl border border-border overflow-hidden">
          <div className="grid lg:grid-cols-2">
            <div className="p-8 lg:p-12">
              <Badge variant="blue" className="mb-4">Espace recruteur</Badge>
              <h2 className="text-2xl lg:text-3xl font-black text-foreground mb-3">
                Publiez votre annonce et trouvez les bons profils
              </h2>
              <p className="text-muted-foreground font-semibold leading-relaxed mb-6">
                Diffusion multi-canal : catalogue Emplois Burkina, WhatsApp, Facebook et Telegram.
                Modération rapide, rapport de performance et paiement Mobile Money.
              </p>
              <div className="flex flex-wrap gap-3 mb-8">
                {[
                  { label: "Annonce standard", price: "25 000 FCFA" },
                  { label: "Offre sponsorisée", price: "75 000 FCFA" },
                  { label: "Campagne recrutement", price: "150 000+ FCFA" }
                ].map((pack) => (
                  <div key={pack.label} className="border border-border rounded-xl p-3 text-sm">
                    <p className="font-black text-foreground">{pack.label}</p>
                    <p className="text-primary font-black">{pack.price}</p>
                  </div>
                ))}
              </div>
              <div className="flex gap-3">
                <Button size="lg" asChild>
                  <a href="/annonceurs">
                    Publier une annonce <ArrowRight size={16} />
                  </a>
                </Button>
                <Button size="lg" variant="outline" asChild>
                  <a href="/recruteur">Mon espace</a>
                </Button>
              </div>
            </div>
            <div className="bg-foreground p-8 lg:p-12 flex flex-col justify-center gap-5">
              {[
                { icon: ShieldCheck, label: "Vérification en 24h", desc: "Toutes les annonces sont vérifiées avant publication." },
                { icon: Share2, label: "Diffusion automatique", desc: "WhatsApp, Facebook, Telegram — zéro effort de votre côté." },
                { icon: TrendingUp, label: "Rapport de performance", desc: "Vues, leads, conversions — tout est mesuré." }
              ].map((item) => (
                <div key={item.label} className="flex gap-4">
                  <div className="w-10 h-10 rounded-xl bg-white/10 flex items-center justify-center shrink-0">
                    <item.icon size={18} className="text-emerald-400" />
                  </div>
                  <div>
                    <p className="font-black text-white text-sm">{item.label}</p>
                    <p className="text-white/60 text-xs font-semibold mt-0.5">{item.desc}</p>
                  </div>
                </div>
              ))}
            </div>
          </div>
        </div>
      </section>

      {/* ── FOOTER ────────────────────────────────────── */}
      <footer className="border-t border-border bg-foreground text-white">
        <div className="container py-10">
          <div className="grid gap-8 sm:grid-cols-2 lg:grid-cols-4 mb-10">
            <div>
              <div className="flex items-center gap-2.5 mb-4">
                <span className="flex h-8 w-8 items-center justify-center rounded-lg font-black text-white text-xs"
                  style={{ background: "linear-gradient(135deg, #128449, #006fa3)" }}>EB</span>
                <span className="font-black text-white">Emplois Burkina</span>
              </div>
              <p className="text-white/60 text-sm font-semibold leading-relaxed">
                La plateforme emploi de référence au Burkina Faso. Offres vérifiées, alertes WhatsApp, espace recruteur.
              </p>
            </div>
            {[
              { title: "Candidats", links: [["Explorer les offres", "/jobs"], ["Alertes WhatsApp", "/#alertes"], ["Offres urgentes", "/jobs?sort=deadline"]] },
              { title: "Recruteurs", links: [["Publier une annonce", "/annonceurs"], ["Mon espace", "/recruteur"], ["Grille tarifaire", "/grille-tarifaire"]] },
              { title: "Plateforme", links: [["Opérations", "/operations"], ["Automation", "/automation"], ["Politique", "/privacy"]] }
            ].map((col) => (
              <div key={col.title}>
                <p className="font-black text-white text-sm mb-3">{col.title}</p>
                <ul className="grid gap-2">
                  {col.links.map(([label, href]) => (
                    <li key={label}>
                      <a href={href} className="text-white/60 text-sm font-semibold hover:text-white transition-colors">
                        {label}
                      </a>
                    </li>
                  ))}
                </ul>
              </div>
            ))}
          </div>
          <div className="border-t border-white/10 pt-6 flex flex-col sm:flex-row items-center justify-between gap-3">
            <p className="text-white/40 text-xs font-semibold">© 2025 Emplois Burkina · Burkina Faso</p>
            <p className="text-white/40 text-xs font-semibold">Offres vérifiées · Sources diversifiées · Gratuit pour les candidats</p>
          </div>
        </div>
      </footer>
    </div>
  );
}
