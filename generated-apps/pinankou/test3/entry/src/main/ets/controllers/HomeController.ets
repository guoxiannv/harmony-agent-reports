import { StorageService } from '../services/StorageService';
import { StatsService } from '../services/StatsService';
import { Activity } from '../model/Activity';
import { HomeSummary, StatsSnapshot } from '../services/StatsService';

export class HomeController {
  private storage = StorageService.getInstance();
  private stats = new StatsService();

  summary(): HomeSummary {
    return this.stats.homeSummary();
  }

  recentActivities(limit: number = 20): Activity[] {
    return this.stats.recentActivities(limit);
  }

  clearAll(): void {
    this.storage.resetAll();
  }
}
