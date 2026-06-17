import { mkdir, readFile, writeFile } from "node:fs/promises";

const ROOT = new URL("../", import.meta.url);
const JOBS_FILE = new URL("data/curated-jobs.json", ROOT);
const CONFIG_FILE = new URL("data/site-config.json", ROOT);
const SOCIAL_DIR = new URL("data/social/", ROOT);
const QUEUE_FILE = new URL("data/social/queue.json", ROOT);
const HISTORY_FILE = new URL("data/social/history.json", ROOT);

function clean(value = "") {
  return String(value).replace(/\s+/g, " ").trim();
}

function cleanLines(value = "") {
  return String(value)
    .split(/\r?\n/)
    .map((line) => clean(line))
    .filter(Boolean)
    .join("\n");
}

function slugify(value) {
  return clean(value)
    .toLowerCase()
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .replace(/&/g, " et ")
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/^-+|-+$/g, "")
    .slice(0, 90);
}

function absolute(config, path) {
  const baseUrl = process.env.JOBFASO_BASE_URL || config.baseUrl || "https://jobfaso.com";
  return `${baseUrl.replace(/\/$/, "")}/${path.replace(/^\//, "")}`;
}

function trackedUrl(url, source, campaign) {
  const target = new URL(url);
  target.searchParams.set("utm_source", source);
  target.searchParams.set("utm_medium", "social");
  target.searchParams.set("utm_campaign", campaign);
  return target.toString();
}

function jobPath(job) {
  return `pages/jobs/${slugify(job.title)}-${String(job.id).slice(0, 8)}.html`;
}

async function readJson(file, fallback) {
  try {
    return JSON.parse(await readFile(file, "utf8"));
  } catch {
    return fallback;
  }
}

function postMessage(job, url) {
  const city = job.city || "Burkina Faso";
  const organization = job.company || job.sourceName || "Organisation";
  const type = job.type && job.type !== "A verifier" ? `Type : ${job.type}\n` : "";
  const deadline = job.deadline ? `Deadline : ${job.deadline}\n` : "";

  return cleanLines(`Nouvelle opportunite sur JobFaso

${job.title}
Organisation : ${organization}
Ville : ${city}
${type}${deadline}
Voir les details et verifier la source officielle :
${url}

#JobFaso #EmploiBurkina #Recrutement #BurkinaFaso`);
}

function socialHashtags(job) {
  const tags = new Set(["#JobFaso", "#EmploiBurkina", "#BurkinaFaso"]);
  const category = clean(job.category || "");
  const city = clean(job.city || "");

  if (/ong|humanitaire|onu/i.test(category)) tags.add("#ONG");
  if (/concours/i.test(category)) tags.add("#Concours");
  if (/stage/i.test(category)) tags.add("#Stage");
  if (/terrain|informel/i.test(category)) tags.add("#MetiersTerrain");
  if (/remote|teletravail/i.test([job.title, ...(job.tags || [])].join(" "))) tags.add("#Teletravail");
  if (city && city !== "Burkina Faso") tags.add(`#${slugify(city).replace(/-/g, "")}`);

  return [...tags].slice(0, 6).join(" ");
}

function socialMessages(job, urls) {
  const city = job.city || "Burkina Faso";
  const organization = job.company || job.sourceName || "Organisation";
  const hashtags = socialHashtags(job);
  const closing = job.closingDate ? `Cloture: ${job.closingDate}\n` : "";

  return {
    facebook: cleanLines(`Nouvelle offre JobFaso

${job.title}
Organisation : ${organization}
Ville : ${city}
${closing}Postulez depuis la source officielle :
${urls.facebook}

${hashtags}`),
    linkedin: cleanLines(`Offre reperee sur JobFaso

${job.title}
Organisation : ${organization}
Ville : ${city}
${closing}Details et source officielle :
${urls.linkedin}`),
    whatsapp: cleanLines(`JobFaso
${job.title}
${organization} - ${city}
${closing}Details : ${urls.whatsapp}`),
  };
}

async function main() {
  const jobs = await readJson(JOBS_FILE, []);
  const config = await readJson(CONFIG_FILE, {});
  const previousQueue = await readJson(QUEUE_FILE, []);
  const history = await readJson(HISTORY_FILE, []);
  const previousById = new Map(previousQueue.map((item) => [item.id, item]));
  const publishedJobIds = new Set(history.filter((item) => item.status === "published").map((item) => item.jobId));

  const candidates = jobs
    .filter((job) => job.title && job.sourceUrl && !publishedJobIds.has(job.id))
    .slice(0, Number(process.env.SOCIAL_QUEUE_LIMIT || 20))
    .map((job, index) => {
      const url = absolute(config, jobPath(job));
      const shareUrls = {
        canonical: url,
        facebook: trackedUrl(url, "facebook", "job_post"),
        linkedin: trackedUrl(url, "linkedin", "job_post"),
        whatsapp: trackedUrl(url, "whatsapp", "job_post"),
      };
      const messages = socialMessages(job, shareUrls);
      const id = `social-${job.id}`;
      const previous = previousById.get(id);
      const status = previous?.status === "failed" ? "queued" : previous?.status || "queued";
      return {
        ...previous,
        id,
        jobId: job.id,
        title: job.title,
        category: job.category || "Opportunite",
        sourceName: job.sourceName || "Source",
        url,
        shareUrls,
        sourceUrl: job.sourceUrl,
        message: postMessage(job, shareUrls.canonical),
        channels: messages,
        hashtags: socialHashtags(job),
        status,
        attempts: Number(previous?.attempts || 0),
        createdAt: previous?.createdAt || new Date().toISOString(),
        scheduledAt: previous?.scheduledAt || new Date(Date.now() + index * 3_600_000).toISOString(),
        error: status === "queued" ? undefined : previous?.error,
      };
    });

  const candidateIds = new Set(candidates.map((item) => item.id));
  const orphanedQueue = previousQueue.filter((item) => !candidateIds.has(item.id) && item.status !== "published");
  const queue = [...candidates, ...orphanedQueue].slice(0, 100);
  const createdCount = candidates.filter((item) => !previousById.has(item.id)).length;
  const refreshedCount = candidates.length - createdCount;

  await mkdir(SOCIAL_DIR, { recursive: true });
  await writeFile(QUEUE_FILE, `${JSON.stringify(queue, null, 2)}\n`, "utf8");

  console.log(`Social queue ready: ${queue.filter((item) => item.status === "queued").length} queued item(s).`);
  console.log(`Created: ${createdCount}`);
  console.log(`Refreshed: ${refreshedCount}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
