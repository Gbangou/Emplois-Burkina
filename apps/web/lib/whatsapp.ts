/**
 * Service WhatsApp Emplois Burkina
 * Envoie des alertes d'offres aux abonnés correspondants
 */

const PHONE_ID = process.env.WHATSAPP_PHONE_NUMBER_ID;
const TOKEN = process.env.WHATSAPP_ACCESS_TOKEN;
const WA_API = "https://graph.facebook.com/v20.0";

export type AlertSubscriber = {
  phone: string;
  query?: string;
  city?: string;
  category?: string;
};

export type JobAlert = {
  title: string;
  company?: string;
  city?: string;
  category?: string;
  deadline?: string;
  url: string;
};

export function isWhatsAppConfigured(): boolean {
  return Boolean(PHONE_ID && TOKEN && PHONE_ID !== "REMPLACER" && TOKEN !== "REMPLACER");
}

export async function sendWhatsAppMessage(to: string, message: string): Promise<boolean> {
  if (!isWhatsAppConfigured()) return false;

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
        to: phone,
        type: "text",
        text: { preview_url: true, body: message }
      })
    });
    return res.ok;
  } catch {
    return false;
  }
}

export function formatJobAlert(jobs: JobAlert[], subscriberCity?: string): string {
  const header = `🟢 *Emplois Burkina* — Nouvelles offres${subscriberCity ? ` à ${subscriberCity}` : " au Burkina Faso"}\n\n`;

  const body = jobs.slice(0, 5).map((job, i) => {
    const lines = [`*${i + 1}. ${job.title}*`];
    if (job.company) lines.push(`🏢 ${job.company}`);
    if (job.city) lines.push(`📍 ${job.city}`);
    if (job.category) lines.push(`📋 ${job.category}`);
    if (job.deadline) lines.push(`⏰ Clôture : ${job.deadline}`);
    lines.push(`🔗 ${job.url}`);
    return lines.join("\n");
  }).join("\n\n---\n\n");

  const footer = "\n\n_Répondre STOP pour se désabonner · emplois-burkina.com_";

  return header + body + footer;
}

/**
 * Envoie des alertes groupées à une liste d'abonnés.
 * Utilisé par le cron NestJS ou déclenché manuellement.
 */
export async function broadcastAlerts(
  subscribers: AlertSubscriber[],
  jobs: JobAlert[]
): Promise<{ sent: number; failed: number }> {
  if (!isWhatsAppConfigured() || !subscribers.length || !jobs.length) {
    return { sent: 0, failed: 0 };
  }

  let sent = 0;
  let failed = 0;

  for (const subscriber of subscribers) {
    // Filtrer les offres pertinentes pour cet abonné
    const relevant = jobs.filter((job) => {
      const cityMatch = !subscriber.city || (job.city || "").toLowerCase().includes(subscriber.city.toLowerCase());
      const catMatch = !subscriber.category || (job.category || "").toLowerCase().includes(subscriber.category.toLowerCase());
      const queryMatch = !subscriber.query || [job.title, job.company, job.category]
        .join(" ").toLowerCase().includes(subscriber.query.toLowerCase());
      return cityMatch && catMatch && queryMatch;
    });

    if (!relevant.length) continue;

    const message = formatJobAlert(relevant, subscriber.city);
    const ok = await sendWhatsAppMessage(subscriber.phone, message);
    if (ok) sent++; else failed++;

    // Délai entre envois pour éviter le rate limiting
    await new Promise((r) => setTimeout(r, 500));
  }

  return { sent, failed };
}
