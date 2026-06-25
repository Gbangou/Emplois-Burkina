"use client";

import { useState } from "react";
import { Loader2, Send } from "lucide-react";
import { useToast } from "./toaster";

type LeadKind = "alert" | "publish" | "sponsor" | "contact";

type LeadCaptureFormProps = {
  kind: LeadKind;
  submitLabel: string;
  interestPlaceholder?: string;
  messagePlaceholder?: string;
};

type FormState = "idle" | "loading" | "success";

export function LeadCaptureForm({
  kind,
  submitLabel,
  interestPlaceholder = "Besoin principal",
  messagePlaceholder = "Details utiles"
}: LeadCaptureFormProps) {
  const [state, setState] = useState<FormState>("idle");
  const { toast } = useToast();

  async function submit(formData: FormData) {
    setState("loading");

    const payload = {
      type: kind,
      name: String(formData.get("name") || "").trim(),
      email: String(formData.get("email") || "").trim(),
      phone: String(formData.get("phone") || "").trim(),
      query: String(formData.get("interest") || "").trim(),
      message: String(formData.get("message") || "").trim()
    };

    try {
      const res = await fetch("/api/leads", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(payload)
      });
      if (!res.ok) throw new Error();
      toast("Demande envoyée avec succès !", "success");
    } catch {
      try {
        const existing = JSON.parse(localStorage.getItem("jf_leads_offline") || "[]") as typeof payload[];
        existing.unshift({ ...payload, createdAt: new Date().toISOString() } as typeof payload & { createdAt: string });
        localStorage.setItem("jf_leads_offline", JSON.stringify(existing.slice(0, 50)));
      } catch { /* ignore */ }
      toast("Demande sauvegardée localement (mode hors-ligne)", "info");
    }
    setState("success");
  }

  if (state === "success") {
    return (
      <div
        className="lead-form items-center justify-center text-center"
        style={{ gridTemplateColumns: "1fr", minHeight: 220 }}
      >
        <div className="grid gap-3 place-items-center">
          <span className="flex items-center justify-center w-14 h-14 rounded-full" style={{ background: "rgba(18,132,73,0.12)" }}>
            <Send size={24} style={{ color: "var(--green)" }} />
          </span>
          <p className="font-black text-base" style={{ color: "var(--ink-strong)" }}>Demande reçue !</p>
          <p className="text-sm font-semibold leading-relaxed" style={{ color: "var(--muted)" }}>
            L'équipe Emplois Burkina traitera votre demande dans les 24h.
          </p>
          <button
            type="button"
            onClick={() => setState("idle")}
            className="text-sm font-black px-4 py-2 rounded-lg transition-colors"
            style={{ color: "var(--blue)", background: "#eef7fb", border: "1px solid #d6eaf2" }}
          >
            Nouvelle demande
          </button>
        </div>
      </div>
    );
  }

  return (
    <form action={submit} className="lead-form">
      <label>
        <span>Nom ou organisation</span>
        <input name="name" placeholder="Ex: Cabinet Faso Conseil" required />
      </label>
      <label>
        <span>Email professionnel</span>
        <input name="email" placeholder="contact@exemple.com" type="email" />
      </label>
      <label>
        <span>WhatsApp</span>
        <input name="phone" placeholder="+226 70 00 00 00" type="tel" />
      </label>
      <label>
        <span>{interestPlaceholder}</span>
        <input name="interest" placeholder="Annonce premium, shortlist, sponsor..." required />
      </label>
      <label className="lead-form__wide">
        <span>{messagePlaceholder}</span>
        <textarea
          name="message"
          placeholder="Poste, ville, délai, budget, nombre de profils recherchés…"
          rows={5}
        />
      </label>
      <button disabled={state === "loading"} type="submit">
        {state === "loading" ? <Loader2 size={16} className="animate-spin" /> : <Send size={16} />}
        {state === "loading" ? "Envoi en cours…" : submitLabel}
      </button>
    </form>
  );
}
