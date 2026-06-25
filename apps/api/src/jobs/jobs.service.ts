import { Injectable, NotFoundException } from "@nestjs/common";
import type { JobOpportunity } from "@emplois-burkina/domain";
import { isPublishedJob, normalizeSearch } from "@emplois-burkina/domain";
import type { ModerateJobDto } from "./dto/moderate-job.dto";
import { JsonStore } from "../storage/json-store.service";

@Injectable()
export class JobsService {
  constructor(private readonly store: JsonStore) {}

  async allJobs() {
    return this.store.read<JobOpportunity[]>("data/curated-jobs.json", []);
  }

  async allPublished() {
    const jobs = await this.allJobs();
    return jobs.filter(isPublishedJob);
  }

  async moderationQueue(params: { limit?: number }) {
    const jobs = await this.allJobs();
    const limit = Math.min(Number(params.limit || 30), 100);

    return jobs
      .filter((job) => job.status === "needs_review" || (job.riskScore || 0) > 35 || (job.confidenceScore || 0) < 70)
      .sort((a, b) => {
        const riskDelta = (b.riskScore || 0) - (a.riskScore || 0);
        if (riskDelta) return riskDelta;
        return String(b.collectedAt || "").localeCompare(String(a.collectedAt || ""));
      })
      .slice(0, limit);
  }

  async list(params: { q?: string; city?: string; category?: string; limit?: number }) {
    const jobs = await this.allPublished();
    const q = normalizeSearch(params.q || "");
    const city = normalizeSearch(params.city || "");
    const category = normalizeSearch(params.category || "");
    const limit = Math.min(Number(params.limit || 50), 100);

    return jobs
      .filter((job) => {
        const text = normalizeSearch([job.title, job.company, job.city, job.category, job.type, ...(job.tags || [])].join(" "));
        return (!q || text.includes(q)) && (!city || normalizeSearch(job.city).includes(city)) && (!category || normalizeSearch(job.category).includes(category));
      })
      .slice(0, limit);
  }

  async moderate(id: string, dto: ModerateJobDto) {
    const jobs = await this.allJobs();
    const index = jobs.findIndex((job) => job.id === id);
    if (index < 0) throw new NotFoundException("Job not found");

    const current = jobs[index];
    if (!current) throw new NotFoundException("Job not found");

    const nextConfidence =
      dto.status === "validated" ? Math.max(current.confidenceScore || 0, 88) : current.confidenceScore;
    const nextRisk = dto.status === "rejected" ? Math.max(current.riskScore || 0, 75) : current.riskScore;

    const updated: JobOpportunity = {
      ...current,
      confidenceScore: nextConfidence,
      riskScore: nextRisk,
      status: dto.status,
      tags: dto.note ? Array.from(new Set([...(current.tags || []), `moderation:${dto.note}`])) : current.tags
    };

    jobs[index] = updated;
    await this.store.write("data/curated-jobs.json", jobs);

    return {
      ok: true,
      job: updated
    };
  }
}
