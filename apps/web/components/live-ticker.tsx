"use client";

import { ArrowRight, CalendarClock, CheckCircle, MapPin, TriangleAlert, Zap } from "lucide-react";
import type { JobOpportunity } from "@emplois-burkina/domain";

type Props = { jobs: JobOpportunity[] };

function deadlineLabel(job: JobOpportunity): { text: string; urgent: boolean; warning: boolean } | null {
  const raw = job.closingDate || job.deadline;
  if (!raw || raw === "A verifier") return null;

  const today = Date.now();
  const close = new Date(job.closingDate || "").getTime();
  if (isNaN(close)) {
    // deadline is a display string like "15 juillet 2026" — show as-is
    return { text: job.deadline || "", urgent: false, warning: false };
  }
  const daysLeft = Math.ceil((close - today) / 86400000);
  if (daysLeft < 0) return null; // expired — don't show
  if (daysLeft === 0) return { text: "Ferme aujourd'hui", urgent: true, warning: false };
  if (daysLeft <= 3) return { text: `J-${daysLeft}`, urgent: true, warning: false };
  if (daysLeft <= 7) return { text: `J-${daysLeft}`, urgent: false, warning: true };
  const d = new Date(close);
  return {
    text: d.toLocaleDateString("fr-FR", { day: "2-digit", month: "short" }),
    urgent: false,
    warning: false
  };
}

export function LiveTicker({ jobs }: Props) {
  if (!jobs.length) return null;
  const doubled = [...jobs, ...jobs];

  return (
    <div className="border-b border-border bg-gradient-to-r from-slate-50 via-white to-slate-50 py-3">
      {/* Header */}
      <div className="container flex items-center justify-between mb-2.5">
        <span className="flex items-center gap-1.5 text-[10px] font-black text-primary uppercase tracking-widest">
          <Zap size={10} fill="currentColor" /> Offres récentes
        </span>
        <a href="/jobs" className="flex items-center gap-1 text-[10px] font-black text-primary hover:underline">
          Voir tout <ArrowRight size={9} />
        </a>
      </div>

      {/* Scrolling track */}
      <div className="relative overflow-hidden">
        <div
          className="flex gap-2.5 w-max"
          style={{ animation: `ticker-scroll ${jobs.length * 5}s linear infinite` }}
          onMouseEnter={(e) => { (e.currentTarget as HTMLElement).style.animationPlayState = "paused"; }}
          onMouseLeave={(e) => { (e.currentTarget as HTMLElement).style.animationPlayState = "running"; }}
        >
          {doubled.map((job, i) => {
            const dl = deadlineLabel(job);
            return (
              <a
                key={`${job.id}-${i}`}
                href={`/jobs/${job.id}`}
                className="group shrink-0 flex flex-col gap-1 px-3.5 py-2.5 rounded-xl border border-border bg-white hover:border-primary/40 hover:shadow-md transition-all"
                style={{ width: 220 }}
              >
                {/* Title */}
                <p className="text-xs font-black text-foreground leading-snug line-clamp-2 group-hover:text-primary transition-colors">
                  {job.title}
                </p>

                {/* Meta row */}
                <div className="flex items-center justify-between gap-2 mt-auto">
                  <span className="flex items-center gap-1 text-[10px] font-semibold text-muted-foreground truncate">
                    <MapPin size={8} className="shrink-0" />
                    {job.city || "Burkina Faso"}
                  </span>
                  <div className="flex items-center gap-1.5 shrink-0">
                    {dl && (
                      <span className={`flex items-center gap-0.5 text-[10px] font-black rounded px-1.5 py-0.5 ${
                        dl.urgent
                          ? "bg-red-100 text-red-700"
                          : dl.warning
                          ? "bg-amber-50 text-amber-700"
                          : "bg-muted text-muted-foreground"
                      }`}>
                        {dl.urgent && <TriangleAlert size={8} />}
                        {dl.warning && <CalendarClock size={8} />}
                        {dl.text}
                      </span>
                    )}
                    <span className="flex items-center gap-0.5 text-[10px] font-black text-emerald-600">
                      <CheckCircle size={9} />
                      {job.confidenceScore || 70}%
                    </span>
                  </div>
                </div>
              </a>
            );
          })}
        </div>

        {/* Fade edges */}
        <div className="pointer-events-none absolute inset-y-0 left-0 w-10 bg-gradient-to-r from-slate-50 to-transparent z-10" />
        <div className="pointer-events-none absolute inset-y-0 right-0 w-10 bg-gradient-to-l from-slate-50 to-transparent z-10" />
      </div>

      <style>{`
        @keyframes ticker-scroll {
          0% { transform: translateX(0); }
          100% { transform: translateX(-50%); }
        }
      `}</style>
    </div>
  );
}
