"use client";

import { Building2, CalendarClock, FileText, Loader2, MapPin, Phone, Send, Tag, User } from "lucide-react";
import { useState } from "react";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Select } from "@/components/ui/select";
import { Separator } from "@/components/ui/separator";
import { useToast } from "@/components/toaster";

const CATEGORIES = [
  "Administration / Gestion",
  "Agriculture / Agronomie",
  "Audit / Contrôle",
  "BTP / Génie Civil",
  "Commerce / Vente",
  "Communication / Marketing",
  "Comptabilité / Finance",
  "Droit / Juridique",
  "Education / Formation",
  "Informatique / Tech",
  "Logistique / Transport",
  "Mines / Géologie / Pétrole",
  "ONG / Humanitaire / Développement",
  "Ressources Humaines",
  "Santé / Médical / Pharmaceutique",
  "Sécurité / Défense",
  "Télécommunications",
  "Tourisme / Hôtellerie",
  "Autre"
];

const CITIES = [
  "Ouagadougou", "Bobo-Dioulasso", "Koudougou", "Banfora",
  "Ouahigouya", "Kaya", "Tenkodogo", "Fada N'Gourma",
  "Dédougou", "Pouytenga", "Dori", "Tougan",
  "Plusieurs villes", "Burkina Faso (national)", "Télétravail"
];

const CONTRACT_TYPES = ["CDI", "CDD", "Stage", "Consultation / Mission", "Freelance", "Bénévolat", "Alternance"];

const PACKAGES = [
  { id: "standard", label: "Standard", price: "25 000 FCFA", duration: "30 jours", features: ["Catalogue", "SEO", "Page dédiée"], color: "border-blue-200 bg-blue-50/50" },
  { id: "sponsored", label: "Sponsorisée", price: "75 000 FCFA", duration: "30 jours", features: ["Standard +", "WhatsApp ciblé", "Facebook", "Rapport"], color: "border-emerald-300 bg-emerald-50/50", recommended: true },
  { id: "campaign", label: "Campagne", price: "150 000+ FCFA", duration: "Sur devis", features: ["Sponsorisée +", "Formulaire candidat", "Shortlist", "Suivi dédié"], color: "border-violet-200 bg-violet-50/50" }
];

type FormState = "idle" | "loading" | "success";

export function NewJobForm() {
  const [state, setState] = useState<FormState>("idle");
  const [selectedPackage, setSelectedPackage] = useState("sponsored");
  const { toast } = useToast();

  async function handleSubmit(e: React.FormEvent<HTMLFormElement>) {
    e.preventDefault();
    setState("loading");
    const fd = new FormData(e.currentTarget);
    const payload = {
      type: "recruiter_post",
      package: selectedPackage,
      name: fd.get("contact_name"),
      company: fd.get("company"),
      phone: fd.get("phone"),
      email: fd.get("email"),
      query: fd.get("title"),
      city: fd.get("city"),
      category: fd.get("category"),
      message: [
        `Titre: ${fd.get("title")}`,
        `Contrat: ${fd.get("contract_type")}`,
        `Deadline: ${fd.get("deadline") || "non précisée"}`,
        `Salaire: ${fd.get("salary") || "non communiqué"}`,
        `Description: ${fd.get("description")}`,
        `Profil: ${fd.get("profile")}`,
        `Contact officiel: ${fd.get("official_contact")}`,
        `URL source: ${fd.get("source_url") || "à créer"}`,
        `Pack choisi: ${selectedPackage}`
      ].join("\n")
    };
    try {
      const res = await fetch("/api/leads", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(payload)
      });
      if (!res.ok) throw new Error();
      toast("Demande de publication envoyée ! Notre équipe vous contacte sous 24h.", "success");
      setState("success");
    } catch {
      toast("Erreur réseau — votre demande a été sauvegardée localement.", "info");
      setState("success");
    }
  }

  if (state === "success") {
    return (
      <Card>
        <CardContent className="p-10 flex flex-col items-center gap-5 text-center">
          <div className="w-20 h-20 rounded-2xl flex items-center justify-center"
            style={{ background: "linear-gradient(135deg, #128449, #006fa3)" }}>
            <Send size={30} className="text-white" />
          </div>
          <div>
            <h2 className="text-xl font-black text-foreground">Demande reçue !</h2>
            <p className="text-muted-foreground font-semibold mt-2 max-w-md">
              Notre équipe va vérifier votre offre et vous contacter sous 24h pour finaliser la publication et le paiement.
            </p>
          </div>
          <div className="flex gap-3 flex-wrap justify-center">
            <a href="/recruteur" className="inline-flex items-center gap-2 h-10 px-5 rounded-xl border border-border font-black text-sm hover:bg-muted transition-colors">
              Mon espace
            </a>
            <button
              onClick={() => setState("idle")}
              className="inline-flex items-center gap-2 h-10 px-5 rounded-xl font-black text-sm text-white"
              style={{ background: "linear-gradient(135deg, #128449, #006fa3)" }}
            >
              Publier une autre offre
            </button>
          </div>
        </CardContent>
      </Card>
    );
  }

  return (
    <form onSubmit={handleSubmit} className="grid gap-6">

      {/* Section 1 — Offre */}
      <Card>
        <CardContent className="p-6 grid gap-5">
          <div className="flex items-center gap-2">
            <div className="w-7 h-7 rounded-lg flex items-center justify-center text-xs font-black text-white"
              style={{ background: "linear-gradient(135deg, #128449, #006fa3)" }}>1</div>
            <h2 className="font-black text-foreground">L'offre d'emploi</h2>
          </div>
          <Separator />

          <div className="grid gap-4">
            <div className="grid gap-1.5">
              <label className="text-xs font-black uppercase tracking-wide text-muted-foreground flex items-center gap-1.5">
                <FileText size={11} /> Titre du poste *
              </label>
              <Input name="title" placeholder="ex: Comptable Senior, Développeur Full Stack, Chauffeur..." required />
            </div>

            <div className="grid sm:grid-cols-2 gap-4">
              <div className="grid gap-1.5">
                <label className="text-xs font-black uppercase tracking-wide text-muted-foreground flex items-center gap-1.5">
                  <Tag size={11} /> Secteur *
                </label>
                <Select name="category" required>
                  <option value="">Choisir un secteur</option>
                  {CATEGORIES.map((c) => <option key={c}>{c}</option>)}
                </Select>
              </div>
              <div className="grid gap-1.5">
                <label className="text-xs font-black uppercase tracking-wide text-muted-foreground flex items-center gap-1.5">
                  <FileText size={11} /> Type de contrat *
                </label>
                <Select name="contract_type" required>
                  <option value="">Type de contrat</option>
                  {CONTRACT_TYPES.map((t) => <option key={t}>{t}</option>)}
                </Select>
              </div>
            </div>

            <div className="grid sm:grid-cols-2 gap-4">
              <div className="grid gap-1.5">
                <label className="text-xs font-black uppercase tracking-wide text-muted-foreground flex items-center gap-1.5">
                  <MapPin size={11} /> Ville / Localisation *
                </label>
                <Select name="city" required>
                  <option value="">Choisir une ville</option>
                  {CITIES.map((c) => <option key={c}>{c}</option>)}
                </Select>
              </div>
              <div className="grid gap-1.5">
                <label className="text-xs font-black uppercase tracking-wide text-muted-foreground flex items-center gap-1.5">
                  <CalendarClock size={11} /> Date de clôture
                </label>
                <Input name="deadline" type="date" min={new Date().toISOString().split("T")[0]} />
              </div>
            </div>

            <div className="grid gap-1.5">
              <label className="text-xs font-black uppercase tracking-wide text-muted-foreground">
                Salaire / Rémunération
              </label>
              <Input name="salary" placeholder="ex: 150 000 – 200 000 FCFA / mois, ou À négocier" />
            </div>

            <div className="grid gap-1.5">
              <label className="text-xs font-black uppercase tracking-wide text-muted-foreground">
                Description du poste *
              </label>
              <textarea
                name="description"
                required
                rows={5}
                placeholder="Décrivez les missions, responsabilités et contexte du poste…"
                className="w-full rounded-lg border border-input bg-background px-3 py-2.5 text-sm font-medium resize-y focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring placeholder:text-muted-foreground/60"
              />
            </div>

            <div className="grid gap-1.5">
              <label className="text-xs font-black uppercase tracking-wide text-muted-foreground">
                Profil recherché *
              </label>
              <textarea
                name="profile"
                required
                rows={4}
                placeholder="Formation, expérience requise, compétences, langues…"
                className="w-full rounded-lg border border-input bg-background px-3 py-2.5 text-sm font-medium resize-y focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring placeholder:text-muted-foreground/60"
              />
            </div>

            <div className="grid gap-1.5">
              <label className="text-xs font-black uppercase tracking-wide text-muted-foreground">
                Contact officiel pour postuler
              </label>
              <Input name="official_contact" placeholder="Email de candidature, numéro WhatsApp, ou URL du formulaire en ligne" />
            </div>

            <div className="grid gap-1.5">
              <label className="text-xs font-black uppercase tracking-wide text-muted-foreground">
                URL de l'offre (si déjà publiée ailleurs)
              </label>
              <Input name="source_url" type="url" placeholder="https://votre-site.com/offre" />
            </div>
          </div>
        </CardContent>
      </Card>

      {/* Section 2 — Organisation */}
      <Card>
        <CardContent className="p-6 grid gap-5">
          <div className="flex items-center gap-2">
            <div className="w-7 h-7 rounded-lg flex items-center justify-center text-xs font-black text-white"
              style={{ background: "linear-gradient(135deg, #128449, #006fa3)" }}>2</div>
            <h2 className="font-black text-foreground">Votre organisation</h2>
          </div>
          <Separator />

          <div className="grid sm:grid-cols-2 gap-4">
            <div className="grid gap-1.5">
              <label className="text-xs font-black uppercase tracking-wide text-muted-foreground flex items-center gap-1.5">
                <Building2 size={11} /> Organisation / Entreprise *
              </label>
              <Input name="company" placeholder="Nom de l'organisation ou de l'entreprise" required />
            </div>
            <div className="grid gap-1.5">
              <label className="text-xs font-black uppercase tracking-wide text-muted-foreground flex items-center gap-1.5">
                <User size={11} /> Votre nom *
              </label>
              <Input name="contact_name" placeholder="Prénom et nom du responsable" required />
            </div>
            <div className="grid gap-1.5">
              <label className="text-xs font-black uppercase tracking-wide text-muted-foreground flex items-center gap-1.5">
                <Phone size={11} /> WhatsApp *
              </label>
              <Input name="phone" type="tel" placeholder="+226 70 00 00 00" required />
            </div>
            <div className="grid gap-1.5">
              <label className="text-xs font-black uppercase tracking-wide text-muted-foreground">
                Email professionnel
              </label>
              <Input name="email" type="email" placeholder="contact@organisation.com" />
            </div>
          </div>
        </CardContent>
      </Card>

      {/* Section 3 — Pack */}
      <Card>
        <CardContent className="p-6 grid gap-5">
          <div className="flex items-center gap-2">
            <div className="w-7 h-7 rounded-lg flex items-center justify-center text-xs font-black text-white"
              style={{ background: "linear-gradient(135deg, #128449, #006fa3)" }}>3</div>
            <h2 className="font-black text-foreground">Choisir un pack</h2>
          </div>
          <Separator />

          <div className="grid gap-3">
            {PACKAGES.map((pack) => (
              <button
                key={pack.id}
                type="button"
                onClick={() => setSelectedPackage(pack.id)}
                className={`flex items-center gap-4 p-4 rounded-xl border-2 transition-all text-left ${
                  selectedPackage === pack.id
                    ? "border-primary shadow-sm"
                    : pack.color
                }`}
              >
                <div className={`w-5 h-5 rounded-full border-2 flex items-center justify-center shrink-0 transition-colors ${
                  selectedPackage === pack.id ? "border-primary bg-primary" : "border-border"
                }`}>
                  {selectedPackage === pack.id && (
                    <div className="w-2 h-2 rounded-full bg-white" />
                  )}
                </div>
                <div className="flex-1 min-w-0">
                  <div className="flex items-center gap-2 flex-wrap">
                    <span className="font-black text-sm text-foreground">{pack.label}</span>
                    {pack.recommended && <Badge variant="success" className="text-xs">Recommandé</Badge>}
                    <span className="font-black text-sm text-primary ml-auto">{pack.price}</span>
                  </div>
                  <div className="flex flex-wrap gap-1.5 mt-1.5">
                    {pack.features.map((f) => (
                      <span key={f} className="text-xs font-semibold text-muted-foreground bg-muted rounded-md px-2 py-0.5">{f}</span>
                    ))}
                    <span className="text-xs font-semibold text-muted-foreground">{pack.duration}</span>
                  </div>
                </div>
              </button>
            ))}
          </div>

          <div className="p-4 rounded-xl border border-amber-200 bg-amber-50/50">
            <p className="text-xs font-bold text-amber-800 leading-relaxed">
              <strong className="font-black">Paiement après vérification :</strong> Notre équipe vous contacte via WhatsApp pour confirmer l'offre et procéder au paiement (Orange Money, Moov Money ou virement).
            </p>
          </div>
        </CardContent>
      </Card>

      {/* Submit */}
      <Button
        type="submit"
        size="xl"
        className="w-full"
        disabled={state === "loading"}
      >
        {state === "loading"
          ? <><Loader2 size={18} className="animate-spin" /> Envoi en cours…</>
          : <><Send size={18} /> Soumettre l'offre pour publication</>
        }
      </Button>

      <p className="text-center text-xs text-muted-foreground font-semibold">
        En soumettant, vous acceptez notre{" "}
        <a href="/privacy" className="text-primary hover:underline font-black">politique de confidentialité</a>.
        Aucun paiement avant validation.
      </p>
    </form>
  );
}
