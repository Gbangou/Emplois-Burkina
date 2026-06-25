"use client";

import { useEffect, useRef, useState } from "react";
import { Bell, CheckCircle, Loader2, MapPin, X } from "lucide-react";

type AlertModalProps = {
  open: boolean;
  onClose: () => void;
  defaultQuery?: string;
  defaultCity?: string;
};

const CITIES = [
  "Ouagadougou", "Bobo-Dioulasso", "Koudougou", "Banfora", "Ouahigouya",
  "Pouytenga", "Kaya", "Tenkodogo", "Fada N'Gourma", "Dédougou"
];

const CATEGORIES = [
  "Informatique / Tech", "Administration / Gestion", "Finance / Comptabilité",
  "Education / Formation", "Santé", "ONG / Humanitaire", "BTP / Génie Civil",
  "Commerce / Vente", "Agriculture / Agronomie", "Mines / Géologie", "Droit / Juridique"
];

export function AlertModal({ open, onClose, defaultQuery = "", defaultCity = "" }: AlertModalProps) {
  const [step, setStep] = useState<"form" | "success">("form");
  const [loading, setLoading] = useState(false);
  const [phone, setPhone] = useState("");
  const [query, setQuery] = useState(defaultQuery);
  const [city, setCity] = useState(defaultCity);
  const [category, setCategory] = useState("");
  const overlayRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    if (!open) { setStep("form"); setLoading(false); }
    if (open) setQuery(defaultQuery);
  }, [open, defaultQuery]);

  useEffect(() => {
    const handler = (e: KeyboardEvent) => { if (e.key === "Escape") onClose(); };
    if (open) document.addEventListener("keydown", handler);
    return () => document.removeEventListener("keydown", handler);
  }, [open, onClose]);

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    if (!phone.trim()) return;
    setLoading(true);
    try {
      await fetch("/api/leads", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          type: "whatsapp_alert",
          phone: phone.trim(),
          query: query.trim(),
          city: city.trim(),
          category: category.trim()
        })
      });
      setStep("success");
    } catch {
      setStep("success");
    }
    setLoading(false);
  }

  if (!open) return null;

  return (
    <div
      ref={overlayRef}
      className="fixed inset-0 z-50 flex items-end sm:items-center justify-center sm:px-4"
      style={{ background: "rgba(7,23,30,0.52)", backdropFilter: "blur(8px)" }}
      onClick={(e) => { if (e.target === overlayRef.current) onClose(); }}
    >
      <div
        className="w-full sm:max-w-md rounded-t-2xl sm:rounded-2xl overflow-hidden"
        style={{
          background: "var(--surface)",
          border: "1px solid var(--line-strong)",
          boxShadow: "var(--shadow-lg)"
        }}
      >
        {/* Header */}
        <div
          className="flex items-center justify-between px-5 py-4"
          style={{
            background: "linear-gradient(135deg, var(--green-deep), var(--blue))",
            color: "#fff"
          }}
        >
          <div className="flex items-center gap-3">
            <span className="flex items-center justify-center w-9 h-9 rounded-xl" style={{ background: "rgba(255,255,255,0.18)" }}>
              <Bell size={18} />
            </span>
            <div>
              <p className="font-black text-base leading-tight">Alertes WhatsApp</p>
              <p className="text-xs font-semibold opacity-75">Recevez les offres qui vous correspondent</p>
            </div>
          </div>
          <button
            onClick={onClose}
            className="w-8 h-8 rounded-full flex items-center justify-center transition-colors"
            style={{ background: "rgba(255,255,255,0.12)" }}
            aria-label="Fermer"
          >
            <X size={16} />
          </button>
        </div>

        {step === "form" ? (
          <form onSubmit={handleSubmit} className="p-5 grid gap-4">
            <p className="text-sm font-semibold leading-relaxed" style={{ color: "var(--muted)" }}>
              Renseignez vos préférences et recevez les nouvelles offres directement sur WhatsApp, dès leur publication.
            </p>

            <label className="grid gap-1.5">
              <span className="text-xs font-black uppercase tracking-wide" style={{ color: "var(--muted)" }}>
                Numéro WhatsApp *
              </span>
              <input
                type="tel"
                value={phone}
                onChange={(e) => setPhone(e.target.value)}
                placeholder="+226 70 00 00 00"
                required
                className="w-full px-3 py-2.5 rounded-lg text-sm font-semibold border outline-none transition-all"
                style={{
                  background: "var(--bg)",
                  border: "1px solid var(--line)",
                  color: "var(--ink)"
                }}
                onFocus={(e) => { e.target.style.borderColor = "var(--cyan)"; e.target.style.boxShadow = "var(--focus)"; }}
                onBlur={(e) => { e.target.style.borderColor = "var(--line)"; e.target.style.boxShadow = "none"; }}
              />
            </label>

            <div className="grid grid-cols-2 gap-3">
              <label className="grid gap-1.5">
                <span className="text-xs font-black uppercase tracking-wide" style={{ color: "var(--muted)" }}>
                  Métier / Mots-clés
                </span>
                <input
                  type="text"
                  value={query}
                  onChange={(e) => setQuery(e.target.value)}
                  placeholder="ex: comptable, ONG…"
                  className="w-full px-3 py-2.5 rounded-lg text-sm font-semibold border outline-none transition-all"
                  style={{ background: "var(--bg)", border: "1px solid var(--line)", color: "var(--ink)" }}
                  onFocus={(e) => { e.target.style.borderColor = "var(--cyan)"; }}
                  onBlur={(e) => { e.target.style.borderColor = "var(--line)"; }}
                />
              </label>

              <label className="grid gap-1.5">
                <span className="text-xs font-black uppercase tracking-wide flex items-center gap-1" style={{ color: "var(--muted)" }}>
                  <MapPin size={10} /> Ville
                </span>
                <select
                  value={city}
                  onChange={(e) => setCity(e.target.value)}
                  className="w-full px-3 py-2.5 rounded-lg text-sm font-semibold border outline-none transition-all"
                  style={{ background: "var(--bg)", border: "1px solid var(--line)", color: city ? "var(--ink)" : "var(--muted)" }}
                >
                  <option value="">Toutes</option>
                  {CITIES.map((c) => <option key={c} value={c}>{c}</option>)}
                </select>
              </label>
            </div>

            <label className="grid gap-1.5">
              <span className="text-xs font-black uppercase tracking-wide" style={{ color: "var(--muted)" }}>
                Secteur
              </span>
              <select
                value={category}
                onChange={(e) => setCategory(e.target.value)}
                className="w-full px-3 py-2.5 rounded-lg text-sm font-semibold border outline-none"
                style={{ background: "var(--bg)", border: "1px solid var(--line)", color: category ? "var(--ink)" : "var(--muted)" }}
              >
                <option value="">Tous les secteurs</option>
                {CATEGORIES.map((c) => <option key={c} value={c}>{c}</option>)}
              </select>
            </label>

            <button
              type="submit"
              disabled={loading}
              className="flex items-center justify-center gap-2 w-full py-3 rounded-xl font-black text-sm text-white transition-all"
              style={{
                background: "linear-gradient(180deg, var(--green), var(--green-deep))",
                boxShadow: "0 8px 24px rgba(18,132,73,0.28)",
                opacity: loading ? 0.75 : 1
              }}
            >
              {loading ? <Loader2 size={16} className="animate-spin" /> : <Bell size={16} />}
              {loading ? "Inscription en cours…" : "Activer l'alerte WhatsApp"}
            </button>

            <p className="text-center text-xs font-semibold" style={{ color: "var(--muted)" }}>
              Gratuit · Se désinscrire à tout moment · Aucun spam
            </p>
          </form>
        ) : (
          <div className="p-8 flex flex-col items-center gap-4 text-center">
            <span className="flex items-center justify-center w-16 h-16 rounded-full" style={{ background: "rgba(18,132,73,0.12)" }}>
              <CheckCircle size={32} style={{ color: "var(--green)" }} />
            </span>
            <div>
              <p className="font-black text-lg" style={{ color: "var(--ink-strong)" }}>Alerte activée !</p>
              <p className="text-sm font-semibold mt-1" style={{ color: "var(--muted)" }}>
                Vous recevrez les prochaines offres correspondantes sur WhatsApp.
              </p>
            </div>
            <button
              onClick={onClose}
              className="px-5 py-2.5 rounded-xl font-black text-sm text-white"
              style={{ background: "linear-gradient(180deg, var(--green), var(--green-deep))" }}
            >
              Parfait, merci !
            </button>
          </div>
        )}
      </div>
    </div>
  );
}
