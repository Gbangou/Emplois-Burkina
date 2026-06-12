import { spawn } from "node:child_process";

const steps = [
  ["Collecte des sources", "scripts/jobfaso-scraper.mjs"],
  ["Curation et nettoyage", "scripts/curate-raw-items.mjs"],
  ["Generation SEO", "scripts/generate-seo-pages.mjs"],
  ["SEO pages statiques", "scripts/enhance-static-seo.mjs"],
  ["Generation croissance", "scripts/generate-growth-assets.mjs"],
  ["Preparation reseaux sociaux", "scripts/generate-social-queue.mjs"],
];

function runNodeScript(label, script) {
  return new Promise((resolve, reject) => {
    console.log(`\n== ${label} ==`);
    const child = spawn(process.execPath, [script], {
      cwd: new URL("../", import.meta.url),
      stdio: "inherit",
      shell: false,
    });

    child.on("exit", (code) => {
      if (code === 0) resolve();
      else reject(new Error(`${label} failed with exit code ${code}`));
    });
  });
}

async function main() {
  for (const [label, script] of steps) {
    await runNodeScript(label, script);
  }

  console.log("\nAutomation complete: raw data, curated jobs, SEO pages and sitemap are up to date.");
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
