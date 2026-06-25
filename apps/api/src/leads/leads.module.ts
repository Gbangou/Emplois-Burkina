import { Module } from "@nestjs/common";
import { StorageModule } from "../storage/storage.module";
import { LeadsController } from "./leads.controller";
import { LeadsService } from "./leads.service";

@Module({
  imports: [StorageModule],
  controllers: [LeadsController],
  providers: [LeadsService]
})
export class LeadsModule {}
