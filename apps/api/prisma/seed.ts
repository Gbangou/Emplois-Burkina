import { PrismaClient } from "@prisma/client";
import { readFileSync } from "node:fs";
import { join } from "node:path";

const prisma = new PrismaClient();

type RawJob = {
  id?: string;
  title?: string;
  company?: string;
  city?: string;
  category?: string;
  type?: string;
  salary?: string;
  deadline?: string;
  openingDate?: string;
  closingDate?: string;
  sourceName?: string;
  sourceUrl?: string;
  confidenceScore?: number;
  riskScore?: number;
  tags?: string[];
  status?: string;
  excerpt?: string;
  collectedAt?: string;
};

type RawSource = {
  id?: string;
  name?: string;
  url?: string;
  type?: string;
  collection?: string;
  priority?: number;
  notes?: string;
};

function readJson<T>(path: string, fallback: T): T {
  try {
    return JSON.parse(readFileSync(path, "utf8")) as T;
  } catch {
    return fallback;
  }
}

function mapStatus(status?: string) {
  if (status === "validated") return "VALIDATED";
  if (status === "rejected") return "REJECTED";
  return "NEEDS_REVIEW";
}

async function main() {
  const root = join(__dirname, "..", "..", "..");
  const jobs = readJson<RawJob[]>(join(root, "data/curated-jobs.json"), []);
  const sources = readJson<RawSource[]>(join(root, "data/sources.json"), []);

  console.log(`Seeding ${jobs.length} jobs and ${sources.length} sources…`);

  for (const job of jobs.slice(0, 200)) {
    await prisma.job.upsert({
      where: { externalId: job.id || `ext_${Math.random()}` },
      create: {
        externalId: job.id,
        title: job.title || "Sans titre",
        company: job.company,
        city: job.city,
        category: job.category,
        type: job.type,
        salary: job.salary,
        deadline: job.deadline,
        openingDate: job.openingDate,
        closingDate: job.closingDate,
        sourceName: job.sourceName,
        sourceUrl: job.sourceUrl,
        confidenceScore: job.confidenceScore ?? 70,
        riskScore: job.riskScore ?? 0,
        tags: job.tags ?? [],
        status: mapStatus(job.status) as "VALIDATED" | "NEEDS_REVIEW" | "REJECTED",
        excerpt: job.excerpt,
        collectedAt: job.collectedAt ? new Date(job.collectedAt) : null
      },
      update: {
        title: job.title || "Sans titre",
        confidenceScore: job.confidenceScore ?? 70,
        status: mapStatus(job.status) as "VALIDATED" | "NEEDS_REVIEW" | "REJECTED"
      }
    });
  }

  for (const source of sources) {
    await prisma.source.upsert({
      where: { externalId: source.id || source.name || "unknown" },
      create: {
        externalId: source.id,
        name: source.name || "Source inconnue",
        url: source.url || "",
        type: source.type || "web",
        collection: source.collection || "manual_only",
        priority: source.priority ?? 5,
        notes: source.notes
      },
      update: {
        name: source.name || "Source inconnue",
        priority: source.priority ?? 5
      }
    });
  }

  console.log("Seed terminé.");
}

main()
  .catch((e) => { console.error(e); process.exit(1); })
  .finally(() => prisma.$disconnect());
