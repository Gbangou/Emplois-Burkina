import {
  ArrowRight,
  BarChart3,
  Bell,
  Briefcase,
  Building2,
  CheckCircle,
  ChevronRight,
  Eye,
  FileText,
  Megaphone,
  Plus,
  TrendingUp,
  Users,
  Zap
} from "lucide-react";
import type { Metadata } from "next";
import { SiteHeader } from "@/components/site-header";
import { Badge } from "@/components/ui/badge";
import { Card, CardContent } from "@/components/ui/card";
import { Separator } from "@/components/ui/separator";
import { getJobs } from "@/lib/data";

export const metadata: Metadata = {
  title: "Espace recruteur — Emplois Burkina",
  description: "Gérez vos annonces, leads et campagnes de recrutement."
};

const QUICK_ACTIONS = [
  { label: "Nouvelle annonce", icon: Plus, href: "/annonceurs#demande", style: "bg-primary text-white shadow-sm" },
  { label: "Voir les offres", icon: Briefcase, href: "/jobs", style: "bg-white border border-border text-foreground" },
  { label: "Sponsoriser", icon: Megaphone, href: "/annonceurs#demande", style: "bg-white border border-border text-foreground" },
  { label: "Analyser", icon: BarChart3, href: "/operations", style: "bg-white border border-border text-foreground" }
];

const PACKAGES = [
  {
    name: "Standard",
    price: "25 000 FCFA",
    features: ["Publication 24h", "Page dédiée", "SEO inclus", "30 jours"],
    accent: "text-blue-600",
    bg: "bg-blue-50",
    border: "border-blue-100"
  },
  {
    name: "Sponsorisé",
    price: "75 000 FCFA",
    features: ["Mise en avant 7j", "WhatsApp ciblé", "Facebook auto", "Rapport perf."],
    accent: "text-emerald-700",
    bg: "bg-emerald-50",
    border: "border-emerald-100",
    featured: true
  },
  {
    name: "Campagne",
    price: "150 000+ FCFA",
    features: ["Formulaire intégré", "Shortlist", "Export CSV", "Suivi dédié"],
    accent: "text-violet-600",
    bg: "bg-violet-50",
    border: "border-violet-100"
  }
];

export default async function RecruteurPage() {
  const jobs = await getJobs();
  const recentJobs = jobs
    .sort((a, b) => String(b.collectedAt || "").localeCompare(String(a.collectedAt || "")))
    .slice(0, 6);

  return (
    <div className="min-h-screen bg-background">
      <SiteHeader />

      {/* ── HEADER DASHBOARD ── */}
      <div className="border-b border-border"
        style={{ background: "linear-gradient(135deg, #07171e 0%, #0c3d26 100%)" }}>
        <div className="container py-8">
          <div className="flex flex-col sm:flex-row sm:items-end justify-between gap-5">
            <div>
              <Badge className="mb-3 bg-white/10 text-white border-white/15">
                Espace recruteur
              </Badge>
              <h1 className="font-black text-white text-2xl lg:text-3xl">
                Tableau de bord
              </h1>
              <p className="text-white/60 font-semibold mt-1">
                Gérez vos annonces, leads et campagnes depuis un seul endroit.
              </p>
            </div>
            <a
              href="/annonceurs#demande"
              className="inline-flex items-center gap-2 h-11 px-5 rounded-xl font-black text-sm text-white shrink-0 transition-all hover:-translate-y-0.5"
              style={{ background: "linear-gradient(135deg, #dd3f31, #b82f25)", boxShadow: "0 6px 20px rgba(221,63,49,0.3)" }}
            >
              <Plus size={15} /> Nouvelle annonce
            </a>
          </div>

          {/* Stats */}
          <div className="grid grid-cols-2 sm:grid-cols-4 gap-3 mt-6">
            {[
              { label: "Annonces actives", value: "0", icon: FileText, color: "rgba(18,132,73,0.3)" },
              { label: "Vues ce mois", value: "—", icon: Eye, color: "rgba(0,111,163,0.3)" },
              { label: "Leads reçus", value: "0", icon: Users, color: "rgba(224,169,40,0.3)" },
              { label: "Taux de réponse", value: "—", icon: TrendingUp, color: "rgba(92,79,216,0.3)" }
            ].map((s) => (
              <div key={s.label} className="rounded-xl p-4 grid gap-2 border border-white/10" style={{ background: s.color }}>
                <s.icon size={14} className="text-white/70" />
                <p className="text-2xl font-black text-white leading-none">{s.value}</p>
                <p className="text-xs font-semibold text-white/60">{s.label}</p>
              </div>
            ))}
          </div>
        </div>
      </div>

      <div className="container py-8 grid gap-6 lg:grid-cols-[minmax(0,1fr)_340px]">

        {/* ── MAIN ── */}
        <div className="grid gap-6">

          {/* Quick actions */}
          <Card>
            <CardContent className="p-5">
              <h2 className="font-black text-foreground text-base mb-4">Actions rapides</h2>
              <div className="grid grid-cols-2 sm:grid-cols-4 gap-3">
                {QUICK_ACTIONS.map((a) => (
                  <a key={a.label} href={a.href}
                    className={`flex flex-col items-center justify-center gap-2 p-4 rounded-xl text-sm font-black transition-all hover:-translate-y-0.5 hover:shadow-md ${a.style}`}>
                    <a.icon size={20} />
                    {a.label}
                  </a>
                ))}
              </div>
            </CardContent>
          </Card>

          {/* Recent market */}
          <Card>
            <CardContent className="p-5">
              <div className="flex items-center justify-between mb-4">
                <h2 className="font-black text-foreground text-base">Offres récentes sur Emplois Burkina</h2>
                <a href="/jobs" className="text-xs font-black text-primary hover:underline flex items-center gap-1">
                  Tout voir <ChevronRight size={12} />
                </a>
              </div>
              <div className="grid gap-2">
                {recentJobs.map((job) => (
                  <a key={job.id} href={`/jobs/${job.id}`}
                    className="flex items-center gap-3 p-3 rounded-xl border border-border hover:bg-muted/50 transition-colors group">
                    <div className="w-9 h-9 rounded-xl bg-muted flex items-center justify-center shrink-0">
                      <Briefcase size={14} className="text-primary" />
                    </div>
                    <div className="flex-1 min-w-0">
                      <p className="font-black text-sm text-foreground truncate group-hover:text-primary transition-colors">
                        {job.title}
                      </p>
                      <p className="text-xs text-muted-foreground font-semibold truncate">
                        {[job.company, job.city].filter(Boolean).join(" · ")}
                      </p>
                    </div>
                    <Badge variant="success" className="shrink-0 text-xs">
                      {job.confidenceScore || 70}%
                    </Badge>
                  </a>
                ))}
              </div>
            </CardContent>
          </Card>

          {/* Why Emplois Burkina */}
          <Card>
            <CardContent className="p-5">
              <h2 className="font-black text-foreground text-base mb-4 flex items-center gap-2">
                <Zap size={15} className="text-primary" />
                Pourquoi Emplois Burkina pour recruter ?
              </h2>
              <div className="grid sm:grid-cols-2 gap-3">
                {[
                  { icon: CheckCircle, title: "Vérification garantie", desc: "Chaque annonce est vérifiée avant publication.", color: "text-emerald-600" },
                  { icon: Users, title: "Audience ciblée", desc: "Candidats actifs sur WhatsApp et Facebook.", color: "text-blue-600" },
                  { icon: BarChart3, title: "Reporting inclus", desc: "Vues, leads et conversions mesurés.", color: "text-violet-600" },
                  { icon: TrendingUp, title: "Diffusion multi-canal", desc: "Catalogue, WhatsApp, Facebook, Telegram.", color: "text-amber-600" }
                ].map((item) => (
                  <div key={item.title} className="flex gap-3 p-3 rounded-xl bg-muted/30">
                    <item.icon size={16} className={`${item.color} shrink-0 mt-0.5`} />
                    <div>
                      <p className="font-black text-sm text-foreground">{item.title}</p>
                      <p className="text-xs text-muted-foreground font-semibold mt-0.5">{item.desc}</p>
                    </div>
                  </div>
                ))}
              </div>
            </CardContent>
          </Card>
        </div>

        {/* ── SIDEBAR ── */}
        <div className="grid gap-4 self-start">

          {/* Packages */}
          {PACKAGES.map((pack) => (
            <Card key={pack.name} className={`${pack.border} ${pack.featured ? "shadow-md" : ""}`}
              style={pack.featured ? { borderColor: "#d5ecdf" } : {}}>
              <CardContent className="p-4 grid gap-3">
                {pack.featured && (
                  <Badge variant="success" className="justify-self-start">
                    <Zap size={9} /> Recommandé
                  </Badge>
                )}
                <div className="flex items-center justify-between">
                  <h3 className="font-black text-sm text-foreground">{pack.name}</h3>
                  <span className={`font-black text-sm ${pack.accent}`}>{pack.price}</span>
                </div>
                <Separator />
                <ul className="grid gap-1.5">
                  {pack.features.map((f) => (
                    <li key={f} className="flex items-center gap-2 text-xs font-semibold text-muted-foreground">
                      <CheckCircle size={10} className="text-emerald-500 shrink-0" /> {f}
                    </li>
                  ))}
                </ul>
                <a href="/annonceurs#demande"
                  className={`flex items-center justify-center gap-2 h-9 rounded-lg font-black text-xs transition-all hover:-translate-y-px ${pack.featured ? "text-white" : `${pack.accent} border border-current`}`}
                  style={pack.featured ? { background: "linear-gradient(135deg, #128449, #006fa3)" } : {}}>
                  Choisir ce pack <ArrowRight size={11} />
                </a>
              </CardContent>
            </Card>
          ))}

          {/* WhatsApp contact */}
          <Card className="border-emerald-200 bg-emerald-50/40">
            <CardContent className="p-4 grid gap-3">
              <div className="flex items-center gap-2">
                <Bell size={14} className="text-emerald-700" />
                <p className="font-black text-sm text-emerald-900">Besoin d'aide ?</p>
              </div>
              <p className="text-xs font-semibold text-emerald-800/70 leading-relaxed">
                Notre équipe est disponible sur WhatsApp pour accompagner votre campagne.
              </p>
              <a
                href="https://wa.me/22670000000?text=Bonjour+Emplois Burkina,+je+souhaite+recruter"
                target="_blank"
                rel="noopener noreferrer"
                className="flex items-center justify-center gap-2 h-9 rounded-xl font-black text-xs text-white transition-all hover:-translate-y-0.5"
                style={{ background: "linear-gradient(135deg, #128449, #006fa3)" }}
              >
                Contacter sur WhatsApp
              </a>
            </CardContent>
          </Card>

          {/* Building2 context */}
          <div className="rounded-xl border border-border bg-muted/30 p-4">
            <div className="flex items-center gap-2 mb-2">
              <Building2 size={13} className="text-muted-foreground" />
              <p className="text-xs font-black text-muted-foreground uppercase tracking-wide">Liens utiles</p>
            </div>
            <div className="grid gap-1.5">
              {[
                ["Explorer le catalogue", "/jobs"],
                ["Tableau des opérations", "/operations"],
                ["Automation & diffusion", "/automation"],
                ["Politique de confidentialité", "/privacy"]
              ].map(([label, href]) => (
                <a key={href} href={href}
                  className="text-xs font-semibold text-muted-foreground hover:text-foreground transition-colors flex items-center gap-1.5">
                  <ChevronRight size={10} /> {label}
                </a>
              ))}
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
