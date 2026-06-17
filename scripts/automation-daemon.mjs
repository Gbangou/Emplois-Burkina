import { spawn } from "node:child_process";
import { ROOT, readAutomationState, writeAutomationState } from "./automation-state.mjs";

const intervalMinutes = Math.max(5, Number(process.env.JOBFASO_AUTOMATION_INTERVAL_MINUTES || 30));
const runOnStart = process.env.JOBFASO_AUTOMATION_RUN_ON_START !== "false";
const intervalMs = intervalMinutes * 60 * 1000;

let activeChild = null;

function runAutomation(reason) {
  if (activeChild) {
    console.log(`Automation daemon: skipped ${reason}, run already active.`);
    return;
  }

  console.log(`Automation daemon: starting run (${reason}) at ${new Date().toISOString()}`);
  activeChild = spawn(process.execPath, ["scripts/run-automation.mjs"], {
    cwd: ROOT,
    stdio: "inherit",
    shell: false,
  });

  activeChild.on("exit", async (code) => {
    console.log(`Automation daemon: run finished with code ${code} at ${new Date().toISOString()}`);
    activeChild = null;
    const state = await readAutomationState();
    await writeAutomationState({
      daemonStatus: "waiting",
      daemonIntervalMinutes: intervalMinutes,
      nextRunAt: new Date(Date.now() + intervalMs).toISOString(),
      lastDaemonExitCode: code,
      lastDaemonState: state.status,
    });
  });
}

await writeAutomationState({
  daemonStatus: "started",
  daemonIntervalMinutes: intervalMinutes,
  daemonStartedAt: new Date().toISOString(),
  nextRunAt: new Date(Date.now() + (runOnStart ? 0 : intervalMs)).toISOString(),
});

console.log(`Automation daemon started. Interval: ${intervalMinutes} minute(s).`);
if (runOnStart) runAutomation("startup");

setInterval(() => runAutomation("interval"), intervalMs);

process.on("SIGINT", async () => {
  await writeAutomationState({ daemonStatus: "stopped", daemonStoppedAt: new Date().toISOString() });
  process.exit(0);
});

process.on("SIGTERM", async () => {
  await writeAutomationState({ daemonStatus: "stopped", daemonStoppedAt: new Date().toISOString() });
  process.exit(0);
});
