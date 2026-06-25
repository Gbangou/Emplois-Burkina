/**
 * Wrapper PM2 — lance NestJS dev sur le port 4000.
 * PM2 surveille ce processus Node ; NestJS tourne en child process.
 */
import { spawn } from "node:child_process";
import { join, dirname } from "node:path";
import { fileURLToPath } from "node:url";

const __dirname = dirname(fileURLToPath(import.meta.url));
const API_ROOT = join(__dirname, "..", "apps", "api");
const child = spawn("pnpm", ["dev"], {
  cwd: API_ROOT,
  stdio: "inherit",
  shell: true,   // required on Windows for pnpm.cmd
  env: { ...process.env, PORT: "4000", NODE_ENV: "development" }
});

child.on("exit", (code) => process.exit(code ?? 0));
child.on("error", (err) => { console.error("[start-api] Error:", err.message); process.exit(1); });
process.on("SIGINT", () => child.kill("SIGINT"));
process.on("SIGTERM", () => child.kill("SIGTERM"));
