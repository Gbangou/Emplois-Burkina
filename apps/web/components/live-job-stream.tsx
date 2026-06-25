import { ArrowUpRight, Radio, ShieldCheck } from "lucide-react";
import type { JobOpportunity } from "@emplois-burkina/domain";

type LiveJobStreamProps = {
  jobs: JobOpportunity[];
};

export function LiveJobStream({ jobs }: LiveJobStreamProps) {
  const streamJobs = jobs.slice(0, 12);
  const loop = [...streamJobs, ...streamJobs];

  return (
    <section className="section live-stream-section" aria-label="Flux live des offres collectees">
      <div className="live-stream-copy">
        <p className="eyebrow">Flux live</p>
        <h2>Les offres collectees defilent comme un tableau de bord actif.</h2>
        <p>
          La nouvelle app conserve l'esprit du flux historique: offres recentes,
          sources visibles, deadlines et confiance. Le scraping reste dans le
          pipeline; ce flux montre ce qui arrive cote candidat.
        </p>
        <div className="stream-badges">
          <span>
            <Radio size={15} />
            Collecte active
          </span>
          <span>
            <ShieldCheck size={15} />
            Moderation avant mise en avant
          </span>
        </div>
      </div>
      <div className="live-stream-window" aria-live="polite">
        <div className="live-stream-track">
          {loop.map((job, index) => (
            <a className="live-stream-item" href={`/jobs?q=${encodeURIComponent(job.title)}`} key={`${job.id}-${index}`}>
              <div>
                <strong>{job.title}</strong>
                <span>{job.company || job.sourceName || "Organisation suivie"}</span>
              </div>
              <small>{job.city || "Burkina Faso"} - {job.deadline || "Date a verifier"}</small>
              <em>
                Source
                <ArrowUpRight size={14} />
              </em>
            </a>
          ))}
        </div>
      </div>
    </section>
  );
}
