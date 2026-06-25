import { Injectable } from "@nestjs/common";
import { randomUUID } from "node:crypto";
import { JsonStore } from "../storage/json-store.service";
import type { CreateLeadDto } from "./dto/create-lead.dto";

type LeadRecord = CreateLeadDto & {
  id: string;
  createdAt: string;
};

@Injectable()
export class LeadsService {
  constructor(private readonly store: JsonStore) {}

  async list() {
    return this.store.read<LeadRecord[]>("data/runtime/leads-modern.json", []);
  }

  async create(dto: CreateLeadDto) {
    const leads = await this.store.read<LeadRecord[]>("data/runtime/leads-modern.json", []);
    const lead: LeadRecord = {
      ...dto,
      id: randomUUID(),
      createdAt: new Date().toISOString()
    };
    await this.store.write("data/runtime/leads-modern.json", [lead, ...leads].slice(0, 5000));
    return { ok: true, id: lead.id };
  }
}
