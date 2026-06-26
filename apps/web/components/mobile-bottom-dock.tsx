"use client";

import { Bell, Briefcase, Home, Search, WalletCards } from "lucide-react";
import { usePathname } from "next/navigation";
import { useEffect, useState } from "react";
import { AlertModal } from "./alert-modal";
import { cn } from "@/lib/utils";

type Tab =
  | { label: string; href: string; icon: React.ElementType; action?: never }
  | { label: string; href: null; icon: React.ElementType; action: string };

const TABS: Tab[] = [
  { label: "Accueil", href: "/", icon: Home },
  { label: "Offres", href: "/jobs", icon: Briefcase },
  { label: "Alertes", href: "/alertes", icon: Bell },
  { label: "Chercher", href: null, icon: Search, action: "search" },
  { label: "Services", href: "/services", icon: WalletCards }
];

export function MobileBottomDock() {
  const pathname = usePathname();
  const [alertOpen, setAlertOpen] = useState(false);
  const [visible, setVisible] = useState(true);
  const [lastY, setLastY] = useState(0);

  // Auto-hide on scroll down, show on scroll up
  useEffect(() => {
    const handler = () => {
      const y = window.scrollY;
      if (y < 60) { setVisible(true); setLastY(y); return; }
      setVisible(y < lastY);
      setLastY(y);
    };
    window.addEventListener("scroll", handler, { passive: true });
    return () => window.removeEventListener("scroll", handler);
  }, [lastY]);

  // Listen for custom alert open event from header bell
  useEffect(() => {
    const handler = () => setAlertOpen(true);
    document.addEventListener("emplois-burkina:open-alert", handler);
    return () => document.removeEventListener("emplois-burkina:open-alert", handler);
  }, []);

  function handleAction(action: string) {
    if (action === "search") {
      document.dispatchEvent(new KeyboardEvent("keydown", { key: "k", ctrlKey: true, bubbles: true }));
    }
    if (action === "alert") setAlertOpen(true);
  }

  return (
    <>
      <nav
        aria-label="Navigation mobile"
        className={cn(
          "fixed bottom-0 left-0 right-0 z-40 lg:hidden transition-transform duration-300",
          visible ? "translate-y-0" : "translate-y-full"
        )}
        style={{
          background: "rgba(255,255,255,0.96)",
          backdropFilter: "blur(20px) saturate(1.6)",
          borderTop: "1px solid hsl(var(--border))",
          paddingBottom: "env(safe-area-inset-bottom, 0px)"
        }}
      >
        <div className="flex items-stretch h-16">
          {TABS.map((tab) => {
            const isActive = tab.href ? pathname === tab.href || (tab.href !== "/" && pathname.startsWith(tab.href)) : false;
            const isAlert = tab.action === "alert";

            if (isAlert) {
              return (
                <a
                  key={tab.label}
                  href={tab.href || "/alertes"}
                  className="flex-1 flex flex-col items-center justify-center gap-1 relative"
                  aria-label={tab.label}
                  aria-current={isActive ? "page" : undefined}
                >
                  {/* Elevated alert button */}
                  <span
                    className="flex items-center justify-center w-12 h-12 rounded-2xl shadow-lg -mt-5 transition-transform active:scale-95"
                    style={{
                      background: "linear-gradient(135deg, #128449, #006fa3)",
                      boxShadow: "0 4px 20px rgba(18,132,73,0.4)"
                    }}
                  >
                    <Bell size={20} className="text-white" strokeWidth={2.2} />
                  </span>
                  <span className="text-[9px] font-black tracking-wide text-muted-foreground mt-0.5">{tab.label}</span>
                </a>
              );
            }

            const Tag = tab.href ? "a" : "button";
            const tagProps = tab.href
              ? { href: tab.href }
              : { type: "button" as const, onClick: () => tab.action && handleAction(tab.action) };

            return (
              <Tag
                key={tab.label}
                {...tagProps}
                aria-label={tab.label}
                aria-current={isActive ? "page" : undefined}
                className="flex-1 flex flex-col items-center justify-center gap-1 transition-colors active:bg-accent/50"
              >
                <span
                  className={cn(
                    "flex items-center justify-center w-10 h-7 rounded-xl transition-all",
                    isActive ? "bg-primary/10" : ""
                  )}
                >
                  <tab.icon
                    size={20}
                    strokeWidth={isActive ? 2.5 : 1.8}
                    className={isActive ? "text-primary" : "text-muted-foreground"}
                  />
                </span>
                <span className={cn(
                  "text-[9px] font-black tracking-wide",
                  isActive ? "text-primary" : "text-muted-foreground"
                )}>
                  {tab.label}
                </span>
              </Tag>
            );
          })}
        </div>
      </nav>

      <AlertModal open={alertOpen} onClose={() => setAlertOpen(false)} />
    </>
  );
}
