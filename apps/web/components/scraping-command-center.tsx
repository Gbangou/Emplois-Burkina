import { Activity, AlertTriangle, Bot, CheckCircle2, DatabaseZap, Gauge, ShieldCheck } from "lucide-react";
import type { ScrapingOverview, SourceHealth } from "@emplois-burkina/domain";

type ScrapingCommandCenterProps = {
  overview: ScrapingOverview;
};

function statusLabel(status: SourceHealth["status"]) {
  if (status === "excellent") return "Excellent";
  if (status === "stable") return "Stable";
  if (status === "manual") return "Manuel";
  return "A surveiller";
}

export function ScrapingCommandCenter({ overview }: ScrapingCommandCenterProps) {
  const metrics = [
    ["Items collectes", overview.rawItems, DatabaseZap],
    ["Offres publiees", overview.publishedJobs, CheckCircle2],
    ["Sources actives", overview.automatedSources, Bot],
    ["File moderation", overview.reviewQueue, ShieldCheck],
    ["Deadlines propres", overview.deadlineReady, Activity],
    ["Sante moyenne", `${overview.healthAverage}%`, Gauge],
  ] as const;

  return (
    <section className="section ops-console" id="operations">
      <div className="section__heading">
        <div>
          <p className="eyebrow">Operations scraping</p>
          <h2>Un centre de controle pour piloter qualite, sources et moderation.</h2>
        </div>
        <span className="section-badge">
          <Gauge size={16} />
          {overview.confidenceAverage}% confiance moyenne
        </span>
      </div>

      <div className="ops-metrics">
        {metrics.map(([label, value, Icon]) => (
          <article key={label}>
            <span>
              <Icon size={17} />
              {label}
            </span>
            <strong>{value}</strong>
          </article>
        ))}
      </div>

      <div className="ops-grid">
        <div className="ops-panel">
          <div className="ops-panel__head">
            <strong>Sources prioritaires</strong>
            <small>Classement par sante, volume, confiance et deadlines.</small>
          </div>
          <div className="source-list">
            {overview.topSources.map((source) => (
              <article key={source.id}>
                <div>
                  <strong>{source.name}</strong>
                  <small>
                    {source.rawItems} items collectes - {source.publishedJobs} offres publiees
                  </small>
                </div>
                <span className={`source-status source-status--${source.status}`}>
                  {statusLabel(source.status)} {source.healthScore}%
                </span>
              </article>
            ))}
          </div>
        </div>

        <div className="ops-panel ops-panel--watch">
          <div className="ops-panel__head">
            <strong>Actions qualite</strong>
            <small>Ce qu'il faut corriger avant d'automatiser plus fort.</small>
          </div>
          <div className="watch-list">
            {overview.watchSources.map((source) => (
              <article key={source.id}>
                <AlertTriangle size={17} />
                <div>
                  <strong>{source.name}</strong>
                  <small>{source.nextAction}</small>
                </div>
              </article>
            ))}
          </div>
        </div>
      </div>
    </section>
  );
}
