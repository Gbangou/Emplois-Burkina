import { CheckCircle2, Clock3, FileCheck2, PackageCheck, ShieldCheck, Sparkles } from "lucide-react";
import type { ServiceDeliveryOverview } from "@/lib/service-delivery";

type ServiceDeliveryBoardProps = {
  overview: ServiceDeliveryOverview;
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

export function ServiceDeliveryBoard({ overview }: ServiceDeliveryBoardProps) {
  return (
    <section className="section">
      <div className="section-head">
        <div>
          <p className="eyebrow">Livraison numerique</p>
          <h2>Transformer les paiements confirmes en services livres vite.</h2>
        </div>
        <p>
          File interne pour livrer CV, lettres, packs ONG et preparations entretien sans exposer
          les donnees personnelles dans les vues publiques.
        </p>
      </div>

      <div className="grid gap-4 md:grid-cols-3">
        <Metric label="A livrer" value={overview.readyToDeliver} icon={PackageCheck} />
        <Metric label="Revenu a servir" value={`${formatFcfa(overview.targetRevenueFcfa)} FCFA`} icon={CheckCircle2} />
        <Metric label="Delai moyen cible" value={overview.averageTargetHours ? `${overview.averageTargetHours}h` : "0h"} icon={Clock3} />
      </div>

      <div className="mt-4 grid gap-4 lg:grid-cols-[1.15fr_0.85fr]">
        <div className="rounded-xl border border-border bg-white p-4 shadow-sm">
          <div className="flex items-center gap-2">
            <FileCheck2 size={17} className="text-primary" />
            <h3 className="text-sm font-black text-foreground">Commandes pretes a livrer</h3>
          </div>
          <div className="mt-3 grid gap-2">
            {overview.queue.length > 0 ? overview.queue.map((item) => (
              <article key={item.id} className="rounded-xl border border-border bg-muted/30 p-3">
                <div className="flex items-start justify-between gap-3">
                  <div className="min-w-0">
                    <p className="truncate text-sm font-black text-foreground">{item.serviceName}</p>
                    <p className="mt-1 text-[11px] font-bold uppercase tracking-wide text-muted-foreground">
                      {item.paidSignal === "pawapay_callback" ? "pawaPay confirme" : "preuve manuelle"} - {formatDate(item.submittedAt)}
                    </p>
                  </div>
                  <span className="shrink-0 rounded-full bg-emerald-50 px-2.5 py-1 text-[11px] font-black text-emerald-800">
                    {formatFcfa(item.amountFcfa)} FCFA
                  </span>
                </div>
                <div className="mt-3 grid gap-2 md:grid-cols-2">
                  <div className="rounded-lg border border-border bg-white p-3">
                    <p className="text-[11px] font-black uppercase tracking-wide text-muted-foreground">Livrables</p>
                    <ul className="mt-2 grid gap-1 text-xs font-semibold leading-relaxed text-muted-foreground">
                      {item.deliverables.map((deliverable) => <li key={deliverable}>{deliverable}</li>)}
                    </ul>
                  </div>
                  <div className="rounded-lg border border-border bg-white p-3">
                    <p className="text-[11px] font-black uppercase tracking-wide text-muted-foreground">Controle qualite</p>
                    <ul className="mt-2 grid gap-1 text-xs font-semibold leading-relaxed text-muted-foreground">
                      {item.qualityChecks.map((check) => <li key={check}>{check}</li>)}
                    </ul>
                  </div>
                </div>
              </article>
            )) : (
              <p className="text-xs font-semibold leading-relaxed text-muted-foreground">
                Aucune commande payee a livrer pour le moment. Les preuves Mobile Money et confirmations pawaPay alimenteront cette file.
              </p>
            )}
          </div>
        </div>

        <div className="rounded-xl border border-border bg-white p-4 shadow-sm">
          <div className="flex items-center gap-2">
            <Sparkles size={17} className="text-primary" />
            <h3 className="text-sm font-black text-foreground">Modeles de livraison</h3>
          </div>
          <div className="mt-3 grid gap-2">
            {overview.templates.map((template) => (
              <article key={template.serviceId} className="rounded-lg border border-border bg-muted/30 p-3">
                <div className="flex items-center justify-between gap-3">
                  <p className="text-xs font-black text-foreground">{template.title}</p>
                  <span className="rounded-full bg-white px-2 py-0.5 text-[11px] font-black text-primary">{template.targetHours}h</span>
                </div>
                <p className="mt-2 flex gap-2 text-xs font-semibold leading-relaxed text-muted-foreground">
                  <ShieldCheck size={13} className="mt-0.5 shrink-0 text-primary" />
                  Livraison tracee, utile et sans promesse d'embauche.
                </p>
              </article>
            ))}
          </div>
        </div>
      </div>
    </section>
  );
}
