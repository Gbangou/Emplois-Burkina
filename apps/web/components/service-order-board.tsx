import { Banknote, Clock3, CreditCard, ShoppingBag, Smartphone } from "lucide-react";
import type { ServiceOrderSummary, ServiceOrderStatus } from "@/lib/service-orders";

type ServiceOrderBoardProps = {
  summary: ServiceOrderSummary;
};

const STATUS_LABEL: Record<ServiceOrderStatus, string> = {
  draft: "Brouillon",
  awaiting_payment: "Paiement attendu"
};

function formatFcfa(value: number) {
  return new Intl.NumberFormat("fr-FR").format(value);
}

function formatDate(value: string) {
  return new Intl.DateTimeFormat("fr-FR", {
    day: "2-digit",
    month: "short",
    hour: "2-digit",
    minute: "2-digit"
  }).format(new Date(value));
}

function Metric({ label, value, icon: Icon }: { label: string; value: string | number; icon: React.ElementType }) {
  return (
    <article className="rounded-xl border border-border bg-white p-4 shadow-sm">
      <Icon size={17} className="text-primary" />
      <p className="mt-3 text-2xl font-black text-foreground">{value}</p>
      <p className="mt-1 text-xs font-black uppercase tracking-wide text-muted-foreground">{label}</p>
    </article>
  );
}

export function ServiceOrderBoard({ summary }: ServiceOrderBoardProps) {
  return (
    <section className="section">
      <div className="section-head">
        <div>
          <p className="eyebrow">Services payants optionnels</p>
          <h2>Suivi interne des commandes qui peuvent generer du cash rapide.</h2>
        </div>
        <p>
          Vue agreggee et minimale: elle aide a prioriser les produits digitaux rentables sans afficher
          les contacts, notes ou informations personnelles des demandeurs.
        </p>
      </div>

      <div className="grid gap-4 md:grid-cols-4">
        <Metric label="Commandes" value={summary.totalOrders} icon={ShoppingBag} />
        <Metric label="Paiements attendus" value={summary.awaitingPayment} icon={Clock3} />
        <Metric label="Mobile money a suivre" value={summary.mobileMoneyPending} icon={Smartphone} />
        <Metric label="Revenu attendu" value={`${formatFcfa(summary.expectedRevenueFcfa)} FCFA`} icon={Banknote} />
      </div>

      <div className="mt-4 grid gap-4 lg:grid-cols-2">
        <div className="rounded-xl border border-border bg-white p-4 shadow-sm">
          <div className="flex items-center gap-2">
            <CreditCard size={17} className="text-primary" />
            <h3 className="text-sm font-black text-foreground">Services les plus demandes</h3>
          </div>
          <div className="mt-3 grid gap-2">
            {summary.topServices.length > 0 ? summary.topServices.map((service) => (
              <div key={service.serviceName} className="rounded-lg border border-border bg-muted/30 p-3">
                <div className="flex items-center justify-between gap-3">
                  <p className="min-w-0 truncate text-xs font-black text-foreground">{service.serviceName}</p>
                  <span className="shrink-0 text-xs font-black text-primary">{formatFcfa(service.amountFcfa)} FCFA</span>
                </div>
                <p className="mt-1 text-[11px] font-bold uppercase tracking-wide text-muted-foreground">
                  {service.count} demande{service.count > 1 ? "s" : ""}
                </p>
              </div>
            )) : (
              <p className="text-xs font-semibold leading-relaxed text-muted-foreground">
                Les premieres commandes alimenteront ce classement automatiquement.
              </p>
            )}
          </div>
        </div>

        <div className="rounded-xl border border-border bg-white p-4 shadow-sm">
          <h3 className="text-sm font-black text-foreground">Dernieres commandes anonymisees</h3>
          <div className="mt-3 grid gap-2">
            {summary.recentOrders.length > 0 ? summary.recentOrders.map((order) => (
              <div key={order.id} className="rounded-lg border border-border bg-muted/30 p-3">
                <div className="flex items-center justify-between gap-3">
                  <p className="min-w-0 truncate text-xs font-black text-foreground">{order.serviceName}</p>
                  <span className="shrink-0 text-xs font-black text-primary">{formatFcfa(order.amountFcfa)} FCFA</span>
                </div>
                <div className="mt-2 flex flex-wrap items-center gap-2 text-[11px] font-bold text-muted-foreground">
                  <span className="rounded-full border border-border bg-white px-2 py-0.5">{STATUS_LABEL[order.status]}</span>
                  <span>{formatDate(order.createdAt)}</span>
                  <span className="font-mono">{order.id.slice(0, 14)}</span>
                </div>
              </div>
            )) : (
              <p className="text-xs font-semibold leading-relaxed text-muted-foreground">
                Aucune commande enregistree pour le moment.
              </p>
            )}
          </div>
        </div>
      </div>

      <div className="mt-4 rounded-xl border border-border bg-muted/30 p-4">
        <p className="text-xs font-bold leading-relaxed text-muted-foreground">
          Prochaine optimisation: relier les services les plus demandes aux guides et pages d'offres qui convertissent,
          puis automatiser relance, paiement et livraison numerique.
        </p>
      </div>
    </section>
  );
}
