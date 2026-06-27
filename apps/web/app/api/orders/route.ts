import { NextRequest, NextResponse } from "next/server";
import { buildPaymentInstructions, createPawaPayPaymentPage, getPaymentMode } from "@/lib/payment";
import {
  appendServiceOrder,
  buildServiceOrder,
  cleanOrderField,
  findServiceProduct,
  readServiceOrders,
  updateServiceOrderExternalPayment
} from "@/lib/service-orders";

const ADMIN_SECRET = process.env.EMPLOIS_BURKINA_ADMIN_TOKEN;

function isAdmin(req: NextRequest) {
  const cookie = req.cookies.get("eb_admin")?.value;
  const header = req.headers.get("x-eb-admin");
  return Boolean(ADMIN_SECRET && (cookie === ADMIN_SECRET || header === ADMIN_SECRET));
}

export async function POST(req: NextRequest) {
  try {
    const body = await req.json() as Record<string, unknown>;
    const serviceId = cleanOrderField(body.serviceId, 80);
    const service = findServiceProduct(serviceId);

    if (!service) {
      return NextResponse.json({ ok: false, error: "invalid_service" }, { status: 400, headers: { "Cache-Control": "no-store" } });
    }

    const order = buildServiceOrder(service, body);
    await appendServiceOrder(order);
    const payment = buildPaymentInstructions({ orderId: order.id, amountFcfa: order.amountFcfa });

    if (getPaymentMode() === "pawapay_payment_page" && order.externalPayment?.depositId) {
      const page = await createPawaPayPaymentPage({
        depositId: order.externalPayment.depositId,
        amountFcfa: order.amountFcfa,
        reason: `${service.name} - Emplois Burkina`,
        returnPath: `/paiement/retour?order=${encodeURIComponent(order.id)}`
      });

      if (page.ok) {
        payment.redirectUrl = page.redirectUrl;
        await updateServiceOrderExternalPayment(order.id, {
          ...order.externalPayment,
          redirectUrl: page.redirectUrl,
          status: "redirect_ready",
          updatedAt: new Date().toISOString()
        });
      }
    }

    return NextResponse.json({ ok: true, order, payment }, { headers: { "Cache-Control": "no-store" } });
  } catch {
    return NextResponse.json({ ok: false }, { status: 500, headers: { "Cache-Control": "no-store" } });
  }
}

export async function GET(req: NextRequest) {
  if (!isAdmin(req)) {
    return NextResponse.json({ ok: false }, { status: 404, headers: { "Cache-Control": "no-store" } });
  }

  const orders = await readServiceOrders();
  return NextResponse.json({ orders, total: orders.length }, { headers: { "Cache-Control": "no-store" } });
}
