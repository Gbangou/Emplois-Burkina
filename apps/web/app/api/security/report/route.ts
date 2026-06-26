import { NextRequest, NextResponse } from "next/server";

export async function POST(req: NextRequest) {
  try {
    await req.text();
  } catch {
    // Security reports are best-effort and must never break browsing.
  }

  return new NextResponse(null, {
    status: 204,
    headers: {
      "Cache-Control": "no-store"
    }
  });
}
