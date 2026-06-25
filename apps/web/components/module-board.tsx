import { Activity, ArrowUpRight, CheckCircle2 } from "lucide-react";
import type { ProductModule } from "@emplois-burkina/domain";

type ModuleBoardProps = {
  modules: ProductModule[];
};

export function ModuleBoard({ modules }: ModuleBoardProps) {
  return (
    <section className="section module-board" aria-label="Modules produit Emplois Burkina">
      <div className="section__heading">
        <p className="eyebrow">Architecture produit</p>
        <h2>Les briques d'une vraie plateforme emploi moderne.</h2>
      </div>
      <div className="module-grid">
        {modules.slice(0, 8).map((module) => (
          <article className="module-card" key={module.id}>
            <div>
              <span className={`status status--${module.status}`}>
                <Activity size={14} />
                {module.status.replace("_", " ")}
              </span>
              <h3>{module.name}</h3>
              <p>{module.nextMilestone}</p>
            </div>
            <div className="module-card__footer">
              <span>
                <CheckCircle2 size={15} />
                {module.priority}
              </span>
              <ArrowUpRight size={17} />
            </div>
          </article>
        ))}
      </div>
    </section>
  );
}
