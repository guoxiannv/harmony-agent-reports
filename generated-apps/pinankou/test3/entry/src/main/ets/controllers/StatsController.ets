import { StatsService } from '../services/StatsService';
import { StatsSnapshot } from '../services/StatsService';

export class StatsController {
  private statsService = new StatsService();

  getStats(period: '7d' | '30d' | 'all'): StatsSnapshot {
    return this.statsService.stats(period);
  }
}
