import { DatabaseZap, Globe2, LockKeyhole, Radar, ShieldCheck } from "lucide-react";
import type { SourceGovernance } from "@/lib/source-governance";

type SourceGovernanceBoardProps = {
  governance: SourceGovernance;
};

function modeLabel(mode: string) {
  if (mode === "manual_only") return "Manuel";
  if (mode === "review_required") return "Moderation";
  if (mode === "official_link") return "Lien officiel";
  if (mode === "automated") return "Automatise";
  return mode;
}

export function SourceGovernanceBoard({ governance }: SourceGovernanceBoardProps) {
  const metrics = [
    ["Sources totales", governance.totalSources, Globe2],
    ["Automatisables", governance.automatedSources, DatabaseZap],
    ["Manuelles", governance.manualOnlySources, LockKeyhole],
    ["Score conformite", `${governance.complianceScore}%`, ShieldCheck],
    ["Diversification", `${governance.diversificationScore}%`, Radar]
  ] as const;

  return (
    <section className="section ops-console">
      <div className="section__heading">
        <div>
          <p className="eyebrow">Gouvernance sources</p>
          <h2>Diversifier fort sans exposer les surfaces sensibles.</h2>
        </div>
        <span className="section-badge">
          <ShieldCheck size={16} />
          Secure scraping
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
            <strong>Modes de collecte</strong>
            <small>Ce qui peut etre automatise, modere ou garde en veille.</small>
          </div>
          <div className="source-list">
            {governance.collectionModes.map((mode) => (
              <article key={mode.mode}>
                <div>
                  <strong>{modeLabel(mode.mode)}</strong>
                  <small>{mode.guidance}</small>
                </div>
                <span className="source-status source-status--stable">{mode.count}</span>
              </article>
            ))}
          </div>
        </div>

        <div className="ops-panel">
          <div className="ops-panel__head">
            <strong>Couverture par segment</strong>
            <small>Priorite aux zones qui peuvent creer trafic, confiance et revenus.</small>
          </div>
          <div className="source-list">
            {governance.segmentCoverage.map((segment) => (
              <article key={segment.id}>
                <div>
                  <strong>{segment.name}</strong>
                  <small>{segment.nextMove}</small>
                </div>
                <span className="source-status source-status--stable">{segment.sourceCount}</span>
              </article>
            ))}
          </div>
        </div>
      </div>

      <div className="ops-grid">
        <div className="ops-panel">
          <div className="ops-panel__head">
            <strong>Types de sources</strong>
            <small>Plus la couverture est variee, moins l'app depend d'une plateforme.</small>
          </div>
          <div className="source-list">
            {governance.sourceTypes.slice(0, 10).map((type) => (
              <article key={type.type}>
                <div>
                  <strong>{type.type}</strong>
                  <small>Famille de source referencee</small>
                </div>
                <span className="source-status source-status--stable">{type.count}</span>
              </article>
            ))}
          </div>
        </div>

        <div className="ops-panel ops-panel--watch">
          <div className="ops-panel__head">
            <strong>Backlog expansion propre</strong>
            <small>Ajouter du volume sans violer confidentialite, robots.txt ou plateformes fermees.</small>
          </div>
          <div className="watch-list">
            {governance.expansionBacklog.map((item) => (
              <article key={item.label}>
                <ShieldCheck size={17} />
                <div>
                  <strong>{item.label}</strong>
                  <small>{item.reason} Regle: {item.safetyRule}</small>
                </div>
              </article>
            ))}
          </div>
        </div>
      </div>
    </section>
  );
}
