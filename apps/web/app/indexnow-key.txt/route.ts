import { NextResponse } from "next/server";

export function GET() {
  const key = process.env.INDEXNOW_KEY?.trim();

  if (!key) {
    return new NextResponse("IndexNow key not configured\n", {
      status: 404,
      headers: {
        "Content-Type": "text/plain; charset=utf-8",
        "Cache-Control": "no-store"
      }
    });
  }

  return new NextResponse(`${key}\n`, {
    headers: {
      "Content-Type": "text/plain; charset=utf-8",
      "Cache-Control": "public, max-age=3600"
    }
  });
}
