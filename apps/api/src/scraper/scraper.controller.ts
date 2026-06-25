import { Controller, Get, Post } from "@nestjs/common";
import { ScraperService } from "./scraper.service";

@Controller("scraper")
export class ScraperController {
  constructor(private readonly scraperService: ScraperService) {}

  @Get("state")
  getState() {
    return this.scraperService.getState();
  }

  @Post("trigger")
  async trigger() {
    void this.scraperService.runPipeline("manual-api");
    return { ok: true, message: "Pipeline démarré en arrière-plan" };
  }
}
