import type { MetadataRoute } from "next";

export default function robots(): MetadataRoute.Robots {
  return {
    rules: [
      {
        userAgent: "*",
        allow: ["/", "/jobs", "/jobs/", "/annonceurs", "/contact", "/privacy"],
        disallow: ["/api/", "/recruteur/", "/admin/", "/_next/"]
      }
    ],
    sitemap: "https://emplois-burkina.com/sitemap.xml"
  };
}
