import { NextRequest, NextResponse } from "next/server";
import { writeFile, readFile, mkdir } from "node:fs/promises";
import { join } from "node:path";

type Lead = {
  id: string;
  type: string;
  phone?: string;
  email?: string;
  query?: string;
  city?: string;
  category?: string;
  name?: string;
  company?: string;
  message?: string;
  createdAt: string;
};

const cwd = process.cwd().replace(/\\/g, "/");
const root = (cwd.endsWith("apps/web") || cwd.endsWith("apps\\web"))
  ? join(process.cwd(), "..", "..")
  : process.cwd();
const ADMIN_SECRET = process.env.EMPLOIS_BURKINA_ADMIN_TOKEN;
const MAX_FIELD_LENGTH = 500;

function clean(value: unknown, max = MAX_FIELD_LENGTH) {
  if (typeof value !== "string") return undefined;
  const trimmed = value.replace(/\s+/g, " ").trim();
  return trimmed ? trimmed.slice(0, max) : undefined;
}

function isAdmin(req: NextRequest) {
  const cookie = req.cookies.get("eb_admin")?.value;
  const header = req.headers.get("x-eb-admin");
  return Boolean(ADMIN_SECRET && (cookie === ADMIN_SECRET || header === ADMIN_SECRET));
}

async function readLeads(): Promise<Lead[]> {
  try {
    const content = await readFile(join(root, "data/runtime/leads-modern.json"), "utf8");
    return JSON.parse(content) as Lead[];
  } catch {
    return [];
  }
}

async function writeLead(lead: Lead): Promise<void> {
  const leads = await readLeads();
  leads.push(lead);
  await mkdir(join(root, "data/runtime"), { recursive: true });
  await writeFile(join(root, "data/runtime/leads-modern.json"), JSON.stringify(leads, null, 2), "utf8");
}

export async function POST(req: NextRequest) {
  try {
    const body = await req.json() as Partial<Lead>;
    const lead: Lead = {
      id: `lead_${Date.now()}_${Math.random().toString(36).slice(2, 7)}`,
      type: clean(body.type, 60) || "contact",
      phone: clean(body.phone, 40),
      email: clean(body.email, 160),
      query: clean(body.query, 160),
      city: clean(body.city, 80),
      category: clean(body.category, 100),
      name: clean(body.name, 120),
      company: clean(body.company, 160),
      message: clean(body.message, 1500),
      createdAt: new Date().toISOString()
    };
    await writeLead(lead);
    return NextResponse.json({ ok: true, id: lead.id }, { headers: { "Cache-Control": "no-store" } });
  } catch {
    return NextResponse.json({ ok: false }, { status: 500, headers: { "Cache-Control": "no-store" } });
  }
}

export async function GET(req: NextRequest) {
  if (!isAdmin(req)) {
    return NextResponse.json({ ok: false }, { status: 404, headers: { "Cache-Control": "no-store" } });
  }

  const leads = await readLeads();
  return NextResponse.json({ leads, total: leads.length }, { headers: { "Cache-Control": "no-store" } });
}
