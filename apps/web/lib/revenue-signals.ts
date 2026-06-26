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
  topPaths: { path: string; count: number }[];
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
  const topPaths = Array.from(
    events
      .filter((event) => event.type === "page_view")
      .reduce((acc, event) => acc.set(event.path, (acc.get(event.path) || 0) + 1), new Map<string, number>())
      .entries()
  )
    .map(([path, count]) => ({ path, count }))
    .sort((a, b) => b.count - a.count)
    .slice(0, 5);

  return {
    totalEvents: events.length,
    pageViews: events.filter((event) => event.type === "page_view").length,
    conversionClicks: events.filter((event) => event.type === "conversion_click").length,
    leadSubmits: events.filter((event) => event.type === "lead_submit").length,
    topPaths
  };
}
