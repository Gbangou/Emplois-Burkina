import { readFile } from "node:fs/promises";

const SCHEMA_FILE = new URL("../database/schema.sql", import.meta.url);

const schema = await readFile(SCHEMA_FILE, "utf8");

const required = [
  "create table if not exists sources",
  "include_url text[]",
  "exclude_url text[]",
  "create table if not exists raw_items",
  "opening_date date",
  "closing_date date",
  "create table if not exists jobs",
  "tags text[]",
  "create table if not exists source_runs",
  "create table if not exists seo_pages",
  "create table if not exists indexing_submissions",
  "create table if not exists page_events",
  "create index if not exists jobs_closing_date_idx",
];

const missing = required.filter((needle) => !schema.includes(needle));

if (missing.length) {
  console.error(`Schema check failed. Missing:\n- ${missing.join("\n- ")}`);
  process.exit(1);
}

console.log("Schema check passed.");
