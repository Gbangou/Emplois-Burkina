import { Module } from "@nestjs/common";
import { ConfigModule } from "@nestjs/config";
import { HealthModule } from "./health/health.module";
import { JobsModule } from "./jobs/jobs.module";
import { LeadsModule } from "./leads/leads.module";
import { PlatformModule } from "./platform/platform.module";
import { ScraperModule } from "./scraper/scraper.module";
import { StorageModule } from "./storage/storage.module";

@Module({
  imports: [
    ConfigModule.forRoot({ isGlobal: true }),
    StorageModule,
    HealthModule,
    JobsModule,
    PlatformModule,
    LeadsModule,
    ScraperModule
  ]
})
export class AppModule {}
