import { StorageService } from '../services/StorageService';
import { Hazard, HazardComment, HazardLevel, HazardStatus } from '../model/Hazard';
import { Inspection, InspectionCheckItem, InspectionStatus } from '../model/Inspection';
import { SafetyNote } from '../model/SafetyNote';
import { Contact } from '../model/Contact';
import { Activity } from '../model/Activity';
import { daysAgo } from '../services/IdGenerator';

export interface HomeSummary {
  pendingTasksCount: number;
  hazardTotal: number;
  closedCount: number;
  inspectionTotal: number;
  completedInspectionCount: number;
}

export class TrendPoint {
  date: string = '';
  count: number = 0;
}

export class StatusDistributionItem {
  status: string = '';
  label: string = '';
  count: number = 0;
}

export class TopLocationItem {
  location: string = '';
  count: number = 0;
}

export interface StatsSnapshot {
  hazardTotal: number;
  closedRate: number;
  inspectionCompletion: number;
  overdueCount: number;
  trend: TrendPoint[];
  statusDistribution: StatusDistributionItem[];
  topLocations: TopLocationItem[];
}

export class StatsService {
  private storage = StorageService.getInstance();

  homeSummary(): HomeSummary {
    const hazards = this.storage.listHazards();
    const notes = this.storage.listNotes();
    const inspections = this.storage.listInspections();
    const pendingTasksCount =
      hazards.filter(h => h.status === HazardStatus.PENDING || h.status === HazardStatus.IN_PROGRESS).length +
      notes.filter(n => !n.isDone).length;
    return {
      pendingTasksCount,
      hazardTotal: hazards.length,
      closedCount: hazards.filter(h => h.status === HazardStatus.CLOSED).length,
      inspectionTotal: inspections.length,
      completedInspectionCount: inspections.filter(i => i.status === InspectionStatus.COMPLETED).length
    };
  }

  recentActivities(limit: number = 20): Activity[] {
    return this.storage.recentActivities(limit);
  }

  stats(period: '7d' | '30d' | 'all'): StatsSnapshot {
    const hazards = this.storage.listHazards();
    const inspections = this.storage.listInspections();
    const now = Date.now();
    const cutoff = period === '7d' ? daysAgo(7) : period === '30d' ? daysAgo(30) : 0;

    const filteredHazards = hazards.filter(h => h.createdAt >= cutoff);
    const closedCount = filteredHazards.filter(h => h.status === HazardStatus.CLOSED).length;
    const closedRate = filteredHazards.length > 0 ? Math.round((closedCount / filteredHazards.length) * 100) : 0;

    const filteredInspections = inspections.filter(i => i.createdAt >= cutoff);
    const completedCount = filteredInspections.filter(i => i.status === InspectionStatus.COMPLETED).length;
    const inspectionCompletion = filteredInspections.length > 0
      ? Math.round((completedCount / filteredInspections.length) * 100)
      : 0;

    const notes = this.storage.listNotes();
    const overdueCount = hazards.filter(h =>
      h.deadline !== null &&
      h.deadline < now &&
      h.status !== HazardStatus.CLOSED
    ).length +
      notes.filter(n =>
        n.deadline !== null &&
        n.deadline < now &&
        !n.isDone
      ).length;

    const trend = this.buildTrend(filteredHazards, period);
    const statusDistribution = this.buildStatusDistribution(filteredHazards);
    const topLocations = this.buildTopLocations(filteredHazards);

    return {
      hazardTotal: filteredHazards.length,
      closedRate,
      inspectionCompletion,
      overdueCount,
      trend,
      statusDistribution,
      topLocations
    };
  }

  private buildTrend(hazards: Hazard[], period: '7d' | '30d' | 'all'): TrendPoint[] {
    if (period === 'all') {
      const map = new Map<string, number>();
      hazards.forEach(h => {
        const key = this.monthKey(h.createdAt);
        map.set(key, (map.get(key) || 0) + 1);
      });
      const items: TrendPoint[] = [];
      Array.from(map.entries())
        .sort((a: [string, number], b: [string, number]) => a[0].localeCompare(b[0]))
        .forEach((entry: [string, number]) => {
          const item = new TrendPoint();
          item.date = entry[0];
          item.count = entry[1];
          items.push(item);
        });
      return items;
    }
    const days = period === '7d' ? 7 : 30;
    const out: TrendPoint[] = [];
    for (let i = days - 1; i >= 0; i--) {
      const d = new Date();
      d.setDate(d.getDate() - i);
      d.setHours(0, 0, 0, 0);
      const key = `${d.getMonth() + 1}/${d.getDate()}`;
      const start = d.getTime();
      const end = start + 24 * 60 * 60 * 1000;
      const count = hazards.filter(h => h.createdAt >= start && h.createdAt < end).length;
      const point = new TrendPoint();
      point.date = key;
      point.count = count;
      out.push(point);
    }
    return out;
  }

  private monthKey(ts: number): string {
    const d = new Date(ts);
    return `${d.getFullYear()}-${String(d.getMonth() + 1).padStart(2, '0')}`;
  }

  private buildStatusDistribution(hazards: Hazard[]): StatusDistributionItem[] {
    const map = new Map<string, number>();
    hazards.forEach(h => {
      map.set(h.status, (map.get(h.status) || 0) + 1);
    });
    const labels: Map<string, string> = new Map<string, string>([
      ['pending', '待处理'],
      ['in_progress', '整改中'],
      ['awaiting_acceptance', '待验收'],
      ['closed', '已关闭']
    ]);
    const items: StatusDistributionItem[] = [];
    Array.from(map.entries()).forEach((entry: [string, number]) => {
      const status = entry[0];
      const count = entry[1];
      const item = new StatusDistributionItem();
      item.status = status;
      item.label = labels.get(status) || status;
      item.count = count;
      items.push(item);
    });
    return items;
  }

  private buildTopLocations(hazards: Hazard[]): TopLocationItem[] {
    const map = new Map<string, number>();
    hazards.forEach(h => {
      if (h.location) {
        map.set(h.location, (map.get(h.location) || 0) + 1);
      }
    });
    const items: TopLocationItem[] = [];
    Array.from(map.entries()).forEach((entry: [string, number]) => {
      const item = new TopLocationItem();
      item.location = entry[0];
      item.count = entry[1];
      items.push(item);
    });
    return items.sort((a: TopLocationItem, b: TopLocationItem) => b.count - a.count).slice(0, 5);
  }
}
