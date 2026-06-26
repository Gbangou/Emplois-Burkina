import { mkdir, readFile, writeFile } from "node:fs/promises";
import { join } from "node:path";
import { NextRequest, NextResponse } from "next/server";
import { SERVICE_PRODUCTS } from "@/lib/revenue";

type Order = {
  id: string;
  serviceId: string;
  serviceName: string;
  amountFcfa: number;
  status: "draft" | "awaiting_payment";
  paymentMethod: "mobile_money";
  name?: string;
  phone?: string;
  email?: string;
  notes?: string;
  createdAt: string;
};

const cwd = process.cwd().replace(/\\/g, "/");
const root = cwd.endsWith("apps/web") || cwd.endsWith("apps\\web") ? join(process.cwd(), "..", "..") : process.cwd();
const ORDERS_FILE = join(root, "data/runtime/service-orders.json");
const ADMIN_SECRET = process.env.EMPLOIS_BURKINA_ADMIN_TOKEN;

function clean(value: unknown, max = 220) {
  if (typeof value !== "string") return undefined;
  const trimmed = value.replace(/\s+/g, " ").trim();
  return trimmed ? trimmed.slice(0, max) : undefined;
}

function priceToFcfa(value: string) {
  const digits = value.replace(/[^\d]/g, "");
  return digits ? Number(digits) : 0;
}

function isAdmin(req: NextRequest) {
  const cookie = req.cookies.get("eb_admin")?.value;
  const header = req.headers.get("x-eb-admin");
  return Boolean(ADMIN_SECRET && (cookie === ADMIN_SECRET || header === ADMIN_SECRET));
}

async function readOrders(): Promise<Order[]> {
  try {
    const content = await readFile(ORDERS_FILE, "utf8");
    return JSON.parse(content) as Order[];
  } catch {
    return [];
  }
}

async function writeOrder(order: Order) {
  const orders = await readOrders();
  orders.push(order);
  await mkdir(join(root, "data/runtime"), { recursive: true });
  await writeFile(ORDERS_FILE, JSON.stringify(orders.slice(-2000), null, 2), "utf8");
}

export async function POST(req: NextRequest) {
  try {
    const body = await req.json() as Record<string, unknown>;
    const serviceId = clean(body.serviceId, 80);
    const service = SERVICE_PRODUCTS.find((item) => item.id === serviceId);

    if (!service) {
      return NextResponse.json({ ok: false, error: "invalid_service" }, { status: 400, headers: { "Cache-Control": "no-store" } });
    }

    const order: Order = {
      id: `ord_${Date.now()}_${Math.random().toString(36).slice(2, 8)}`,
      serviceId: service.id,
      serviceName: service.name,
      amountFcfa: priceToFcfa(service.price),
      status: "awaiting_payment",
      paymentMethod: "mobile_money",
      name: clean(body.name, 120),
      phone: clean(body.phone, 40),
      email: clean(body.email, 160),
      notes: clean(body.notes, 800),
      createdAt: new Date().toISOString()
    };

    await writeOrder(order);
    return NextResponse.json({ ok: true, order }, { headers: { "Cache-Control": "no-store" } });
  } catch {
    return NextResponse.json({ ok: false }, { status: 500, headers: { "Cache-Control": "no-store" } });
  }
}

export async function GET(req: NextRequest) {
  if (!isAdmin(req)) {
    return NextResponse.json({ ok: false }, { status: 404, headers: { "Cache-Control": "no-store" } });
  }

  const orders = await readOrders();
  return NextResponse.json({ orders, total: orders.length }, { headers: { "Cache-Control": "no-store" } });
}
