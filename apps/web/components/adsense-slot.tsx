"use client";

import { useEffect } from "react";

type AdSenseSlotProps = {
  clientId?: string;
  slot?: string;
  label?: string;
  format?: "auto" | "rectangle" | "horizontal";
  className?: string;
};

const publicClient = process.env.NEXT_PUBLIC_ADSENSE_CLIENT || "";

declare global {
  interface Window {
    adsbygoogle?: unknown[];
  }
}

export function AdSenseSlot({ clientId, slot, label = "Annonce", format = "auto", className = "" }: AdSenseSlotProps) {
  const client = clientId || publicClient;
  const enabled = Boolean(client && slot);

  useEffect(() => {
    if (!enabled) return;
    try {
      window.adsbygoogle = window.adsbygoogle || [];
      window.adsbygoogle.push({});
    } catch {
      // Ad blockers or pending AdSense approval should not affect the app.
    }
  }, [enabled]);

  if (!enabled) return null;

  return (
    <aside
      aria-label={label}
      className={`not-prose overflow-hidden rounded-xl border border-border bg-white p-3 shadow-sm ${className}`}
    >
      <p className="mb-2 text-[10px] font-black uppercase tracking-widest text-muted-foreground">{label}</p>
      <ins
        className="adsbygoogle block"
        style={{ display: "block", minHeight: format === "horizontal" ? 90 : 250 }}
        data-ad-client={client}
        data-ad-slot={slot}
        data-ad-format={format === "rectangle" ? "rectangle" : "auto"}
        data-full-width-responsive="true"
      />
    </aside>
  );
}
