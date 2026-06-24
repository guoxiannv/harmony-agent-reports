import { AppServices } from '../services/AppServices';
import { HomeStats, Activity } from '../models/Models';

export class HomeController {
  private services: AppServices

  constructor(services: AppServices) {
    this.services = services
  }

  stats(): HomeStats {
    return this.services.statsService.compute()
  }

  activities(): Activity[] {
    return this.services.statsService.recentActivities()
  }

  navigateReportRisk(): void {
  }
}
