import { Injectable, OnModuleInit, OnModuleDestroy, Logger } from "@nestjs/common";
import { PrismaClient } from "@prisma/client";

@Injectable()
export class PrismaService extends PrismaClient implements OnModuleInit, OnModuleDestroy {
  private readonly logger = new Logger(PrismaService.name);
  private _connected = false;

  get isConnected() { return this._connected; }

  async onModuleInit() {
    if (!process.env.DATABASE_URL || process.env.DATABASE_URL.includes("REMPLACER")) {
      this.logger.warn("DATABASE_URL non configurée — mode JSON uniquement (sans base de données)");
      return;
    }

    try {
      const { PrismaPg } = await import("@prisma/adapter-pg");
      const { Pool } = await import("pg");
      const pool = new Pool({
        connectionString: process.env.DATABASE_URL,
        ssl: process.env.DATABASE_URL.includes("supabase") || process.env.DATABASE_URL.includes("neon")
          ? { rejectUnauthorized: false }
          : false,
        connectionTimeoutMillis: 5000
      });

      // Réassigner l'instance avec l'adapter
      const client = new PrismaClient({ adapter: new PrismaPg(pool) });
      Object.assign(this, client);
      await (this as unknown as PrismaClient).$connect();
      this._connected = true;
      this.logger.log("✅ Base de données connectée");
    } catch (err) {
      this.logger.warn(`Base de données non disponible: ${(err as Error).message} — mode JSON uniquement`);
    }
  }

  async onModuleDestroy() {
    if (this._connected) {
      try { await (this as unknown as PrismaClient).$disconnect(); } catch { /* ignore */ }
    }
  }
}
