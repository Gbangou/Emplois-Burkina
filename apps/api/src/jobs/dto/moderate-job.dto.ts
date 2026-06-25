import { IsIn, IsOptional, IsString, MaxLength } from "class-validator";
import type { JobStatus } from "@emplois-burkina/domain";

const statuses: JobStatus[] = ["validated", "needs_review", "rejected"];

export class ModerateJobDto {
  @IsIn(statuses)
  status!: JobStatus;

  @IsOptional()
  @IsString()
  @MaxLength(240)
  note?: string;
}
