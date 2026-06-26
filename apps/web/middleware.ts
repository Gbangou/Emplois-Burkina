import { NextRequest, NextResponse } from "next/server";

const ADMIN_PATHS = ["/operations", "/automation", "/admin"];
const ADMIN_SECRET = process.env.EMPLOIS_BURKINA_ADMIN_TOKEN;

function securityHeaders(req: NextRequest) {
  const isDev = process.env.NODE_ENV !== "production";
  const connectSrc = isDev ? "'self' ws: http://localhost:* http://127.0.0.1:*" : "'self'";
  const upgrade = isDev ? "" : "; upgrade-insecure-requests";

  return {
    "Content-Security-Policy": [
      "default-src 'self'",
      `connect-src ${connectSrc}`,
      "img-src 'self' data: https:",
      "font-src 'self' data:",
      "style-src 'self' 'unsafe-inline'",
      "script-src 'self' 'unsafe-inline' 'unsafe-eval'",
      "object-src 'none'",
      "base-uri 'self'",
      "form-action 'self'",
      "frame-ancestors 'none'",
      `report-uri ${new URL("/api/security/report", req.url).pathname}${upgrade}`
    ].join("; "),
    "Cross-Origin-Opener-Policy": "same-origin",
    "Cross-Origin-Resource-Policy": "same-origin",
    "Origin-Agent-Cluster": "?1",
    "Permissions-Policy": "camera=(), microphone=(), geolocation=(), payment=(), usb=(), bluetooth=(), accelerometer=(), gyroscope=()",
    "Referrer-Policy": "strict-origin-when-cross-origin",
    "X-Content-Type-Options": "nosniff",
    "X-DNS-Prefetch-Control": "on",
    "X-Frame-Options": "DENY",
    "X-Permitted-Cross-Domain-Policies": "none",
    "X-Robots-Tag": "index, follow"
  };
}

export function middleware(req: NextRequest) {
  const { pathname } = req.nextUrl;

  const isAdminPath = ADMIN_PATHS.some((p) => pathname === p || pathname.startsWith(`${p}/`));

  if (isAdminPath && process.env.NODE_ENV === "production") {
    const cookie = req.cookies.get("eb_admin")?.value;
    const header = req.headers.get("x-eb-admin");
    if (!ADMIN_SECRET || (cookie !== ADMIN_SECRET && header !== ADMIN_SECRET)) {
      return NextResponse.redirect(new URL("/", req.url));
    }
  }

  const response = NextResponse.next();
  for (const [key, value] of Object.entries(securityHeaders(req))) {
    response.headers.set(key, value);
  }
  return response;
}

export const config = {
  matcher: ["/((?!_next/static|_next/image|favicon.ico|icon-192.png|icon-512.png).*)"]
};
