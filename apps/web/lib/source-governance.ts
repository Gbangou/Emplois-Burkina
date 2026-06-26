import { readFile } from "node:fs/promises";
import { join } from "node:path";
import type { SourceDefinition, SourceExpansionSegment } from "@emplois-burkina/domain";

export type SourceGovernance = {
  totalSources: number;
  automatedSources: number;
  reviewRequiredSources: number;
  manualOnlySources: number;
  officialLinkSources: number;
  highPrioritySources: number;
  complianceScore: number;
  diversificationScore: number;
  sourceTypes: { type: string; count: number }[];
  collectionModes: { mode: string; count: number; guidance: string }[];
  segmentCoverage: {
    id: string;
    name: string;
    priority: SourceExpansionSegment["priority"];
    sourceCount: number;
    automationMode: SourceExpansionSegment["automationMode"];
    coverageGoal: string;
    nextMove: string;
  }[];
  expansionBacklog: {
    label: string;
    reason: string;
    safetyRule: string;
  }[];
};

const cwd = process.cwd().replace(/\\/g, "/");
const root = (cwd.endsWith("apps/web") || cwd.endsWith("apps\\web"))
  ? join(process.cwd(), "..", "..")
  : process.cwd();

async function readJson<T>(path: string, fallback: T): Promise<T> {
  try {
    const content = await readFile(join(root, path), "utf8");
    return JSON.parse(content) as T;
  } catch {
    return fallback;
  }
}

function countBy<T>(items: T[], getKey: (item: T) => string | undefined) {
  const counts = new Map<string, number>();
  for (const item of items) {
    const key = getKey(item) || "unknown";
    counts.set(key, (counts.get(key) || 0) + 1);
  }
  return Array.from(counts.entries())
    .map(([label, count]) => ({ label, count }))
    .sort((a, b) => b.count - a.count || a.label.localeCompare(b.label));
}

function collectionGuidance(mode: string) {
  if (mode === "manual_only") return "Veille ou partenariat uniquement";
  if (mode === "review_required") return "Collecte possible avec moderation";
  if (mode === "official_link") return "Resume court et lien officiel";
  if (mode === "automated") return "Automatisation prioritaire";
  return "Mode a clarifier avant extension";
}

function nextMoveForSegment(sourceCount: number, mode: SourceExpansionSegment["automationMode"]) {
  if (sourceCount === 0) return "Ajouter des sources officielles avant publication.";
  if (sourceCount < 4) return "Ajouter 3 a 5 sources verifiables et limiter la publication auto.";
  if (mode.includes("api")) return "Chercher API, RSS ou export partenaire pour fiabiliser la frequence.";
  if (mode.includes("intake")) return "Renforcer formulaires, relais terrain et moderation humaine.";
  return "Tester frequence de collecte et mesurer doublons, deadlines et erreurs.";
}

export async function getSourceGovernance(): Promise<SourceGovernance> {
  const [sources, segments] = await Promise.all([
    readJson<SourceDefinition[]>("data/sources.json", []),
    readJson<SourceExpansionSegment[]>("data/source-expansion-plan.json", [])
  ]);

  const manualOnlySources = sources.filter((source) => source.collection === "manual_only").length;
  const reviewRequiredSources = sources.filter((source) => source.collection === "review_required").length;
  const officialLinkSources = sources.filter((source) => source.collection === "official_link").length;
  const automatedSources = sources.filter((source) => source.collection !== "manual_only").length;
  const highPrioritySources = sources.filter((source) => Number(source.priority || 9) <= 2).length;
  const withIncludeRules = sources.filter((source) => Array.isArray(source.includeUrl) && source.includeUrl.length > 0).length;
  const withExcludeRules = sources.filter((source) => Array.isArray(source.excludeUrl)).length;
  const typedSources = new Set(sources.map((source) => source.type).filter(Boolean)).size;
  const complianceScore = sources.length
    ? Math.round(((withIncludeRules + withExcludeRules + officialLinkSources + reviewRequiredSources) / (sources.length * 3)) * 100)
    : 0;
  const diversificationScore = Math.min(100, Math.round(typedSources * 9 + highPrioritySources * 1.5 + sources.length * 0.35));

  const segmentCoverage = segments.map((segment) => {
    const sourceCount = sources.filter((source) => source.segments?.includes(segment.id)).length;
    return {
      id: segment.id,
      name: segment.name,
      priority: segment.priority,
      sourceCount,
      automationMode: segment.automationMode,
      coverageGoal: segment.coverageGoal,
      nextMove: nextMoveForSegment(sourceCount, segment.automationMode)
    };
  });

  return {
    totalSources: sources.length,
    automatedSources,
    reviewRequiredSources,
    manualOnlySources,
    officialLinkSources,
    highPrioritySources,
    complianceScore,
    diversificationScore,
    sourceTypes: countBy(sources, (source) => source.type).map(({ label, count }) => ({ type: label, count })),
    collectionModes: countBy(sources, (source) => source.collection).map(({ label, count }) => ({
      mode: label,
      count,
      guidance: collectionGuidance(label)
    })),
    segmentCoverage,
    expansionBacklog: [
      {
        label: "Sources officielles entreprise",
        reason: "Banques, telecoms, mines, cabinets et carrieres corporate ameliorent la qualite et la valeur recruteur.",
        safetyRule: "Preferer pages carrieres officielles, RSS, API ou accord partenaire."
      },
      {
        label: "Sources terrain informelles",
        reason: "Les petits boulots locaux peuvent creer beaucoup de trafic utile hors capitale.",
        safetyRule: "Collecte par formulaire/WhatsApp, validation admin et interdiction des frais candidat suspects."
      },
      {
        label: "Remote et tech international",
        reason: "Contenu a forte valeur pour diaspora, profils IT, formations et affiliation utile.",
        safetyRule: "Filtrer remote Afrique admissible et eviter extraction massive sur plateformes fermees."
      },
      {
        label: "Concours et institutions",
        reason: "Recherche recurrente, fort potentiel SEO et alerte WhatsApp.",
        safetyRule: "Resume court, lien officiel, dates d'ouverture/fermeture et source gouvernementale."
      }
    ]
  };
}
