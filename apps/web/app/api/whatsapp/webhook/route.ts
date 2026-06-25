import { NextRequest, NextResponse } from "next/server";
import { writeFile, readFile, mkdir } from "node:fs/promises";
import { join } from "node:path";

const VERIFY_TOKEN = process.env.WHATSAPP_VERIFY_TOKEN || "emplois-burkina_webhook_secret_2025";

const ROOT = process.cwd().replace(/\\/g, "/").endsWith("apps/web")
  ? join(process.cwd(), "..", "..")
  : process.cwd();

// ── GET : vérification du webhook Meta (étape obligatoire) ──
export async function GET(req: NextRequest) {
  const mode = req.nextUrl.searchParams.get("hub.mode");
  const token = req.nextUrl.searchParams.get("hub.verify_token");
  const challenge = req.nextUrl.searchParams.get("hub.challenge");

  if (mode === "subscribe" && token === VERIFY_TOKEN) {
    return new NextResponse(challenge, { status: 200 });
  }

  return new NextResponse("Token invalide", { status: 403 });
}

// ── POST : réception des messages entrants ──
export async function POST(req: NextRequest) {
  try {
    const body = await req.json() as {
      object?: string;
      entry?: Array<{
        changes?: Array<{
          value?: {
            messages?: Array<{
              from: string;
              text?: { body: string };
              type: string;
            }>;
          };
        }>;
      }>;
    };

    if (body.object !== "whatsapp_business_account") {
      return NextResponse.json({ ok: false }, { status: 400 });
    }

    // Traiter les messages entrants
    for (const entry of body.entry || []) {
      for (const change of entry.changes || []) {
        for (const msg of change.value?.messages || []) {
          const from = msg.from;
          const text = msg.text?.body?.toLowerCase() || "";

          // Commande "STOP" = désinscription
          if (text === "stop" || text === "arret" || text === "desabonner") {
            await handleUnsubscribe(from);
          }
          // Commande "AIDE" ou "HELP"
          if (text === "aide" || text === "help") {
            await sendHelpMessage(from);
          }
        }
      }
    }

    return NextResponse.json({ ok: true });
  } catch {
    return NextResponse.json({ ok: false }, { status: 500 });
  }
}

async function handleUnsubscribe(phone: string) {
  try {
    const path = join(ROOT, "data/runtime/unsubscribed.json");
    let list: string[] = [];
    try { list = JSON.parse(await readFile(path, "utf8")) as string[]; } catch { /* empty */ }
    if (!list.includes(phone)) {
      list.push(phone);
      await mkdir(join(ROOT, "data/runtime"), { recursive: true });
      await writeFile(path, JSON.stringify(list, null, 2), "utf8");
    }
  } catch { /* ignore */ }
}

async function sendHelpMessage(to: string) {
  const PHONE_ID = process.env.WHATSAPP_PHONE_NUMBER_ID;
  const TOKEN = process.env.WHATSAPP_ACCESS_TOKEN;
  if (!PHONE_ID || !TOKEN || PHONE_ID === "REMPLACER") return;

  await fetch(`https://graph.facebook.com/v20.0/${PHONE_ID}/messages`, {
    method: "POST",
    headers: { "Authorization": `Bearer ${TOKEN}`, "Content-Type": "application/json" },
    body: JSON.stringify({
      messaging_product: "whatsapp",
      to,
      type: "text",
      text: {
        body: "🟢 *Emplois Burkina* — Aide\n\nCommandes disponibles:\n• Répondre *STOP* pour se désabonner\n• Visiter emplois-burkina.com pour voir toutes les offres\n\nPour toute question: contact@emplois-burkina.com"
      }
    })
  }).catch(() => {});
}
