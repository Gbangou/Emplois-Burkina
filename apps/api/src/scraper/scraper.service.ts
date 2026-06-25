import { Injectable, Logger } from "@nestjs/common";
import { Cron, CronExpression } from "@nestjs/schedule";
import { spawn } from "node:child_process";
import { existsSync, readFileSync, writeFileSync, mkdirSync } from "node:fs";
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
      const { unlinkSync } = require("node:fs");
      unlinkSync(LOCK_FILE);
    } catch { /* already gone */ }
  }

  private runScript(label: string, script: string): Promise<void> {
    return new Promise((resolve, reject) => {
      this.logger.log(`[Scraper] ${label}…`);
      this.writeState({ currentStep: label });

      const child = spawn(process.execPath, [script], {
        cwd: ROOT,
        stdio: ["ignore", "pipe", "pipe"],
        shell: false
      });

      child.stdout?.on("data", (d: Buffer) => process.stdout.write(d));
      child.stderr?.on("data", (d: Buffer) => process.stderr.write(d));

      child.on("exit", (code) => {
        if (code === 0) resolve();
        else reject(new Error(`${label} exited with code ${code}`));
      });

      child.on("error", reject);
    });
  }

  async runPipeline(reason = "cron") {
    if (this.running || this.isLocked()) {
      this.logger.log(`[Scraper] Skip (${reason}) — already running`);
      return;
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
      currentStep: "démarrage"
    });

    try {
      for (const { label, script } of PIPELINE) {
        await this.runScript(label, script);
      }

      const now = new Date().toISOString();
      this.writeState({
        status: "success",
        lastSuccessAt: now,
        successCount: state.successCount + 1,
        currentStep: "",
        lastError: ""
      });
      this.logger.log(`[Scraper] Pipeline terminé avec succès`);
    } catch (err) {
      const msg = (err as Error).message;
      this.writeState({
        status: "failed",
        lastError: msg,
        failureCount: state.failureCount + 1,
        currentStep: ""
      });
      this.logger.error(`[Scraper] Pipeline échoué: ${msg}`);
    } finally {
      this.running = false;
      this.unlock();
    }
  }

  // Toutes les 45 minutes
  @Cron("0 */45 * * * *")
  async scheduledRun() {
    const next = new Date(Date.now() + 45 * 60 * 1000).toISOString();
    this.writeState({ nextRunAt: next });
    await this.runPipeline("cron-45min");
  }

  getState(): ScraperState {
    return this.readState();
  }
}
