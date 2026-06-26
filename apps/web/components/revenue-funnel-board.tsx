import { ArrowRight, BriefcaseBusiness, FileCheck2, MousePointerClick, ShoppingBag, WalletCards } from "lucide-react";
import type { RevenueSignals } from "@/lib/revenue-signals";
import type { ServiceOrderSummary } from "@/lib/service-orders";

type RevenueFunnelBoardProps = {
  signals: RevenueSignals;
  orders: ServiceOrderSummary;
};

function formatFcfa(value: number) {
  return new Intl.NumberFormat("fr-FR").format(value);
}

function Step({ label, value, icon: Icon }: { label: string; value: string | number; icon: React.ElementType }) {
  return (
    <article className="rounded-xl border border-border bg-white p-4 shadow-sm">
      <Icon size={17} className="text-primary" />
      <p className="mt-3 text-2xl font-black text-foreground">{value}</p>
      <p className="mt-1 text-xs font-black uppercase tracking-wide text-muted-foreground">{label}</p>
    </article>
  );
}

export function RevenueFunnelBoard({ signals, orders }: RevenueFunnelBoardProps) {
  const funnel = signals.funnel;
  const nextAction = orders.totalOrders > 0
    ? "Priorite: verifier paiement, livrer vite, puis automatiser relance et temoignages."
    : funnel.serviceClicks > 0
      ? "Priorite: reduire la friction formulaire/paiement pour transformer les clics en commandes."
      : "Priorite: augmenter les CTA contextuels sur offres, outils CV et pages SEO a trafic.";

  return (
    <section className="section">
      <div className="section-head">
        <div>
          <p className="eyebrow">Funnel revenus</p>
          <h2>Lecture business du chemin trafic vers commandes.</h2>
        </div>
        <p>
          Suit le tunnel gratuit vers monetisation: offres consultees, outils, pages services,
          clics de conversion et commandes Mobile Money attendues.
        </p>
      </div>

      <div className="grid gap-4 md:grid-cols-5">
        <Step label="Vues offres" value={funnel.jobViews} icon={BriefcaseBusiness} />
        <Step label="Vues outils" value={funnel.toolViews} icon={FileCheck2} />
        <Step label="Vues services" value={funnel.serviceViews + funnel.pricingViews} icon={WalletCards} />
        <Step label="Clics services" value={funnel.serviceClicks} icon={MousePointerClick} />
        <Step label="Commandes" value={orders.totalOrders} icon={ShoppingBag} />
      </div>

      <div className="mt-4 grid gap-4 lg:grid-cols-[0.75fr_1.25fr]">
        <div className="rounded-xl border border-border bg-white p-4 shadow-sm">
          <p className="text-xs font-black uppercase tracking-wide text-muted-foreground">Taux clic service</p>
          <p className="mt-2 text-3xl font-black text-foreground">{funnel.serviceClickRate}%</p>
          <p className="mt-2 text-xs font-semibold leading-relaxed text-muted-foreground">
            Clics vers services ou grille tarifaire depuis les surfaces monetisables.
          </p>
        </div>
        <div className="rounded-xl border border-border bg-muted/30 p-4">
          <p className="flex items-start gap-2 text-xs font-bold leading-relaxed text-muted-foreground">
            <ArrowRight size={14} className="mt-0.5 shrink-0 text-primary" />
            {nextAction}
          </p>
          <p className="mt-3 text-xs font-bold leading-relaxed text-muted-foreground">
            Revenu attendu actuel: <strong className="text-foreground">{formatFcfa(orders.expectedRevenueFcfa)} FCFA</strong>.
            Ce montant represente les commandes en attente, pas un revenu encaisse confirme.
          </p>
        </div>
      </div>
    </section>
  );
}
