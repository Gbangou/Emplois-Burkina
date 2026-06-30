import { readServiceOrders, type ServiceOrder } from "@/lib/service-orders";

export type ServiceDeliveryTemplate = {
  serviceId: ServiceOrder["serviceId"];
  title: string;
  targetHours: number;
  deliverables: string[];
  qualityChecks: string[];
  intakeFields: string[];
  productionSections: string[];
  closingChecklist: string[];
};

export type ServiceDeliveryQueueItem = {
  id: string;
  serviceId: ServiceOrder["serviceId"];
  serviceName: string;
  amountFcfa: number;
  status: ServiceOrder["status"];
  paidSignal: "manual_proof" | "pawapay_callback";
  submittedAt: string;
  targetHours: number;
  deliverables: string[];
  qualityChecks: string[];
};

export type ServiceDeliveryOverview = {
  readyToDeliver: number;
  delivered: number;
  deliveredRevenueFcfa: number;
  targetRevenueFcfa: number;
  averageTargetHours: number;
  queue: ServiceDeliveryQueueItem[];
  templates: ServiceDeliveryTemplate[];
};

export const SERVICE_DELIVERY_TEMPLATES: ServiceDeliveryTemplate[] = [
  {
    serviceId: "cv-ats",
    title: "CV ATS Express",
    targetHours: 24,
    deliverables: ["CV texte propre", "Version PDF", "Checklist mots-cles du poste"],
    qualityChecks: ["Lisibilite mobile", "Mots-cles coherents", "Aucune experience inventee"],
    intakeFields: ["CV actuel", "Offre visee", "Ville ou pays vise", "Niveau d'etudes", "Experience la plus recente"],
    productionSections: ["En-tete clair", "Profil professionnel court", "Competences ciblees", "Experiences quantifiees", "Formation", "Outils et langues"],
    closingChecklist: ["Exporter PDF lisible", "Garder une version modifiable", "Verifier telephone/email", "Retirer toute promesse non prouvee"]
  },
  {
    serviceId: "lettre",
    title: "Lettre ciblee",
    targetHours: 24,
    deliverables: ["Lettre courte", "Version modifiable", "Objet email de candidature"],
    qualityChecks: ["Lien clair avec l'offre", "Ton professionnel", "Pas de promesse exageree"],
    intakeFields: ["Offre visee", "Nom structure", "Poste", "Experience pertinente", "Motivation principale"],
    productionSections: ["Accroche specifique", "Preuve d'adequation", "Motivation concrete", "Disponibilite", "Formule courte"],
    closingChecklist: ["Une page maximum", "Aucune phrase generique", "Objet email ajoute", "Coordonnees coherentes"]
  },
  {
    serviceId: "ong-international",
    title: "Pack ONG / International",
    targetHours: 48,
    deliverables: ["CV adapte", "Lettre ONG", "Checklist documents et vigilance"],
    qualityChecks: ["Langage terrain credible", "Competences verifiables", "Structure ONG claire"],
    intakeFields: ["CV actuel", "Offre ou domaine ONG", "Langues", "Experiences terrain", "Mobilite", "References disponibles"],
    productionSections: ["Resume profil ONG", "Competences terrain", "Experience projet", "Lettre orientee mandat", "Checklist documents", "Vigilance anti-arnaque"],
    closingChecklist: ["Pas de garantie de recrutement", "Verifier preuves terrain", "Adapter au bailleur/mandat", "Ajouter vigilance paiement suspect"]
  },
  {
    serviceId: "entretien",
    title: "Preparation entretien",
    targetHours: 24,
    deliverables: ["Pitch personnel", "Questions probables", "Reponses courtes a adapter"],
    qualityChecks: ["Reponses sinceres", "Exemples concrets", "Pas de garantie d'embauche"],
    intakeFields: ["Poste vise", "CV ou profil", "Entreprise", "Points forts", "Points faibles", "Langue de l'entretien"],
    productionSections: ["Pitch 60 secondes", "Questions techniques", "Questions comportementales", "Exemples STAR", "Questions a poser", "Plan de revision"],
    closingChecklist: ["Reponses courtes", "Exemples vrais", "Aucune memorisation rigide", "Conseils de ponctualite et posture"]
  }
];

export function getServiceDeliveryTemplate(serviceId: ServiceOrder["serviceId"]) {
  return SERVICE_DELIVERY_TEMPLATES.find((template) => template.serviceId === serviceId) || SERVICE_DELIVERY_TEMPLATES[0]!;
}

function paymentSignal(order: ServiceOrder): ServiceDeliveryQueueItem["paidSignal"] {
  return order.externalPayment?.status === "completed" ? "pawapay_callback" : "manual_proof";
}

function paidAt(order: ServiceOrder) {
  return order.externalPayment?.updatedAt || order.paymentProof?.submittedAt || order.createdAt;
}

export async function getServiceDeliveryOverview(): Promise<ServiceDeliveryOverview> {
  const orders = await readServiceOrders();
  const paidOrders = orders
    .filter((order) => order.status === "payment_submitted")
    .sort((a, b) => new Date(paidAt(b)).getTime() - new Date(paidAt(a)).getTime());
  const deliveredOrders = orders.filter((order) => order.status === "delivered");

  const queue = paidOrders.slice(0, 8).map((order) => {
    const template = getServiceDeliveryTemplate(order.serviceId);
    return {
      id: order.id,
      serviceId: order.serviceId,
      serviceName: order.serviceName,
      amountFcfa: order.amountFcfa,
      status: order.status,
      paidSignal: paymentSignal(order),
      submittedAt: paidAt(order),
      targetHours: template.targetHours,
      deliverables: template.deliverables,
      qualityChecks: template.qualityChecks
    };
  });

  return {
    readyToDeliver: paidOrders.length,
    delivered: deliveredOrders.length,
    deliveredRevenueFcfa: deliveredOrders.reduce((sum, order) => sum + order.amountFcfa, 0),
    targetRevenueFcfa: paidOrders.reduce((sum, order) => sum + order.amountFcfa, 0),
    averageTargetHours: queue.length
      ? Math.round(queue.reduce((sum, item) => sum + item.targetHours, 0) / queue.length)
      : 0,
    queue,
    templates: SERVICE_DELIVERY_TEMPLATES
  };
}

export function buildServiceDeliveryMessage(order: ServiceOrder) {
  const template = getServiceDeliveryTemplate(order.serviceId);
  const name = order.name || "Bonjour";
  return [
    `${name}, votre commande ${order.serviceName} est en preparation sur Emplois Burkina.`,
    `Reference: ${order.id.slice(0, 18).toUpperCase()}.`,
    `Livrables prevus: ${template.deliverables.join(", ")}.`,
    "Merci de garder cette reference pour le suivi. Les offres restent gratuites; ce service est optionnel."
  ].join("\n");
}

export function buildServiceDeliveryBrief(order: ServiceOrder) {
  const template = getServiceDeliveryTemplate(order.serviceId);
  const candidateNotes = order.notes || "";
  const missingInputs = template.intakeFields.filter((field) => !candidateNotes.toLowerCase().includes(field.toLowerCase().slice(0, 5)));
  const productionDraft = [
    `# ${template.title}`,
    "",
    `Reference: ${order.id.slice(0, 18).toUpperCase()}`,
    `Client: ${order.name || "Non renseigne"}`,
    `Contact: ${order.phone || order.email || "Non renseigne"}`,
    "",
    "## Besoin candidat",
    order.notes || "A completer avec le candidat avant livraison.",
    "",
    "## Structure du livrable",
    ...template.productionSections.map((section) => `- ${section}:`),
    "",
    "## Controle final",
    ...template.closingChecklist.map((item) => `- ${item}`)
  ].join("\n");

  return {
    title: `${order.serviceName} - ${order.id.slice(0, 18).toUpperCase()}`,
    summary: order.notes || "Aucun detail candidat fourni. Demander le poste vise, le CV actuel et le delai souhaite avant livraison.",
    deliverables: template.deliverables,
    qualityChecks: template.qualityChecks,
    intakeFields: template.intakeFields,
    missingInputs,
    productionSections: template.productionSections,
    closingChecklist: template.closingChecklist,
    productionDraft,
    targetHours: template.targetHours
  };
}
