import { readFile } from "node:fs/promises";
import { join } from "node:path";
import { NextResponse } from "next/server";

const cwd = process.cwd().replace(/\\/g, "/");
const root = cwd.endsWith("apps/web") || cwd.endsWith("apps\\web") ? join(process.cwd(), "..", "..") : process.cwd();

async function getConfiguredClient() {
  const envClient = process.env.NEXT_PUBLIC_ADSENSE_CLIENT || process.env.ADSENSE_CLIENT || "";
  if (envClient) return envClient;

  try {
    const content = await readFile(join(root, "data/site-config.json"), "utf8");
    const config = JSON.parse(content) as { adsenseClient?: string };
    return config.adsenseClient || "";
  } catch {
    return "";
  }
}

function publisherId(client: string) {
  return client.trim().replace(/^ca-/, "");
}

export async function GET() {
  const publisher = publisherId(await getConfiguredClient());
  const body = /^pub-\d+$/i.test(publisher)
    ? `google.com, ${publisher}, DIRECT, f08c47fec0942fa0\n`
    : "# ads.txt sera active automatiquement apres ajout d'un identifiant AdSense valide.\n";

  return new NextResponse(body, {
    headers: {
      "Content-Type": "text/plain; charset=utf-8",
      "Cache-Control": "public, s-maxage=3600, stale-while-revalidate=86400"
    }
  });
}
