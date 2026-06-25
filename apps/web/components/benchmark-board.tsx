import { CheckCircle2, Compass, ShieldCheck } from "lucide-react";
import type { BenchmarkItem } from "@emplois-burkina/domain";

type BenchmarkBoardProps = {
  items: BenchmarkItem[];
};

export function BenchmarkBoard({ items }: BenchmarkBoardProps) {
  return (
    <section className="section benchmark-section" aria-label="Benchmark produit Emplois Burkina">
      <div className="section__heading">
        <div>
          <p className="eyebrow">Benchmark mondial</p>
          <h2>Le meilleur des job boards, adapte au terrain burkinabe.</h2>
        </div>
        <span className="section-badge">
          <Compass size={16} />
          Produit guide par references
        </span>
      </div>
      <div className="benchmark-grid">
        {items.map((item) => (
          <article className="benchmark-card" key={item.id}>
            <span className="benchmark-card__ref">
              <ShieldCheck size={15} />
              {item.reference}
            </span>
            <h3>{item.principle}</h3>
            <p>{item.emploisBurkinaMove}</p>
            <strong>
              <CheckCircle2 size={15} />
              {item.impact}
            </strong>
          </article>
        ))}
      </div>
    </section>
  );
}
