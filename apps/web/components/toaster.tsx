"use client";

import { createContext, useCallback, useContext, useEffect, useRef, useState } from "react";
import { CheckCircle, Info, X, XCircle } from "lucide-react";

type ToastType = "success" | "error" | "info";

type Toast = {
  id: string;
  message: string;
  type: ToastType;
};

type ToastCtx = {
  toast: (message: string, type?: ToastType) => void;
};

export const ToastContext = createContext<ToastCtx>({ toast: () => {} });

export function useToast() {
  return useContext(ToastContext);
}

const ICONS = {
  success: CheckCircle,
  error: XCircle,
  info: Info
};

const COLORS = {
  success: { bg: "#e6f7ef", border: "#d5ecdf", icon: "var(--green-deep)", text: "var(--green-deep)" },
  error: { bg: "#fff1ef", border: "#f3c2bc", icon: "var(--red)", text: "var(--red)" },
  info: { bg: "#eef7fb", border: "#d6eaf2", icon: "var(--blue)", text: "var(--blue)" }
};

function ToastItem({ toast, onRemove }: { toast: Toast; onRemove: (id: string) => void }) {
  const colors = COLORS[toast.type];
  const Icon = ICONS[toast.type];

  useEffect(() => {
    const t = setTimeout(() => onRemove(toast.id), 4500);
    return () => clearTimeout(t);
  }, [toast.id, onRemove]);

  return (
    <div
      role="alert"
      className="flex items-center gap-3 px-4 py-3 rounded-xl shadow-lg text-sm font-bold animate-slide-in"
      style={{
        background: colors.bg,
        border: `1px solid ${colors.border}`,
        color: colors.text,
        minWidth: 280,
        maxWidth: 380,
        boxShadow: "0 12px 32px rgba(16,37,47,0.14)"
      }}
    >
      <Icon size={18} style={{ color: colors.icon, flexShrink: 0 }} />
      <span className="flex-1">{toast.message}</span>
      <button
        onClick={() => onRemove(toast.id)}
        className="opacity-60 hover:opacity-100 transition-opacity"
        aria-label="Fermer"
      >
        <X size={14} />
      </button>
    </div>
  );
}

export function Toaster({ children }: { children?: React.ReactNode }) {
  const [toasts, setToasts] = useState<Toast[]>([]);
  const counter = useRef(0);

  const toast = useCallback((message: string, type: ToastType = "info") => {
    const id = String(++counter.current);
    setToasts((prev) => [...prev, { id, message, type }]);
  }, []);

  const remove = useCallback((id: string) => {
    setToasts((prev) => prev.filter((t) => t.id !== id));
  }, []);

  return (
    <ToastContext.Provider value={{ toast }}>
      {children}
      <div
        className="fixed bottom-20 right-4 z-50 flex flex-col gap-2 lg:bottom-4"
        aria-live="polite"
      >
        {toasts.map((t) => (
          <ToastItem key={t.id} toast={t} onRemove={remove} />
        ))}
      </div>
    </ToastContext.Provider>
  );
}
