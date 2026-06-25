import { Body, Controller, Get, Param, Patch, Query } from "@nestjs/common";
import { ModerateJobDto } from "./dto/moderate-job.dto";
import { JobsService } from "./jobs.service";

@Controller("jobs")
export class JobsController {
  constructor(private readonly jobs: JobsService) {}

  @Get()
  list(
    @Query("q") q?: string,
    @Query("city") city?: string,
    @Query("category") category?: string,
    @Query("limit") limit?: string
  ) {
    return this.jobs.list({ q, city, category, limit: Number(limit || 50) });
  }

  @Get("moderation")
  moderationQueue(@Query("limit") limit?: string) {
    return this.jobs.moderationQueue({ limit: Number(limit || 30) });
  }

  @Patch(":id/moderation")
  moderate(@Param("id") id: string, @Body() dto: ModerateJobDto) {
    return this.jobs.moderate(id, dto);
  }
}
