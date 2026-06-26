import { readFile } from "node:fs/promises";
import { join } from "node:path";

export type AnalyticsEventType = "page_view" | "conversion_click" | "lead_submit";

export type AnalyticsEvent = {
  id: string;
  type: AnalyticsEventType;
  path: string;
  target?: string;
  source?: string;
  createdAt: string;
};

export type RevenueSignals = {
  totalEvents: number;
  pageViews: number;
  conversionClicks: number;
  leadSubmits: number;
  clickThroughRate: number;
  topPaths: { path: string; count: number }[];
  topTargets: { target: string; count: number }[];
  topSources: { source: string; count: number }[];
  nextActions: { title: string; reason: string; priority: "high" | "medium" | "low" }[];
};

const cwd = process.cwd().replace(/\\/g, "/");
const root = (cwd.endsWith("apps/web") || cwd.endsWith("apps\\web"))
  ? join(process.cwd(), "..", "..")
  : process.cwd();

export const ANALYTICS_EVENTS_PATH = join(root, "data/runtime/analytics-events.json");

async function readEvents(): Promise<AnalyticsEvent[]> {
  try {
    const content = await readFile(ANALYTICS_EVENTS_PATH, "utf8");
    return JSON.parse(content) as AnalyticsEvent[];
  } catch {
    return [];
  }
}

export async function getRevenueSignals(): Promise<RevenueSignals> {
  const events = await readEvents();
  const pageViews = events.filter((event) => event.type === "page_view");
  const conversionClicks = events.filter((event) => event.type === "conversion_click");
  const leadSubmits = events.filter((event) => event.type === "lead_submit");

  const topPaths = Array.from(
    pageViews.reduce((acc, event) => acc.set(event.path, (acc.get(event.path) || 0) + 1), new Map<string, number>()).entries()
  )
    .map(([path, count]) => ({ path, count }))
    .sort((a, b) => b.count - a.count)
    .slice(0, 5);

  const topTargets = Array.from(
    conversionClicks
      .filter((event) => Boolean(event.target))
      .reduce((acc, event) => acc.set(event.target!, (acc.get(event.target!) || 0) + 1), new Map<string, number>())
      .entries()
  )
    .map(([target, count]) => ({ target, count }))
    .sort((a, b) => b.count - a.count)
    .slice(0, 5);

  const topSources = Array.from(
    [...conversionClicks, ...leadSubmits]
      .filter((event) => Boolean(event.source))
      .reduce((acc, event) => acc.set(event.source!, (acc.get(event.source!) || 0) + 1), new Map<string, number>())
      .entries()
  )
    .map(([source, count]) => ({ source, count }))
    .sort((a, b) => b.count - a.count)
    .slice(0, 5);
  const nextActions = buildNextActions({
    pageViews: pageViews.length,
    conversionClicks: conversionClicks.length,
    leadSubmits: leadSubmits.length,
    clickThroughRate: pageViews.length ? Math.round((conversionClicks.length / pageViews.length) * 1000) / 10 : 0,
    topPaths,
    topTargets,
    topSources
  });

  return {
    totalEvents: events.length,
    pageViews: pageViews.length,
    conversionClicks: conversionClicks.length,
    leadSubmits: leadSubmits.length,
    clickThroughRate: pageViews.length ? Math.round((conversionClicks.length / pageViews.length) * 1000) / 10 : 0,
    topPaths,
    topTargets,
    topSources,
    nextActions
  };
}

function buildNextActions(input: {
  pageViews: number;
  conversionClicks: number;
  leadSubmits: number;
  clickThroughRate: number;
  topPaths: { path: string; count: number }[];
  topTargets: { target: string; count: number }[];
  topSources: { source: string; count: number }[];
}) {
  const actions: RevenueSignals["nextActions"] = [];

  if (input.pageViews < 100) {
    actions.push({
      title: "Augmenter la distribution des guides et pages marches",
      reason: "Le volume de donnees est encore faible. Priorite au trafic SEO, flux RSS, partage social et backlinks naturels.",
      priority: "high"
    });
  }

  if (input.pageViews >= 100 && input.clickThroughRate < 2) {
    actions.push({
      title: "Renforcer les CTA des pages a trafic",
      reason: "Les pages sont vues mais cliquent peu vers services, alertes ou recommandations. Tester des CTA plus visibles et plus contextuels.",
      priority: "high"
    });
  }

  const guideSource = input.topSources.find((source) => source.source.startsWith("guide_recommendation"));
  if (guideSource) {
    actions.push({
      title: "Dupliquer les recommandations qui cliquent dans les guides proches",
      reason: `${guideSource.source} genere deja des signaux. Repliquer l'angle sur les guides et pages marche connexes.`,
      priority: "medium"
    });
  }

  const alertTarget = input.topTargets.find((target) => target.target.startsWith("/alertes"));
  if (alertTarget) {
    actions.push({
      title: "Transformer les alertes en audience recurrente",
      reason: "Les alertes attirent des clics. Priorite a la segmentation WhatsApp, newsletter et relance automatique.",
      priority: "medium"
    });
  }

  const serviceTarget = input.topTargets.find((target) => target.target.startsWith("/services"));
  if (serviceTarget) {
    actions.push({
      title: "Prioriser le paiement Mobile Money pour les services",
      reason: "Les services recoivent des clics. Le prochain levier revenu est de reduire la friction paiement/livraison.",
      priority: "high"
    });
  }

  if (input.leadSubmits === 0 && input.conversionClicks > 0) {
    actions.push({
      title: "Verifier les formulaires et la promesse post-clic",
      reason: "Il y a des clics mais pas encore de leads. Simplifier les champs et clarifier la valeur immediate.",
      priority: "medium"
    });
  }

  if (actions.length === 0) {
    actions.push({
      title: "Continuer la collecte de signaux",
      reason: "Le systeme est pret. Les prochaines visites permettront d'identifier les pages et recommandations gagnantes.",
      priority: "low"
    });
  }

  return actions.slice(0, 4);
}
