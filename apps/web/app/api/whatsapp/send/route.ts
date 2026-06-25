import { NextRequest, NextResponse } from "next/server";

const PHONE_ID = process.env.WHATSAPP_PHONE_NUMBER_ID;
const TOKEN = process.env.WHATSAPP_ACCESS_TOKEN;
const WA_API = "https://graph.facebook.com/v20.0";

type SendPayload = {
  to: string;        // numéro WhatsApp avec indicatif ex: "22670123456"
  message: string;   // texte du message
  template?: string; // nom du template Meta approuvé (si utilisé)
};

export async function POST(req: NextRequest) {
  if (!PHONE_ID || !TOKEN || PHONE_ID === "REMPLACER") {
    return NextResponse.json(
      { ok: false, error: "WhatsApp API non configurée. Renseigner WHATSAPP_PHONE_NUMBER_ID et WHATSAPP_ACCESS_TOKEN." },
      { status: 503 }
    );
  }

  const body = await req.json() as SendPayload;
  const { to, message } = body;

  if (!to || !message) {
    return NextResponse.json({ ok: false, error: "to et message sont requis" }, { status: 400 });
  }

  // Nettoyer le numéro (enlever espaces, +, tirets)
  const phone = to.replace(/[\s+\-()]/g, "");

  try {
    const res = await fetch(`${WA_API}/${PHONE_ID}/messages`, {
      method: "POST",
      headers: {
        "Authorization": `Bearer ${TOKEN}`,
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        messaging_product: "whatsapp",
        recipient_type: "individual",
        to: phone,
        type: "text",
        text: { preview_url: false, body: message }
      })
    });

    const data = await res.json() as { messages?: { id: string }[]; error?: { message: string } };

    if (!res.ok) {
      return NextResponse.json(
        { ok: false, error: data.error?.message || "Erreur WhatsApp API" },
        { status: res.status }
      );
    }

    return NextResponse.json({ ok: true, messageId: data.messages?.[0]?.id });
  } catch (err) {
    return NextResponse.json({ ok: false, error: (err as Error).message }, { status: 500 });
  }
}
