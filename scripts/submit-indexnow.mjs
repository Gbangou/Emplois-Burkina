import { readFile, writeFile } from "node:fs/promises";

const ROOT = new URL("../", import.meta.url);
const CONFIG_FILE = new URL("data/site-config.json", ROOT);
const URLS_FILE = new URL("indexnow-urls.txt", ROOT);
const KEY_FILE = new URL("indexnow-key.txt", ROOT);

const key = process.env.INDEXNOW_KEY || "";
const endpoint = process.env.INDEXNOW_ENDPOINT || "https://api.indexnow.org/indexnow";

if (!key) {
  console.log("IndexNow skipped: set INDEXNOW_KEY to submit URLs.");
  process.exit(0);
}

const config = JSON.parse(await readFile(CONFIG_FILE, "utf8"));
const urls = (await readFile(URLS_FILE, "utf8"))
  .split(/\r?\n/)
  .map((line) => line.trim())
  .filter(Boolean);

await writeFile(KEY_FILE, `${key}\n`, "utf8");

const payload = {
  host: new URL(config.baseUrl).host,
  key,
  keyLocation: `${config.baseUrl.replace(/\/$/, "")}/indexnow-key.txt`,
  urlList: urls.slice(0, 10000),
};

const response = await fetch(endpoint, {
  method: "POST",
  headers: { "content-type": "application/json; charset=utf-8" },
  body: JSON.stringify(payload),
});

if (!response.ok) {
  throw new Error(`IndexNow failed: HTTP ${response.status} ${response.statusText}`);
}

console.log(`IndexNow submitted: ${payload.urlList.length} URL(s) to ${endpoint}`);
