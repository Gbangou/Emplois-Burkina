import type { Metadata } from "next";
import { SiteHeader } from "@/components/site-header";
import { ProfilClient } from "./profil-client";

export const metadata: Metadata = {
  title: "Mon profil — Emplois Burkina",
  description: "Vos offres sauvegardées, alertes actives et historique de candidatures."
};

export default function ProfilPage() {
  return (
    <div className="min-h-screen bg-background">
      <SiteHeader />
      <ProfilClient />
    </div>
  );
}
