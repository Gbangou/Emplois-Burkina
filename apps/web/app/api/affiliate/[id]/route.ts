import { NextRequest, NextResponse } from "next/server";
import { getAffiliateDestination } from "@/lib/affiliate-recommendations";
import { appendAnalyticsEvent } from "@/lib/revenue-signals";

type AffiliateRouteProps = {
  params: Promise<{ id: string }>;
};

function safePath(req: NextRequest) {
  const referrer = req.headers.get("referer");
  if (!referrer) return "/api/affiliate";

  try {
    const url = new URL(referrer);
    return `${url.pathname}${url.search}`.slice(0, 180);
  } catch {
    return "/api/affiliate";
  }
}

export async function GET(req: NextRequest, { params }: AffiliateRouteProps) {
  const { id } = await params;
  const destination = getAffiliateDestination(id);

  if (!destination) {
    return NextResponse.redirect(new URL("/formations", req.url), 302);
  }

  await appendAnalyticsEvent({
    type: "conversion_click",
    path: safePath(req),
    target: destination.external ? destination.href : `/formations/${destination.item.id}`,
    source: `affiliate_redirect:${destination.item.id}:${destination.external ? "external" : "internal"}`
  });

  return NextResponse.redirect(new URL(destination.href, req.url), 302);
}
