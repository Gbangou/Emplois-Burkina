import type { Guide } from "@/lib/guides";

export type Recommendation = {
  id: string;
  title: string;
  category: "service" | "formation" | "outil" | "alerte";
  description: string;
  href: string;
  value: string;
  disclosure: string;
};

const BASE_RECOMMENDATIONS: Recommendation[] = [
  {
    id: "alertes-whatsapp",
    title: "Alertes emploi gratuites",
    category: "alerte",
    description: "Recevoir les nouvelles offres pertinentes au lieu de verifier plusieurs sources chaque jour.",
    href: "/alertes?source=guide",
    value: "Retention et trafic recurrent",
    disclosure: "Gratuit"
  },
  {
    id: "cv-ats-express",
    title: "CV ATS Express",
    category: "service",
    description: "Transformer un CV en version claire, lisible et adaptee a une offre precise.",
    href: "/services?service=cv-ats&source=guide#demande",
    value: "Service optionnel",
    disclosure: "Service Emplois Burkina"
  },
  {
    id: "lettre-ciblee",
    title: "Lettre ciblee",
    category: "service",
    description: "Rediger une lettre courte, specifique et coherente avec l'offre visee.",
    href: "/services?service=lettre&source=guide#demande",
    value: "Service optionnel",
    disclosure: "Service Emplois Burkina"
  },
  {
    id: "pack-ong-international",
    title: "Pack ONG / International",
    category: "service",
    description: "Preparer CV, lettre et checklist pour ONG, ONU, projets et opportunites remote.",
    href: "/services?service=ong-international&source=guide#demande",
    value: "Marge plus elevee",
    disclosure: "Service Emplois Burkina"
  },
  {
    id: "preparation-entretien",
    title: "Preparation entretien",
    category: "service",
    description: "Structurer un pitch, anticiper les questions et clarifier les preuves du parcours.",
    href: "/services?service=entretien&source=guide#demande",
    value: "Upsell naturel",
    disclosure: "Service Emplois Burkina"
  }
];

const BY_GUIDE: Record<string, string[]> = {
  "cv-ats-burkina": ["cv-ats-express", "lettre-ciblee", "alertes-whatsapp"],
  "lettre-motivation-ong": ["pack-ong-international", "lettre-ciblee", "preparation-entretien"],
  "emplois-remote-afrique": ["pack-ong-international", "cv-ats-express", "alertes-whatsapp"],
  "concours-recrutements-burkina": ["alertes-whatsapp", "cv-ats-express", "lettre-ciblee"]
};

export function getGuideRecommendations(guide: Guide) {
  const ids = BY_GUIDE[guide.slug] || ["alertes-whatsapp", "cv-ats-express", "lettre-ciblee"];
  return ids
    .map((id) => BASE_RECOMMENDATIONS.find((item) => item.id === id))
    .filter((item): item is Recommendation => Boolean(item));
}
