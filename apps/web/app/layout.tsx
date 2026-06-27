import type { Metadata, Viewport } from "next";
import "./globals.css";
import { CommandPalette } from "@/components/command-palette";
import { MobileBottomDock } from "@/components/mobile-bottom-dock";
import { ScrollToTop } from "@/components/scroll-to-top";
import { Toaster } from "@/components/toaster";
import { AuthProvider } from "@/components/auth-provider";
import { RevenueAnalytics } from "@/components/revenue-analytics";
import { AdSenseScript } from "@/components/adsense-script";
import { PwaInstallPrompt } from "@/components/pwa-install-prompt";

export const metadata: Metadata = {
  title: { default: "Emplois Burkina — Emploi & Recrutement au Burkina Faso", template: "%s | Emplois Burkina" },
  description: "Emplois Burkina centralise les offres d'emploi, concours, stages et alertes WhatsApp au Burkina Faso. Sources vérifiées, scraping automatique, diffusion multi-canal.",
  applicationName: "Emplois Burkina",
  metadataBase: new URL("https://emplois-burkina.com"),
  manifest: "/manifest.webmanifest",
  alternates: {
    canonical: "/",
    types: {
      "application/rss+xml": "/feed.xml",
      "application/feed+json": "/feed.json",
      "application/opensearchdescription+xml": "/opensearch.xml",
      "text/plain": "/llms.txt"
    }
  },
  keywords: ["emploi burkina faso", "recrutement ouagadougou", "offres d'emploi", "concours burkina", "emplois-burkina"],
  openGraph: {
    title: "Emplois Burkina — Emploi au Burkina Faso",
    description: "Plateforme emploi moderne pour le Burkina Faso. Offres vérifiées, alertes WhatsApp, espace recruteur.",
    locale: "fr_BF",
    siteName: "Emplois Burkina",
    type: "website",
    images: [{ url: "/opengraph-image", width: 1200, height: 630, alt: "Emplois Burkina" }]
  },
  twitter: {
    card: "summary_large_image",
    title: "Emplois Burkina — Emploi au Burkina Faso",
    description: "Offres verifiees, concours, ONG, remote et guides candidats au Burkina Faso.",
    images: ["/opengraph-image"]
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

const siteJsonLd = {
  "@context": "https://schema.org",
  "@graph": [
    {
      "@type": "Organization",
      "@id": "https://emplois-burkina.com/#organization",
      name: "Emplois Burkina",
      url: "https://emplois-burkina.com",
      logo: "https://emplois-burkina.com/icon-512.png",
      sameAs: []
    },
    {
      "@type": "WebSite",
      "@id": "https://emplois-burkina.com/#website",
      url: "https://emplois-burkina.com",
      name: "Emplois Burkina",
      publisher: { "@id": "https://emplois-burkina.com/#organization" },
      inLanguage: "fr-BF",
      potentialAction: {
        "@type": "SearchAction",
        target: "https://emplois-burkina.com/jobs?q={search_term_string}",
        "query-input": "required name=search_term_string"
      }
    }
  ]
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
            <PwaInstallPrompt />
          </Toaster>
          <script
            dangerouslySetInnerHTML={{
              __html: `if('serviceWorker' in navigator){navigator.serviceWorker.register('/sw.js').catch(()=>{})}`
            }}
          />
          <script
            type="application/ld+json"
            dangerouslySetInnerHTML={{ __html: JSON.stringify(siteJsonLd) }}
          />
          <AdSenseScript />
        </body>
      </html>
    </AuthProvider>
  );
}
