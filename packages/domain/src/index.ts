export type JobStatus = "validated" | "needs_review" | "rejected";

export type JobOpportunity = {
  id: string;
  title: string;
  company: string;
  city: string;
  category: string;
  type: string;
  salary?: string;
  deadline?: string;
  openingDate?: string;
  closingDate?: string;
  sourceName?: string;
  sourceUrl?: string;
  confidenceScore?: number;
  riskScore?: number;
  tags?: string[];
  status?: JobStatus;
  excerpt?: string;
  collectedAt?: string;
};

export type ProductModule = {
  id: string;
  name: string;
  domain: string;
  status: "ready" | "in_progress" | "planned";
  priority: "critical" | "high" | "medium" | "low";
  backend: string;
  frontend: string;
  nextMilestone: string;
  acceptanceCriteria: string[];
};

export type BenchmarkItem = {
  id: string;
  reference: string;
  principle: string;
  emploisBurkinaMove: string;
  impact: string;
};

export type SourceCollectionMode = "review_required" | "manual_only" | "automated" | string;

export type SourceDefinition = {
  id: string;
  name: string;
  url: string;
  type: string;
  priority: number;
  collection: SourceCollectionMode;
  includeUrl?: string[];
  excludeUrl?: string[];
  notes?: string;
  segments?: string[];
};

export type RawScrapedItem = {
  id: string;
  sourceId?: string;
  sourceName?: string;
  title?: string;
  status?: JobStatus;
  closingDate?: string;
  collectedAt?: string;
  detailExtractedAt?: string;
};

export type SourceHealth = {
  id: string;
  name: string;
  type: string;
  collection: SourceCollectionMode;
  priority: number;
  rawItems: number;
  publishedJobs: number;
  reviewedJobs: number;
  deadlineReady: number;
  confidenceAverage: number;
  healthScore: number;
  status: "excellent" | "stable" | "watch" | "manual";
  nextAction: string;
};

export type ScrapingOverview = {
  rawItems: number;
  publishedJobs: number;
  sources: number;
  automatedSources: number;
  reviewQueue: number;
  deadlineReady: number;
  confidenceAverage: number;
  healthAverage: number;
  topSources: SourceHealth[];
  watchSources: SourceHealth[];
};

export type SourceExpansionSegment = {
  id: string;
  name: string;
  priority: "critical" | "high" | "medium" | "low";
  coverageGoal: string;
  sourceExamples: string[];
  automationMode: "scrape_review_publish" | "intake_moderate_publish" | "feed_scrape_review_publish" | "api_feed_scrape_review_publish";
  channels: string[];
  qualityRules: string[];
};

export type PublicationQueueItem = {
  id: string;
  title: string;
  company: string;
  segment: string;
  channels: string[];
  confidenceScore: number;
  readinessScore: number;
  action: "auto_publish" | "schedule_digest" | "needs_moderation";
  reason: string;
};

export type PublicationBatchItem = PublicationQueueItem & {
  deliveryStatus: "queued" | "published" | "failed";
  queuedAt: string;
};

export type PublicationBatch = {
  id: string;
  createdAt: string;
  status: "queued" | "running" | "completed";
  channelCount: number;
  itemCount: number;
  items: PublicationBatchItem[];
};

export type AutomationOverview = {
  readyToPublish: number;
  needsModeration: number;
  digestCandidates: number;
  channels: string[];
  segments: SourceExpansionSegment[];
  queue: PublicationQueueItem[];
};

export type PlatformSummary = {
  jobs: number;
  trustedSources: number;
  deadlineReady: number;
  categories: string[];
  cities: string[];
};

export type IntelligenceSignal = {
  label: string;
  value: number;
  share: number;
  score: number;
};

export type IntelligenceRisk = {
  label: string;
  count: number;
  severity: "low" | "medium" | "high";
  action: string;
};

export type MarketIntelligence = {
  generatedAt: string;
  marketHeatScore: number;
  monetizationScore: number;
  candidateValueScore: number;
  topCategories: IntelligenceSignal[];
  topCities: IntelligenceSignal[];
  hotSources: IntelligenceSignal[];
  urgentJobs: number;
  trustedJobs: number;
  riskQueue: IntelligenceRisk[];
  recommendedActions: string[];
};

export function normalizeSearch(value = "") {
  return value
    .toLowerCase()
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .trim();
}

export function isPublishedJob(job: JobOpportunity) {
  return job.status !== "rejected";
}

export function buildPlatformSummary(jobs: JobOpportunity[]): PlatformSummary {
  const published = jobs.filter(isPublishedJob);
  const categories = Array.from(new Set(published.map((job) => job.category).filter(Boolean))).sort();
  const cities = Array.from(new Set(published.map((job) => job.city).filter(Boolean))).sort();

  return {
    jobs: published.length,
    trustedSources: new Set(published.map((job) => job.sourceName).filter(Boolean)).size,
    deadlineReady: published.filter((job) => Boolean(job.closingDate)).length,
    categories,
    cities,
  };
}

export function buildScrapingOverview(
  sources: SourceDefinition[],
  jobs: JobOpportunity[],
  rawItems: RawScrapedItem[]
): ScrapingOverview {
  const published = jobs.filter(isPublishedJob);
  const confidenceScores = published.map((job) => job.confidenceScore || 0).filter((score) => score > 0);
  const confidenceAverage = confidenceScores.length
    ? Math.round(confidenceScores.reduce((sum, score) => sum + score, 0) / confidenceScores.length)
    : 0;

  const sourceHealth = sources
    .map((source) => {
      const rawForSource = rawItems.filter((item) => item.sourceId === source.id || item.sourceName === source.name);
      const jobsForSource = published.filter((job) => job.sourceName === source.name);
      const reviewedJobs = jobsForSource.filter((job) => job.status === "validated").length;
      const deadlineReady = jobsForSource.filter((job) => Boolean(job.closingDate)).length;
      const scores = jobsForSource.map((job) => job.confidenceScore || 0).filter((score) => score > 0);
      const confidence = scores.length ? Math.round(scores.reduce((sum, score) => sum + score, 0) / scores.length) : 0;
      const collectionScore = source.collection === "manual_only" ? 46 : source.collection === "review_required" ? 72 : 82;
      const volumeScore = Math.min(100, rawForSource.length * 4 + jobsForSource.length * 8);
      const deadlineScore = jobsForSource.length ? Math.round((deadlineReady / jobsForSource.length) * 100) : 0;
      const healthScore = Math.round(collectionScore * 0.28 + volumeScore * 0.28 + confidence * 0.28 + deadlineScore * 0.16);
      const status =
        source.collection === "manual_only" ? "manual" : healthScore >= 78 ? "excellent" : healthScore >= 62 ? "stable" : "watch";
      const nextAction =
        status === "excellent"
          ? "Augmenter la frequence et surveiller les doublons."
          : status === "stable"
            ? "Optimiser les dates, titres et attribution source."
            : status === "manual"
              ? "Garder en veille ou negocier un acces partenaire."
              : "Revoir selecteurs, robots.txt et qualite des pages collectees.";

      return {
        id: source.id,
        name: source.name,
        type: source.type,
        collection: source.collection,
        priority: source.priority,
        rawItems: rawForSource.length,
        publishedJobs: jobsForSource.length,
        reviewedJobs,
        deadlineReady,
        confidenceAverage: confidence,
        healthScore,
        status,
        nextAction,
      } satisfies SourceHealth;
    })
    .sort((a, b) => b.healthScore - a.healthScore);

  const healthAverage = sourceHealth.length
    ? Math.round(sourceHealth.reduce((sum, source) => sum + source.healthScore, 0) / sourceHealth.length)
    : 0;

  return {
    rawItems: rawItems.length,
    publishedJobs: published.length,
    sources: sources.length,
    automatedSources: sources.filter((source) => source.collection !== "manual_only").length,
    reviewQueue: published.filter((job) => job.status === "needs_review").length,
    deadlineReady: published.filter((job) => Boolean(job.closingDate)).length,
    confidenceAverage,
    healthAverage,
    topSources: sourceHealth.slice(0, 6),
    watchSources: sourceHealth.filter((source) => source.status === "watch" || source.status === "manual").slice(0, 8),
  };
}

function inferSegment(job: JobOpportunity) {
  const text = normalizeSearch([job.title, job.company, job.category, job.type, job.city, ...(job.tags || [])].join(" "));
  if (text.includes("onu") || text.includes("un ") || text.includes("undp") || text.includes("unicef") || text.includes("ong")) {
    return "international_ngo_un";
  }
  if (
    text.includes("developpeur") ||
    text.includes("developer") ||
    text.includes("data") ||
    text.includes("cloud") ||
    text.includes("cyber") ||
    text.includes("informatique") ||
    text.includes("it ")
  ) {
    return "global_tech";
  }
  if (text.includes("concours") || text.includes("stage") || text.includes("bourse") || text.includes("candidature")) {
    return "public_competitions";
  }
  if (text.includes("chauffeur") || text.includes("commerce") || text.includes("chantier") || text.includes("serveur")) {
    return "informal_local";
  }
  return "formal_burkina";
}

function channelSet(segments: SourceExpansionSegment[], segmentId: string) {
  const segment = segments.find((item) => item.id === segmentId);
  return segment?.channels || ["catalogue", "seo"];
}

export function buildAutomationOverview(
  jobs: JobOpportunity[],
  segments: SourceExpansionSegment[]
): AutomationOverview {
  const published = jobs.filter(isPublishedJob);
  const queue = published
    .slice()
    .sort((a, b) => (b.confidenceScore || 0) - (a.confidenceScore || 0))
    .slice(0, 40)
    .map((job) => {
      const segment = inferSegment(job);
      const hasDeadline = Boolean(job.closingDate);
      const confidence = job.confidenceScore || 0;
      const readinessScore = Math.min(100, confidence + (hasDeadline ? 8 : -12) - (job.status === "needs_review" ? 18 : 0));
      const action =
        job.status === "needs_review" || readinessScore < 72
          ? "needs_moderation"
          : readinessScore >= 88
            ? "auto_publish"
            : "schedule_digest";
      const reason =
        action === "auto_publish"
          ? "Confiance forte, source exploitable et diffusion multi-canal possible."
          : action === "schedule_digest"
            ? "Bonne offre a integrer dans un digest ou une alerte segmentee."
            : "Validation humaine requise avant publication automatique.";

      return {
        id: job.id,
        title: job.title,
        company: job.company || "Organisation a verifier",
        segment,
        channels: channelSet(segments, segment),
        confidenceScore: confidence,
        readinessScore,
        action,
        reason,
      } satisfies PublicationQueueItem;
    });

  return {
    readyToPublish: queue.filter((item) => item.action === "auto_publish").length,
    needsModeration: queue.filter((item) => item.action === "needs_moderation").length,
    digestCandidates: queue.filter((item) => item.action === "schedule_digest").length,
    channels: Array.from(new Set(segments.flatMap((segment) => segment.channels))).sort(),
    segments,
    queue,
  };
}

function increment(map: Map<string, number>, key?: string) {
  const normalized = key?.trim();
  if (!normalized) return;
  map.set(normalized, (map.get(normalized) || 0) + 1);
}

function topSignals(map: Map<string, number>, total: number, limit = 5): IntelligenceSignal[] {
  return Array.from(map.entries())
    .sort((a, b) => b[1] - a[1] || a[0].localeCompare(b[0]))
    .slice(0, limit)
    .map(([label, value]) => {
      const share = total ? Math.round((value / total) * 100) : 0;
      return {
        label,
        value,
        share,
        score: Math.min(100, Math.round(share * 0.7 + value * 7)),
      };
    });
}

function daysUntil(value?: string) {
  if (!value) return null;
  const date = new Date(value);
  if (Number.isNaN(date.getTime())) return null;
  return Math.ceil((date.getTime() - Date.now()) / 86400000);
}

function clampScore(value: number) {
  return Math.max(0, Math.min(100, Math.round(value)));
}

export function buildMarketIntelligence(jobs: JobOpportunity[]): MarketIntelligence {
  const published = jobs.filter(isPublishedJob);
  const total = published.length;
  const categories = new Map<string, number>();
  const cities = new Map<string, number>();
  const sources = new Map<string, number>();
  let trustedJobs = 0;
  let urgentJobs = 0;
  let jobsWithDeadline = 0;
  let missingDeadline = 0;
  let highRisk = 0;
  let needsReview = 0;

  for (const job of published) {
    increment(categories, job.category || "A classer");
    increment(cities, job.city || "Burkina Faso");
    increment(sources, job.sourceName || "Source a verifier");

    if ((job.confidenceScore || 0) >= 80 && (job.riskScore || 0) <= 20) trustedJobs += 1;
    if (job.status === "needs_review") needsReview += 1;
    if ((job.riskScore || 0) >= 45) highRisk += 1;

    const days = daysUntil(job.closingDate || job.deadline);
    if (days === null) {
      missingDeadline += 1;
    } else {
      jobsWithDeadline += 1;
      if (days >= 0 && days <= 7) urgentJobs += 1;
    }
  }

  const trustedShare = total ? trustedJobs / total : 0;
  const deadlineShare = total ? jobsWithDeadline / total : 0;
  const reviewPenalty = total ? needsReview / total : 0;
  const sourceDiversity = Math.min(1, sources.size / 12);
  const cityDiversity = Math.min(1, cities.size / 8);

  const marketHeatScore = clampScore(total * 2.2 + urgentJobs * 4 + sourceDiversity * 28 + cityDiversity * 18);
  const candidateValueScore = clampScore(trustedShare * 42 + deadlineShare * 34 + sourceDiversity * 18 - reviewPenalty * 22 + 18);
  const monetizationScore = clampScore(total * 1.4 + trustedShare * 24 + categories.size * 3 + urgentJobs * 3 + sourceDiversity * 18);

  const riskQueue: IntelligenceRisk[] = [];
  if (missingDeadline > 0) {
    riskQueue.push({
      label: "Offres sans deadline",
      count: missingDeadline,
      severity: missingDeadline > total * 0.35 ? "high" : "medium",
      action: "Prioriser la revue des dates avant alertes WhatsApp et sponsorisation.",
    });
  }
  if (needsReview > 0) {
    riskQueue.push({
      label: "Offres en moderation",
      count: needsReview,
      severity: needsReview > total * 0.25 ? "high" : "medium",
      action: "Valider ou rejeter les offres avant diffusion multi-canal.",
    });
  }
  if (highRisk > 0) {
    riskQueue.push({
      label: "Risque antifraude",
      count: highRisk,
      severity: "high",
      action: "Verifier source, contact, salaire et lien officiel.",
    });
  }
  if (!riskQueue.length) {
    riskQueue.push({
      label: "Qualite controlee",
      count: trustedJobs,
      severity: "low",
      action: "Augmenter la diffusion et tester des packs recruteurs sponsorises.",
    });
  }

  const topCategories = topSignals(categories, total);
  const topCities = topSignals(cities, total);
  const hotSources = topSignals(sources, total);
  const leadingCategory = topCategories[0]?.label || "les offres verifiees";
  const leadingCity = topCities[0]?.label || "Ouagadougou";

  return {
    generatedAt: new Date().toISOString(),
    marketHeatScore,
    monetizationScore,
    candidateValueScore,
    topCategories,
    topCities,
    hotSources,
    urgentJobs,
    trustedJobs,
    riskQueue,
    recommendedActions: [
      `Creer une campagne WhatsApp ciblee sur ${leadingCategory} a ${leadingCity}.`,
      "Transformer les sources les plus chaudes en partenariats de diffusion propres.",
      "Publier un digest marche hebdomadaire pour recruteurs et centres de formation.",
      "Tester une offre sponsorisee sur les categories a forte demande.",
    ],
  };
}
