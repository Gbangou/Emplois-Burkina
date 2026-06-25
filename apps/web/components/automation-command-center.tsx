import { Bot, CheckCircle2, Globe2, RadioTower, Send, ShieldAlert, Sparkles } from "lucide-react";
import type { AutomationOverview, PublicationQueueItem } from "@emplois-burkina/domain";

type AutomationCommandCenterProps = {
  overview: AutomationOverview;
};

function actionLabel(action: PublicationQueueItem["action"]) {
  if (action === "auto_publish") return "Auto-publication";
  if (action === "schedule_digest") return "Digest";
  return "Moderation";
}

export function AutomationCommandCenter({ overview }: AutomationCommandCenterProps) {
  const preview = overview.queue.slice(0, 8);

  return (
    <section className="section automation-console" id="automation">
      <div className="section__heading">
        <div>
          <p className="eyebrow">Automation benchmark</p>
          <h2>Publication automatique multi-canal, inspiree des meilleurs ATS et job boards.</h2>
        </div>
        <span className="section-badge">
          <Bot size={16} />
          {overview.channels.length} canaux prepares
        </span>
      </div>

      <div className="automation-metrics">
        <article>
          <CheckCircle2 />
          <span>Pretes a publier</span>
          <strong>{overview.readyToPublish}</strong>
        </article>
        <article>
          <Send />
          <span>Digests candidats</span>
          <strong>{overview.digestCandidates}</strong>
        </article>
        <article>
          <ShieldAlert />
          <span>A moderer</span>
          <strong>{overview.needsModeration}</strong>
        </article>
      </div>

      <div className="automation-grid">
        <div className="automation-panel">
          <div className="ops-panel__head">
            <strong>Segments couverts</strong>
            <small>Formel, informel, international, ONU/ONG et informatique globale.</small>
          </div>
          <div className="segment-list">
            {overview.segments.map((segment) => (
              <article key={segment.id}>
                <span>
                  <Globe2 size={16} />
                  {segment.priority}
                </span>
                <strong>{segment.name}</strong>
                <p>{segment.coverageGoal}</p>
                <small>{segment.sourceExamples.join(" / ")}</small>
              </article>
            ))}
          </div>
        </div>

        <div className="automation-panel automation-panel--queue">
          <div className="ops-panel__head">
            <strong>File de publication</strong>
            <small>Priorisation automatique selon confiance, deadline et segment.</small>
          </div>
          <div className="publication-list">
            {preview.map((item) => (
              <article key={item.id}>
                <div>
                  <span className={`publication-action publication-action--${item.action}`}>
                    <RadioTower size={15} />
                    {actionLabel(item.action)}
                  </span>
                  <strong>{item.title}</strong>
                  <small>
                    {item.company} - {item.readinessScore}% pret - {item.channels.slice(0, 3).join(", ")}
                  </small>
                </div>
                <Sparkles size={18} />
              </article>
            ))}
          </div>
        </div>
      </div>
    </section>
  );
}
