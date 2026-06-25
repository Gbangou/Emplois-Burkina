"use client";

import { useState } from "react";
import { Play, RadioTower, Send } from "lucide-react";
import type { PublicationBatch } from "@emplois-burkina/domain";

type PublicationBatchLauncherProps = {
  initialBatches: PublicationBatch[];
};

const apiBase = process.env.NEXT_PUBLIC_API_URL || "http://127.0.0.1:4000/api";

export function PublicationBatchLauncher({ initialBatches }: PublicationBatchLauncherProps) {
  const [batches, setBatches] = useState(initialBatches);
  const [busy, setBusy] = useState(false);
  const [message, setMessage] = useState("");

  async function createBatch() {
    setBusy(true);
    setMessage("");

    try {
      const response = await fetch(`${apiBase}/platform/automation/batches`, { method: "POST" });
      if (!response.ok) throw new Error(`HTTP ${response.status}`);
      const payload = (await response.json()) as { batch: PublicationBatch };
      setBatches((current) => [payload.batch, ...current].slice(0, 8));
      setMessage(`${payload.batch.itemCount} offres preparees sur ${payload.batch.channelCount} canaux.`);
    } catch {
      setMessage("API indisponible: impossible de preparer le batch.");
    } finally {
      setBusy(false);
    }
  }

  return (
    <section className="section batch-console" id="publication-batches">
      <div className="section__heading">
        <div>
          <p className="eyebrow">Publication batches</p>
          <h2>Preparer des lots propres avant diffusion automatique.</h2>
        </div>
        <button className="batch-launch-button" disabled={busy} onClick={createBatch} type="button">
          <Play size={16} />
          Preparer un batch
        </button>
      </div>

      {message ? <div className="batch-message">{message}</div> : null}

      <div className="batch-list">
        {batches.slice(0, 6).map((batch) => (
          <article key={batch.id}>
            <span>
              <RadioTower size={16} />
              {batch.status}
            </span>
            <strong>{batch.itemCount} offres</strong>
            <small>
              {batch.channelCount} canaux - cree le {new Date(batch.createdAt).toLocaleString("fr-FR")}
            </small>
          </article>
        ))}
      </div>

      {!batches.length ? (
        <div className="batch-empty">
          <Send size={16} />
          Aucun batch prepare pour le moment.
        </div>
      ) : null}
    </section>
  );
}
