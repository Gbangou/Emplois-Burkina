import Link from "next/link";
import type { Metadata } from "next";
import { AlertTriangle, CheckCircle2, Clock3, RefreshCw, ShieldCheck } from "lucide-react";
import { getPublicServiceOrderPaymentStatus } from "@/lib/service-orders";

export const metadata: Metadata = {
  title: "Retour paiement | Emplois Burkina",
  description: "Verification du statut de paiement d'une commande de service Emplois Burkina.",
  robots: {
    index: false,
    follow: false
  }
};

type PaymentReturnPageProps = {
  searchParams: Promise<{
    order?: string;
  }>;
};

function formatFcfa(value: number) {
  return new Intl.NumberFormat("fr-FR").format(value);
}

function getStatusView(status?: string) {
  if (status === "completed") {
    return {
      icon: CheckCircle2,
      label: "Paiement confirme",
      tone: "text-emerald-800 bg-emerald-50 border-emerald-200",
      copy: "La confirmation pawaPay a ete recue. La commande passe en verification finale et livraison."
    };
  }

  if (status === "failed") {
    return {
      icon: AlertTriangle,
      label: "Paiement non abouti",
      tone: "text-rose-800 bg-rose-50 border-rose-200",
      copy: "Le paiement n'a pas ete confirme. Vous pouvez relancer une commande ou essayer un autre wallet."
    };
  }

  if (status === "needs_attention") {
    return {
      icon: AlertTriangle,
      label: "Verification requise",
      tone: "text-amber-800 bg-amber-50 border-amber-200",
      copy: "Le statut demande une verification manuelle. Gardez votre SMS de paiement et la reference de commande."
    };
  }

  return {
    icon: Clock3,
    label: "Paiement en verification",
    tone: "text-sky-800 bg-sky-50 border-sky-200",
    copy: "Le paiement peut prendre quelques instants a remonter. Cette page affichera le dernier statut connu."
  };
}

export default async function PaymentReturnPage({ searchParams }: PaymentReturnPageProps) {
  const { order: orderId } = await searchParams;
  const order = await getPublicServiceOrderPaymentStatus(orderId);
  const statusView = getStatusView(order?.externalStatus);
  const StatusIcon = statusView.icon;

  return (
    <main className="min-h-screen bg-muted/30">
      <section className="section py-16">
        <div className="mx-auto max-w-2xl rounded-2xl border border-border bg-white p-6 shadow-sm md:p-8">
          <div className={`inline-flex items-center gap-2 rounded-full border px-3 py-1 text-xs font-black uppercase tracking-wide ${statusView.tone}`}>
            <StatusIcon size={15} />
            {statusView.label}
          </div>

          <h1 className="mt-5 text-3xl font-black tracking-tight text-foreground md:text-4xl">
            Retour de paiement
          </h1>
          <p className="mt-3 text-sm font-semibold leading-relaxed text-muted-foreground">
            {statusView.copy}
          </p>

          {order ? (
            <div className="mt-6 grid gap-3 rounded-xl border border-border bg-muted/30 p-4">
              <div className="flex items-center justify-between gap-4">
                <span className="text-xs font-black uppercase tracking-wide text-muted-foreground">Service</span>
                <span className="text-right text-sm font-black text-foreground">{order.serviceName}</span>
              </div>
              <div className="flex items-center justify-between gap-4">
                <span className="text-xs font-black uppercase tracking-wide text-muted-foreground">Montant</span>
                <span className="text-sm font-black text-primary">{formatFcfa(order.amountFcfa)} FCFA</span>
              </div>
              <div className="flex items-center justify-between gap-4">
                <span className="text-xs font-black uppercase tracking-wide text-muted-foreground">Reference</span>
                <span className="font-mono text-xs font-black text-foreground">{order.id.slice(0, 18).toUpperCase()}</span>
              </div>
              <div className="flex items-center justify-between gap-4">
                <span className="text-xs font-black uppercase tracking-wide text-muted-foreground">Derniere mise a jour</span>
                <span className="text-right text-xs font-bold text-muted-foreground">
                  {new Intl.DateTimeFormat("fr-FR", { dateStyle: "medium", timeStyle: "short" }).format(new Date(order.updatedAt))}
                </span>
              </div>
            </div>
          ) : (
            <div className="mt-6 rounded-xl border border-amber-200 bg-amber-50 p-4 text-sm font-bold leading-relaxed text-amber-900">
              Reference introuvable ou absente. Revenez au service commande et gardez votre preuve de paiement si le wallet a ete debite.
            </div>
          )}

          <div className="mt-6 grid gap-3 sm:grid-cols-2">
            <Link
              href="/services"
              className="inline-flex h-11 items-center justify-center gap-2 rounded-xl bg-primary px-4 text-sm font-black text-primary-foreground transition-transform hover:-translate-y-0.5"
            >
              <RefreshCw size={16} />
              Revenir aux services
            </Link>
            <Link
              href="/contact"
              className="inline-flex h-11 items-center justify-center gap-2 rounded-xl border border-border bg-white px-4 text-sm font-black text-foreground transition-transform hover:-translate-y-0.5"
            >
              <ShieldCheck size={16} />
              Contacter le support
            </Link>
          </div>
        </div>
      </section>
    </main>
  );
}
