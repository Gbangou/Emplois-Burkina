import { mkdir, readFile, writeFile } from "node:fs/promises";

const ROOT = new URL("../", import.meta.url);
const SOCIAL_DIR = new URL("data/social/", ROOT);
const QUEUE_FILE = new URL("data/social/queue.json", ROOT);
const HISTORY_FILE = new URL("data/social/history.json", ROOT);

const LIVE = process.argv.includes("--live") || process.env.SOCIAL_PUBLISH_LIVE === "true";
const LIMIT = Number(process.env.SOCIAL_PUBLISH_LIMIT || 3);

async function readJson(file, fallback) {
  try {
    return JSON.parse(await readFile(file, "utf8"));
  } catch {
    return fallback;
  }
}

async function writeJson(file, value) {
  await mkdir(SOCIAL_DIR, { recursive: true });
  await writeFile(file, `${JSON.stringify(value, null, 2)}\n`, "utf8");
}

async function publishFacebook(item) {
  const pageId = process.env.FACEBOOK_PAGE_ID;
  const token = process.env.FACEBOOK_PAGE_ACCESS_TOKEN;
  if (!pageId || !token) {
    return { skipped: true, platform: "facebook", reason: "FACEBOOK_PAGE_ID or FACEBOOK_PAGE_ACCESS_TOKEN missing" };
  }

  if (!LIVE) {
    return { dryRun: true, platform: "facebook", message: item.channels?.facebook || item.message, link: item.shareUrls?.facebook || item.url };
  }

  const body = new URLSearchParams({
    message: item.channels?.facebook || item.message,
    link: item.shareUrls?.facebook || item.url,
    access_token: token,
  });

  const response = await fetch(`https://graph.facebook.com/v20.0/${encodeURIComponent(pageId)}/feed`, {
    method: "POST",
    body,
  });
  const result = await response.json();

  if (!response.ok) {
    throw new Error(`Facebook publish failed: ${JSON.stringify(result)}`);
  }

  return { platform: "facebook", id: result.id };
}

async function publishWebhook(item) {
  const url = process.env.SOCIAL_WEBHOOK_URL;
  if (!url) {
    return { skipped: true, platform: "webhook", reason: "SOCIAL_WEBHOOK_URL missing" };
  }

  if (!LIVE) {
    return { dryRun: true, platform: "webhook", payload: item };
  }

  const response = await fetch(url, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({
      source: "emplois-burkina",
      type: "job_post",
      item,
      platformPayloads: {
        facebook: {
          message: item.channels?.facebook || item.message,
          link: item.shareUrls?.facebook || item.url,
        },
        linkedin: {
          message: item.channels?.linkedin || item.message,
          link: item.shareUrls?.linkedin || item.url,
        },
        whatsapp: {
          message: item.channels?.whatsapp || item.message,
          link: item.shareUrls?.whatsapp || item.url,
        },
      },
    }),
  });

  const text = await response.text();
  if (!response.ok) {
    throw new Error(`Webhook publish failed: HTTP ${response.status} ${text.slice(0, 500)}`);
  }

  return { platform: "webhook", status: response.status };
}

async function publishItem(item) {
  const results = [];
  results.push(await publishFacebook(item));
  results.push(await publishWebhook(item));
  if (LIVE && results.every((result) => result.skipped)) {
    throw new Error("No live social destination configured. Set FACEBOOK_PAGE_ID/FACEBOOK_PAGE_ACCESS_TOKEN or SOCIAL_WEBHOOK_URL.");
  }
  return results;
}

async function main() {
  const queue = await readJson(QUEUE_FILE, []);
  const history = await readJson(HISTORY_FILE, []);
  const publishable = queue.filter((item) => item.status === "queued").slice(0, LIMIT);

  if (!publishable.length) {
    console.log("No queued social posts to publish.");
    return;
  }

  for (const item of publishable) {
    item.attempts = Number(item.attempts || 0) + 1;
    item.lastAttemptAt = new Date().toISOString();

    try {
      const results = await publishItem(item);
      if (LIVE) {
        item.status = "published";
        item.publishedAt = new Date().toISOString();
      } else {
        item.status = "queued";
        item.lastDryRunAt = new Date().toISOString();
      }
      item.results = results;
      history.unshift({ ...item, status: LIVE ? "published" : "dry_run" });
      console.log(`${LIVE ? "Published" : "Dry run"}: ${item.title}`);
    } catch (error) {
      item.status = "failed";
      item.error = error.message;
      history.unshift({ ...item });
      console.error(`Failed: ${item.title}`);
      console.error(error.message);
    }
  }

  const nextQueue = queue.filter((item) => item.status !== "published");
  await writeJson(QUEUE_FILE, nextQueue);
  await writeJson(HISTORY_FILE, history.slice(0, 500));
  console.log(`Remaining queued: ${nextQueue.filter((item) => item.status === "queued").length}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
