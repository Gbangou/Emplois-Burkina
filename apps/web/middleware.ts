import { NextRequest, NextResponse } from "next/server";

// Pages réservées à l'administration interne
// En production, inaccessibles sans token d'admin
const ADMIN_PATHS = ["/operations", "/automation", "/admin"];
const ADMIN_SECRET = process.env.EMPLOIS_BURKINA_ADMIN_TOKEN;

export function middleware(req: NextRequest) {
  const { pathname } = req.nextUrl;

  const isAdminPath = ADMIN_PATHS.some((p) => pathname === p || pathname.startsWith(`${p}/`));

  if (isAdminPath && process.env.NODE_ENV === "production") {
    // Vérifier le cookie admin ou le header secret
    const cookie = req.cookies.get("jf_admin")?.value;
    const header = req.headers.get("x-jf-admin");
    if (!ADMIN_SECRET || (cookie !== ADMIN_SECRET && header !== ADMIN_SECRET)) {
      return NextResponse.redirect(new URL("/", req.url));
    }
  }

  return NextResponse.next();
}

export const config = {
  matcher: ["/operations", "/operations/:path*", "/automation", "/automation/:path*", "/admin/:path*"]
};
