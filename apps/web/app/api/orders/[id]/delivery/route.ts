import { NextRequest, NextResponse } from "next/server";
import { markServiceOrderDelivered } from "@/lib/service-orders";

type RouteContext = {
  params: Promise<{
    id: string;
  }>;
};

const ADMIN_SECRET = process.env.EMPLOIS_BURKINA_ADMIN_TOKEN;

function isAdmin(req: NextRequest) {
  const cookie = req.cookies.get("eb_admin")?.value;
  const header = req.headers.get("x-eb-admin");
  return Boolean(ADMIN_SECRET && (cookie === ADMIN_SECRET || header === ADMIN_SECRET));
}

export async function POST(req: NextRequest, context: RouteContext) {
  if (!isAdmin(req)) {
    return NextResponse.json({ ok: false }, { status: 404, headers: { "Cache-Control": "no-store" } });
  }

  try {
    const { id } = await context.params;
    const body = await req.json().catch(() => ({})) as Record<string, unknown>;
    const order = await markServiceOrderDelivered(id, body);

    if (!order) {
      return NextResponse.json({ ok: false, error: "order_not_found" }, { status: 404, headers: { "Cache-Control": "no-store" } });
    }

    return NextResponse.json({ ok: true, order }, { headers: { "Cache-Control": "no-store" } });
  } catch {
    return NextResponse.json({ ok: false }, { status: 500, headers: { "Cache-Control": "no-store" } });
  }
}
