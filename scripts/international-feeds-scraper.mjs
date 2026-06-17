import { createHash } from "node:crypto";
import { mkdir, readFile, writeFile } from "node:fs/promises";

const ROOT = new URL("../", import.meta.url);
const SOURCES_FILE = new URL("data/sources.json", ROOT);
const OUTPUT_FILE = new URL("data/international-feeds.json", ROOT);
const REPORT_FILE = new URL("data/runtime/international-feeds-report.json", ROOT);
const USER_AGENT = process.env.JOBFASO_CRAWLER_AGENT || "JobFasoBot/0.1 (+contact: contact@jobfaso.com)";
const MAX_JOBS_PER_SOURCE = Math.max(3, Number(process.env.JOBFASO_INTERNATIONAL_JOB_LIMIT || 12));
const DETAIL_FETCH_LIMIT = Math.max(1, Number(process.env.JOBFASO_INTERNATIONAL_DETAIL_LIMIT || MAX_JOBS_PER_SOURCE));
const SOURCE_FILTER = new Set(
  String(process.env.JOBFASO_SOURCE_IDS || "")
    .split(",")
    .map((value) => normalize(value))
    .filter(Boolean),
);

const monthNumbers = {
  jan: "01",
  january: "01",
  feb: "02",
  february: "02",
  mar: "03",
  march: "03",
  apr: "04",
  april: "04",
  may: "05",
  jun: "06",
  june: "06",
  jul: "07",
  july: "07",
  aug: "08",
  august: "08",
  sep: "09",
  sept: "09",
  september: "09",
  oct: "10",
  october: "10",
  nov: "11",
  november: "11",
  dec: "12",
  december: "12",
};

function normalize(value = "") {
  return String(value)
    .toLowerCase()
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .replace(/\s+/g, " ")
    .trim();
}

function decodeHtml(value = "") {
  return String(value)
    .replace(/&#(\d+);/g, (_, code) => String.fromCharCode(Number(code)))
    .replace(/&#x([a-f0-9]+);/gi, (_, code) => String.fromCharCode(parseInt(code, 16)))
    .replace(/&nbsp;/g, " ")
    .replace(/&amp;/g, "&")
    .replace(/&quot;/g, "\"")
    .replace(/&#039;/g, "'")
    .replace(/&apos;/g, "'")
    .replace(/&lt;/g, "<")
    .replace(/&gt;/g, ">")
    .replace(/\s+/g, " ")
    .trim();
}

function stripHtml(html = "") {
  return String(html)
    .replace(/<script[\s\S]*?<\/script>/gi, " ")
    .replace(/<style[\s\S]*?<\/style>/gi, " ")
    .replace(/<[^>]+>/g, " ")
    .replace(/\s+/g, " ")
    .trim();
}

function hash(parts) {
  return createHash("sha256").update(parts.join("||")).digest("hex");
}

function validIsoDate(value) {
  if (!/^\d{4}-\d{2}-\d{2}$/.test(String(value || ""))) return "";
  const date = new Date(`${value}T00:00:00Z`);
  return Number.isNaN(date.getTime()) ? "" : value;
}

function parseDateValue(value = "") {
  const raw = String(value).trim();
  const iso = validIsoDate(raw);
  if (iso) return iso;

  const numeric = raw.match(/\b(\d{1,2})[/-](\d{1,2})[/-](\d{2,4})\b/);
  if (numeric) {
    const [, day, month, year] = numeric;
    const fullYear = year.length === 2 ? `20${year}` : year;
    return validIsoDate(`${fullYear.padStart(4, "0")}-${month.padStart(2, "0")}-${day.padStart(2, "0")}`);
  }

  const named = normalize(raw).replace(/\./g, "").match(/\b(\d{1,2})(?:er)?[\s-]+([a-z]+)[\s-]+(\d{4})\b/);
  if (!named) return "";
  const [, day, monthName, year] = named;
  const month = monthNumbers[monthName] || monthNumbers[monthName.slice(0, 3)];
  return month ? validIsoDate(`${year}-${month}-${day.padStart(2, "0")}`) : "";
}

function parseEnglishDateLabel(value = "") {
  const raw = String(value).trim();
  const match = raw.match(/\b([A-Za-z]{3,9})\s+(\d{1,2}),\s+(\d{4})\b/);
  if (!match) return "";
  const [, monthName, day, year] = match;
  const month = monthNumbers[normalize(monthName)] || monthNumbers[normalize(monthName).slice(0, 3)];
  return month ? validIsoDate(`${year}-${month}-${String(day).padStart(2, "0")}`) : "";
}

function parseRelativePostedOn(value = "") {
  const text = normalize(value);
  const today = new Date();
  today.setUTCHours(0, 0, 0, 0);

  if (/today/.test(text)) return today.toISOString().slice(0, 10);
  if (/yesterday/.test(text)) {
    today.setUTCDate(today.getUTCDate() - 1);
    return today.toISOString().slice(0, 10);
  }

  const daysAgo = text.match(/(\d+)\s+day/);
  if (daysAgo) {
    today.setUTCDate(today.getUTCDate() - Number(daysAgo[1]));
    return today.toISOString().slice(0, 10);
  }

  return parseEnglishDateLabel(value);
}

function parseAnyDate(value = "") {
  return parseDateValue(value) || parseEnglishDateLabel(value) || parseRelativePostedOn(value);
}

function absolutizeUrl(href, baseUrl) {
  try {
    return new URL(href, baseUrl).toString();
  } catch {
    return "";
  }
}

async function fetchText(url, options = {}) {
  const controller = new AbortController();
  const timeout = setTimeout(() => controller.abort(), 15000);
  const response = await fetch(url, {
    ...options,
    signal: controller.signal,
    headers: {
      "user-agent": USER_AGENT,
      "accept": "text/html,application/xhtml+xml,application/xml;q=0.9,application/json;q=0.8,*/*;q=0.7",
      ...(options.headers || {}),
    },
  }).finally(() => clearTimeout(timeout));

  if (!response.ok) throw new Error(`HTTP ${response.status}`);
  return response.text();
}

async function fetchJson(url, options = {}) {
  const text = await fetchText(url, options);
  return JSON.parse(text);
}

async function loadSources() {
  const sources = JSON.parse(await readFile(SOURCES_FILE, "utf8"));
  return sources.filter(
    (source) =>
      Array.isArray(source.segments) &&
      source.segments.some((segment) => ["international_onu", "consulting_remote"].includes(normalize(segment))) &&
      (!SOURCE_FILTER.size || SOURCE_FILTER.has(normalize(source.id)) || SOURCE_FILTER.has(normalize(source.name))) &&
      ["multilateral", "organization", "development_marketplace", "freelance_platform", "remote_board", "social_jobs", "ngo"].includes(source.type),
  );
}

async function readPreviousFeeds() {
  try {
    return JSON.parse(await readFile(OUTPUT_FILE, "utf8"));
  } catch {
    return [];
  }
}

function cleanJob(item, source) {
  const title = decodeHtml(item.title || "").slice(0, 220);
  const url = absolutizeUrl(item.url || "", source.url);
  const normalizedTitle = normalize(title);
  if (!title || !url) return null;
  if (!isUsefulJobTitle(normalizedTitle)) return null;

  return {
    id: hash([source.id, title, url]),
    title,
    url,
    location: decodeHtml(item.location || "").slice(0, 120),
    contract: decodeHtml(item.contract || "").slice(0, 120),
    openingDate: parseAnyDate(item.openingDate),
    closingDate: parseAnyDate(item.closingDate),
    excerpt: decodeHtml(item.excerpt || "").slice(0, 280),
  };
}

function isUsefulJobTitle(normalizedTitle = "") {
  if (
    /^voir l.?offre$|^apply now$|^read more$|^learn more$|^details$|^job details$|^open positions?$|^skip to|^skip navigation$|default logo|explore |where we work|about us|home$|careers$|search jobs$|search results$|open menu|close menu|job alerts/.test(
      normalizedTitle,
    )
  ) {
    return false;
  }

  if (
    /^(view all jobs|advanced search|add organization|add location|add job field|single-line|you can also view all available job openings|working in emergencies|diversity and inclusion|leadership recruitment|life at unicef|get prepared|duty stations|organizations|closing soon)$/.test(
      normalizedTitle,
    )
  ) {
    return false;
  }

  if (/^(ouagadougou|ouahigouya|bobo|dori|kaya)\s+\d+$/i.test(normalizedTitle)) return false;
  if (/^[a-z .&'-]+\s+\d+$/.test(normalizedTitle) && !/consult|assistant|officer|manager|specialist|coordinator|director|analyst|advisor|engineer|expert|charg|responsable|recrutement/.test(normalizedTitle)) {
    return false;
  }

  return true;
}

function isLikelyVacancyUrl(url = "") {
  return /\/job\/|jobdetail|job=|vacan|requisition|opening|position|posting|opportunities\/detail|\/jobs\/[^/?#]+/i.test(url);
}

function findDateInSnippet(snippet = "") {
  const text = decodeHtml(stripHtml(snippet));
  if (!text) return "";

  const candidates = [
    ...text.matchAll(/\b\d{4}-\d{2}-\d{2}\b/g),
    ...text.matchAll(/\b\d{1,2}[/-]\d{1,2}[/-]\d{2,4}\b/g),
    ...text.matchAll(/\b(?:Jan(?:uary)?|Feb(?:ruary)?|Mar(?:ch)?|Apr(?:il)?|May|Jun(?:e)?|Jul(?:y)?|Aug(?:ust)?|Sep(?:t|tember)?|Oct(?:ober)?|Nov(?:ember)?|Dec(?:ember)?)\s+\d{1,2},\s+\d{4}\b/gi),
    ...text.matchAll(/\b\d{1,2}(?:er)?\s+(?:janvier|fevrier|février|mars|avril|mai|juin|juillet|aout|août|septembre|octobre|novembre|decembre|décembre)\s+\d{4}\b/gi),
  ];

  for (const match of candidates) {
    const parsed = parseAnyDate(match[0]);
    if (parsed) return parsed;
  }

  return "";
}

function extractLabeledDate(text = "", labels = []) {
  for (const label of labels) {
    const regex = new RegExp(`${label}[\\s:|\\-–]{0,8}([^\\n\\r|]{0,80})`, "i");
    const match = String(text).match(regex);
    if (!match) continue;
    const parsed = findDateInSnippet(match[1]) || findDateInSnippet(match[0]);
    if (parsed) return parsed;
  }
  return "";
}

function extractJsonScripts(html = "") {
  return [...String(html).matchAll(/<script\b[^>]*type=["']application\/ld\+json["'][^>]*>([\s\S]*?)<\/script>/gi)].map((match) => match[1]);
}

function walkStructuredData(value, visit) {
  if (!value || typeof value !== "object") return;
  visit(value);
  if (Array.isArray(value)) {
    for (const item of value) walkStructuredData(item, visit);
    return;
  }
  for (const child of Object.values(value)) walkStructuredData(child, visit);
}

function extractJobPostingStructuredData(html = "") {
  const scripts = extractJsonScripts(html);
  for (const script of scripts) {
    try {
      const parsed = JSON.parse(script.trim());
      let match = null;
      walkStructuredData(parsed, (entry) => {
        if (match) return;
        const typeValue = normalize(Array.isArray(entry?.["@type"]) ? entry["@type"].join(" ") : entry?.["@type"] || "");
        if (typeValue.includes("jobposting")) match = entry;
      });
      if (!match) continue;

      const location =
        match.jobLocation?.address?.addressLocality ||
        match.jobLocation?.address?.addressRegion ||
        match.jobLocation?.name ||
        match.jobLocationType ||
        "";
      const contract = Array.isArray(match.employmentType) ? match.employmentType.join(" - ") : match.employmentType || "";

      return {
        openingDate: parseAnyDate(match.datePosted || ""),
        closingDate: parseAnyDate(match.validThrough || ""),
        location: decodeHtml(location).slice(0, 120),
        contract: decodeHtml(contract).slice(0, 120),
      };
    } catch {
      // ignore malformed structured data
    }
  }

  return null;
}

function enrichDatesFromPageText(text = "") {
  return {
    openingDate:
      extractLabeledDate(text, [
        "posted on",
        "date posted",
        "publication date",
        "posted",
        "opening date",
        "date d'ouverture",
        "date de depot",
        "date de publication",
      ]) || "",
    closingDate:
      extractLabeledDate(text, [
        "deadline",
        "closing date",
        "application deadline",
        "valid through",
        "date limite",
        "date de cloture",
        "date de fermeture",
        "date limite de depot",
      ]) || "",
  };
}

function extractAnchorJobs(html, source) {
  const jobs = [];
  const includeTerms = (source.includeUrl || []).map((term) => normalize(term)).filter(Boolean);
  const excludeTerms = (source.excludeUrl || []).map((term) => normalize(term)).filter(Boolean);
  for (const match of String(html).matchAll(/<a\b[^>]*href=["']([^"']+)["'][^>]*>([\s\S]*?)<\/a>/gi)) {
    const href = match[1];
    const label = decodeHtml(stripHtml(match[2]));
    const normalizedLabel = normalize(label);
    if (label.length < 10) continue;
    if (!isUsefulJobTitle(normalizedLabel)) continue;
    const url = absolutizeUrl(href, source.url);
    const normalizedUrl = normalize(url);
    if (!url || !isLikelyVacancyUrl(url)) continue;
    if (/#$/.test(url) || /jobsearch\.ftl#|moresearch\.ftl|\/careers\/(?:life-|get-prepared|working-|equity-|executive-)|\/duty_stations\/?$|\/organizations\/?$|\/offices\/|\/field_locations\//i.test(url)) {
      continue;
    }
    if (includeTerms.length && !includeTerms.some((term) => normalizedUrl.includes(term))) continue;
    if (excludeTerms.some((term) => normalizedUrl.includes(term))) continue;
    if (/sign in|login|view profile|rss|create alert|cookie|faq/.test(normalizedLabel)) continue;
    jobs.push(cleanJob({ title: label, url }, source));
    if (jobs.length >= MAX_JOBS_PER_SOURCE) break;
  }
  return jobs.filter(Boolean);
}

function extractSuccessFactorsJobs(html, source) {
  const jobs = [];
  for (const match of String(html).matchAll(/<a\b[^>]*href=["']([^"']+)["'][^>]*>([\s\S]*?)<\/a>/gi)) {
    const href = match[1];
    const title = decodeHtml(stripHtml(match[2]));
    if (title.length < 10 || /view all jobs|reset|home/i.test(normalize(title))) continue;
    const absoluteUrl = absolutizeUrl(href, source.url);
    if (!absoluteUrl || !/job\//i.test(absoluteUrl)) continue;
    const snippet = decodeHtml(stripHtml(String(html).slice(match.index, match.index + 700)));
    const closingDate = parseDateValue(snippet) || parseEnglishDateLabel(snippet);
    const locationMatch = snippet.match(new RegExp(`${title.replace(/[.*+?^${}()|[\]\\]/g, "\\$&")}\\s+([^\\d]{3,90}?)\\s+(?:[A-Z][a-z]{2,8}\\s+\\d{1,2},\\s+\\d{4}|\\d{1,2}/\\d{1,2}/\\d{4})`));
    jobs.push(
      cleanJob(
        {
          title,
          url: absoluteUrl,
          location: locationMatch?.[1] || "",
          closingDate,
          excerpt: snippet,
        },
        source,
      ),
    );
    if (jobs.length >= MAX_JOBS_PER_SOURCE) break;
  }
  return dedupeJobs(jobs);
}

function dedupeJobs(items) {
  const byId = new Map();
  for (const item of items.filter(Boolean)) {
    if (!byId.has(item.id)) byId.set(item.id, item);
  }
  return [...byId.values()];
}

async function scrapeWorkday(source) {
  const url = new URL(source.url);
  const match = url.pathname.match(/\/recruiting\/([^/]+)\/([^/]+)/i);
  if (!match) return [];
  const [, tenant, site] = match;
  const endpoint = `${url.origin}/wday/cxs/${tenant}/${site}/jobs`;
  const payload = await fetchJson(endpoint, {
    method: "POST",
    headers: { "content-type": "application/json" },
    body: JSON.stringify({ appliedFacets: {}, limit: MAX_JOBS_PER_SOURCE, offset: 0, searchText: "" }),
  });

  const items = Array.isArray(payload?.jobPostings) ? payload.jobPostings : [];
  return dedupeJobs(
    items.map((item) =>
      cleanJob(
        {
          title: item.title,
          url: absolutizeUrl(item.externalPath || "", source.url),
          location: item.locationsText || item.location || "",
          openingDate: item.postedOn || "",
          closingDate: item.endDate || "",
          contract: Array.isArray(item.bulletFields) ? item.bulletFields.join(" - ") : "",
          excerpt: item.bulletFields?.join(" - ") || "",
        },
        source,
      ),
    ),
  );
}

async function scrapeGenericHtml(source) {
  const html = await fetchText(source.url);
  return dedupeJobs(extractAnchorJobs(html, source));
}

async function scrapeSuccessFactors(source) {
  const html = await fetchText(source.url);
  return dedupeJobs(extractSuccessFactorsJobs(html, source));
}

async function enrichJobsWithDetails(source, jobs) {
  const limitedJobs = jobs.slice(0, DETAIL_FETCH_LIMIT);
  const enriched = [];

  for (const job of limitedJobs) {
    try {
      const html = await fetchText(job.url);
      const text = decodeHtml(stripHtml(html));
      const structured = extractJobPostingStructuredData(html) || {};
      const pageDates = enrichDatesFromPageText(text);

      enriched.push({
        ...job,
        location: job.location || structured.location || "",
        contract: job.contract || structured.contract || "",
        openingDate: job.openingDate || structured.openingDate || pageDates.openingDate || "",
        closingDate: job.closingDate || structured.closingDate || pageDates.closingDate || "",
        excerpt: job.excerpt || text.slice(0, 280),
      });
    } catch {
      enriched.push(job);
    }
  }

  if (jobs.length > limitedJobs.length) enriched.push(...jobs.slice(limitedJobs.length));
  return dedupeJobs(enriched).filter((job) => isUsefulJobTitle(normalize(job.title)));
}

async function collectJobsForSource(source) {
  let jobs = [];
  if (source.id === "wfp-careers") jobs = await scrapeWorkday(source);
  else if (source.id === "unesco-careers") jobs = await scrapeSuccessFactors(source);
  else jobs = await scrapeGenericHtml(source);

  return enrichJobsWithDetails(source, jobs);
}

function sortSourceFeeds(feeds) {
  return feeds.sort((a, b) => a.priority - b.priority || b.jobs.length - a.jobs.length || a.name.localeCompare(b.name, "fr"));
}

async function main() {
  const sources = await loadSources();
  const previousFeeds = await readPreviousFeeds();
  const previousBySourceId = new Map(previousFeeds.map((feed) => [normalize(feed.sourceId), feed]));
  const feeds = [];
  const errors = [];

  for (const source of sources) {
    try {
      const jobs = await collectJobsForSource(source);
      feeds.push({
        sourceId: source.id,
        name: source.name,
        url: source.url,
        type: source.type,
        collection: source.collection,
        notes: source.notes || "",
        priority: source.priority || 9,
        updatedAt: new Date().toISOString(),
        jobs: jobs.slice(0, MAX_JOBS_PER_SOURCE),
      });
      console.log(`${source.name}: ${jobs.length} job(s)`);
    } catch (error) {
      const previous = previousBySourceId.get(normalize(source.id));
      const previousJobs = Array.isArray(previous?.jobs) ? previous.jobs.filter((job) => isUsefulJobTitle(normalize(job.title))) : [];
      errors.push({ sourceId: source.id, name: source.name, message: error.message });
      feeds.push({
        sourceId: source.id,
        name: source.name,
        url: source.url,
        type: source.type,
        collection: source.collection,
        notes: source.notes || "",
        priority: source.priority || 9,
        updatedAt: new Date().toISOString(),
        jobs: previousJobs,
        error: error.message,
        stale: Boolean(previousJobs.length),
      });
      console.warn(`${source.name}: ${error.message}`);
    }
  }

  const finalFeeds = SOURCE_FILTER.size
    ? sortSourceFeeds([
        ...previousFeeds.filter((feed) => !SOURCE_FILTER.has(normalize(feed.sourceId)) && !SOURCE_FILTER.has(normalize(feed.name))),
        ...feeds,
      ])
    : sortSourceFeeds(feeds);

  await mkdir(new URL("data/runtime/", ROOT), { recursive: true });
  await writeFile(OUTPUT_FILE, `${JSON.stringify(finalFeeds, null, 2)}\n`, "utf8");
  await writeFile(
    REPORT_FILE,
    `${JSON.stringify({ generatedAt: new Date().toISOString(), sources: feeds.length, errors }, null, 2)}\n`,
    "utf8",
  );

  console.log(`International feeds: ${feeds.length}`);
  console.log(`Errors: ${errors.length}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
