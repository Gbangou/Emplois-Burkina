import { mkdir, readFile, stat } from "node:fs/promises";
import { existsSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath, pathToFileURL } from "node:url";

const ROOT = fileURLToPath(new URL("..", import.meta.url));
const DATA_DIR = join(ROOT, "data");
const RUNTIME_DIR = join(DATA_DIR, "runtime");
const SQLITE_FILE = join(RUNTIME_DIR, "jobfaso.sqlite");

async function readJson(file, fallback) {
  try {
    return JSON.parse(await readFile(file, "utf8"));
  } catch {
    return fallback;
  }
}

function stringify(value) {
  return JSON.stringify(value ?? null);
}

function text(value, max = 4000) {
  return String(value || "")
    .replace(/[\u0000-\u001f\u007f]/g, " ")
    .replace(/\s+/g, " ")
    .trim()
    .slice(0, max);
}

function boolInt(value) {
  return value ? 1 : 0;
}

function runInsert(statement, rows, mapRow) {
  for (const row of rows) statement.run(...mapRow(row));
}

export async function syncSqliteDb() {
  const sqlite = await import("node:sqlite").catch(() => null);
  if (!sqlite?.DatabaseSync) {
    throw new Error("node:sqlite indisponible. Utilise Node 22.5+ ou Node 24+ pour la DB SQLite locale.");
  }

  const [config, jobs, sources, rateCards, rawItems, leads, events, visibilityReport] = await Promise.all([
    readJson(join(DATA_DIR, "site-config.json"), {}),
    readJson(join(DATA_DIR, "curated-jobs.json"), []),
    readJson(join(DATA_DIR, "sources.json"), []),
    readJson(join(DATA_DIR, "rate-card.json"), []),
    readJson(join(DATA_DIR, "raw-items.json"), []),
    readJson(join(RUNTIME_DIR, "leads.json"), []),
    readJson(join(RUNTIME_DIR, "events.json"), []),
    readJson(join(DATA_DIR, "growth", "visibility-report.json"), {}),
  ]);

  await mkdir(dirname(SQLITE_FILE), { recursive: true });
  let moderationOverrides = [];
  let jobEditOverrides = [];
  if (existsSync(SQLITE_FILE)) {
    const previousDb = new sqlite.DatabaseSync(SQLITE_FILE, { readOnly: true });
    try {
      moderationOverrides = previousDb
        .prepare("select job_id, status, note, moderated_at, moderated_by from moderation_overrides order by moderated_at desc")
        .all();
    } catch {
      moderationOverrides = [];
    }
    try {
      jobEditOverrides = previousDb
        .prepare("select job_id, patch_json, edited_at, edited_by from job_edit_overrides order by edited_at desc")
        .all();
    } catch {
      jobEditOverrides = [];
    } finally {
      previousDb.close();
    }
  }

  const db = new sqlite.DatabaseSync(SQLITE_FILE);

  db.exec(`
    pragma journal_mode = WAL;
    pragma foreign_keys = ON;

    drop table if exists sync_metadata;
    drop table if exists job_edit_overrides;
    drop table if exists moderation_overrides;
    drop table if exists page_events;
    drop table if exists leads;
    drop table if exists raw_items;
    drop table if exists jobs;
    drop table if exists rate_cards;
    drop table if exists sources;
    drop table if exists site_config;

    create table site_config (
      key text primary key,
      value text not null
    );

    create table sources (
      id text primary key,
      name text not null,
      type text,
      collection text,
      url text,
      priority integer,
      notes text,
      payload_json text not null
    );

    create table jobs (
      id text primary key,
      title text not null,
      company text,
      city text,
      category text,
      type text,
      source_name text,
      source_url text,
      canonical_url text,
      opening_date text,
      closing_date text,
      deadline text,
      status text,
      confidence real,
      tags_json text not null,
      payload_json text not null,
      collected_at text
    );

    create table raw_items (
      id text primary key,
      title text,
      source_name text,
      source_url text,
      opening_date text,
      closing_date text,
      collected_at text,
      payload_json text not null
    );

    create table rate_cards (
      id text primary key,
      name text not null,
      price_fcfa integer,
      billing text,
      audience text,
      includes_json text not null,
      payload_json text not null
    );

    create table leads (
      id text primary key,
      kind text,
      status text,
      value_fcfa integer,
      data_json text not null,
      created_at text
    );

    create table page_events (
      id text primary key,
      event_type text,
      label text,
      path text,
      target text,
      payload_json text not null,
      created_at text
    );

    create table moderation_overrides (
      job_id text primary key,
      status text not null check (status in ('needs_review', 'validated', 'rejected')),
      note text,
      moderated_at text not null,
      moderated_by text
    );

    create table job_edit_overrides (
      job_id text primary key,
      patch_json text not null,
      edited_at text not null,
      edited_by text
    );

    create table sync_metadata (
      key text primary key,
      value text not null
    );

    create index jobs_category_idx on jobs(category);
    create index jobs_city_idx on jobs(city);
    create index jobs_source_idx on jobs(source_name);
    create index jobs_closing_date_idx on jobs(closing_date);
    create index raw_items_source_idx on raw_items(source_name);
    create index events_type_created_idx on page_events(event_type, created_at);
    create index leads_kind_created_idx on leads(kind, created_at);
    create index moderation_status_idx on moderation_overrides(status, moderated_at);
    create index job_edit_overrides_edited_idx on job_edit_overrides(edited_at);
  `);

  try {
    db.exec("begin immediate;");
    const configInsert = db.prepare("insert into site_config (key, value) values (?, ?)");
    for (const [key, value] of Object.entries(config)) configInsert.run(key, stringify(value));

    runInsert(
      db.prepare(
        `insert into sources (id, name, type, collection, url, priority, notes, payload_json)
         values (?, ?, ?, ?, ?, ?, ?, ?)`,
      ),
      sources,
      (source) => [
        text(source.id || source.name, 160),
        text(source.name, 220),
        text(source.type, 80),
        text(source.collection, 80),
        text(source.url, 600),
        Number(source.priority || 0),
        text(source.notes, 1000),
        stringify(source),
      ],
    );

    runInsert(
      db.prepare(
        `insert into jobs (
          id, title, company, city, category, type, source_name, source_url, canonical_url,
          opening_date, closing_date, deadline, status, confidence, tags_json, payload_json, collected_at
        ) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
      ),
      jobs,
      (job) => [
        text(job.id, 180),
        text(job.title, 300),
        text(job.company, 220),
        text(job.city, 160),
        text(job.category, 120),
        text(job.type, 120),
        text(job.sourceName, 220),
        text(job.sourceUrl, 900),
        text(job.canonicalUrl, 900),
        text(job.openingDate, 40),
        text(job.closingDate, 40),
        text(job.deadline, 120),
        text(job.status, 80),
        Number(job.confidence || 0),
        stringify(job.tags || []),
        stringify(job),
        text(job.collectedAt, 80),
      ],
    );

    runInsert(
      db.prepare(
        `insert into raw_items (id, title, source_name, source_url, opening_date, closing_date, collected_at, payload_json)
         values (?, ?, ?, ?, ?, ?, ?, ?)`,
      ),
      rawItems,
      (item) => [
        text(item.id, 180),
        text(item.title, 300),
        text(item.sourceName, 220),
        text(item.sourceUrl, 900),
        text(item.openingDate, 40),
        text(item.closingDate, 40),
        text(item.collectedAt, 80),
        stringify(item),
      ],
    );

    runInsert(
      db.prepare(
        `insert into rate_cards (id, name, price_fcfa, billing, audience, includes_json, payload_json)
         values (?, ?, ?, ?, ?, ?, ?)`,
      ),
      rateCards,
      (product) => [
        text(product.id, 120),
        text(product.name, 220),
        Number(product.priceFcfa || 0),
        text(product.billing, 80),
        text(product.audience, 160),
        stringify(product.includes || []),
        stringify(product),
      ],
    );

    runInsert(
      db.prepare("insert into leads (id, kind, status, value_fcfa, data_json, created_at) values (?, ?, ?, ?, ?, ?)"),
      leads,
      (lead) => [
        text(lead.id, 180),
        text(lead.kind, 80),
        text(lead.status, 80),
        Number(lead.valueFcfa || 0),
        stringify(lead.data || {}),
        text(lead.createdAt, 80),
      ],
    );

    runInsert(
      db.prepare(
        "insert into page_events (id, event_type, label, path, target, payload_json, created_at) values (?, ?, ?, ?, ?, ?, ?)",
      ),
      events,
      (event) => [
        text(event.id, 180),
        text(event.type || event.eventType, 120),
        text(event.payload?.label || event.label, 240),
        text(event.payload?.path || event.path, 300),
        text(event.payload?.target || event.target, 700),
        stringify(event.payload || event),
        text(event.createdAt, 80),
      ],
    );

    runInsert(
      db.prepare(
        "insert into moderation_overrides (job_id, status, note, moderated_at, moderated_by) values (?, ?, ?, ?, ?)",
      ),
      moderationOverrides,
      (item) => [
        text(item.job_id, 180),
        text(item.status, 80),
        text(item.note, 1000),
        text(item.moderated_at, 80),
        text(item.moderated_by, 120),
      ],
    );

    runInsert(
      db.prepare("insert into job_edit_overrides (job_id, patch_json, edited_at, edited_by) values (?, ?, ?, ?)"),
      jobEditOverrides,
      (item) => [
        text(item.job_id, 180),
        item.patch_json || "{}",
        text(item.edited_at, 80),
        text(item.edited_by, 120),
      ],
    );

    const metaInsert = db.prepare("insert into sync_metadata (key, value) values (?, ?)");
    metaInsert.run("generatedAt", new Date().toISOString());
    metaInsert.run("schemaVersion", "1");
    metaInsert.run("jobs", String(jobs.length));
    metaInsert.run("sources", String(sources.length));
    metaInsert.run("rawItems", String(rawItems.length));
    metaInsert.run("leads", String(leads.length));
    metaInsert.run("events", String(events.length));
    metaInsert.run("visibilityScore", String(visibilityReport.score ?? ""));
    metaInsert.run("adsenseReady", String(boolInt(Boolean(config.adsenseClient))));
    db.exec("commit;");
  } catch (error) {
    db.exec("rollback;");
    db.close();
    throw error;
  }

  db.exec("pragma optimize;");
  db.close();

  const info = await stat(SQLITE_FILE);
  return {
    ok: true,
    path: SQLITE_FILE,
    bytes: info.size,
    jobs: jobs.length,
    sources: sources.length,
    rawItems: rawItems.length,
    message: `SQLite synchronisee: ${jobs.length} offres, ${sources.length} sources, ${rawItems.length} items, ${Math.round(info.size / 1024)} KB.`,
  };
}

if (import.meta.url === pathToFileURL(process.argv[1]).href) {
  syncSqliteDb()
    .then((result) => {
      console.log(result.message);
    })
    .catch((error) => {
      console.error(error);
      process.exitCode = 1;
    });
}
