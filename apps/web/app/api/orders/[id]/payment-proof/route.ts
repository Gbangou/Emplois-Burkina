import { NextRequest, NextResponse } from "next/server";
import { appendAnalyticsEvent } from "@/lib/revenue-signals";
import { submitServiceOrderPaymentProof } from "@/lib/service-orders";

type RouteContext = {
  params: Promise<{
    id: string;
  }>;
};

export async function POST(req: NextRequest, context: RouteContext) {
  try {
    const { id } = await context.params;
    const body = await req.json() as Record<string, unknown>;
    const order = await submitServiceOrderPaymentProof(id, body);

    if (!order) {
      return NextResponse.json({ ok: false, error: "order_not_found" }, { status: 404, headers: { "Cache-Control": "no-store" } });
    }

    await appendAnalyticsEvent({
      type: "conversion_click",
      path: "/services",
      target: `/services?service=${order.serviceId}#preuve-paiement`,
      source: `service_payment_proof:${order.serviceId}`
    });

    return NextResponse.json({ ok: true, order }, { headers: { "Cache-Control": "no-store" } });
  } catch {
    return NextResponse.json({ ok: false }, { status: 500, headers: { "Cache-Control": "no-store" } });
  }
}
