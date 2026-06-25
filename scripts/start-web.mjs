/**
 * Wrapper PM2 — lance Next.js dev sur le port 3000.
 * PM2 surveille ce processus Node ; Next.js tourne en child process.
 */
import { spawn } from "node:child_process";
import { join, dirname } from "node:path";
import { fileURLToPath } from "node:url";

const __dirname = dirname(fileURLToPath(import.meta.url));
const WEB_ROOT = join(__dirname, "..", "apps", "web");
const child = spawn("pnpm", ["dev", "-p", "3000"], {
  cwd: WEB_ROOT,
  stdio: "inherit",
  shell: true,   // required on Windows for pnpm.cmd
  env: { ...process.env, PORT: "3000", NODE_ENV: "development" }
});

child.on("exit", (code) => process.exit(code ?? 0));
child.on("error", (err) => { console.error("[start-web] Error:", err.message); process.exit(1); });
process.on("SIGINT", () => child.kill("SIGINT"));
process.on("SIGTERM", () => child.kill("SIGTERM"));
