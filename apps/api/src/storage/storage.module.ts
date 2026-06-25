import { Module, Global } from "@nestjs/common";
import { JsonStore } from "./json-store.service";
import { PrismaService } from "./prisma.service";

@Global()
@Module({
  providers: [JsonStore, PrismaService],
  exports: [JsonStore, PrismaService]
})
export class StorageModule {}
