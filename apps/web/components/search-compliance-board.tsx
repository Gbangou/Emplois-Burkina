import { BadgeCheck, SearchCheck, ShieldCheck, TriangleAlert } from "lucide-react";
import type { SearchComplianceReport } from "@/lib/search-compliance";

type SearchComplianceBoardProps = {
  report: SearchComplianceReport;
};

function StatusIcon({ status }: { status: "ready" | "watch" | "blocked" }) {
  if (status === "ready") return <BadgeCheck size={17} className="text-emerald-600" />;
  if (status === "watch") return <TriangleAlert size={17} className="text-amber-600" />;
  return <TriangleAlert size={17} className="text-red-600" />;
}

export function SearchComplianceBoard({ report }: SearchComplianceBoardProps) {
  return (
    <section className="section ops-console">
      <div className="section__heading">
        <div>
          <p className="eyebrow">Search & Ads compliance</p>
          <h2>Maximiser les revenus sans risquer Google, AdSense ou la confiance.</h2>
        </div>
        <span className="section-badge">
          <SearchCheck size={16} />
          {report.score}% conforme
        </span>
      </div>

      <div className="ops-grid">
        <div className="ops-panel">
          <div className="ops-panel__head">
            <strong>Checklist moteurs de recherche</strong>
            <small>Contenu utile, crawl propre, donnees structurees et surfaces privees fermees.</small>
          </div>
          <div className="source-list">
            {report.items.map((item) => (
              <article key={item.label}>
                <div>
                  <strong className="inline-flex items-center gap-2">
                    <StatusIcon status={item.status} />
                    {item.label}
                  </strong>
                  <small>{item.proof}</small>
                </div>
                <span className={`source-status source-status--${item.status === "ready" ? "excellent" : "watch"}`}>
                  {item.status}
                </span>
              </article>
            ))}
          </div>
        </div>

        <div className="ops-panel ops-panel--watch">
          <div className="ops-panel__head">
            <strong>Regles AdSense a ne pas casser</strong>
            <small>Les revenus durables viennent d'une experience propre, pas de clics forces.</small>
          </div>
          <div className="watch-list">
            {report.adSenseRules.map((rule) => (
              <article key={rule}>
                <ShieldCheck size={17} />
                <div>
                  <strong>Regle</strong>
                  <small>{rule}</small>
                </div>
              </article>
            ))}
          </div>
        </div>
      </div>
    </section>
  );
}
