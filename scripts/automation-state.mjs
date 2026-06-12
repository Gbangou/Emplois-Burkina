import { mkdir, readFile, rm, stat, writeFile } from "node:fs/promises";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

export const ROOT = fileURLToPath(new URL("..", import.meta.url));
export const RUNTIME_DIR = join(ROOT, "data", "runtime");
export const AUTOMATION_STATE_FILE = join(RUNTIME_DIR, "automation-state.json");
export const AUTOMATION_LOCK_FILE = join(RUNTIME_DIR, "automation.lock");

export async function readJson(file, fallback) {
  try {
    return JSON.parse(await readFile(file, "utf8"));
  } catch {
    return fallback;
  }
}

export async function writeJson(file, value) {
  await mkdir(dirname(file), { recursive: true });
  await writeFile(file, `${JSON.stringify(value, null, 2)}\n`, "utf8");
}

export async function readAutomationState() {
  return readJson(AUTOMATION_STATE_FILE, {
    status: "idle",
    startedAt: "",
    finishedAt: "",
    lastSuccessAt: "",
    lastErrorAt: "",
    lastError: "",
    durationMs: 0,
    runCount: 0,
    successCount: 0,
    failureCount: 0,
    latestSteps: [],
  });
}

export async function writeAutomationState(patch) {
  const previous = await readAutomationState();
  const next = { ...previous, ...patch, updatedAt: new Date().toISOString() };
  await writeJson(AUTOMATION_STATE_FILE, next);
  return next;
}

export async function acquireAutomationLock(maxAgeMs = 3 * 60 * 60 * 1000) {
  await mkdir(RUNTIME_DIR, { recursive: true });
  try {
    const lock = await stat(AUTOMATION_LOCK_FILE);
    if (Date.now() - lock.mtimeMs < maxAgeMs) return false;
  } catch {
    // No active lock.
  }
  await writeFile(AUTOMATION_LOCK_FILE, `${process.pid}\n${new Date().toISOString()}\n`, { flag: "w" });
  return true;
}

export async function releaseAutomationLock() {
  await rm(AUTOMATION_LOCK_FILE, { force: true });
}
