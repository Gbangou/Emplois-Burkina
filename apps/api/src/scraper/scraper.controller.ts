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
    if (!this.scraperService.canStart()) {
      return { ok: false, message: "Pipeline déjà en cours", state: this.scraperService.getState() };
    }

    void this.scraperService.runPipeline("manual-api");
    return { ok: true, message: "Pipeline démarré en arrière-plan", state: this.scraperService.getState() };
  }
}
