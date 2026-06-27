"use client";

import { useState } from "react";
import { CheckCircle2, Loader2 } from "lucide-react";

type MarkDeliveredButtonProps = {
  orderId: string;
};

export function MarkDeliveredButton({ orderId }: MarkDeliveredButtonProps) {
  const [state, setState] = useState<"idle" | "loading" | "done" | "error">("idle");

  async function markDelivered() {
    setState("loading");
    try {
      const res = await fetch(`/api/orders/${encodeURIComponent(orderId)}/delivery`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ note: "Livraison confirmee depuis la console operations." })
      });
      const data = await res.json() as { ok?: boolean };
      if (!res.ok || !data.ok) throw new Error("delivery_failed");
      setState("done");
      window.location.reload();
    } catch {
      setState("error");
    }
  }

  return (
    <button
      type="button"
      disabled={state === "loading" || state === "done"}
      onClick={markDelivered}
      className="inline-flex h-9 shrink-0 items-center justify-center gap-2 rounded-lg bg-primary px-3 text-xs font-black text-primary-foreground transition-transform hover:-translate-y-0.5 disabled:opacity-70"
    >
      {state === "loading" ? <Loader2 size={14} className="animate-spin" /> : <CheckCircle2 size={14} />}
      {state === "done" ? "Livre" : state === "error" ? "Reessayer" : "Marquer livre"}
    </button>
  );
}
