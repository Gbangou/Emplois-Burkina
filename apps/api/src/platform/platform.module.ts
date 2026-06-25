import { Module } from "@nestjs/common";
import { JobsModule } from "../jobs/jobs.module";
import { StorageModule } from "../storage/storage.module";
import { PlatformController } from "./platform.controller";
import { PlatformService } from "./platform.service";

@Module({
  imports: [JobsModule, StorageModule],
  controllers: [PlatformController],
  providers: [PlatformService]
})
export class PlatformModule {}
