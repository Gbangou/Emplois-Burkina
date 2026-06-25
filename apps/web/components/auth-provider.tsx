"use client";

import { useEffect, useState } from "react";

// Clerk n'est activé que si les vraies clés sont présentes
const CLERK_KEY = process.env.NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY ?? "";
const clerkEnabled = Boolean(CLERK_KEY && !CLERK_KEY.includes("REMPLACER") && CLERK_KEY.startsWith("pk_"));

type Props = { children: React.ReactNode };

export function AuthProvider({ children }: Props) {
  const [ClerkProvider, setClerkProvider] = useState<React.ComponentType<Props> | null>(null);

  useEffect(() => {
    if (!clerkEnabled) return;
    import("@clerk/nextjs").then((mod) => {
      setClerkProvider(() => mod.ClerkProvider as React.ComponentType<Props>);
    }).catch(() => {
      // Clerk unavailable — run without auth
    });
  }, []);

  if (!clerkEnabled || !ClerkProvider) {
    return <>{children}</>;
  }

  return <ClerkProvider>{children}</ClerkProvider>;
}
