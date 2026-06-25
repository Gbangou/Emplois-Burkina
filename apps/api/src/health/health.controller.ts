import { Controller, Get } from "@nestjs/common";

@Controller("health")
export class HealthController {
  @Get()
  getHealth() {
    return {
      ok: true,
      service: "emplois-burkina-api",
      time: new Date().toISOString()
    };
  }
}
