import type { Metadata, Viewport } from "next";
import "./globals.css";
import { CommandPalette } from "@/components/command-palette";
import { MobileBottomDock } from "@/components/mobile-bottom-dock";
import { ScrollToTop } from "@/components/scroll-to-top";
import { Toaster } from "@/components/toaster";
import { AuthProvider } from "@/components/auth-provider";
import { RevenueAnalytics } from "@/components/revenue-analytics";

export const metadata: Metadata = {
  title: { default: "Emplois Burkina — Emploi & Recrutement au Burkina Faso", template: "%s | Emplois Burkina" },
  description: "Emplois Burkina centralise les offres d'emploi, concours, stages et alertes WhatsApp au Burkina Faso. Sources vérifiées, scraping automatique, diffusion multi-canal.",
  applicationName: "Emplois Burkina",
  metadataBase: new URL("https://emplois-burkina.com"),
  manifest: "/manifest.webmanifest",
  keywords: ["emploi burkina faso", "recrutement ouagadougou", "offres d'emploi", "concours burkina", "emplois-burkina"],
  openGraph: {
    title: "Emplois Burkina — Emploi au Burkina Faso",
    description: "Plateforme emploi moderne pour le Burkina Faso. Offres vérifiées, alertes WhatsApp, espace recruteur.",
    locale: "fr_BF",
    siteName: "Emplois Burkina",
    type: "website"
  },
  appleWebApp: { capable: true, statusBarStyle: "black-translucent", title: "Emplois Burkina" },
  robots: { index: true, follow: true }
};

export const viewport: Viewport = {
  themeColor: "#0f6b3d",
  width: "device-width",
  initialScale: 1,
  maximumScale: 5
};

export default function RootLayout({ children }: Readonly<{ children: React.ReactNode }>) {
  return (
    <AuthProvider>
      <html lang="fr-BF" className="scroll-smooth">
        <body className="antialiased">
          <Toaster>
            {children}
            <CommandPalette />
            <MobileBottomDock />
            <ScrollToTop />
            <RevenueAnalytics />
          </Toaster>
          <script
            dangerouslySetInnerHTML={{
              __html: `if('serviceWorker' in navigator){navigator.serviceWorker.register('/sw.js').catch(()=>{})}`
            }}
          />
        </body>
      </html>
    </AuthProvider>
  );
}
