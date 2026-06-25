"use client";

import { ArrowRight, Search } from "lucide-react";
import { useRef } from "react";

type Props = {
  jobs: number;
  sources: number;
  deadlines: number;
};

export function HomeHero({ jobs, sources, deadlines }: Props) {
  const inputRef = useRef<HTMLInputElement>(null);

  return (
    <section className="relative overflow-hidden min-h-[92vh] flex items-center">
      {/* Background */}
      <div className="absolute inset-0"
        style={{ background: "linear-gradient(135deg, #07171e 0%, #0a3d24 55%, #07171e 100%)" }} />

      {/* Dot grid */}
      <div className="absolute inset-0 opacity-[0.07]"
        style={{
          backgroundImage: "radial-gradient(circle, rgba(255,255,255,0.8) 1px, transparent 1px)",
          backgroundSize: "28px 28px"
        }} />

      {/* Green glow */}
      <div className="absolute top-1/4 left-1/3 w-[500px] h-[500px] rounded-full opacity-15 blur-[80px] pointer-events-none"
        style={{ background: "radial-gradient(circle, #128449, transparent 70%)" }} />
      <div className="absolute bottom-0 right-1/4 w-[400px] h-[400px] rounded-full opacity-10 blur-[80px] pointer-events-none"
        style={{ background: "radial-gradient(circle, #00a7a5, transparent 70%)" }} />

      <div className="container relative z-10 py-24 lg:py-32">
        <div className="max-w-3xl mx-auto text-center">

          {/* Eyebrow badge */}
          <div className="inline-flex items-center gap-2 rounded-full border border-white/15 bg-white/8 px-4 py-2 text-sm font-black text-white/90 backdrop-blur-sm mb-8 animate-fade-up"
            style={{ animationDelay: "0ms" }}>
            <span className="w-2 h-2 rounded-full bg-emerald-400 animate-pulse" />
            Plateforme emploi au Burkina Faso
          </div>

          {/* Headline */}
          <h1
            className="font-black text-white leading-[0.95] tracking-tight mb-6 animate-fade-up"
            style={{
              fontSize: "clamp(2.8rem, 7vw, 5.5rem)",
              textShadow: "0 2px 40px rgba(0,0,0,0.5)",
              animationDelay: "80ms"
            }}
          >
            Toutes les{" "}
            <span style={{
              background: "linear-gradient(90deg, #4ade80 0%, #00a7a5 100%)",
              WebkitBackgroundClip: "text",
              WebkitTextFillColor: "transparent",
              backgroundClip: "text"
            }}>
              opportunités
            </span>
            <br />du Burkina Faso
          </h1>

          <p className="text-white/65 font-semibold text-lg leading-relaxed max-w-xl mx-auto mb-10 animate-fade-up"
            style={{ animationDelay: "160ms" }}>
            Emplois formels, informels, ONG, concours — scraping automatique,
            offres vérifiées et alertes WhatsApp gratuites.
          </p>

          {/* Search bar */}
          <form
            action="/jobs"
            className="flex gap-2 p-2 rounded-2xl bg-white shadow-2xl max-w-2xl mx-auto mb-10 animate-fade-up"
            style={{ animationDelay: "240ms", boxShadow: "0 20px 60px rgba(0,0,0,0.5)" }}
          >
            <div className="flex-1 flex items-center gap-3 px-3">
              <Search size={18} className="text-muted-foreground shrink-0" />
              <input
                ref={inputRef}
                name="q"
                autoComplete="off"
                placeholder="Comptable, développeur, ONG, chauffeur…"
                className="flex-1 bg-transparent outline-none text-sm font-medium text-foreground placeholder:text-muted-foreground/60 min-w-0 py-2.5"
              />
            </div>
            <button
              type="submit"
              className="flex items-center gap-2 h-12 px-5 rounded-xl font-black text-sm text-white shrink-0 transition-all hover:opacity-90 hover:-translate-y-0.5 active:scale-95"
              style={{ background: "linear-gradient(135deg, #128449, #006fa3)" }}
            >
              Rechercher <ArrowRight size={15} />
            </button>
          </form>

          {/* Stats */}
          <div className="flex items-center justify-center gap-6 sm:gap-10 flex-wrap animate-fade-up"
            style={{ animationDelay: "320ms" }}>
            {[
              { value: jobs, label: "offres actives", color: "text-emerald-400" },
              { value: sources, label: "sources suivies", color: "text-cyan-400" },
              { value: deadlines, label: "deadlines vérifiées", color: "text-yellow-400" }
            ].map((stat) => (
              <div key={stat.label} className="text-center">
                <div className={`text-3xl sm:text-4xl font-black ${stat.color} tabular-nums`}>
                  {stat.value}
                </div>
                <div className="text-white/55 text-xs sm:text-sm font-semibold mt-1">{stat.label}</div>
              </div>
            ))}
          </div>

          {/* Quick category pills */}
          <div className="flex flex-wrap gap-2 justify-center mt-8 animate-fade-up"
            style={{ animationDelay: "400ms" }}>
            {[
              ["ONG / Humanitaire", "/jobs?category=ONG"],
              ["Informatique", "/jobs?category=Informatique%2C+data+et+systemes"],
              ["Finance", "/jobs?category=Finance+et+administration"],
              ["BTP", "/jobs?category=BTP+et+chantier"],
              ["Terrain", "/jobs?category=Metiers+terrain+et+informels"]
            ].map(([label, href]) => (
              <a
                key={label}
                href={href}
                className="inline-flex items-center gap-1.5 px-3 py-1.5 rounded-full border border-white/15 bg-white/8 text-white/80 text-xs font-black hover:bg-white/15 hover:text-white transition-all"
              >
                {label}
              </a>
            ))}
          </div>
        </div>
      </div>

      {/* Bottom fade */}
      <div className="absolute bottom-0 left-0 right-0 h-24 pointer-events-none"
        style={{ background: "linear-gradient(0deg, hsl(var(--background)), transparent)" }} />
    </section>
  );
}
