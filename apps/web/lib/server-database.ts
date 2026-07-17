import pg from "pg";
import type { QueryResultRow } from "pg";

const { Pool } = pg;

type QueryParam = string | number | boolean | null | Date | Record<string, unknown> | unknown[];

let pool: pg.Pool | undefined;
let schemaReady: Promise<void> | undefined;

function databaseUrl() {
  return process.env.DATABASE_URL || process.env.POSTGRES_URL || process.env.POSTGRES_PRISMA_URL;
}

export function hasProductionDatabase() {
  return Boolean(databaseUrl());
}

function getPool() {
  const url = databaseUrl();
  if (!url) return undefined;

  pool ??= new Pool({
    connectionString: url,
    max: 3,
    idleTimeoutMillis: 10_000,
    connectionTimeoutMillis: 4_000,
    ssl: url.includes("localhost") ? undefined : { rejectUnauthorized: false }
  });

  return pool;
}

async function ensureProductionSchema() {
  const client = getPool();
  if (!client) return;

  schemaReady ??= client.query(`
    create extension if not exists pgcrypto;

    create table if not exists lead_events (
      id uuid primary key default gen_random_uuid(),
      lead_type text not null,
      contact text,
      payload jsonb not null default '{}',
      estimated_value_fcfa integer not null default 0,
      status text not null default 'new',
      created_at timestamptz not null default now()
    );

    create table if not exists page_events (
      id uuid primary key default gen_random_uuid(),
      event_type text not null,
      page_path text,
      payload jsonb not null default '{}',
      created_at timestamptz not null default now()
    );

    create table if not exists service_orders (
      id text primary key,
      service_id text not null,
      service_name text not null,
      amount_fcfa integer not null default 0,
      status text not null,
      payment_method text not null default 'mobile_money',
      customer_name text,
      customer_phone text,
      customer_email text,
      payload jsonb not null default '{}',
      created_at timestamptz not null default now(),
      updated_at timestamptz not null default now()
    );

    create index if not exists lead_events_status_idx on lead_events(status);
    create index if not exists page_events_type_idx on page_events(event_type, created_at desc);
    create index if not exists service_orders_status_idx on service_orders(status, created_at desc);
  `).then(() => undefined);

  await schemaReady;
}

export async function queryProductionDatabase<T extends QueryResultRow>(
  text: string,
  params: QueryParam[] = []
): Promise<T[] | null> {
  const client = getPool();
  if (!client) return null;

  try {
    await ensureProductionSchema();
    const result = await client.query<T>(text, params);
    return result.rows;
  } catch (error) {
    console.error("Production database query failed", error);
    return null;
  }
}

export async function executeProductionDatabase(text: string, params: QueryParam[] = []) {
  const rows = await queryProductionDatabase(text, params);
  return rows !== null;
}
