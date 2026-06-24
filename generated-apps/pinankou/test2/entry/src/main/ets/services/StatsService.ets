// StatsService.ets — pure computation over DataStore for stats board + home summary.
import { DataStore } from './DataStore';
import { StatsResult, TrendPoint, RankItem, TimeRange, HazardItem } from '../model/Types';

function rangeStartMs(range: TimeRange): number {
  const d = new Date();
  d.setHours(0, 0, 0, 0);
  if (range === 'week') {
    d.setDate(d.getDate() - 6);
  } else if (range === 'month') {
    d.setMonth(d.getMonth() - 1);
  } else if (range === 'quarter') {
    d.setMonth(d.getMonth() - 3);
  } else {
    return 0;
  }
  return d.getTime();
}

export class StatsService {
  static computeStats(store: DataStore, range: TimeRange): StatsResult {
    const start = rangeStartMs(range);
    const inRange = start === 0 ? store.hazards : store.hazards.filter(h => h.createdAt >= start);

    const hazardTotal = inRange.length;
    const doneCount = inRange.filter(h => h.status === 'done').length;
    const pendingCount = inRange.filter(h => h.status !== 'done').length;
    const completionRate = hazardTotal === 0 ? 0 : doneCount / hazardTotal;

    // patrol coverage: distinct checkpoints checked today / total checkpoints across routes
    const totalCps = store.routes.reduce((s, r) => s + r.checkpoints.length, 0);
    const checkedToday = store.totalCheckpointsToday();
    const patrolCoverage = totalCps === 0 ? 0 : Math.min(1, checkedToday / totalCps);

    return {
      hazardTotal,
      doneCount,
      pendingCount,
      completionRate,
      patrolCoverage,
      trend: StatsService.trend(store, range),
      rank: StatsService.rank(inRange),
    };
  }

  static trend(store: DataStore, range: TimeRange): TrendPoint[] {
    let days = 7;
    if (range === 'month') {
      days = 30;
    } else if (range === 'quarter') {
      days = 90;
    } else if (range === 'all') {
      days = 14;
    }
    const buckets: TrendPoint[] = [];
    const counts: number[] = new Array(days).fill(0);
    const now = new Date();
    now.setHours(0, 0, 0, 0);
    const today0 = now.getTime();
    const dayMs = 24 * 3600 * 1000;
    store.hazards.forEach(h => {
      const diff = Math.floor((today0 - (new Date(h.createdAt).setHours(0, 0, 0, 0))) / dayMs);
      if (diff >= 0 && diff < days) {
        counts[days - 1 - diff] += 1;
      }
    });
    for (let i = 0; i < days; i++) {
      const d = new Date(today0 - (days - 1 - i) * dayMs);
      buckets.push({ label: `${d.getMonth() + 1}/${d.getDate()}`, value: counts[i] });
    }
    // downsample to ~7 points for readability
    if (buckets.length > 7) {
      const step = Math.ceil(buckets.length / 7);
      const out: TrendPoint[] = [];
      for (let i = 0; i < buckets.length; i += step) {
        let sum = 0;
        for (let j = i; j < Math.min(i + step, buckets.length); j++) {
          sum += buckets[j].value;
        }
        out.push({ label: buckets[i].label, value: sum });
      }
      return out;
    }
    return buckets;
  }

  static rank(inRange: HazardItem[]): RankItem[] {
    const map = new Map<string, number>();
    inRange.forEach(h => {
      const key = h.location && h.location.length > 0 ? h.location : '未指定';
      map.set(key, (map.get(key) ?? 0) + 1);
    });
    const list: RankItem[] = [];
    map.forEach((value, label) => list.push({ label, value }));
    list.sort((a, b) => b.value - a.value);
    return list.slice(0, 6);
  }
}
