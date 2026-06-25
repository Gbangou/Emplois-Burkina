import { Mail, MapPin, MessageSquare, Phone } from "lucide-react";
import type { Metadata } from "next";
import { SiteHeader } from "@/components/site-header";
import { Card, CardContent } from "@/components/ui/card";
import { LeadCaptureForm } from "@/components/lead-capture-form";

export const metadata: Metadata = {
  title: "Contact",
  description: "Contactez l'équipe Emplois Burkina. Disponibles par WhatsApp, email ou formulaire de contact."
};

const CONTACTS = [
  {
    icon: MessageSquare,
    label: "WhatsApp",
    value: "+226 70 00 00 00",
    href: "https://wa.me/22670000000?text=Bonjour+Emplois Burkina,+j%27ai+une+question",
    desc: "Réponse rapide · Lun–Sam 8h–18h",
    color: "text-emerald-600",
    bg: "bg-emerald-50",
    border: "border-emerald-200"
  },
  {
    icon: Mail,
    label: "Email",
    value: "contact@emplois-burkina.com",
    href: "mailto:contact@emplois-burkina.com",
    desc: "Réponse sous 24h ouvrées",
    color: "text-blue-600",
    bg: "bg-blue-50",
    border: "border-blue-200"
  },
  {
    icon: MapPin,
    label: "Localisation",
    value: "Ouagadougou, Burkina Faso",
    href: "https://maps.google.com/?q=Ouagadougou,Burkina+Faso",
    desc: "Zone du Bois de Boulogne",
    color: "text-violet-600",
    bg: "bg-violet-50",
    border: "border-violet-200"
  }
];

const FAQS = [
  {
    q: "Comment publier une offre d'emploi ?",
    a: "Rendez-vous sur la page Recruteurs et remplissez le formulaire de demande. Notre équipe vous recontacte sous 24h pour finaliser la publication."
  },
  {
    q: "Les alertes WhatsApp sont-elles gratuites pour les candidats ?",
    a: "Oui, totalement. Vous vous inscrivez gratuitement et recevez les offres correspondant à votre profil directement sur WhatsApp."
  },
  {
    q: "Comment signaler une offre frauduleuse ?",
    a: "Utilisez le formulaire ci-dessous en indiquant l'URL de l'offre. Notre équipe traitera le signalement sous 12h."
  },
  {
    q: "Peut-on intégrer le flux d'offres dans une autre application ?",
    a: "Oui, nous proposons un flux RSS et une API REST. Contactez-nous pour obtenir les accès et la documentation."
  }
];

export default function ContactPage() {
  return (
    <div className="min-h-screen bg-background">
      <SiteHeader />

      {/* Hero */}
      <div className="border-b border-border bg-white">
        <div className="container py-10 lg:py-14">
          <p className="text-xs font-black text-primary uppercase tracking-widest mb-2 flex items-center gap-2">
            <span className="w-1.5 h-1.5 rounded-full bg-primary" />
            Contact
          </p>
          <h1 className="text-2xl lg:text-4xl font-black text-foreground mb-3">
            Une question ? On est là.
          </h1>
          <p className="text-muted-foreground font-semibold max-w-xl">
            Pour toute question sur les offres, les alertes, le recrutement ou les partenariats — notre équipe répond rapidement.
          </p>
        </div>
      </div>

      <div className="container py-12 grid gap-10 lg:grid-cols-[minmax(0,1fr)_380px]">

        {/* Left — form + FAQ */}
        <div className="grid gap-8">
          <Card>
            <CardContent className="p-6">
              <h2 className="font-black text-foreground text-lg mb-1">Envoyer un message</h2>
              <p className="text-muted-foreground text-sm font-semibold mb-5">
                Décrivez votre besoin en détail, nous vous répondons sous 24h.
              </p>
              <LeadCaptureForm
                kind="contact"
                submitLabel="Envoyer le message"
                interestPlaceholder="Sujet (recrutement, alerte, partenariat, bug...)"
                messagePlaceholder="Décrivez votre besoin ou votre question en détail"
              />
            </CardContent>
          </Card>

          {/* FAQ */}
          <div>
            <h2 className="font-black text-foreground text-lg mb-4">Questions fréquentes</h2>
            <div className="grid gap-3">
              {FAQS.map((faq) => (
                <details key={faq.q} className="group rounded-xl border border-border bg-white overflow-hidden">
                  <summary className="flex items-center justify-between gap-4 px-5 py-4 cursor-pointer font-black text-sm text-foreground list-none select-none hover:bg-muted/30 transition-colors">
                    {faq.q}
                    <span className="text-muted-foreground text-lg leading-none group-open:rotate-45 transition-transform">+</span>
                  </summary>
                  <div className="px-5 pb-4 text-sm text-muted-foreground font-semibold leading-relaxed border-t border-border pt-3">
                    {faq.a}
                  </div>
                </details>
              ))}
            </div>
          </div>
        </div>

        {/* Right — contact cards */}
        <div className="grid gap-4 self-start">
          {CONTACTS.map((c) => (
            <a
              key={c.label}
              href={c.href}
              target={c.href.startsWith("http") ? "_blank" : undefined}
              rel="noopener noreferrer"
              className={`flex items-center gap-4 p-5 rounded-2xl border transition-all hover:-translate-y-0.5 hover:shadow-md ${c.border} ${c.bg}`}
            >
              <div className={`w-12 h-12 rounded-xl flex items-center justify-center ${c.bg} shrink-0 shadow-sm`}
                style={{ border: `1px solid`, borderColor: "inherit" }}>
                <c.icon size={20} className={c.color} />
              </div>
              <div className="flex-1 min-w-0">
                <p className="text-xs font-black uppercase tracking-wide text-muted-foreground">{c.label}</p>
                <p className={`font-black text-sm mt-0.5 ${c.color}`}>{c.value}</p>
                <p className="text-xs text-muted-foreground font-semibold mt-0.5">{c.desc}</p>
              </div>
            </a>
          ))}

          {/* Response times */}
          <Card className="border-amber-200 bg-amber-50/40">
            <CardContent className="p-5 grid gap-3">
              <p className="font-black text-sm text-amber-900">Délais de réponse</p>
              <div className="grid gap-2">
                {[
                  ["WhatsApp", "Quelques heures"],
                  ["Email", "Sous 24h ouvrées"],
                  ["Formulaire", "Sous 24h ouvrées"],
                  ["Urgences", "Mentionnez «urgent»"]
                ].map(([ch, delay]) => (
                  <div key={ch} className="flex justify-between text-xs font-semibold">
                    <span className="text-muted-foreground">{ch}</span>
                    <span className="font-black text-amber-800">{delay}</span>
                  </div>
                ))}
              </div>
            </CardContent>
          </Card>

          {/* Social links */}
          <Card>
            <CardContent className="p-5">
              <p className="font-black text-sm text-foreground mb-3">Suivre Emplois Burkina</p>
              <div className="flex flex-wrap gap-2">
                {[
                  { label: "Facebook", href: "https://facebook.com/emplois-burkina" },
                  { label: "WhatsApp Channel", href: "https://whatsapp.com/channel/emplois-burkina" },
                  { label: "Telegram", href: "https://t.me/emplois-burkina" }
                ].map((s) => (
                  <a
                    key={s.label}
                    href={s.href}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="text-xs font-black px-3 py-1.5 rounded-lg border border-border hover:bg-muted transition-colors"
                  >
                    {s.label}
                  </a>
                ))}
              </div>
            </CardContent>
          </Card>
        </div>
      </div>
    </div>
  );
}
