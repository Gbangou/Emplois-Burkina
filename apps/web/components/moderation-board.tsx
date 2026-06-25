"use client";

import { useMemo, useState } from "react";
import { Ban, CheckCircle2, ExternalLink, ShieldAlert } from "lucide-react";
import type { JobOpportunity, JobStatus } from "@emplois-burkina/domain";

type ModerationBoardProps = {
  initialJobs: JobOpportunity[];
};

const apiBase = process.env.NEXT_PUBLIC_API_URL || "http://127.0.0.1:4000/api";

function riskLabel(job: JobOpportunity) {
  const risk = job.riskScore || 0;
  if (risk >= 60) return "Risque eleve";
  if ((job.confidenceScore || 0) < 70) return "Confiance basse";
  return "A verifier";
}

export function ModerationBoard({ initialJobs }: ModerationBoardProps) {
  const [jobs, setJobs] = useState(initialJobs);
  const [busyId, setBusyId] = useState("");
  const [message, setMessage] = useState("");

  const stats = useMemo(() => {
    const highRisk = jobs.filter((job) => (job.riskScore || 0) >= 60).length;
    const lowConfidence = jobs.filter((job) => (job.confidenceScore || 0) < 70).length;
    return { highRisk, lowConfidence };
  }, [jobs]);

  async function moderate(job: JobOpportunity, status: JobStatus) {
    setBusyId(job.id);
    setMessage("");

    try {
      const response = await fetch(`${apiBase}/jobs/${job.id}/moderation`, {
        body: JSON.stringify({ status, note: status === "validated" ? "source-verifiee" : "rejet-console-ops" }),
        headers: { "Content-Type": "application/json" },
        method: "PATCH",
      });

      if (!response.ok) throw new Error(`HTTP ${response.status}`);

      setJobs((current) => current.filter((item) => item.id !== job.id));
      setMessage(status === "validated" ? "Offre validee et sortie de la file." : "Offre rejetee et marquee a risque.");
    } catch {
      setMessage("API indisponible: action non appliquee. Verifiez le serveur 4000.");
    } finally {
      setBusyId("");
    }
  }

  return (
    <section className="section moderation-board" id="moderation">
      <div className="section__heading">
        <div>
          <p className="eyebrow">Moderation</p>
          <h2>File de revue pour garder le catalogue propre avant diffusion.</h2>
        </div>
        <span className="section-badge">
          <ShieldAlert size={16} />
          {jobs.length} annonces a traiter
        </span>
      </div>

      <div className="moderation-summary">
        <article>
          <span>Risque eleve</span>
          <strong>{stats.highRisk}</strong>
        </article>
        <article>
          <span>Confiance basse</span>
          <strong>{stats.lowConfidence}</strong>
        </article>
        <article>
          <span>Action recommandee</span>
          <strong>Verifier source/date</strong>
        </article>
      </div>

      {message ? <div className="moderation-message">{message}</div> : null}

      <div className="moderation-list">
        {jobs.map((job) => (
          <article key={job.id}>
            <div className="moderation-card__main">
              <span>{riskLabel(job)}</span>
              <h3>{job.title}</h3>
              <p>
                {job.company || "Organisation a verifier"} - {job.city || "Burkina Faso"} -{" "}
                {job.deadline || "Date a verifier"}
              </p>
              <small>
                Source: {job.sourceName || "Inconnue"} - Confiance {job.confidenceScore || 0}% - Risque{" "}
                {job.riskScore || 0}%
              </small>
            </div>
            <div className="moderation-card__actions">
              {job.sourceUrl ? (
                <a href={job.sourceUrl} rel="noreferrer" target="_blank">
                  <ExternalLink size={16} />
                  Source
                </a>
              ) : null}
              <button disabled={busyId === job.id} onClick={() => moderate(job, "validated")} type="button">
                <CheckCircle2 size={16} />
                Valider
              </button>
              <button
                className="moderation-danger"
                disabled={busyId === job.id}
                onClick={() => moderate(job, "rejected")}
                type="button"
              >
                <Ban size={16} />
                Rejeter
              </button>
            </div>
          </article>
        ))}
      </div>

      {!jobs.length ? <div className="moderation-empty">File vide: le catalogue est pret pour diffusion.</div> : null}
    </section>
  );
}
