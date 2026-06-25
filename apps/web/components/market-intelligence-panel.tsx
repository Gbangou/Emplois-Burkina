import { AlertTriangle, ArrowUpRight, Building2, Flame, MapPin, RadioTower, ShieldCheck, Sparkles } from "lucide-react";
import type { IntelligenceRisk, MarketIntelligence } from "@emplois-burkina/domain";

type MarketIntelligencePanelProps = {
  intelligence: MarketIntelligence;
};

function severityTone(severity: IntelligenceRisk["severity"]) {
  if (severity === "high") return "market-risk--high";
  if (severity === "medium") return "market-risk--medium";
  return "market-risk--low";
}

export function MarketIntelligencePanel({ intelligence }: MarketIntelligencePanelProps) {
  const scores = [
    ["Chaleur marche", intelligence.marketHeatScore, Flame],
    ["Valeur candidat", intelligence.candidateValueScore, ShieldCheck],
    ["Potentiel revenu", intelligence.monetizationScore, Building2],
  ] as const;

  return (
    <section className="section market-intelligence" id="intelligence">
      <div className="section__heading">
        <div>
          <p className="eyebrow">Market intelligence</p>
          <h2>Les signaux qui disent ou chercher, quoi pousser et quoi monetiser.</h2>
        </div>
        <span className="section-badge">
          <Sparkles size={16} />
          Opportunity OS
        </span>
      </div>

      <div className="market-score-grid">
        {scores.map(([label, value, Icon]) => (
          <article key={label}>
            <span>
              <Icon size={17} />
              {label}
            </span>
            <strong>{value}%</strong>
          </article>
        ))}
      </div>

      <div className="market-grid">
        <div className="market-panel">
          <div className="ops-panel__head">
            <strong>Categories chaudes</strong>
            <small>Les segments ou la demande publiee est la plus visible.</small>
          </div>
          <div className="signal-list">
            {intelligence.topCategories.map((signal) => (
              <article key={signal.label}>
                <div>
                  <strong>{signal.label}</strong>
                  <small>{signal.value} offres - {signal.share}% du catalogue</small>
                </div>
                <span>{signal.score}%</span>
              </article>
            ))}
          </div>
        </div>

        <div className="market-panel">
          <div className="ops-panel__head">
            <strong>Villes prioritaires</strong>
            <small>Ou pousser les alertes, partenariats et campagnes locales.</small>
          </div>
          <div className="signal-list">
            {intelligence.topCities.map((signal) => (
              <article key={signal.label}>
                <MapPin size={17} />
                <div>
                  <strong>{signal.label}</strong>
                  <small>{signal.value} offres disponibles</small>
                </div>
                <span>{signal.share}%</span>
              </article>
            ))}
          </div>
        </div>

        <div className="market-panel">
          <div className="ops-panel__head">
            <strong>Sources chaudes</strong>
            <small>Sources a convertir en partenariats ou surveillance prioritaire.</small>
          </div>
          <div className="signal-list">
            {intelligence.hotSources.map((signal) => (
              <article key={signal.label}>
                <RadioTower size={17} />
                <div>
                  <strong>{signal.label}</strong>
                  <small>{signal.value} opportunites publiees</small>
                </div>
                <ArrowUpRight size={16} />
              </article>
            ))}
          </div>
        </div>

        <div className="market-panel">
          <div className="ops-panel__head">
            <strong>Risques et actions</strong>
            <small>Ce qui peut bloquer la confiance, les alertes ou la monetisation.</small>
          </div>
          <div className="risk-list">
            {intelligence.riskQueue.map((risk) => (
              <article className={severityTone(risk.severity)} key={risk.label}>
                <AlertTriangle size={17} />
                <div>
                  <strong>{risk.label} - {risk.count}</strong>
                  <small>{risk.action}</small>
                </div>
              </article>
            ))}
          </div>
        </div>
      </div>

      <div className="recommended-actions">
        {intelligence.recommendedActions.map((action) => (
          <span key={action}>{action}</span>
        ))}
      </div>
    </section>
  );
}
