// StatsService.ets
//
// Pure computations over DataStore state for the dashboard (/summary/*) and
// the statistics page (/stats/*). No persistence, no side effects.

import { DataStore } from './DataStore';
import {
  DashboardSummary,
  DashboardStats,
  CategoryStat,
  TrendPoint,
  UrgentItem,
  RiskReport,
  RectificationTask,
  PatrolTask,
  Checkpoint,
} from '../model/Models';
import {
  StatsPeriod,
} from '../model/Enums';
import { daysBetween, nowMs, startOfToday } from '../model/IdUtil';

export class StatsService {
  static summary(): DashboardSummary {
    const store: DataStore = DataStore.getInstance();
    let openMatters: number = 0;
    const matters = store.getMatters();
    for (let i = 0; i < matters.length; i++) {
      if (matters[i].status === 'open') {
        openMatters = openMatters + 1;
      }
    }

    let unresolvedRisks: number = 0;
    const risks = store.getRisks();
    for (let i = 0; i < risks.length; i++) {
      if (risks[i].status !== 'resolved') {
        unresolvedRisks = unresolvedRisks + 1;
      }
    }

    const patrol: PatrolTask | null = store.getTodayPatrol();
    let total: number = 0;
    let done: number = 0;
    let todayCheckpoints: number = 0;
    if (patrol !== null) {
      const cps: Checkpoint[] = patrol.checkpoints;
      total = cps.length;
      for (let i = 0; i < cps.length; i++) {
        if (cps[i].clockedAt === 0) {
          todayCheckpoints = todayCheckpoints + 1;
        } else {
          done = done + 1;
        }
      }
    }
    const completionRate: number = total === 0 ? 0 : Math.round((done / total) * 100);

    let overdueRectifications: number = 0;
    const rects = store.getRectifications();
    for (let i = 0; i < rects.length; i++) {
      if (store.effectiveRectificationStatus(rects[i]) === 'overdue') {
        overdueRectifications = overdueRectifications + 1;
      }
    }

    const out: DashboardSummary = {
      openMatters: openMatters,
      unresolvedRisks: unresolvedRisks,
      todayCheckpoints: todayCheckpoints,
      overdueRectifications: overdueRectifications,
      completionRate: completionRate,
    };
    return out;
  }

  static patrolProgress(): number {
    const patrol: PatrolTask | null = DataStore.getInstance().getTodayPatrol();
    if (patrol === null) {
      return 0;
    }
    const cps: Checkpoint[] = patrol.checkpoints;
    if (cps.length === 0) {
      return 0;
    }
    let done: number = 0;
    for (let i = 0; i < cps.length; i++) {
      if (cps[i].clockedAt !== 0) {
        done = done + 1;
      }
    }
    return done / cps.length;
  }

  static stats(period: StatsPeriod): DashboardStats {
    const store: DataStore = DataStore.getInstance();
    const now: number = nowMs();
    const cutoff: number = StatsService.periodCutoff(period, now);

    const risks = store.getRisks();
    let riskTotal: number = 0;
    let riskResolved: number = 0;
    let resolutionDaySum: number = 0;
    let resolutionCount: number = 0;
    for (let i = 0; i < risks.length; i++) {
      const r: RiskReport = risks[i];
      if (r.reportedAt >= cutoff) {
        riskTotal = riskTotal + 1;
      }
      if (r.status === 'resolved') {
        if (r.reportedAt >= cutoff) {
          riskResolved = riskResolved + 1;
        }
        resolutionDaySum = resolutionDaySum + daysBetween(r.reportedAt, r.updatedAt);
        resolutionCount = resolutionCount + 1;
      }
    }
    const avgResolutionDays: number =
      resolutionCount === 0 ? 0 : Math.round((resolutionDaySum / resolutionCount) * 10) / 10;
    const patrolCompletion: number = StatsService.patrolProgress() * 100;

    const riskByCategory: CategoryStat[] = StatsService.riskByCategory(risks, cutoff);
    const trend: TrendPoint[] = StatsService.trend(risks, period, now);

    const out: DashboardStats = {
      riskTotal: riskTotal,
      riskResolved: riskResolved,
      patrolCompletion: Math.round(patrolCompletion),
      avgResolutionDays: avgResolutionDays,
      riskByCategory: riskByCategory,
      trend: trend,
    };
    return out;
  }

  // Urgent items for the home dashboard: unresolved critical/high risks first,
  // then overdue rectifications, then open high-priority matters.
  static urgentItems(limit: number): UrgentItem[] {
    const store: DataStore = DataStore.getInstance();
    const items: UrgentItem[] = [];

    const risks = store.getRisks();
    for (let i = 0; i < risks.length; i++) {
      const r: RiskReport = risks[i];
      if (r.status !== 'resolved' && (r.severity === 'critical' || r.severity === 'high')) {
        items.push({
          id: r.id,
          kind: 'risk',
          title: r.title,
          subtitle: r.location.length > 0 ? r.location : '风险隐患',
        });
      }
      if (items.length >= limit) {
        return items;
      }
    }

    const rects = store.getRectifications();
    for (let i = 0; i < rects.length; i++) {
      const t: RectificationTask = rects[i];
      if (store.effectiveRectificationStatus(t) === 'overdue') {
        items.push({
          id: t.id,
          kind: 'rectification',
          title: t.title,
          subtitle: t.assignee.length > 0 ? '负责人：' + t.assignee : '整改逾期',
        });
      }
      if (items.length >= limit) {
        return items;
      }
    }

    const matters = store.getMatters();
    for (let i = 0; i < matters.length; i++) {
      const m = matters[i];
      if (m.status === 'open' && m.priority === 'high') {
        items.push({
          id: m.id,
          kind: 'matter',
          title: m.title,
          subtitle: '高优先事项',
        });
      }
      if (items.length >= limit) {
        return items;
      }
    }
    return items;
  }

  private static periodCutoff(period: StatsPeriod, now: number): number {
    if (period === '7d') {
      return now - 7 * 86400000;
    } else if (period === '30d') {
      return now - 30 * 86400000;
    }
    return 0;
  }

  private static riskByCategory(risks: RiskReport[], cutoff: number): CategoryStat[] {
    const matters = DataStore.getInstance().getMatters();
    const categoryById: Map<string, string> = new Map<string, string>();
    for (let i = 0; i < matters.length; i++) {
      categoryById.set(matters[i].id, matters[i].category);
    }
    const counts: Map<string, number> = new Map<string, number>();
    const keys: string[] = [];
    for (let i = 0; i < risks.length; i++) {
      const r: RiskReport = risks[i];
      if (r.reportedAt < cutoff) {
        continue;
      }
      const cat: string | undefined = categoryById.get(r.relatedMatterId);
      const key: string = cat !== undefined ? cat : 'uncategorized';
      const prev: number | undefined = counts.get(key);
      if (prev === undefined) {
        counts.set(key, 1);
        keys.push(key);
      } else {
        counts.set(key, prev + 1);
      }
    }
    const out: CategoryStat[] = [];
    for (let i = 0; i < keys.length; i++) {
      const c: number | undefined = counts.get(keys[i]);
      out.push({ category: keys[i], count: c === undefined ? 0 : c });
    }
    return out;
  }

  private static trend(risks: RiskReport[], period: StatsPeriod, now: number): TrendPoint[] {
    const days: number = period === '7d' ? 7 : period === '30d' ? 30 : 14;
    const todayStart: number = startOfToday(now);
    const dayMs: number = 86400000;
    const buckets: number[] = [];
    for (let i = days - 1; i >= 0; i--) {
      buckets.push(0);
    }
    const startIndex: number = days - 1;
    for (let i = 0; i < risks.length; i++) {
      const r: RiskReport = risks[i];
      const dayDiff: number = Math.floor((todayStart - startOfToday(r.reportedAt)) / dayMs);
      if (dayDiff < 0 || dayDiff >= days) {
        continue;
      }
      const idx: number = startIndex - dayDiff;
      if (idx >= 0 && idx < days) {
        buckets[idx] = buckets[idx] + 1;
      }
    }
    const out: TrendPoint[] = [];
    for (let i = 0; i < days; i++) {
      const dayDate: number = todayStart - (days - 1 - i) * dayMs;
      const label: string = StatsService.dayLabel(dayDate);
      out.push({ dayLabel: label, count: buckets[i] });
    }
    return out;
  }

  private static dayLabel(ms: number): string {
    const d: Date = new Date(ms);
    const m: number = d.getMonth() + 1;
    const day: number = d.getDate();
    return m + '/' + day;
  }
}
