import { mkdir, readFile, writeFile } from "node:fs/promises";
import { join } from "node:path";
import { randomUUID } from "node:crypto";
import { SERVICE_PRODUCTS, type ServiceProduct } from "@/lib/revenue";

export type ServiceOrderStatus = "draft" | "awaiting_payment" | "payment_submitted" | "delivered";

export type ServiceOrderPaymentProof = {
  senderPhone?: string;
  transactionId?: string;
  note?: string;
  submittedAt: string;
};

export type ServiceOrderExternalPayment = {
  provider: "pawapay";
  depositId: string;
  redirectUrl?: string;
  status: "created" | "redirect_ready" | "completed" | "failed" | "needs_attention";
  providerTransactionId?: string;
  updatedAt: string;
};

export type ServiceOrderDelivery = {
  deliveredAt: string;
  note?: string;
};

export type ServiceOrder = {
  id: string;
  serviceId: ServiceProduct["id"];
  serviceName: string;
  amountFcfa: number;
  status: ServiceOrderStatus;
  paymentMethod: "mobile_money";
  name?: string;
  phone?: string;
  email?: string;
  notes?: string;
  paymentProof?: ServiceOrderPaymentProof;
  externalPayment?: ServiceOrderExternalPayment;
  delivery?: ServiceOrderDelivery;
  createdAt: string;
};

export type ServiceOrderSummary = {
  totalOrders: number;
  awaitingPayment: number;
  paymentSubmitted: number;
  delivered: number;
  draft: number;
  expectedRevenueFcfa: number;
  mobileMoneyPending: number;
  recentOrders: Array<Pick<ServiceOrder, "id" | "serviceName" | "amountFcfa" | "status" | "createdAt">>;
  topServices: Array<{
    serviceName: string;
    count: number;
    amountFcfa: number;
  }>;
};

export type PublicServiceOrderPaymentStatus = {
  id: string;
  serviceName: string;
  amountFcfa: number;
  status: ServiceOrderStatus;
  externalStatus?: ServiceOrderExternalPayment["status"];
  updatedAt: string;
};

const cwd = process.cwd().replace(/\\/g, "/");
const root = cwd.endsWith("apps/web") || cwd.endsWith("apps\\web") ? join(process.cwd(), "..", "..") : process.cwd();
const runtimeDir = join(root, "data/runtime");

export const SERVICE_ORDERS_FILE = join(runtimeDir, "service-orders.json");

export function cleanOrderField(value: unknown, max = 220) {
  if (typeof value !== "string") return undefined;
  const trimmed = value.replace(/\s+/g, " ").trim();
  return trimmed ? trimmed.slice(0, max) : undefined;
}

export function priceToFcfa(value: string) {
  const digits = value.replace(/[^\d]/g, "");
  return digits ? Number(digits) : 0;
}

export async function readServiceOrders(): Promise<ServiceOrder[]> {
  try {
    const content = await readFile(SERVICE_ORDERS_FILE, "utf8");
    const orders = JSON.parse(content) as ServiceOrder[];
    return Array.isArray(orders) ? orders : [];
  } catch {
    return [];
  }
}

export async function appendServiceOrder(order: ServiceOrder) {
  const orders = await readServiceOrders();
  orders.push(order);
  await writeServiceOrders(orders);
}

async function writeServiceOrders(orders: ServiceOrder[]) {
  await mkdir(runtimeDir, { recursive: true });
  await writeFile(SERVICE_ORDERS_FILE, JSON.stringify(orders.slice(-2000), null, 2), "utf8");
}

export function buildServiceOrder(service: ServiceProduct, body: Record<string, unknown>): ServiceOrder {
  return {
    id: `ord_${Date.now()}_${Math.random().toString(36).slice(2, 8)}`,
    serviceId: service.id,
    serviceName: service.name,
    amountFcfa: priceToFcfa(service.price),
    status: "awaiting_payment",
    paymentMethod: "mobile_money",
    name: cleanOrderField(body.name, 120),
    phone: cleanOrderField(body.phone, 40),
    email: cleanOrderField(body.email, 160),
    notes: cleanOrderField(body.notes, 800),
    externalPayment: process.env.EMPLOIS_BURKINA_PAYMENT_MODE === "pawapay_payment_page"
      ? {
          provider: "pawapay",
          depositId: randomUUID(),
          status: "created",
          updatedAt: new Date().toISOString()
        }
      : undefined,
    createdAt: new Date().toISOString()
  };
}

export async function updateServiceOrderExternalPayment(
  orderId: string | undefined,
  externalPayment: ServiceOrderExternalPayment
): Promise<ServiceOrder | null> {
  const cleanOrderId = cleanOrderField(orderId, 80);
  if (!cleanOrderId) return null;

  const orders = await readServiceOrders();
  const index = orders.findIndex((order) => order.id === cleanOrderId);
  const existing = index === -1 ? undefined : orders[index];
  if (!existing) return null;

  const updated: ServiceOrder = { ...existing, externalPayment };
  orders[index] = updated;
  await writeServiceOrders(orders);
  return updated;
}

export async function updateServiceOrderByDepositId(
  depositId: string | undefined,
  status: ServiceOrderExternalPayment["status"],
  providerTransactionId?: string
): Promise<ServiceOrder | null> {
  const cleanDepositId = cleanOrderField(depositId, 120);
  if (!cleanDepositId) return null;

  const orders = await readServiceOrders();
  const index = orders.findIndex((order) => order.externalPayment?.depositId === cleanDepositId);
  const existing = index === -1 ? undefined : orders[index];
  if (!existing?.externalPayment) return null;

  const updated: ServiceOrder = {
    ...existing,
    status: status === "completed" ? "payment_submitted" : existing.status,
    externalPayment: {
      ...existing.externalPayment,
      status,
      providerTransactionId: cleanOrderField(providerTransactionId, 160),
      updatedAt: new Date().toISOString()
    }
  };

  orders[index] = updated;
  await writeServiceOrders(orders);
  return updated;
}

export async function submitServiceOrderPaymentProof(
  orderId: string | undefined,
  body: Record<string, unknown>
): Promise<ServiceOrder | null> {
  const cleanOrderId = cleanOrderField(orderId, 80);
  if (!cleanOrderId) return null;

  const orders = await readServiceOrders();
  const index = orders.findIndex((order) => order.id === cleanOrderId);
  if (index === -1) return null;

  const existing = orders[index];
  if (!existing) return null;

  const updated: ServiceOrder = {
    ...existing,
    status: "payment_submitted",
    paymentProof: {
      senderPhone: cleanOrderField(body.senderPhone, 40),
      transactionId: cleanOrderField(body.transactionId, 120),
      note: cleanOrderField(body.note, 500),
      submittedAt: new Date().toISOString()
    }
  };

  orders[index] = updated;
  await writeServiceOrders(orders);
  return updated;
}

export async function markServiceOrderDelivered(
  orderId: string | undefined,
  body: Record<string, unknown> = {}
): Promise<ServiceOrder | null> {
  const cleanOrderId = cleanOrderField(orderId, 80);
  if (!cleanOrderId) return null;

  const orders = await readServiceOrders();
  const index = orders.findIndex((order) => order.id === cleanOrderId);
  const existing = index === -1 ? undefined : orders[index];
  if (!existing) return null;

  const updated: ServiceOrder = {
    ...existing,
    status: "delivered",
    delivery: {
      deliveredAt: new Date().toISOString(),
      note: cleanOrderField(body.note, 500)
    }
  };

  orders[index] = updated;
  await writeServiceOrders(orders);
  return updated;
}

export async function getServiceOrderSummary(): Promise<ServiceOrderSummary> {
  const orders = await readServiceOrders();
  const topServiceMap = new Map<string, { serviceName: string; count: number; amountFcfa: number }>();

  for (const order of orders) {
    const current = topServiceMap.get(order.serviceId) ?? {
      serviceName: order.serviceName,
      count: 0,
      amountFcfa: 0
    };
    current.count += 1;
    current.amountFcfa += order.amountFcfa;
    topServiceMap.set(order.serviceId, current);
  }

  const awaitingPaymentOrders = orders.filter((order) => order.status === "awaiting_payment");
  const paymentSubmittedOrders = orders.filter((order) => order.status === "payment_submitted");
  const deliveredOrders = orders.filter((order) => order.status === "delivered");
  const revenuePipelineOrders = [...awaitingPaymentOrders, ...paymentSubmittedOrders];

  return {
    totalOrders: orders.length,
    awaitingPayment: awaitingPaymentOrders.length,
    paymentSubmitted: paymentSubmittedOrders.length,
    delivered: deliveredOrders.length,
    draft: orders.filter((order) => order.status === "draft").length,
    expectedRevenueFcfa: revenuePipelineOrders.reduce((sum, order) => sum + order.amountFcfa, 0),
    mobileMoneyPending: revenuePipelineOrders.filter((order) => order.paymentMethod === "mobile_money").length,
    recentOrders: [...orders]
      .sort((a, b) => new Date(b.createdAt).getTime() - new Date(a.createdAt).getTime())
      .slice(0, 5)
      .map((order) => ({
        id: order.id,
        serviceName: order.serviceName,
        amountFcfa: order.amountFcfa,
        status: order.status,
        createdAt: order.createdAt
      })),
    topServices: [...topServiceMap.values()]
      .sort((a, b) => b.amountFcfa - a.amountFcfa || b.count - a.count)
      .slice(0, 4)
  };
}

export function findServiceProduct(serviceId: string | undefined) {
  return SERVICE_PRODUCTS.find((item) => item.id === serviceId);
}

export async function getPublicServiceOrderPaymentStatus(
  orderId: string | undefined
): Promise<PublicServiceOrderPaymentStatus | null> {
  const cleanOrderId = cleanOrderField(orderId, 80);
  if (!cleanOrderId) return null;

  const orders = await readServiceOrders();
  const order = orders.find((item) => item.id === cleanOrderId);
  if (!order) return null;

  return {
    id: order.id,
    serviceName: order.serviceName,
    amountFcfa: order.amountFcfa,
    status: order.status,
    externalStatus: order.externalPayment?.status,
    updatedAt: order.externalPayment?.updatedAt || order.paymentProof?.submittedAt || order.createdAt
  };
}
