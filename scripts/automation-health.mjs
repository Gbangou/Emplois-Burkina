import { readAutomationState } from "./automation-state.mjs";

const maxAgeHours = Math.max(1, Number(process.env.EMPLOIS_BURKINA_AUTOMATION_MAX_AGE_HOURS || 30));
const state = await readAutomationState();
const lastSuccessMs = state.lastSuccessAt ? new Date(state.lastSuccessAt).getTime() : 0;
const ageHours = lastSuccessMs ? (Date.now() - lastSuccessMs) / 3_600_000 : Infinity;

const summary = {
  status: state.status,
  daemonStatus: state.daemonStatus || "unknown",
  lastSuccessAt: state.lastSuccessAt || "",
  lastError: state.lastError || "",
  runCount: state.runCount || 0,
  successCount: state.successCount || 0,
  failureCount: state.failureCount || 0,
  ageHours: Number.isFinite(ageHours) ? Number(ageHours.toFixed(2)) : null,
  maxAgeHours,
};

console.log(JSON.stringify(summary, null, 2));

if (state.status === "failed") process.exit(1);
if (!lastSuccessMs) process.exit(1);
if (ageHours > maxAgeHours) process.exit(1);
