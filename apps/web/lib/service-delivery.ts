import { readServiceOrders, type ServiceOrder } from "@/lib/service-orders";

export type ServiceDeliveryTemplate = {
  serviceId: ServiceOrder["serviceId"];
  title: string;
  targetHours: number;
  deliverables: string[];
  qualityChecks: string[];
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
    qualityChecks: ["Lisibilite mobile", "Mots-cles coherents", "Aucune experience inventee"]
  },
  {
    serviceId: "lettre",
    title: "Lettre ciblee",
    targetHours: 24,
    deliverables: ["Lettre courte", "Version modifiable", "Objet email de candidature"],
    qualityChecks: ["Lien clair avec l'offre", "Ton professionnel", "Pas de promesse exageree"]
  },
  {
    serviceId: "ong-international",
    title: "Pack ONG / International",
    targetHours: 48,
    deliverables: ["CV adapte", "Lettre ONG", "Checklist documents et vigilance"],
    qualityChecks: ["Langage terrain credible", "Competences verifiables", "Structure ONG claire"]
  },
  {
    serviceId: "entretien",
    title: "Preparation entretien",
    targetHours: 24,
    deliverables: ["Pitch personnel", "Questions probables", "Reponses courtes a adapter"],
    qualityChecks: ["Reponses sinceres", "Exemples concrets", "Pas de garantie d'embauche"]
  }
];

function templateFor(serviceId: ServiceOrder["serviceId"]) {
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
    const template = templateFor(order.serviceId);
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
