import { ArrowRight, Bell, FileText, GraduationCap, ShieldCheck, WalletCards, type LucideIcon } from "lucide-react";
import type { Recommendation } from "@/lib/recommendations";

const ICONS: Record<Recommendation["category"], LucideIcon> = {
  alerte: Bell,
  formation: GraduationCap,
  outil: ShieldCheck,
  service: WalletCards
};

type RecommendationPanelProps = {
  items: Recommendation[];
};

export function RecommendationPanel({ items }: RecommendationPanelProps) {
  if (items.length === 0) return null;

  return (
    <section className="rounded-xl border border-border bg-white p-5 shadow-sm">
      <div className="flex items-start gap-3">
        <FileText size={18} className="mt-0.5 shrink-0 text-primary" />
        <div>
          <p className="text-xs font-black uppercase tracking-widest text-primary">Suite utile</p>
          <h2 className="mt-2 text-xl font-black text-foreground">Recommandations pour agir maintenant</h2>
          <p className="mt-2 text-sm font-semibold leading-relaxed text-muted-foreground">
            Le guide reste gratuit. Ces options aident ceux qui veulent gagner du temps, avec une indication claire quand il s'agit d'un service.
          </p>
        </div>
      </div>

      <div className="mt-5 grid gap-3 md:grid-cols-3">
        {items.map((item) => {
          const Icon = ICONS[item.category];

          return (
            <a
              key={item.id}
              href={item.href}
              data-analytics-source="guide_recommendation"
              data-analytics-label={item.id}
              className="group rounded-xl border border-border bg-muted/20 p-4 transition-all hover:-translate-y-0.5 hover:border-primary hover:bg-white hover:shadow-sm"
            >
              <div className="flex items-start justify-between gap-3">
                <Icon size={18} className="text-primary" />
                <span className="rounded-full border border-border bg-white px-2.5 py-1 text-[10px] font-black uppercase tracking-wide text-muted-foreground">
                  {item.disclosure}
                </span>
              </div>
              <h3 className="mt-4 text-sm font-black text-foreground">{item.title}</h3>
              <p className="mt-2 text-xs font-semibold leading-relaxed text-muted-foreground">{item.description}</p>
              <div className="mt-4 flex items-center justify-between border-t border-border pt-3">
                <span className="text-[11px] font-black text-primary">{item.value}</span>
                <ArrowRight size={13} className="text-muted-foreground transition-transform group-hover:translate-x-0.5 group-hover:text-primary" />
              </div>
            </a>
          );
        })}
      </div>
    </section>
  );
}
