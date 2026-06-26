"use client";

import { useState } from "react";
import { CheckCircle, Loader2, WalletCards } from "lucide-react";
import type { ServiceProduct } from "@/lib/revenue";

type ServiceOrderCardProps = {
  service: ServiceProduct;
};

type OrderState = "idle" | "loading" | "success";

export function ServiceOrderCard({ service }: ServiceOrderCardProps) {
  const [state, setState] = useState<OrderState>("idle");
  const [orderId, setOrderId] = useState("");

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
      const data = await res.json() as { ok?: boolean; order?: { id?: string } };
      if (!res.ok || !data.ok) throw new Error("order_failed");
      setOrderId(data.order?.id || "");
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

  if (state === "success") {
    return (
      <div className="rounded-xl border border-emerald-200 bg-emerald-50 p-5">
        <CheckCircle size={22} className="text-emerald-700" />
        <h3 className="mt-4 text-lg font-black text-emerald-950">Commande creee</h3>
        <p className="mt-2 text-sm font-semibold leading-relaxed text-emerald-900/75">
          Reference {orderId || "enregistree"}. Le paiement Mobile Money sera finalise selon le canal configure.
        </p>
        <p className="mt-3 text-xs font-bold leading-relaxed text-emerald-900/70">
          Cette etape prepare l'automatisation paiement + livraison, sans bloquer l'acces gratuit aux offres.
        </p>
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
        Creez une commande traçable. Le paiement Mobile Money sera connecte au fournisseur de paiement choisi.
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
