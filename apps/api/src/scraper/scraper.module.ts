import { Module, OnModuleInit } from "@nestjs/common";
import { ScheduleModule } from "@nestjs/schedule";
import { ScraperController } from "./scraper.controller";
import { ScraperService } from "./scraper.service";

@Module({
  imports: [ScheduleModule.forRoot()],
  controllers: [ScraperController],
  providers: [ScraperService],
  exports: [ScraperService]
})
export class ScraperModule implements OnModuleInit {
  constructor(private readonly scraperService: ScraperService) {}

  async onModuleInit() {
    // Lancer un premier cycle au démarrage de l'API
    setTimeout(() => {
      void this.scraperService.runPipeline("startup");
    }, 8_000); // 8s de délai pour laisser l'API s'initialiser
  }
}
