import { ArrowLeft, Search } from "lucide-react";
import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "Page introuvable — Emplois Burkina",
  description: "Cette page n'existe pas ou a été déplacée."
};

export default function NotFound() {
  return (
    <div className="min-h-screen bg-background flex flex-col items-center justify-center px-4 text-center">
      <div className="max-w-md">
        {/* Logo */}
        <a href="/" className="inline-flex items-center gap-2.5 mb-10">
          <span className="flex h-10 w-10 items-center justify-center rounded-xl font-black text-white"
            style={{ background: "linear-gradient(135deg, #128449, #006fa3)" }}>EB</span>
          <span className="font-black text-foreground text-lg">Emplois Burkina</span>
        </a>

        {/* 404 */}
        <div className="text-8xl font-black text-border mb-6 leading-none">404</div>

        <h1 className="text-2xl font-black text-foreground mb-3">Page introuvable</h1>
        <p className="text-muted-foreground font-semibold leading-relaxed mb-8">
          Cette page n'existe pas ou a été déplacée. Explorez les offres d'emploi ou retournez à l'accueil.
        </p>

        <div className="flex gap-3 justify-center flex-wrap">
          <a
            href="/"
            className="inline-flex items-center gap-2 h-11 px-5 rounded-xl font-black text-sm text-white transition-all hover:-translate-y-0.5"
            style={{ background: "linear-gradient(135deg, #128449, #006fa3)" }}
          >
            <ArrowLeft size={15} /> Accueil
          </a>
          <a
            href="/jobs"
            className="inline-flex items-center gap-2 h-11 px-5 rounded-xl border border-border font-black text-sm text-foreground hover:bg-muted transition-colors"
          >
            <Search size={15} /> Explorer les offres
          </a>
        </div>

        {/* Quick links */}
        <div className="mt-10 pt-6 border-t border-border grid gap-2">
          <p className="text-xs font-black text-muted-foreground uppercase tracking-wide mb-2">Liens utiles</p>
          <div className="flex gap-4 justify-center flex-wrap text-sm font-semibold text-muted-foreground">
            <a href="/jobs" className="hover:text-foreground transition-colors">Offres d'emploi</a>
            <a href="/annonceurs" className="hover:text-foreground transition-colors">Recruteurs</a>
            <a href="/contact" className="hover:text-foreground transition-colors">Contact</a>
            <a href="/privacy" className="hover:text-foreground transition-colors">Confidentialité</a>
          </div>
        </div>
      </div>
    </div>
  );
}
