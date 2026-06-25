import { Injectable } from "@nestjs/common";
import { randomUUID } from "node:crypto";
import type {
  BenchmarkItem,
  ProductModule,
  PublicationBatch,
  RawScrapedItem,
  SourceDefinition,
  SourceExpansionSegment
} from "@emplois-burkina/domain";
import { buildAutomationOverview, buildMarketIntelligence, buildPlatformSummary, buildScrapingOverview } from "@emplois-burkina/domain";
import { JobsService } from "../jobs/jobs.service";
import { JsonStore } from "../storage/json-store.service";

@Injectable()
export class PlatformService {
  constructor(
    private readonly jobs: JobsService,
    private readonly store: JsonStore
  ) {}

  async overview() {
    const [jobs, modules, benchmark, sources, rawItems, sourceSegments] = await Promise.all([
      this.jobs.allPublished(),
      this.store.read<ProductModule[]>("data/product-modules.json", []),
      this.store.read<BenchmarkItem[]>("data/product-benchmark.json", []),
      this.store.read<SourceDefinition[]>("data/sources.json", []),
      this.store.read<RawScrapedItem[]>("data/raw-items.json", []),
      this.store.read<SourceExpansionSegment[]>("data/source-expansion-plan.json", [])
    ]);

    return {
      automation: buildAutomationOverview(jobs, sourceSegments),
      benchmark,
      intelligence: buildMarketIntelligence(jobs),
      scraping: buildScrapingOverview(sources, jobs, rawItems),
      summary: buildPlatformSummary(jobs),
      modules,
      generatedAt: new Date().toISOString()
    };
  }

  async scrapingOverview() {
    const [jobs, sources, rawItems] = await Promise.all([
      this.jobs.allPublished(),
      this.store.read<SourceDefinition[]>("data/sources.json", []),
      this.store.read<RawScrapedItem[]>("data/raw-items.json", [])
    ]);

    return {
      ...buildScrapingOverview(sources, jobs, rawItems),
      generatedAt: new Date().toISOString()
    };
  }

  async automationOverview() {
    const [jobs, sourceSegments] = await Promise.all([
      this.jobs.allPublished(),
      this.store.read<SourceExpansionSegment[]>("data/source-expansion-plan.json", [])
    ]);

    return {
      ...buildAutomationOverview(jobs, sourceSegments),
      generatedAt: new Date().toISOString()
    };
  }

  async publicationBatches() {
    return this.store.read<PublicationBatch[]>("data/runtime/publication-batches.json", []);
  }

  async intelligence() {
    const jobs = await this.jobs.allPublished();
    return buildMarketIntelligence(jobs);
  }

  async createPublicationBatch() {
    const [jobs, sourceSegments, existing] = await Promise.all([
      this.jobs.allPublished(),
      this.store.read<SourceExpansionSegment[]>("data/source-expansion-plan.json", []),
      this.publicationBatches()
    ]);
    const automation = buildAutomationOverview(jobs, sourceSegments);
    const now = new Date().toISOString();
    const items = automation.queue
      .filter((item) => item.action !== "needs_moderation")
      .slice(0, 24)
      .map((item) => ({
        ...item,
        deliveryStatus: "queued" as const,
        queuedAt: now
      }));

    const batch: PublicationBatch = {
      id: randomUUID(),
      createdAt: now,
      status: "queued",
      channelCount: new Set(items.flatMap((item) => item.channels)).size,
      itemCount: items.length,
      items
    };

    await this.store.write("data/runtime/publication-batches.json", [batch, ...existing].slice(0, 100));

    return {
      ok: true,
      batch
    };
  }
}
