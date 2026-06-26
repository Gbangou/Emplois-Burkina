import { readFile } from "node:fs/promises";
import { join } from "node:path";
import type { SourceDefinition, SourceExpansionSegment } from "@emplois-burkina/domain";

export type ScrapingBusinessSegment = {
  id: string;
  name: string;
  priority: SourceExpansionSegment["priority"];
  sourceCount: number;
  automatedCount: number;
  manualCount: number;
  channelCount: number;
  monetizationScore: number;
  revenueAngle: string;
  nextAction: string;
};

export type ScrapingUpgradeCandidate = {
  id: string;
  name: string;
  type: string;
  priority: number;
  collection: string;
  reason: string;
};

export type ScrapingBusinessPlan = {
  generatedAt: string;
  totalSources: number;
  automatedSources: number;
  manualSources: number;
  seoReadySources: number;
  mobileReadySources: number;
  topSegments: ScrapingBusinessSegment[];
  upgradeCandidates: ScrapingUpgradeCandidate[];
  businessActions: string[];
};

const cwd = process.cwd().replace(/\\/g, "/");
const root = cwd.endsWith("apps/web") || cwd.endsWith("apps\\web") ? join(process.cwd(), "..", "..") : process.cwd();

async function readJson<T>(path: string, fallback: T): Promise<T> {
  try {
    const content = await readFile(join(root, path), "utf8");
    return JSON.parse(content) as T;
  } catch {
    return fallback;
  }
}

function priorityWeight(priority: SourceExpansionSegment["priority"]) {
  if (priority === "critical") return 38;
  if (priority === "high") return 28;
  if (priority === "medium") return 18;
  return 10;
}

function revenueAngle(segment: SourceExpansionSegment) {
  if (segment.id.includes("international") || segment.id.includes("global")) {
    return "SEO international, affiliation formations, services CV/anglais et alertes premium plus tard.";
  }
  if (segment.id.includes("informal") || segment.id.includes("local")) {
    return "Audience mobile WhatsApp/Facebook, volume local et confiance terrain avant toute monetisation.";
  }
  if (segment.id.includes("training")) {
    return "Affiliation utile, pages evergreen et recommandations de formations verifiables.";
  }
  if (segment.id.includes("competition")) {
    return "Trafic recurrent concours, guides, alertes et preparation dossier.";
  }
  return "Pages offres SEO, AdSense, services candidats et rapports marche anonymises.";
}

function nextAction(segment: SourceExpansionSegment, sourceCount: number, automatedCount: number) {
  if (sourceCount === 0) return "Ajouter des sources verifiables avant toute publication.";
  if (automatedCount === 0 && segment.automationMode.includes("feed")) return "Chercher flux RSS/API ou accord partenaire avant automatisation.";
  if (automatedCount === 0) return "Basculer 1 a 2 sources faibles risques en review_required avec garde-fous.";
  if (segment.channels.includes("whatsapp")) return "Brancher les meilleures offres au digest WhatsApp mobile apres moderation.";
  return "Produire pages SEO et liens vers services optionnels sur les offres fiables.";
}

function sourceMatchesSegment(source: SourceDefinition, segmentId: string) {
  const sourceSegments = source.segments || [];
  if (sourceSegments.includes(segmentId)) return true;

  const aliases: Record<string, string[]> = {
    international_ngo_un: ["international_onu", "consulting_remote"],
    global_tech: ["consulting_remote"],
    formal_burkina: ["formal_burkina"],
    informal_local: ["informal_local"],
    public_competitions: ["public_competitions"],
    corporate_direct: ["corporate_direct"],
    local_media_communes: ["local_media_communes"],
    training_scholarships: ["training_scholarships"]
  };

  return (aliases[segmentId] || []).some((alias) => sourceSegments.includes(alias));
}

export async function getScrapingBusinessPlan(): Promise<ScrapingBusinessPlan> {
  const [sources, segments] = await Promise.all([
    readJson<SourceDefinition[]>("data/sources.json", []),
    readJson<SourceExpansionSegment[]>("data/source-expansion-plan.json", [])
  ]);

  const automatedSources = sources.filter((source) => source.collection !== "manual_only");
  const mobileSourceTypes = new Set(["social_group", "community_channel", "informal_market", "local_government"]);

  const topSegments = segments
    .map((segment) => {
      const segmentSources = sources.filter((source) => sourceMatchesSegment(source, segment.id));
      const automatedCount = segmentSources.filter((source) => source.collection !== "manual_only").length;
      const manualCount = segmentSources.length - automatedCount;
      const channelScore = Math.min(24, segment.channels.length * 5);
      const automationScore = Math.min(24, automatedCount * 7 + (segment.automationMode.includes("api") ? 5 : 0));
      const coverageScore = Math.min(14, segmentSources.length * 2);

      return {
        id: segment.id,
        name: segment.name,
        priority: segment.priority,
        sourceCount: segmentSources.length,
        automatedCount,
        manualCount,
        channelCount: segment.channels.length,
        monetizationScore: Math.min(100, priorityWeight(segment.priority) + channelScore + automationScore + coverageScore),
        revenueAngle: revenueAngle(segment),
        nextAction: nextAction(segment, segmentSources.length, automatedCount)
      } satisfies ScrapingBusinessSegment;
    })
    .sort((a, b) => b.monetizationScore - a.monetizationScore)
    .slice(0, 6);

  const upgradeCandidates = sources
    .filter((source) => source.collection === "manual_only" && Number(source.priority || 9) <= 3)
    .filter((source) => !["social_group", "social_jobs", "freelance_platform"].includes(source.type))
    .sort((a, b) => Number(a.priority || 9) - Number(b.priority || 9))
    .slice(0, 6)
    .map((source) => ({
      id: source.id,
      name: source.name,
      type: source.type,
      priority: source.priority,
      collection: source.collection,
      reason: "Candidate a une veille semi-automatique avec revue humaine, attribution et limites de frequence."
    }));

  return {
    generatedAt: new Date().toISOString(),
    totalSources: sources.length,
    automatedSources: automatedSources.length,
    manualSources: sources.length - automatedSources.length,
    seoReadySources: sources.filter((source) => source.collection !== "manual_only" && source.includeUrl?.length).length,
    mobileReadySources: sources.filter((source) => mobileSourceTypes.has(source.type) || source.notes?.toLowerCase().includes("whatsapp")).length,
    topSegments,
    upgradeCandidates,
    businessActions: [
      "Prioriser les sources qui creent pages SEO indexables et offres a deadline claire.",
      "Garder Facebook, WhatsApp, LinkedIn et communautes en intake/moderation, pas en scraping sauvage.",
      "Relier chaque segment fort aux services CV, lettre, entretien et alertes mobile.",
      "Publier des digests mobiles courts pour transformer le scraping en audience recurrente."
    ]
  };
}
