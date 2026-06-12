import { mkdir, readFile, writeFile } from "node:fs/promises";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

const ROOT = fileURLToPath(new URL("..", import.meta.url));
const DATA_DIR = join(ROOT, "data");
const RUNTIME_DIR = join(DATA_DIR, "runtime");
const QUEUE_JSON = join(RUNTIME_DIR, "date-review-queue.json");
const QUEUE_MD = join(ROOT, "docs", "DATE_REVIEW_QUEUE.md");

async function readJson(path, fallback) {
  try {
    return JSON.parse(await readFile(path, "utf8"));
  } catch {
    return fallback;
  }
}

function priority(job) {
  if (job.status === "needs_review" && /ong|finance|terrain|btp|logistique/i.test(job.category || "")) return "high";
  if (job.sourceName === "LeFaso.net Recrutement" || job.sourceName === "UNjobs Burkina Faso") return "high";
  if (job.sourceName === "BFemploi") return "medium";
  return "normal";
}

function reason(job) {
  if (!job.closingDate && job.deadline && !/a verifier/i.test(job.deadline)) return "deadline_label_without_iso_date";
  if (!job.closingDate) return "missing_closing_date";
  if (job.inconsistentDates) return "inconsistent_dates";
  return "ok";
}

const [jobs, rawItems] = await Promise.all([
  readJson(join(DATA_DIR, "curated-jobs.json"), []),
  readJson(join(DATA_DIR, "raw-items.json"), []),
]);

const rawById = new Map(rawItems.map((item) => [item.id, item]));
const queue = jobs
  .filter((job) => !job.closingDate || job.inconsistentDates)
  .map((job) => {
    const raw = rawById.get(job.id) || {};
    return {
      id: job.id,
      title: job.title,
      sourceName: job.sourceName,
      sourceUrl: job.sourceUrl,
      category: job.category,
      city: job.city,
      openingDate: job.openingDate || "",
      deadline: job.deadline || "",
      reason: reason(job),
      priority: priority(job),
      excerptHint: String(raw.excerpt || job.excerpt || "").slice(0, 360),
      suggestedAction: "Ouvrir la source officielle, confirmer la date de cloture, puis mettre a jour data/curated-jobs.json ou la future moderation DB.",
    };
  })
  .sort((a, b) => {
    const rank = { high: 0, medium: 1, normal: 2 };
    return rank[a.priority] - rank[b.priority] || a.sourceName.localeCompare(b.sourceName, "fr");
  });

const markdown = `# File de revue des dates JobFaso

Genere le : ${new Date().toISOString()}

Total a verifier : ${queue.length}

## Priorites

${queue
  .map(
    (item, index) => `### ${index + 1}. ${item.title}

- Priorite : ${item.priority}
- Source : ${item.sourceName}
- Categorie : ${item.category}
- Ville : ${item.city}
- Raison : ${item.reason}
- Ouverture : ${item.openingDate || "A verifier"}
- Deadline actuelle : ${item.deadline || "A verifier"}
- Lien : ${item.sourceUrl}

Extrait :

> ${item.excerptHint || "Aucun extrait disponible."}
`,
  )
  .join("\n")}
`;

await mkdir(dirname(QUEUE_JSON), { recursive: true });
await mkdir(dirname(QUEUE_MD), { recursive: true });
await writeFile(QUEUE_JSON, `${JSON.stringify(queue, null, 2)}\n`, "utf8");
await writeFile(QUEUE_MD, markdown, "utf8");

console.log(`Date review queue generated: ${queue.length} item(s).`);
