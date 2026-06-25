import { Controller, Get, Post } from "@nestjs/common";
import { PlatformService } from "./platform.service";

@Controller("platform")
export class PlatformController {
  constructor(private readonly platform: PlatformService) {}

  @Get()
  overview() {
    return this.platform.overview();
  }

  @Get("scraping")
  scraping() {
    return this.platform.scrapingOverview();
  }

  @Get("automation")
  automation() {
    return this.platform.automationOverview();
  }

  @Get("automation/batches")
  publicationBatches() {
    return this.platform.publicationBatches();
  }

  @Get("intelligence")
  intelligence() {
    return this.platform.intelligence();
  }

  @Post("automation/batches")
  createPublicationBatch() {
    return this.platform.createPublicationBatch();
  }
}
