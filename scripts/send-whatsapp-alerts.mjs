/**
 * Script d'envoi des alertes WhatsApp post-scraping.
 * Lit les abonnés, les nouvelles offres, et envoie les messages pertinents.
 * Appelé automatiquement après chaque cycle de curation.
 */
import { readFile, writeFile, mkdir } from "node:fs/promises";
import { existsSync } from "node:fs";

const ROOT = new URL("../", import.meta.url);
const JOBS_FILE = new URL("data/curated-jobs.json", ROOT);
const LEADS_FILE = new URL("data/runtime/leads-modern.json", ROOT);
const SENT_LOG = new URL("data/runtime/whatsapp-sent.json", ROOT);
const UNSUB_FILE = new URL("data/runtime/unsubscribed.json", ROOT);

const PHONE_ID = process.env.WHATSAPP_PHONE_NUMBER_ID;
const TOKEN = process.env.WHATSAPP_ACCESS_TOKEN;
const WA_API = "https://graph.facebook.com/v20.0";

function normalize(v = "") {
  return String(v).toLowerCase().normalize("NFD").replace(/[̀-ͯ]/g, "").trim();
}

async function readJson(url, fallback) {
  try { return JSON.parse(await readFile(url, "utf8")); }
  catch { return fallback; }
}

async function writeJson(url, data) {
  await mkdir(new URL(".", url), { recursive: true });
  await writeFile(url, JSON.stringify(data, null, 2), "utf8");
}

async function sendMessage(to, message) {
  const phone = to.replace(/[\s+\-()]/g, "");
  const res = await fetch(`${WA_API}/${PHONE_ID}/messages`, {
    method: "POST",
    headers: { "Authorization": `Bearer ${TOKEN}`, "Content-Type": "application/json" },
    body: JSON.stringify({
      messaging_product: "whatsapp",
      to: phone,
      type: "text",
      text: { preview_url: true, body: message }
    })
  });
  return res.ok;
}

function formatAlert(jobs, city) {
  const header = `🟢 *Emplois Burkina* — ${jobs.length} nouvelle${jobs.length > 1 ? "s" : ""} offre${jobs.length > 1 ? "s" : ""}${city ? ` à ${city}` : " au Burkina Faso"}\n\n`;
  const body = jobs.slice(0, 5).map((job, i) => {
    const lines = [`*${i + 1}. ${job.title}*`];
    if (job.company) lines.push(`🏢 ${job.company}`);
    if (job.city) lines.push(`📍 ${job.city}`);
    if (job.deadline && job.deadline !== "A verifier") lines.push(`⏰ ${job.deadline}`);
    if (job.sourceUrl) lines.push(`🔗 ${job.sourceUrl}`);
    else lines.push(`🔗 https://emplois-burkina.com/jobs/${job.id}`);
    return lines.join("\n");
  }).join("\n\n");
  return header + body + "\n\n_Répondre STOP pour se désabonner · emplois-burkina.com_";
}

async function main() {
  // Vérifier la config WhatsApp
  if (!PHONE_ID || !TOKEN || PHONE_ID === "REMPLACER") {
    console.log("WhatsApp non configuré — alertes désactivées. Renseigner WHATSAPP_PHONE_NUMBER_ID et WHATSAPP_ACCESS_TOKEN.");
    return;
  }

  const jobs = await readJson(JOBS_FILE, []);
  const leads = await readJson(LEADS_FILE, []);
  const sentLog = await readJson(SENT_LOG, {});
  const unsubscribed = new Set(await readJson(UNSUB_FILE, []));

  // Filtrer les abonnés WhatsApp
  const subscribers = leads.filter(l =>
    l.type === "whatsapp_alert" && l.phone && !unsubscribed.has(l.phone.replace(/[\s+\-()]/g, ""))
  );

  if (!subscribers.length) {
    console.log("Aucun abonné WhatsApp actif.");
    return;
  }

  // Offres collectées depuis les 24 dernières heures
  const cutoff = new Date(Date.now() - 24 * 3600 * 1000).toISOString();
  const newJobs = jobs.filter(j => j.collectedAt && j.collectedAt > cutoff);

  if (!newJobs.length) {
    console.log("Aucune nouvelle offre depuis 24h — pas d'envoi.");
    return;
  }

  console.log(`📱 ${subscribers.length} abonnés, ${newJobs.length} nouvelles offres`);

  let sent = 0, skipped = 0;

  for (const sub of subscribers) {
    const phone = sub.phone.replace(/[\s+\-()]/g, "");

    // Ne pas renvoyer si déjà envoyé dans les 6h
    const lastSent = sentLog[phone];
    if (lastSent && Date.now() - new Date(lastSent).getTime() < 6 * 3600 * 1000) {
      skipped++;
      continue;
    }

    // Filtrer par préférences de l'abonné
    const relevant = newJobs.filter(job => {
      const cityOk = !sub.city || normalize(job.city).includes(normalize(sub.city));
      const catOk = !sub.category || normalize(job.category).includes(normalize(sub.category));
      const qOk = !sub.query || normalize(job.title + " " + job.category).includes(normalize(sub.query));
      return cityOk && catOk && qOk;
    });

    if (!relevant.length) { skipped++; continue; }

    const message = formatAlert(relevant, sub.city);
    const ok = await sendMessage(phone, message);

    if (ok) {
      sentLog[phone] = new Date().toISOString();
      sent++;
      console.log(`  ✅ ${phone} — ${relevant.length} offres`);
    } else {
      console.log(`  ❌ ${phone} — envoi échoué`);
    }

    // Rate limiting: 500ms entre chaque envoi
    await new Promise(r => setTimeout(r, 500));
  }

  await writeJson(SENT_LOG, sentLog);
  console.log(`\n✅ Alertes WhatsApp: ${sent} envoyées, ${skipped} ignorées`);
}

main().catch(e => { console.error(e); process.exitCode = 1; });
