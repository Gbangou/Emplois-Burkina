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

  return {
    totalEvents: events.length,
    pageViews: pageViews.length,
    conversionClicks: conversionClicks.length,
    leadSubmits: leadSubmits.length,
    clickThroughRate: pageViews.length ? Math.round((conversionClicks.length / pageViews.length) * 1000) / 10 : 0,
    topPaths,
    topTargets,
    topSources
  };
}
