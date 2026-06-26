import { mkdir, readFile, writeFile } from "node:fs/promises";
import { join } from "node:path";
import { SERVICE_PRODUCTS, type ServiceProduct } from "@/lib/revenue";

export type ServiceOrderStatus = "draft" | "awaiting_payment";

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
  createdAt: string;
};

export type ServiceOrderSummary = {
  totalOrders: number;
  awaitingPayment: number;
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
    createdAt: new Date().toISOString()
  };
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

  return {
    totalOrders: orders.length,
    awaitingPayment: awaitingPaymentOrders.length,
    draft: orders.filter((order) => order.status === "draft").length,
    expectedRevenueFcfa: awaitingPaymentOrders.reduce((sum, order) => sum + order.amountFcfa, 0),
    mobileMoneyPending: awaitingPaymentOrders.filter((order) => order.paymentMethod === "mobile_money").length,
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
