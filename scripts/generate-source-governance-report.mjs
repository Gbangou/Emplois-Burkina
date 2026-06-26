import { mkdir, readFile, writeFile } from "node:fs/promises";

const ROOT = new URL("../", import.meta.url);
const SOURCES_FILE = new URL("data/sources.json", ROOT);
const SEGMENTS_FILE = new URL("data/source-expansion-plan.json", ROOT);
const REPORT_FILE = new URL("data/runtime/source-governance-report.json", ROOT);

function countBy(items, getKey) {
  const counts = new Map();
  for (const item of items) {
    const key = getKey(item) || "unknown";
    counts.set(key, (counts.get(key) || 0) + 1);
  }
  return Object.fromEntries([...counts.entries()].sort((a, b) => b[1] - a[1] || a[0].localeCompare(b[0])));
}

async function readJson(url, fallback) {
  try {
    return JSON.parse(await readFile(url, "utf8"));
  } catch {
    return fallback;
  }
}

async function main() {
  const [sources, segments] = await Promise.all([
    readJson(SOURCES_FILE, []),
    readJson(SEGMENTS_FILE, []),
  ]);

  const collectionModes = countBy(sources, (source) => source.collection);
  const sourceTypes = countBy(sources, (source) => source.type);
  const segmentCoverage = segments.map((segment) => ({
    id: segment.id,
    name: segment.name,
    priority: segment.priority,
    automationMode: segment.automationMode,
    sourceCount: sources.filter((source) => Array.isArray(source.segments) && source.segments.includes(segment.id)).length,
    qualityRules: segment.qualityRules || [],
  }));
  const compliance = {
    withIncludeRules: sources.filter((source) => Array.isArray(source.includeUrl) && source.includeUrl.length > 0).length,
    withExcludeRules: sources.filter((source) => Array.isArray(source.excludeUrl)).length,
    manualOnly: sources.filter((source) => source.collection === "manual_only").length,
    reviewRequired: sources.filter((source) => source.collection === "review_required").length,
    officialLink: sources.filter((source) => source.collection === "official_link").length,
  };

  const report = {
    generatedAt: new Date().toISOString(),
    totalSources: sources.length,
    automatedCandidateSources: sources.filter((source) => source.collection !== "manual_only").length,
    highPrioritySources: sources.filter((source) => Number(source.priority || 9) <= 2).length,
    sourceTypes,
    collectionModes,
    compliance,
    segmentCoverage,
    guardrails: [
      "Respecter robots.txt et conditions des sources.",
      "Ne pas scraper les plateformes fermees sans API, autorisation ou partenariat.",
      "Garder les sources sociales en manual_only sauf accord explicite.",
      "Publier les offres sensibles seulement apres moderation humaine.",
      "Ne jamais exposer contacts candidats, leads ou outils admin publiquement.",
    ],
  };

  await mkdir(new URL("data/runtime/", ROOT), { recursive: true });
  await writeFile(REPORT_FILE, `${JSON.stringify(report, null, 2)}\n`, "utf8");
  console.log(`Source governance report: ${REPORT_FILE.pathname}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
