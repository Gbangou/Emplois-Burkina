import { FileSearch, LockKeyhole, Search, ShieldCheck, TrendingUp } from "lucide-react";
import type { Metadata } from "next";
import { CvAtsChecker } from "@/components/cv-ats-checker";
import { SiteHeader } from "@/components/site-header";

export const metadata: Metadata = {
  title: "Outils gratuits emploi - test CV ATS | Emplois Burkina",
  description:
    "Testez gratuitement votre CV ATS dans le navigateur. Diagnostic rapide, conseils de candidature et services optionnels pour postuler plus efficacement.",
  alternates: {
    canonical: "/outils"
  },
  openGraph: {
    title: "Test CV ATS gratuit - Emplois Burkina",
    description: "Analyse locale et gratuite de votre CV pour ameliorer vos candidatures.",
    url: "/outils",
    type: "website"
  }
};

const BENEFITS = [
  {
    icon: Search,
    title: "Trafic SEO utile",
    copy: "Un outil gratuit attire les recherches CV, ATS, lettre et entretien mieux qu'une page purement commerciale."
  },
  {
    icon: LockKeyhole,
    title: "Privacy-by-design",
    copy: "Le texte colle reste dans le navigateur. Aucun CV n'est envoye au serveur pour ce diagnostic rapide."
  },
  {
    icon: TrendingUp,
    title: "Conversion naturelle",
    copy: "Les candidats obtiennent une valeur immediate, puis peuvent commander un service s'ils veulent aller plus vite."
  }
];

const toolJsonLd = {
  "@context": "https://schema.org",
  "@type": "SoftwareApplication",
  name: "Test CV ATS Emplois Burkina",
  applicationCategory: "BusinessApplication",
  operatingSystem: "Web",
  offers: {
    "@type": "Offer",
    price: "0",
    priceCurrency: "XOF"
  },
  privacyPolicy: "https://emplois-burkina.com/privacy",
  url: "https://emplois-burkina.com/outils"
};

export default function ToolsPage() {
  return (
    <div className="min-h-screen bg-background">
      <SiteHeader />

      <section className="border-b border-border bg-white">
        <div className="container py-10 lg:py-14">
          <div className="grid gap-8 lg:grid-cols-[1.05fr_0.95fr] lg:items-end">
            <div>
              <div className="mb-3 flex items-center gap-2">
                <FileSearch size={17} className="text-primary" />
                <p className="text-xs font-black uppercase tracking-widest text-primary">Outils gratuits</p>
              </div>
              <h1 className="max-w-3xl text-3xl font-black leading-tight text-foreground lg:text-5xl">
                Un diagnostic CV ATS gratuit qui attire du trafic et convertit proprement.
              </h1>
              <p className="mt-4 max-w-2xl text-sm font-semibold leading-relaxed text-muted-foreground lg:text-base">
                L'utilisateur obtient une analyse immediate sans creer de compte. L'app gagne une page utile,
                partageable, indexable et naturellement reliee aux services payants optionnels.
              </p>
            </div>
            <div className="grid gap-3">
              {BENEFITS.map((benefit) => (
                <div key={benefit.title} className="flex gap-3 rounded-xl border border-border bg-muted/30 p-4">
                  <benefit.icon size={17} className="mt-0.5 shrink-0 text-primary" />
                  <div>
                    <p className="text-sm font-black text-foreground">{benefit.title}</p>
                    <p className="mt-0.5 text-xs font-semibold leading-relaxed text-muted-foreground">{benefit.copy}</p>
                  </div>
                </div>
              ))}
            </div>
          </div>
        </div>
      </section>

      <main className="container py-8">
        <CvAtsChecker />

        <section className="mt-6 rounded-xl border border-border bg-white p-5 shadow-sm">
          <div className="flex items-center gap-2">
            <ShieldCheck size={17} className="text-primary" />
            <h2 className="text-base font-black text-foreground">Conforme a la vision revenu + confiance</h2>
          </div>
          <div className="mt-4 grid gap-3 md:grid-cols-3">
            <p className="rounded-lg border border-border bg-muted/30 p-3 text-xs font-bold leading-relaxed text-muted-foreground">
              L'acces reste gratuit et utile, ce qui renforce la confiance et les partages naturels.
            </p>
            <p className="rounded-lg border border-border bg-muted/30 p-3 text-xs font-bold leading-relaxed text-muted-foreground">
              La conversion vers les services est mesuree par analytics internes, sans vendre les donnees personnelles.
            </p>
            <p className="rounded-lg border border-border bg-muted/30 p-3 text-xs font-bold leading-relaxed text-muted-foreground">
              La page peut recevoir AdSense plus tard si le trafic devient suffisant et conforme.
            </p>
          </div>
        </section>
      </main>

      <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: JSON.stringify(toolJsonLd) }} />
    </div>
  );
}
