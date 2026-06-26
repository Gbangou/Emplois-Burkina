import { ArrowUpRight, MousePointerClick, Target, TrendingUp, Users } from "lucide-react";
import type { RevenueSignals } from "@/lib/revenue-signals";

type RevenueSignalBoardProps = {
  signals: RevenueSignals;
};

function Metric({ label, value, icon: Icon }: { label: string; value: string | number; icon: React.ElementType }) {
  return (
    <article className="rounded-xl border border-border bg-white p-4 shadow-sm">
      <Icon size={17} className="text-primary" />
      <p className="mt-3 text-2xl font-black text-foreground">{value}</p>
      <p className="mt-1 text-xs font-black uppercase tracking-wide text-muted-foreground">{label}</p>
    </article>
  );
}

function RankedList({ title, items, field }: { title: string; items: Array<Record<string, string | number>>; field: string }) {
  return (
    <div className="rounded-xl border border-border bg-white p-4 shadow-sm">
      <h3 className="text-sm font-black text-foreground">{title}</h3>
      <div className="mt-3 grid gap-2">
        {items.length > 0 ? items.map((item, index) => (
          <div key={`${item[field]}-${index}`} className="flex items-center justify-between gap-3 rounded-lg bg-muted/40 px-3 py-2">
            <span className="min-w-0 truncate text-xs font-bold text-muted-foreground">{String(item[field])}</span>
            <span className="shrink-0 text-xs font-black text-primary">{item.count}</span>
          </div>
        )) : (
          <p className="text-xs font-semibold leading-relaxed text-muted-foreground">Pas encore assez de donnees.</p>
        )}
      </div>
    </div>
  );
}

export function RevenueSignalBoard({ signals }: RevenueSignalBoardProps) {
  return (
    <section className="section">
      <div className="section-head">
        <div>
          <p className="eyebrow">Revenus & conversions</p>
          <h2>Signaux pour optimiser ce qui rapporte.</h2>
        </div>
        <p>
          Mesure les pages qui attirent, les recommandations qui cliquent et les sources qui transforment
          sans exposer les donnees candidates.
        </p>
      </div>

      <div className="grid gap-4 md:grid-cols-4">
        <Metric label="Pages vues" value={signals.pageViews} icon={TrendingUp} />
        <Metric label="Clics conversion" value={signals.conversionClicks} icon={MousePointerClick} />
        <Metric label="Leads" value={signals.leadSubmits} icon={Users} />
        <Metric label="CTR clic/page" value={`${signals.clickThroughRate}%`} icon={Target} />
      </div>

      <div className="mt-4 grid gap-4 lg:grid-cols-3">
        <RankedList title="Pages qui attirent" items={signals.topPaths} field="path" />
        <RankedList title="Cibles qui monetisent" items={signals.topTargets} field="target" />
        <RankedList title="Sources de conversion" items={signals.topSources} field="source" />
      </div>

      <div className="mt-4 rounded-xl border border-border bg-muted/30 p-4">
        <p className="flex items-center gap-2 text-xs font-bold leading-relaxed text-muted-foreground">
          <ArrowUpRight size={14} className="text-primary" />
          Action: renforcer les guides et pages qui envoient le plus de clics vers services, alertes et futures affiliations.
        </p>
      </div>
    </section>
  );
}
