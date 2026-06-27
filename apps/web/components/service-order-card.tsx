"use client";

import { useState } from "react";
import { CheckCircle, Copy, Loader2, Send, ShieldCheck, WalletCards } from "lucide-react";
import type { ServiceProduct } from "@/lib/revenue";

type ServiceOrderCardProps = {
  service: ServiceProduct;
};

type OrderState = "idle" | "loading" | "success" | "proof_loading" | "proof_sent";

type PaymentInstructions = {
  provider: string;
  accountLabel: string;
  accountNumber?: string;
  reference: string;
  amountFcfa: number;
  status: "ready" | "needs_configuration";
  steps: string[];
};

function formatFcfa(value: number) {
  return new Intl.NumberFormat("fr-FR").format(value);
}

export function ServiceOrderCard({ service }: ServiceOrderCardProps) {
  const [state, setState] = useState<OrderState>("idle");
  const [orderId, setOrderId] = useState("");
  const [payment, setPayment] = useState<PaymentInstructions | null>(null);

  async function submit(formData: FormData) {
    setState("loading");
    try {
      const res = await fetch("/api/orders", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          serviceId: service.id,
          name: String(formData.get("name") || ""),
          phone: String(formData.get("phone") || ""),
          email: String(formData.get("email") || ""),
          notes: String(formData.get("notes") || "")
        })
      });
      const data = await res.json() as { ok?: boolean; order?: { id?: string }; payment?: PaymentInstructions };
      if (!res.ok || !data.ok) throw new Error("order_failed");
      setOrderId(data.order?.id || "");
      setPayment(data.payment || null);
      setState("success");
      fetch("/api/analytics/events", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          type: "conversion_click",
          path: window.location.pathname,
          target: `/services?service=${service.id}#paiement`,
          source: `service_order:${service.id}`
        })
      }).catch(() => {});
    } catch {
      setState("idle");
    }
  }

  async function submitProof(formData: FormData) {
    if (!orderId) return;
    setState("proof_loading");
    try {
      const res = await fetch(`/api/orders/${encodeURIComponent(orderId)}/payment-proof`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          senderPhone: String(formData.get("senderPhone") || ""),
          transactionId: String(formData.get("transactionId") || ""),
          note: String(formData.get("note") || "")
        })
      });
      const data = await res.json() as { ok?: boolean };
      if (!res.ok || !data.ok) throw new Error("proof_failed");
      setState("proof_sent");
    } catch {
      setState("success");
    }
  }

  if (state === "success" || state === "proof_loading" || state === "proof_sent") {
    return (
      <div className="rounded-xl border border-emerald-200 bg-emerald-50 p-5">
        <div className="flex items-start justify-between gap-3">
          <CheckCircle size={22} className="text-emerald-700" />
          {payment?.status === "ready" ? (
            <span className="rounded-full bg-emerald-100 px-3 py-1 text-[11px] font-black uppercase tracking-wide text-emerald-800">
              {state === "proof_sent" ? "Paiement signale" : "Paiement pret"}
            </span>
          ) : (
            <span className="rounded-full bg-amber-100 px-3 py-1 text-[11px] font-black uppercase tracking-wide text-amber-800">
              Config a terminer
            </span>
          )}
        </div>
        <h3 className="mt-4 text-lg font-black text-emerald-950">Commande creee</h3>
        <p className="mt-2 text-sm font-semibold leading-relaxed text-emerald-900/75">
          Reference {payment?.reference || orderId || "enregistree"}. Votre demande est tracee pour le service {service.name}.
        </p>

        {payment && (
          <div className="mt-4 rounded-xl border border-emerald-200 bg-white/70 p-4">
            <div className="grid gap-3 sm:grid-cols-2">
              <div>
                <p className="text-[11px] font-black uppercase tracking-wide text-emerald-900/60">Montant</p>
                <p className="mt-1 text-lg font-black text-emerald-950">{formatFcfa(payment.amountFcfa)} FCFA</p>
              </div>
              <div>
                <p className="text-[11px] font-black uppercase tracking-wide text-emerald-900/60">Canal</p>
                <p className="mt-1 text-sm font-black text-emerald-950">{payment.provider}</p>
              </div>
              <div>
                <p className="text-[11px] font-black uppercase tracking-wide text-emerald-900/60">Compte</p>
                <p className="mt-1 text-sm font-black text-emerald-950">{payment.accountLabel}</p>
              </div>
              <div>
                <p className="text-[11px] font-black uppercase tracking-wide text-emerald-900/60">Numero</p>
                <p className="mt-1 text-sm font-black text-emerald-950">{payment.accountNumber || "A configurer"}</p>
              </div>
            </div>
            <div className="mt-4 grid gap-2">
              {payment.steps.map((step) => (
                <p key={step} className="flex gap-2 text-xs font-bold leading-relaxed text-emerald-900/75">
                  <ShieldCheck size={13} className="mt-0.5 shrink-0 text-emerald-700" />
                  {step}
                </p>
              ))}
            </div>
            {payment.accountNumber && (
              <>
                <button
                  type="button"
                  onClick={() => navigator.clipboard?.writeText(`${payment.accountNumber} - ${payment.reference}`).catch(() => {})}
                  className="mt-4 inline-flex h-10 w-full items-center justify-center gap-2 rounded-xl bg-emerald-700 px-4 text-sm font-black text-white transition-transform hover:-translate-y-0.5"
                >
                  <Copy size={15} />
                  Copier numero + reference
                </button>

                {state === "proof_sent" ? (
                  <div className="mt-4 rounded-xl border border-emerald-200 bg-emerald-100/70 p-4">
                    <p className="text-sm font-black text-emerald-950">Preuve recue</p>
                    <p className="mt-1 text-xs font-bold leading-relaxed text-emerald-900/75">
                      Votre paiement est signale. La commande passe dans la file de verification et de livraison.
                    </p>
                  </div>
                ) : (
                  <form action={submitProof} className="mt-4 rounded-xl border border-emerald-200 bg-white p-4" id="preuve-paiement">
                    <p className="text-sm font-black text-emerald-950">Signaler le paiement</p>
                    <p className="mt-1 text-xs font-bold leading-relaxed text-emerald-900/70">
                      Ajoutez le numero expediteur et l'identifiant de transaction pour accelerer la verification.
                    </p>
                    <div className="mt-3 grid gap-3 sm:grid-cols-2">
                      <label className="grid gap-1.5">
                        <span className="text-[11px] font-black uppercase tracking-wide text-emerald-900/60">Numero expediteur</span>
                        <input name="senderPhone" type="tel" required className="h-10 rounded-lg border border-emerald-200 bg-white px-3 text-sm font-semibold outline-none focus:border-emerald-700" />
                      </label>
                      <label className="grid gap-1.5">
                        <span className="text-[11px] font-black uppercase tracking-wide text-emerald-900/60">ID transaction</span>
                        <input name="transactionId" required className="h-10 rounded-lg border border-emerald-200 bg-white px-3 text-sm font-semibold outline-none focus:border-emerald-700" />
                      </label>
                      <label className="grid gap-1.5 sm:col-span-2">
                        <span className="text-[11px] font-black uppercase tracking-wide text-emerald-900/60">Note optionnelle</span>
                        <textarea name="note" rows={3} className="rounded-lg border border-emerald-200 bg-white px-3 py-2 text-sm font-semibold outline-none focus:border-emerald-700" />
                      </label>
                    </div>
                    <button
                      disabled={state === "proof_loading"}
                      className="mt-3 inline-flex h-10 w-full items-center justify-center gap-2 rounded-xl bg-emerald-950 px-4 text-sm font-black text-white transition-transform hover:-translate-y-0.5 disabled:opacity-70"
                    >
                      {state === "proof_loading" ? <Loader2 size={15} className="animate-spin" /> : <Send size={15} />}
                      {state === "proof_loading" ? "Envoi..." : "J'ai paye, envoyer la preuve"}
                    </button>
                  </form>
                )}
              </>
            )}
          </div>
        )}
      </div>
    );
  }

  return (
    <form action={submit} className="rounded-xl border border-border bg-white p-5 shadow-sm" id="paiement">
      <div className="flex items-start justify-between gap-3">
        <div>
          <p className="text-xs font-black uppercase tracking-widest text-primary">Commande service</p>
          <h3 className="mt-2 text-xl font-black text-foreground">{service.name}</h3>
          <p className="mt-1 text-2xl font-black text-primary">{service.price}</p>
        </div>
        <WalletCards size={22} className="text-primary" />
      </div>
      <p className="mt-3 text-sm font-semibold leading-relaxed text-muted-foreground">
        Creez une commande traçable. Les instructions Mobile Money s'affichent apres validation si le compte de paiement est configure.
      </p>

      <div className="mt-5 grid gap-3 sm:grid-cols-2">
        <label className="grid gap-1.5">
          <span className="text-xs font-black uppercase tracking-wide text-muted-foreground">Nom</span>
          <input name="name" required className="h-10 rounded-lg border border-border bg-muted/20 px-3 text-sm font-semibold outline-none focus:border-primary" />
        </label>
        <label className="grid gap-1.5">
          <span className="text-xs font-black uppercase tracking-wide text-muted-foreground">WhatsApp</span>
          <input name="phone" required type="tel" placeholder="+226 70 00 00 00" className="h-10 rounded-lg border border-border bg-muted/20 px-3 text-sm font-semibold outline-none focus:border-primary" />
        </label>
        <label className="grid gap-1.5 sm:col-span-2">
          <span className="text-xs font-black uppercase tracking-wide text-muted-foreground">Email optionnel</span>
          <input name="email" type="email" className="h-10 rounded-lg border border-border bg-muted/20 px-3 text-sm font-semibold outline-none focus:border-primary" />
        </label>
        <label className="grid gap-1.5 sm:col-span-2">
          <span className="text-xs font-black uppercase tracking-wide text-muted-foreground">Besoin</span>
          <textarea name="notes" rows={4} placeholder="Lien de l'offre, secteur vise, delai souhaite..." className="rounded-lg border border-border bg-muted/20 px-3 py-2 text-sm font-semibold outline-none focus:border-primary" />
        </label>
      </div>

      <button
        disabled={state === "loading"}
        className="mt-4 inline-flex h-11 w-full items-center justify-center gap-2 rounded-xl bg-primary px-4 text-sm font-black text-primary-foreground transition-transform hover:-translate-y-0.5 disabled:opacity-70"
      >
        {state === "loading" ? <Loader2 size={16} className="animate-spin" /> : <WalletCards size={16} />}
        {state === "loading" ? "Creation..." : "Creer la commande"}
      </button>
    </form>
  );
}
