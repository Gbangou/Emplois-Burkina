import { Injectable, Logger } from "@nestjs/common";
import { Cron, CronExpression } from "@nestjs/schedule";
import { spawn } from "node:child_process";
import { existsSync, readFileSync, writeFileSync, mkdirSync, unlinkSync } from "node:fs";
import { join } from "node:path";

const ROOT = join(__dirname, "..", "..", "..", "..");
const STATE_FILE = join(ROOT, "data", "runtime", "scraper-state.json");
const LOCK_FILE = join(ROOT, "data", "runtime", "scraper.lock");

type ScraperState = {
  status: "idle" | "running" | "success" | "failed";
  lastRunAt?: string;
  lastSuccessAt?: string;
  lastError?: string;
  runCount: number;
  successCount: number;
  failureCount: number;
  nextRunAt?: string;
  currentStep?: string;
  currentReason?: string;
  startedAt?: string;
  finishedAt?: string;
  durationMs?: number;
  steps?: ScraperStepState[];
  summary?: ScraperSummary;
};

type ScraperStepState = {
  label: string;
  script: string;
  status: "pending" | "running" | "success" | "failed";
  startedAt?: string;
  finishedAt?: string;
  durationMs?: number;
  error?: string;
};

type ScraperSummary = {
  curatedJobs: number;
  rawItems: number;
  sources: number;
  validatedJobs: number;
  reviewJobs: number;
  generatedAt: string;
  stale: boolean;
  freshnessMinutes?: number;
};

const PIPELINE = [
  { label: "Collecte sources locales", script: "scripts/emplois-burkina-scraper.mjs" },
  { label: "Collecte feeds internationaux", script: "scripts/international-feeds-scraper.mjs" },
  { label: "Curation et nettoyage", script: "scripts/curate-raw-items.mjs" },
  { label: "Envoi alertes WhatsApp", script: "scripts/send-whatsapp-alerts.mjs" },
  { label: "Generation assets SEO", script: "scripts/generate-seo-pages.mjs" },
  { label: "Queue reseaux sociaux", script: "scripts/generate-social-queue.mjs" },
  { label: "Rapport automation", script: "scripts/generate-automation-report.mjs" }
];

function emptySteps(): ScraperStepState[] {
  return PIPELINE.map((step) => ({ ...step, status: "pending" }));
}

@Injectable()
export class ScraperService {
  private readonly logger = new Logger(ScraperService.name);
  private running = false;

  private readState(): ScraperState {
    try {
      return JSON.parse(readFileSync(STATE_FILE, "utf8")) as ScraperState;
    } catch {
      return { status: "idle", runCount: 0, successCount: 0, failureCount: 0 };
    }
  }

  private writeState(patch: Partial<ScraperState>) {
    try {
      mkdirSync(join(ROOT, "data", "runtime"), { recursive: true });
      const current = this.readState();
      writeFileSync(STATE_FILE, JSON.stringify({ ...current, ...patch }, null, 2), "utf8");
    } catch (err) {
      this.logger.warn(`Could not write scraper state: ${(err as Error).message}`);
    }
  }

  private isLocked(): boolean {
    return existsSync(LOCK_FILE);
  }

  private lock() {
    mkdirSync(join(ROOT, "data", "runtime"), { recursive: true });
    writeFileSync(LOCK_FILE, new Date().toISOString(), "utf8");
  }

  private unlock() {
    try {
      unlinkSync(LOCK_FILE);
    } catch { /* already gone */ }
  }

  private readJsonArray(path: string): unknown[] {
    try {
      const parsed = JSON.parse(readFileSync(join(ROOT, path), "utf8")) as unknown;
      return Array.isArray(parsed) ? parsed : [];
    } catch {
      return [];
    }
  }

  private buildSummary(lastSuccessAt?: string): ScraperSummary {
    const jobs = this.readJsonArray(join("data", "curated-jobs.json")) as Array<{ status?: string }>;
    const rawItems = this.readJsonArray(join("data", "raw-items.json"));
    const sources = this.readJsonArray(join("data", "sources.json"));
    const lastSuccess = lastSuccessAt ? new Date(lastSuccessAt).getTime() : 0;
    const freshnessMinutes = lastSuccess ? Math.round((Date.now() - lastSuccess) / 60000) : undefined;

    return {
      curatedJobs: jobs.length,
      rawItems: rawItems.length,
      sources: sources.length,
      validatedJobs: jobs.filter((job) => job.status === "validated").length,
      reviewJobs: jobs.filter((job) => job.status === "needs_review").length,
      generatedAt: new Date().toISOString(),
      stale: freshnessMinutes === undefined || freshnessMinutes > 180,
      freshnessMinutes
    };
  }

  private updateStep(label: string, patch: Partial<ScraperStepState>) {
    const state = this.readState();
    const steps = state.steps?.length ? state.steps : emptySteps();
    this.writeState({
      steps: steps.map((step) => step.label === label ? { ...step, ...patch } : step)
    });
  }

  private runScript(label: string, script: string): Promise<void> {
    return new Promise((resolve, reject) => {
      this.logger.log(`[Scraper] ${label}…`);
      const startedAt = new Date().toISOString();
      this.writeState({ currentStep: label });
      this.updateStep(label, { status: "running", startedAt, error: "" });

      const child = spawn(process.execPath, [script], {
        cwd: ROOT,
        stdio: ["ignore", "pipe", "pipe"],
        shell: false
      });

      child.stdout?.on("data", (d: Buffer) => process.stdout.write(d));
      child.stderr?.on("data", (d: Buffer) => process.stderr.write(d));

      child.on("exit", (code) => {
        const finishedAt = new Date().toISOString();
        const durationMs = new Date(finishedAt).getTime() - new Date(startedAt).getTime();
        if (code === 0) {
          this.updateStep(label, { status: "success", finishedAt, durationMs });
          resolve();
        } else {
          const error = `${label} exited with code ${code}`;
          this.updateStep(label, { status: "failed", finishedAt, durationMs, error });
          reject(new Error(error));
        }
      });

      child.on("error", (error) => {
        const finishedAt = new Date().toISOString();
        this.updateStep(label, {
          status: "failed",
          finishedAt,
          durationMs: new Date(finishedAt).getTime() - new Date(startedAt).getTime(),
          error: error.message
        });
        reject(error);
      });
    });
  }

  async runPipeline(reason = "cron"): Promise<{ started: boolean; reason: string; state: ScraperState }> {
    if (this.running || this.isLocked()) {
      this.logger.log(`[Scraper] Skip (${reason}) — already running`);
      return { started: false, reason: "already_running", state: this.getState() };
    }

    this.running = true;
    this.lock();
    const state = this.readState();
    const startedAt = new Date().toISOString();

    this.logger.log(`[Scraper] Pipeline started (${reason})`);
    this.writeState({
      status: "running",
      lastRunAt: startedAt,
      runCount: state.runCount + 1,
      currentStep: "demarrage",
      currentReason: reason,
      startedAt,
      finishedAt: "",
      durationMs: 0,
      steps: emptySteps(),
      summary: this.buildSummary(state.lastSuccessAt)
    });

    try {
      for (const { label, script } of PIPELINE) {
        await this.runScript(label, script);
      }

      const now = new Date().toISOString();
      const durationMs = new Date(now).getTime() - new Date(startedAt).getTime();
      this.writeState({
        status: "success",
        lastSuccessAt: now,
        successCount: state.successCount + 1,
        currentStep: "",
        lastError: "",
        finishedAt: now,
        durationMs,
        summary: this.buildSummary(now)
      });
      this.logger.log(`[Scraper] Pipeline terminé avec succès`);
    } catch (err) {
      const msg = (err as Error).message;
      const now = new Date().toISOString();
      this.writeState({
        status: "failed",
        lastError: msg,
        failureCount: state.failureCount + 1,
        currentStep: "",
        finishedAt: now,
        durationMs: new Date(now).getTime() - new Date(startedAt).getTime(),
        summary: this.buildSummary(state.lastSuccessAt)
      });
      this.logger.error(`[Scraper] Pipeline échoué: ${msg}`);
    } finally {
      this.running = false;
      this.unlock();
    }

    return { started: true, reason, state: this.getState() };
  }

  // Toutes les 45 minutes
  @Cron("0 */45 * * * *")
  async scheduledRun() {
    const next = new Date(Date.now() + 45 * 60 * 1000).toISOString();
    this.writeState({ nextRunAt: next });
    await this.runPipeline("cron-45min");
  }

  getState(): ScraperState {
    const state = this.readState();
    return {
      ...state,
      steps: state.steps?.length ? state.steps : emptySteps(),
      summary: state.summary || this.buildSummary(state.lastSuccessAt)
    };
  }

  canStart() {
    return !this.running && !this.isLocked();
  }
}
