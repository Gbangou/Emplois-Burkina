import { NextRequest, NextResponse } from "next/server";
import { updateServiceOrderByDepositId, type ServiceOrderExternalPayment } from "@/lib/service-orders";

function mapPawaPayStatus(status: unknown): ServiceOrderExternalPayment["status"] {
  if (status === "COMPLETED") return "completed";
  if (status === "FAILED") return "failed";
  if (status === "ACCEPTED" || status === "PROCESSING") return "redirect_ready";
  return "needs_attention";
}

export async function POST(req: NextRequest) {
  const callbackSecret = process.env.PAWAPAY_CALLBACK_SECRET;
  if (callbackSecret && req.headers.get("x-eb-payment-callback-secret") !== callbackSecret) {
    return NextResponse.json({ ok: false }, { status: 401, headers: { "Cache-Control": "no-store" } });
  }

  try {
    const body = await req.json() as {
      depositId?: string;
      status?: string;
      providerTransactionId?: string;
    };
    const order = await updateServiceOrderByDepositId(
      body.depositId,
      mapPawaPayStatus(body.status),
      body.providerTransactionId
    );

    if (!order) {
      return NextResponse.json({ ok: false, error: "order_not_found" }, { status: 404, headers: { "Cache-Control": "no-store" } });
    }

    return NextResponse.json({ ok: true }, { headers: { "Cache-Control": "no-store" } });
  } catch {
    return NextResponse.json({ ok: false }, { status: 500, headers: { "Cache-Control": "no-store" } });
  }
}
