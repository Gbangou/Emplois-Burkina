import { ArrowRight, Briefcase, CalendarClock, CheckCircle, Clock, MapPin, TriangleAlert } from "lucide-react";
import type { JobOpportunity } from "@emplois-burkina/domain";
import { Badge } from "@/components/ui/badge";
import { Card, CardContent } from "@/components/ui/card";
import { cn } from "@/lib/utils";

type JobCardProps = {
  job: JobOpportunity;
  compact?: boolean;
};

type DeadlineInfo = {
  label: string;
  daysLeft: number | null;
  variant: "urgent" | "warning" | "normal" | "none";
};

function getDeadlineInfo(job: JobOpportunity): DeadlineInfo {
  const raw = job.closingDate || job.deadline;
  if (!raw || raw === "A verifier") return { label: "", daysLeft: null, variant: "none" };

  // Try ISO date first
  if (job.closingDate) {
    const close = new Date(`${job.closingDate}T23:59:59Z`).getTime();
    if (!isNaN(close)) {
      const daysLeft = Math.ceil((close - Date.now()) / 86400000);
      if (daysLeft < 0) return { label: "Expiré", daysLeft, variant: "none" };
      if (daysLeft === 0) return { label: "Ferme aujourd'hui !", daysLeft: 0, variant: "urgent" };
      if (daysLeft === 1) return { label: "Ferme demain", daysLeft: 1, variant: "urgent" };
      if (daysLeft <= 5) return { label: `${daysLeft} jours restants`, daysLeft, variant: "urgent" };
      if (daysLeft <= 14) return { label: `J-${daysLeft}`, daysLeft, variant: "warning" };

      const d = new Date(close);
      return {
        label: d.toLocaleDateString("fr-FR", { day: "2-digit", month: "long", year: "numeric" }),
        daysLeft,
        variant: "normal"
      };
    }
  }

  // Fallback to display string (deadline field)
  return { label: job.deadline || raw, daysLeft: null, variant: "normal" };
}

const CATEGORY_VARIANTS: Record<string, string> = {
  "ONG": "blue",
  "Humanitaire": "blue",
  "Informatique": "violet",
  "data": "violet",
  "Finance": "success",
  "Comptabilité": "success",
  "Santé": "destructive",
  "BTP": "warning",
  "Terrain": "muted",
  "Stage": "cyan",
  "Concours": "muted"
};

function getCategoryVariant(category?: string): "blue" | "violet" | "success" | "warning" | "destructive" | "muted" | "cyan" {
  if (!category) return "muted";
  for (const [key, variant] of Object.entries(CATEGORY_VARIANTS)) {
    if (category.toLowerCase().includes(key.toLowerCase())) return variant as "blue";
  }
  return "muted";
}

export function JobCard({ job, compact }: JobCardProps) {
  const deadline = getDeadlineInfo(job);
  const score = job.confidenceScore ?? 70;
  const scoreColor = score >= 85 ? "text-emerald-600" : score >= 65 ? "text-blue-600" : "text-amber-600";
  const scoreBg = score >= 85 ? "bg-emerald-50" : score >= 65 ? "bg-blue-50" : "bg-amber-50";

  return (
    <a href={`/jobs/${job.id}`} className="group block h-full">
      <Card className={cn(
        "h-full transition-all duration-200 hover:shadow-lg hover:-translate-y-1 border-border overflow-hidden",
        deadline.variant === "urgent" && "border-red-200"
      )}>
        {/* Top accent gradient bar */}
        <div className={cn(
          "h-0.5",
          deadline.variant === "urgent"
            ? "bg-gradient-to-r from-red-500 to-red-400"
            : "bg-gradient-to-r from-emerald-500 to-cyan-500"
        )} />

        <CardContent className={cn("grid gap-3", compact ? "p-4" : "p-5")}>

          {/* Row 1: Category + Score */}
          <div className="flex items-center justify-between gap-2">
            <Badge variant={getCategoryVariant(job.category)} className="text-[10px] font-black truncate max-w-[8rem]">
              {job.category || "Opportunité"}
            </Badge>
            <div className={cn(
              "flex items-center gap-1 rounded-full px-2 py-0.5 text-[10px] font-black shrink-0",
              scoreBg, scoreColor
            )}>
              <CheckCircle size={9} />
              {score}%
            </div>
          </div>

          {/* Row 2: Title + Company */}
          <div>
            <h3 className={cn(
              "font-black text-foreground leading-snug group-hover:text-primary transition-colors line-clamp-2",
              compact ? "text-sm" : "text-[0.95rem]"
            )}>
              {job.title}
            </h3>
            <p className={cn(
              "text-muted-foreground font-semibold mt-0.5 truncate",
              compact ? "text-xs" : "text-xs"
            )}>
              {job.company || "Organisation"}
            </p>
          </div>

          {/* Row 3: Location + Type */}
          {!compact && (
            <div className="flex flex-wrap gap-1.5">
              {job.city && (
                <span className="inline-flex items-center gap-1 bg-muted rounded-md px-2 py-1 text-[10px] font-semibold text-muted-foreground">
                  <MapPin size={9} /> {job.city}
                </span>
              )}
              {job.type && job.type !== "A verifier" && (
                <span className="inline-flex items-center gap-1 bg-muted rounded-md px-2 py-1 text-[10px] font-semibold text-muted-foreground">
                  <Briefcase size={9} /> {job.type}
                </span>
              )}
            </div>
          )}

          {/* Row 4: Deadline — always visible, colored by urgency */}
          {deadline.variant !== "none" && (
            <div className={cn(
              "flex items-center gap-1.5 rounded-lg px-2.5 py-1.5 text-xs font-black",
              deadline.variant === "urgent"
                ? "bg-red-50 text-red-700 border border-red-200"
                : deadline.variant === "warning"
                ? "bg-amber-50 text-amber-700 border border-amber-200"
                : "bg-muted text-muted-foreground border border-border"
            )}>
              {deadline.variant === "urgent" && <TriangleAlert size={12} className="shrink-0" />}
              {deadline.variant === "warning" && <Clock size={11} className="shrink-0" />}
              {deadline.variant === "normal" && <CalendarClock size={11} className="shrink-0" />}
              <span className="truncate">Clôture : {deadline.label}</span>
            </div>
          )}

          {/* Row 5: Footer */}
          <div className="flex items-center justify-between pt-1.5 border-t border-border mt-auto">
            <span className="flex items-center gap-1 text-[10px] font-semibold text-muted-foreground truncate">
              <CheckCircle size={9} className="text-emerald-500 shrink-0" />
              {job.sourceName || "Source vérifiée"}
            </span>
            <span className="text-[10px] font-black text-primary flex items-center gap-0.5 shrink-0 opacity-0 group-hover:opacity-100 transition-opacity">
              Voir <ArrowRight size={10} />
            </span>
          </div>
        </CardContent>
      </Card>
    </a>
  );
}
