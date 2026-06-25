"use client";

import { Briefcase, Building2, Menu, Search, X, Bell } from "lucide-react";
import { usePathname } from "next/navigation";
import { useEffect, useState } from "react";
import { cn } from "@/lib/utils";

const NAV = [
  { label: "Offres", href: "/jobs" },
  { label: "International", href: "/international" },
  { label: "Services", href: "/services" },
  { label: "Alertes", href: "/jobs#alertes" },
  { label: "Recruteurs", href: "/annonceurs" },
  { label: "Contact", href: "/contact" }
];

export function SiteHeader() {
  const pathname = usePathname();
  const [open, setOpen] = useState(false);
  const [scrolled, setScrolled] = useState(false);

  useEffect(() => {
    const handler = () => setScrolled(window.scrollY > 12);
    window.addEventListener("scroll", handler, { passive: true });
    handler();
    return () => window.removeEventListener("scroll", handler);
  }, []);

  // Close mobile menu on route change
  useEffect(() => { setOpen(false); }, [pathname]);

  const isHome = pathname === "/";

  return (
    <>
      <header className={cn(
        "fixed top-0 left-0 right-0 z-40 transition-all duration-300",
        scrolled || !isHome
          ? "bg-white/95 backdrop-blur-xl border-b border-border shadow-sm"
          : "bg-transparent border-b border-transparent"
      )}>
        <div className="container flex h-16 items-center justify-between gap-4">

          {/* Logo */}
          <a href="/" className="flex items-center gap-2.5 shrink-0 group">
            <span
              className="flex h-9 w-9 items-center justify-center rounded-xl font-black text-white text-sm shadow-sm transition-transform group-hover:scale-105"
              style={{ background: "linear-gradient(135deg, #128449, #006fa3)" }}
            >
              EB
            </span>
            <span className={cn(
              "font-black text-lg hidden sm:block transition-colors",
              scrolled || !isHome ? "text-foreground" : "text-white"
            )}>
              Emplois Burkina
            </span>
          </a>

          {/* Desktop nav */}
          <nav className="hidden lg:flex items-center gap-0.5">
            {NAV.map((item) => {
              const base = item.href.split("#")[0] ?? item.href;
              const active = pathname === item.href || (item.href !== "/" && pathname.startsWith(base));
              return (
                <a
                  key={item.href}
                  href={item.href}
                  className={cn(
                    "px-3 py-2 rounded-lg text-sm font-semibold transition-all",
                    active
                      ? "font-black bg-primary/10 text-primary"
                      : scrolled || !isHome
                        ? "text-muted-foreground hover:text-foreground hover:bg-accent"
                        : "text-white/85 hover:text-white hover:bg-white/10"
                  )}
                >
                  {item.label}
                </a>
              );
            })}
          </nav>

          {/* Right actions */}
          <div className="flex items-center gap-2">
            {/* Search Ctrl+K */}
            <button
              onClick={() => document.dispatchEvent(new KeyboardEvent("keydown", { key: "k", ctrlKey: true, bubbles: true }))}
              className={cn(
                "hidden sm:flex items-center gap-2 h-9 px-3 rounded-lg border text-sm font-semibold transition-all hover:scale-[1.02]",
                scrolled || !isHome
                  ? "border-border text-muted-foreground hover:bg-accent"
                  : "border-white/20 text-white/80 hover:bg-white/10"
              )}
            >
              <Search size={14} />
              <span className="hidden md:inline">Rechercher</span>
              <kbd className={cn(
                "hidden md:inline text-[10px] font-black px-1.5 py-0.5 rounded border",
                scrolled || !isHome ? "bg-muted border-border" : "bg-white/10 border-white/20"
              )}>⌘K</kbd>
            </button>

            {/* Alert bell (mobile) */}
            <button
              onClick={() => document.dispatchEvent(new CustomEvent("emplois-burkina:open-alert"))}
              className={cn(
                "sm:hidden flex items-center justify-center w-9 h-9 rounded-lg border transition-colors",
                scrolled || !isHome
                  ? "border-border text-muted-foreground hover:bg-accent"
                  : "border-white/20 text-white/80 hover:bg-white/10"
              )}
              aria-label="Alertes WhatsApp"
            >
              <Bell size={16} />
            </button>

            {/* Offres link */}
            <a
              href="/jobs"
              className={cn(
                "hidden sm:inline-flex items-center gap-1.5 h-9 px-3 rounded-lg border text-sm font-black transition-all hover:scale-[1.02]",
                scrolled || !isHome
                  ? "border-border text-foreground hover:bg-accent"
                  : "border-white/20 text-white hover:bg-white/10"
              )}
            >
              <Briefcase size={14} />
              <span className="hidden md:inline">Offres</span>
            </a>

            {/* Publier CTA */}
            <a
              href="/annonceurs"
              className="inline-flex items-center gap-1.5 h-9 px-4 rounded-xl text-sm font-black text-white transition-all hover:opacity-90 hover:-translate-y-px shadow-sm"
              style={{ background: "linear-gradient(135deg, #128449, #006fa3)" }}
            >
              <Building2 size={14} />
              <span className="hidden md:inline">Publier</span>
            </a>

            {/* Mobile burger */}
            <button
              onClick={() => setOpen(!open)}
              className={cn(
                "lg:hidden flex items-center justify-center w-9 h-9 rounded-lg border transition-colors",
                scrolled || !isHome
                  ? "border-border text-muted-foreground hover:bg-accent"
                  : "border-white/20 text-white/80 hover:bg-white/10"
              )}
              aria-label="Menu"
            >
              {open ? <X size={16} /> : <Menu size={16} />}
            </button>
          </div>
        </div>

        {/* Mobile nav drawer */}
        {open && (
          <div className="lg:hidden border-t border-border bg-white animate-slide-in">
            <nav className="container py-3 grid gap-0.5">
              {NAV.map((item) => {
                const active = pathname === item.href;
                return (
                  <a
                    key={item.href}
                    href={item.href}
                    className={cn(
                      "flex items-center gap-3 px-4 py-3 rounded-xl text-sm font-semibold transition-colors",
                      active ? "bg-primary/8 text-primary font-black" : "text-foreground hover:bg-accent"
                    )}
                  >
                    {item.label}
                  </a>
                );
              })}

              <div className="pt-2 border-t border-border mt-2 grid gap-2">
                <a href="/profil" className="flex items-center gap-2 h-10 px-4 rounded-xl border border-border text-sm font-black text-foreground hover:bg-accent">
                  Mon profil
                </a>
                <a href="/recruteur" className="flex items-center gap-2 h-10 px-4 rounded-xl border border-border text-sm font-black text-foreground hover:bg-accent">
                  Espace recruteur
                </a>
                <a
                  href="/annonceurs"
                  className="flex items-center gap-2 h-10 px-4 rounded-xl text-sm font-black text-white"
                  style={{ background: "linear-gradient(135deg, #128449, #006fa3)" }}
                >
                  <Building2 size={14} /> Publier une annonce
                </a>
              </div>
            </nav>
          </div>
        )}
      </header>

      {/* Spacer to compensate for fixed header */}
      <div className="h-16" />
    </>
  );
}
