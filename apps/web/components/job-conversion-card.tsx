import { ArrowRight, FileCheck2, FileText, Sparkles } from "lucide-react";
import type { JobOpportunity } from "@emplois-burkina/domain";
import { Card, CardContent } from "@/components/ui/card";

type JobConversionCardProps = {
  job: JobOpportunity;
};

function serviceHref(service: "cv-ats" | "lettre") {
  return `/services?service=${service}#paiement`;
}

export function JobConversionCard({ job }: JobConversionCardProps) {
  const target = [job.title, job.company, job.city].filter(Boolean).join(" - ");

  return (
    <Card className="border-primary/20 bg-primary/5">
      <CardContent className="p-5">
        <div className="flex items-center gap-2">
          <Sparkles size={15} className="text-primary" />
          <h3 className="font-black text-sm text-foreground">Candidature plus forte</h3>
        </div>
        <p className="mt-2 text-xs font-semibold leading-relaxed text-muted-foreground">
          L'offre reste gratuite. Ces outils optionnels aident a envoyer un dossier plus clair pour {target || "cette opportunite"}.
        </p>

        <div className="mt-4 grid gap-2">
          <a
            href="/outils"
            data-analytics-source="job_detail_conversion"
            data-analytics-label="cv_ats_checker"
            className="flex items-center justify-between gap-3 rounded-xl border border-border bg-white px-3 py-2.5 text-sm font-black text-foreground transition-colors hover:border-primary"
          >
            <span className="flex items-center gap-2">
              <FileCheck2 size={14} className="text-primary" />
              Tester mon CV gratuitement
            </span>
            <ArrowRight size={13} className="text-primary" />
          </a>
          <a
            href={serviceHref("cv-ats")}
            data-analytics-source="job_detail_conversion"
            data-analytics-label="cv_ats_service"
            className="flex items-center justify-between gap-3 rounded-xl border border-border bg-white px-3 py-2.5 text-sm font-black text-foreground transition-colors hover:border-primary"
          >
            <span className="flex items-center gap-2">
              <FileText size={14} className="text-primary" />
              Optimiser mon CV ATS
            </span>
            <ArrowRight size={13} className="text-primary" />
          </a>
          <a
            href={serviceHref("lettre")}
            data-analytics-source="job_detail_conversion"
            data-analytics-label="cover_letter_service"
            className="flex items-center justify-between gap-3 rounded-xl border border-border bg-white px-3 py-2.5 text-sm font-black text-foreground transition-colors hover:border-primary"
          >
            <span className="flex items-center gap-2">
              <FileText size={14} className="text-primary" />
              Commander une lettre ciblee
            </span>
            <ArrowRight size={13} className="text-primary" />
          </a>
        </div>
      </CardContent>
    </Card>
  );
}
