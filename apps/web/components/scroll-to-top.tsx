"use client";

import { ArrowUp } from "lucide-react";
import { useEffect, useState } from "react";
import { cn } from "@/lib/utils";

export function ScrollToTop() {
  const [visible, setVisible] = useState(false);

  useEffect(() => {
    const handler = () => setVisible(window.scrollY > 400);
    window.addEventListener("scroll", handler, { passive: true });
    return () => window.removeEventListener("scroll", handler);
  }, []);

  return (
    <button
      onClick={() => window.scrollTo({ top: 0, behavior: "smooth" })}
      aria-label="Retour en haut"
      className={cn(
        "fixed right-4 z-30 w-10 h-10 rounded-full flex items-center justify-center text-white shadow-lg transition-all duration-300 hidden lg:flex",
        visible
          ? "opacity-100 translate-y-0 bottom-6"
          : "opacity-0 translate-y-4 bottom-6 pointer-events-none"
      )}
      style={{ background: "linear-gradient(135deg, #128449, #006fa3)" }}
    >
      <ArrowUp size={16} strokeWidth={2.5} />
    </button>
  );
}
