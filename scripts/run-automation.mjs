import { spawn } from "node:child_process";
import {
  ROOT,
  acquireAutomationLock,
  readAutomationState,
  releaseAutomationLock,
  writeAutomationState,
} from "./automation-state.mjs";

const steps = [
  ["Collecte des sources", "scripts/jobfaso-scraper.mjs"],
  ["Curation et nettoyage", "scripts/curate-raw-items.mjs"],
  ["Generation SEO", "scripts/generate-seo-pages.mjs"],
  ["SEO pages statiques", "scripts/enhance-static-seo.mjs"],
  ["Generation croissance", "scripts/generate-growth-assets.mjs"],
  ["Export PostgreSQL", "scripts/export-postgres-seed.mjs"],
  ["Synchronisation DB locale", "scripts/sync-local-db.mjs"],
  ["Preparation reseaux sociaux", "scripts/generate-social-queue.mjs"],
];

async function runNodeScript(label, script, completedSteps) {
  return new Promise((resolve, reject) => {
    console.log(`\n== ${label} ==`);
    const child = spawn(process.execPath, [script], {
      cwd: ROOT,
      stdio: "inherit",
      shell: false,
    });

    child.on("exit", (code) => {
      if (code === 0) {
        completedSteps.push({ label, script, status: "success", finishedAt: new Date().toISOString() });
        resolve();
      } else {
        completedSteps.push({ label, script, status: "failed", finishedAt: new Date().toISOString() });
        reject(new Error(`${label} failed with exit code ${code}`));
      }
    });
  });
}

let previousState = {};

async function main() {
  const lockAcquired = await acquireAutomationLock();
  if (!lockAcquired) {
    console.log("Automation skipped: another run is already active.");
    return;
  }

  const startedAt = Date.now();
  previousState = await readAutomationState();
  const completedSteps = [];
  await writeAutomationState({
    status: "running",
    startedAt: new Date(startedAt).toISOString(),
    finishedAt: "",
    lastError: "",
    latestSteps: [],
    runCount: (previousState.runCount || 0) + 1,
  });

  for (const [label, script] of steps) {
    await writeAutomationState({ status: "running", currentStep: label, latestSteps: completedSteps });
    await runNodeScript(label, script, completedSteps);
  }

  const finishedAt = Date.now();
  await writeAutomationState({
    status: "success",
    currentStep: "",
    finishedAt: new Date(finishedAt).toISOString(),
    lastSuccessAt: new Date(finishedAt).toISOString(),
    durationMs: finishedAt - startedAt,
    successCount: (previousState.successCount || 0) + 1,
    latestSteps: completedSteps,
  });
  console.log("\nAutomation complete: raw data, curated jobs, SEO pages and sitemap are up to date.");
}

main().catch((error) => {
  console.error(error);
  writeAutomationState({
    status: "failed",
    finishedAt: new Date().toISOString(),
    lastErrorAt: new Date().toISOString(),
    lastError: error.message,
    failureCount: (previousState.failureCount || 0) + 1,
  }).finally(() => releaseAutomationLock());
  process.exitCode = 1;
}).finally(async () => {
  await releaseAutomationLock();
});
