import type { Metadata } from "next";
import { SiteHeader } from "@/components/site-header";

export const metadata: Metadata = {
  title: "Politique de confidentialité",
  description: "Politique de confidentialité et protection des données personnelles — Emplois Burkina."
};

const SECTIONS = [
  {
    title: "1. Données collectées",
    content: `Emplois Burkina collecte uniquement les données nécessaires au fonctionnement de la plateforme :

• Données de contact (numéro WhatsApp, email) lorsque vous créez une alerte ou soumettez un formulaire
• Critères de recherche pour personnaliser les alertes (ville, secteur, mots-clés)
• Données techniques de navigation (logs serveur standards, sans tracking publicitaire)
• Signaux produit anonymes (pages vues, clics internes, formulaires envoyés) sans identifiant publicitaire

Nous ne collectons pas de données sensibles (santé, opinions politiques, religion).`
  },
  {
    title: "2. Utilisation des données",
    content: `Les données collectées sont utilisées exclusivement pour :

• Envoyer les alertes emploi correspondant à vos critères via WhatsApp ou email
• Permettre aux recruteurs de vous contacter si vous avez postulé
• Améliorer la pertinence des résultats de recherche
• Mesurer les pages qui créent le plus de valeur afin d'améliorer le service
• Détecter et prévenir les usages abusifs de la plateforme`
  },
  {
    title: "3. Partage des données",
    content: `Nous ne vendons jamais vos données personnelles. Elles peuvent être partagées avec :

• Les recruteurs uniquement si vous postulez explicitement à une offre
• Des prestataires techniques (hébergement, envoi de messages) sous contrat de confidentialité
• Les autorités légales en cas d'obligation légale`
  },
  {
    title: "4. Conservation des données",
    content: `• Alertes WhatsApp : conservées jusqu'à votre désinscription
• Leads recruteurs : 12 mois après la dernière interaction
• Logs techniques : 90 jours maximum
• Données de modération : 24 mois

Vous pouvez demander la suppression de vos données à tout moment.`
  },
  {
    title: "5. Vos droits",
    content: `Conformément à la réglementation applicable, vous disposez des droits suivants :

• Droit d'accès : obtenir une copie de vos données
• Droit de rectification : corriger des données inexactes
• Droit à l'effacement : supprimer vos données
• Droit d'opposition : vous opposer à certains traitements
• Droit à la portabilité : recevoir vos données dans un format lisible

Pour exercer ces droits, contactez-nous à contact@emplois-burkina.com.`
  },
  {
    title: "6. Cookies et traceurs",
    content: `Emplois Burkina utilise actuellement des cookies fonctionnels essentiels au fonctionnement du site (authentification, préférences de langue). Les publicités ou cookies publicitaires tiers ne doivent être activés qu'avec une information claire, une politique à jour et le respect des règles applicables.

Les favoris et alertes locales sont stockés dans votre navigateur (localStorage) et restent sur votre appareil.`
  },
  {
    title: "7. Scraping et sources de données",
    content: `Emplois Burkina collecte des offres d'emploi publiques depuis des sources web légitimes (sites officiels, RSS publics, plateformes partenaires). Cette collecte respecte les fichiers robots.txt de chaque source. Aucune donnée privée n'est collectée lors du scraping.

Les offres affichées incluent la source originale et un lien vers l'annonce officielle.`
  },
  {
    title: "8. Sécurité",
    content: `Nous mettons en place des mesures techniques appropriées pour protéger vos données :

• Connexions chiffrées (HTTPS)
• Accès restreint aux données personnelles
• Logs d'accès surveillés
• Pas de stockage de mots de passe en clair`
  },
  {
    title: "9. Contact",
    content: `Pour toute question relative à la protection de vos données personnelles :

Email : contact@emplois-burkina.com
WhatsApp : +226 70 00 00 00

Dernière mise à jour : juin 2025`
  }
];

export default function PrivacyPage() {
  return (
    <div className="min-h-screen bg-background">
      <SiteHeader />

      <div className="border-b border-border bg-white">
        <div className="container py-10">
          <p className="text-xs font-black text-primary uppercase tracking-widest mb-2">Légal</p>
          <h1 className="text-2xl lg:text-3xl font-black text-foreground mb-2">
            Politique de confidentialité
          </h1>
          <p className="text-muted-foreground font-semibold text-sm">
            Dernière mise à jour : juin 2025 · Emplois Burkina, Ouagadougou, Burkina Faso
          </p>
        </div>
      </div>

      <div className="container py-10">
        <div className="max-w-3xl grid gap-8">
          <div className="p-5 rounded-xl bg-emerald-50 border border-emerald-200">
            <p className="text-sm font-bold text-emerald-800 leading-relaxed">
              <strong className="font-black">Résumé :</strong> Emplois Burkina ne vend pas vos données, n'utilise pas de publicités ciblées et vous permet de vous désinscrire à tout moment. Nous collectons uniquement ce dont nous avons besoin pour vous envoyer des offres pertinentes.
            </p>
          </div>

          {SECTIONS.map((section) => (
            <div key={section.title} className="grid gap-3">
              <h2 className="text-base font-black text-foreground">{section.title}</h2>
              <div className="text-sm text-muted-foreground font-semibold leading-relaxed whitespace-pre-line">
                {section.content}
              </div>
              <div className="h-px bg-border" />
            </div>
          ))}

          <div className="flex gap-4 flex-wrap">
            <a href="/contact" className="text-sm font-black text-primary hover:underline">Nous contacter</a>
            <a href="/" className="text-sm font-black text-muted-foreground hover:text-foreground">Retour à l'accueil</a>
          </div>
        </div>
      </div>
    </div>
  );
}
