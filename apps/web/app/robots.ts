import type { MetadataRoute } from "next";

export default function robots(): MetadataRoute.Robots {
  return {
    rules: [
      {
        userAgent: "*",
        allow: [
          "/",
          "/jobs",
          "/jobs/",
          "/guides",
          "/guides/",
          "/marches",
          "/marches/",
          "/international",
          "/services",
          "/revenus",
          "/security",
          "/annonceurs",
          "/contact",
          "/privacy"
        ],
        disallow: ["/api/", "/operations", "/operations/", "/automation", "/automation/", "/admin/", "/profil", "/recruteur/", "/_next/"]
      }
    ],
    sitemap: "https://emplois-burkina.com/sitemap.xml"
  };
}
