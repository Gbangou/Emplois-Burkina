import { readFile } from "node:fs/promises";
import { existsSync, readFileSync } from "node:fs";
import { resolve } from "node:path";
import pg from "pg";

const { Client } = pg;

function loadEnvFile(path) {
  if (!existsSync(path)) return;

  for (const line of readFileSync(path, "utf8").split(/\r?\n/)) {
    const match = line.match(/^([A-Z0-9_]+)=(.*)$/);
    if (!match) continue;
    const [, key, rawValue] = match;
    if (process.env[key]) continue;
    process.env[key] = rawValue.replace(/^["']|["']$/g, "");
  }
}

loadEnvFile(resolve(process.cwd(), ".env.local"));
loadEnvFile(resolve(process.cwd(), "../../.env.local"));

const databaseUrl = process.env.DATABASE_URL || process.env.POSTGRES_URL || process.env.POSTGRES_PRISMA_URL;

if (!databaseUrl) {
  console.error("DATABASE_URL is missing. Pull Vercel env vars before running this script.");
  process.exit(1);
}

const schemaPath = resolve(process.cwd(), "../../database/schema.sql");
const schema = await readFile(schemaPath, "utf8");
const client = new Client({
  connectionString: databaseUrl,
  ssl: databaseUrl.includes("localhost") ? undefined : { rejectUnauthorized: false }
});

await client.connect();
await client.query("create extension if not exists pgcrypto;");
await client.query(schema);
await client.end();

console.log("Production database schema is ready.");
