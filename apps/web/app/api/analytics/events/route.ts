import { NextRequest, NextResponse } from "next/server";
import { readFile } from "node:fs/promises";

import { ANALYTICS_EVENTS_PATH, appendAnalyticsEvent, type AnalyticsEvent, type AnalyticsEventType } from "@/lib/revenue-signals";

const ADMIN_SECRET = process.env.EMPLOIS_BURKINA_ADMIN_TOKEN;
const TYPES: AnalyticsEventType[] = ["page_view", "conversion_click", "lead_submit"];

function clean(value: unknown, max = 180) {
  if (typeof value !== "string") return undefined;
  const trimmed = value.replace(/\s+/g, " ").trim();
  return trimmed ? trimmed.slice(0, max) : undefined;
}

function isAdmin(req: NextRequest) {
  const cookie = req.cookies.get("eb_admin")?.value;
  const header = req.headers.get("x-eb-admin");
  return Boolean(ADMIN_SECRET && (cookie === ADMIN_SECRET || header === ADMIN_SECRET));
}

async function readEvents(): Promise<AnalyticsEvent[]> {
  try {
    const content = await readFile(ANALYTICS_EVENTS_PATH, "utf8");
    return JSON.parse(content) as AnalyticsEvent[];
  } catch {
    return [];
  }
}

export async function POST(req: NextRequest) {
  try {
    const body = await req.json() as Partial<AnalyticsEvent>;
    const type = TYPES.includes(body.type as AnalyticsEventType) ? body.type as AnalyticsEventType : "page_view";
    const path = clean(body.path, 180) || "/";

    await appendAnalyticsEvent({
      type,
      path,
      target: clean(body.target, 220),
      source: clean(body.source, 120)
    });

    return NextResponse.json({ ok: true }, { headers: { "Cache-Control": "no-store" } });
  } catch {
    return NextResponse.json({ ok: false }, { status: 400, headers: { "Cache-Control": "no-store" } });
  }
}

export async function GET(req: NextRequest) {
  if (!isAdmin(req)) {
    return NextResponse.json({ ok: false }, { status: 404, headers: { "Cache-Control": "no-store" } });
  }

  const events = await readEvents();
  return NextResponse.json({ events, total: events.length }, { headers: { "Cache-Control": "no-store" } });
}
