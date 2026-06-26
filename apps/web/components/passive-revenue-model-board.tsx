import { BadgeCheck, Bot, CircleDollarSign, Clock, ShieldCheck, Zap, type LucideIcon } from "lucide-react";
import type { PassiveRevenueModel } from "@/lib/passive-revenue-models";

const TYPE_LABEL: Record<PassiveRevenueModel["type"], string> = {
  ads: "Publicite",
  affiliate: "Affiliation",
  digital_product: "Produit digital",
  data: "Data",
  audience: "Audience",
  distribution: "Distribution"
};

const LEVEL_ICON: Record<PassiveRevenueModel["passiveLevel"], LucideIcon> = {
  high: Zap,
  medium: Bot,
  low: Clock
};

type PassiveRevenueModelBoardProps = {
  models: PassiveRevenueModel[];
  priorities: string[];
};

export function PassiveRevenueModelBoard({ models, priorities }: PassiveRevenueModelBoardProps) {
  return (
    <section className="container py-10">
      <div className="flex flex-col gap-3 md:flex-row md:items-end md:justify-between">
        <div>
          <p className="text-xs font-black uppercase tracking-widest text-primary">Business models passifs</p>
          <h2 className="mt-2 max-w-3xl text-2xl font-black leading-tight text-foreground lg:text-3xl">
            Matrice serieuse pour maximiser les revenus sans faire payer l'acces aux offres.
          </h2>
        </div>
        <p className="max-w-xl text-sm font-semibold leading-relaxed text-muted-foreground">
          Priorite aux revenus automatisables, mesurables et conformes: contenu utile, recommandations marquees,
          services optionnels, audience opt-in et donnees anonymisees.
        </p>
      </div>

      <div className="mt-6 grid gap-4 xl:grid-cols-2">
        {models.map((model) => {
          const LevelIcon = LEVEL_ICON[model.passiveLevel];

          return (
            <article key={model.id} className="rounded-xl border border-border bg-white p-5 shadow-sm">
              <div className="flex flex-col gap-3 sm:flex-row sm:items-start sm:justify-between">
                <div>
                  <div className="flex flex-wrap gap-2">
                    <span className="rounded-full border border-border bg-muted/40 px-3 py-1 text-[11px] font-black uppercase tracking-wide text-muted-foreground">
                      {TYPE_LABEL[model.type]}
                    </span>
                    <span className="inline-flex items-center gap-1 rounded-full border border-emerald-200 bg-emerald-50 px-3 py-1 text-[11px] font-black uppercase tracking-wide text-emerald-800">
                      <LevelIcon size={11} /> Passif {model.passiveLevel}
                    </span>
                  </div>
                  <h3 className="mt-4 text-lg font-black text-foreground">{model.name}</h3>
                  <p className="mt-2 text-sm font-semibold leading-relaxed text-muted-foreground">{model.automation}</p>
                </div>
                <CircleDollarSign size={20} className="shrink-0 text-primary" />
              </div>

              <div className="mt-5 grid gap-3 md:grid-cols-2">
                <div className="rounded-xl border border-border bg-muted/20 p-4">
                  <p className="text-[11px] font-black uppercase tracking-wide text-muted-foreground">Potentiel</p>
                  <p className="mt-2 text-sm font-black text-foreground">{model.revenuePotential}</p>
                  <p className="mt-2 text-xs font-semibold text-muted-foreground">{model.timeToRevenue}</p>
                </div>
                <div className="rounded-xl border border-border bg-muted/20 p-4">
                  <p className="text-[11px] font-black uppercase tracking-wide text-muted-foreground">Prochaine etape</p>
                  <p className="mt-2 text-sm font-black text-foreground">{model.nextStep}</p>
                </div>
              </div>

              <div className="mt-4 grid gap-3 md:grid-cols-2">
                <div>
                  <p className="mb-2 text-[11px] font-black uppercase tracking-wide text-muted-foreground">Dependances</p>
                  <div className="grid gap-2">
                    {model.dependencies.map((item) => (
                      <p key={item} className="flex gap-2 text-xs font-bold leading-relaxed text-muted-foreground">
                        <BadgeCheck size={13} className="mt-0.5 shrink-0 text-primary" />
                        {item}
                      </p>
                    ))}
                  </div>
                </div>
                <div>
                  <p className="mb-2 text-[11px] font-black uppercase tracking-wide text-muted-foreground">Conformite</p>
                  <div className="grid gap-2">
                    {model.compliance.map((item) => (
                      <p key={item} className="flex gap-2 text-xs font-bold leading-relaxed text-muted-foreground">
                        <ShieldCheck size={13} className="mt-0.5 shrink-0 text-primary" />
                        {item}
                      </p>
                    ))}
                  </div>
                </div>
              </div>
            </article>
          );
        })}
      </div>

      <div className="mt-5 grid gap-3 md:grid-cols-4">
        {priorities.map((priority) => (
          <div key={priority} className="rounded-xl border border-border bg-muted/30 p-4">
            <p className="text-xs font-bold leading-relaxed text-muted-foreground">{priority}</p>
          </div>
        ))}
      </div>
    </section>
  );
}
