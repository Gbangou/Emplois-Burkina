import type { Metadata } from "next";
import { SiteHeader } from "@/components/site-header";
import { NewJobForm } from "./new-job-form";
import { CheckCircle, Clock, Shield, Zap } from "lucide-react";

export const metadata: Metadata = {
  title: "Publier une offre d'emploi",
  description: "Publiez votre offre d'emploi sur Emplois Burkina. Vérification rapide, diffusion WhatsApp et Facebook, paiement Mobile Money."
};

const STEPS = [
  { icon: CheckCircle, label: "Remplissez le formulaire", desc: "Poste, profil, délai, contact — 3 minutes." },
  { icon: Shield, label: "Vérification sous 24h", desc: "Notre équipe valide l'offre et vous contacte si besoin." },
  { icon: Zap, label: "Publication instantanée", desc: "Visible sur le catalogue, WhatsApp et Facebook." },
  { icon: Clock, label: "Suivi en temps réel", desc: "Vues, leads et candidatures dans votre espace." }
];

export default function NewJobPage() {
  return (
    <div className="min-h-screen bg-background">
      <SiteHeader />

      {/* Hero */}
      <div
        className="border-b border-border"
        style={{ background: "linear-gradient(135deg, #07171e 0%, #0a3d24 100%)" }}
      >
        <div className="container py-10 lg:py-14">
          <p className="text-xs font-black text-emerald-400 uppercase tracking-widest mb-2 flex items-center gap-2">
            <span className="w-1.5 h-1.5 rounded-full bg-emerald-400" />
            Espace recruteur
          </p>
          <h1 className="text-2xl lg:text-3xl font-black text-white mb-3">
            Publier une offre d'emploi
          </h1>
          <p className="text-white/65 font-semibold max-w-xl">
            Remplissez ce formulaire. Votre offre sera vérifiée puis diffusée sur le catalogue Emplois Burkina, WhatsApp et les réseaux sociaux.
          </p>

          {/* Process steps */}
          <div className="grid grid-cols-2 lg:grid-cols-4 gap-3 mt-8">
            {STEPS.map((step, i) => (
              <div key={step.label} className="flex items-start gap-3 p-3 rounded-xl bg-white/5 border border-white/10">
                <div className="w-7 h-7 rounded-lg flex items-center justify-center shrink-0 text-xs font-black text-white mt-0.5"
                  style={{ background: i === 2 ? "linear-gradient(135deg, #128449, #006fa3)" : "rgba(255,255,255,0.1)" }}>
                  {i + 1}
                </div>
                <div>
                  <p className="text-white text-xs font-black leading-snug">{step.label}</p>
                  <p className="text-white/50 text-xs font-semibold mt-0.5 leading-snug hidden lg:block">{step.desc}</p>
                </div>
              </div>
            ))}
          </div>
        </div>
      </div>

      <div className="container py-10 max-w-3xl">
        <NewJobForm />
      </div>
    </div>
  );
}
