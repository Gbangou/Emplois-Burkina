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
      type: body.type || "contact",
      phone: body.phone,
      email: body.email,
      query: body.query,
      city: body.city,
      category: body.category,
      name: body.name,
      company: body.company,
      message: body.message,
      createdAt: new Date().toISOString()
    };
    await writeLead(lead);
    return NextResponse.json({ ok: true, id: lead.id });
  } catch {
    return NextResponse.json({ ok: false }, { status: 500 });
  }
}

export async function GET() {
  const leads = await readLeads();
  return NextResponse.json({ leads, total: leads.length });
}
