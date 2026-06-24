// StatisticsService.ets
//
// 纯函数统计聚合：输入各集合 + 周期，输出 StatisticsSnapshot。
// 不读取 AppStorage，不产生副作用，便于在页面/测试中复用。
// 与 ui-behavior.json dataModel.computedState.statistics 对齐。
// ArkTS strict-safe。

import {
  Hazard,
  Correction,
  PatrolPoint,
  PatrolCheckin,
  StatisticsSnapshot,
  StatTrend,
  StatisticsPeriod,
  CorrectionStatus,
  PatrolStatus,
} from '../model/Types';

const DAY_MS: number = 24 * 60 * 60 * 1000;

// 周期对应的回溯窗口起点（毫秒）。
function windowStart(period: StatisticsPeriod, now: number): number {
  if (period === StatisticsPeriod.Day) {
    return now - DAY_MS;
  } else if (period === StatisticsPeriod.Week) {
    return now - 7 * DAY_MS;
  }
  return now - 30 * DAY_MS;
}

// 是否为终态整改（已完成或已验收）。
function isCorrectionClosed(status: CorrectionStatus): boolean {
  return status === CorrectionStatus.Completed || status === CorrectionStatus.Verified;
}

// 是否逾期：到期日早于当前且未完成。
function isCorrectionOverdue(c: Correction, now: number): boolean {
  return c.dueDate < now && !isCorrectionClosed(c.status);
}

export class StatisticsService {
  // 完整统计快照（看板使用）。
  static compute(
    hazards: Hazard[],
    corrections: Correction[],
    patrolPoints: PatrolPoint[],
    patrolCheckins: PatrolCheckin[],
    period: StatisticsPeriod,
    now: number,
  ): StatisticsSnapshot {
    const start: number = windowStart(period, now);

    // 隐患总数（窗口内新增）。
    let hazardTotal: number = 0;
    for (let i = 0; i < hazards.length; i++) {
      if (hazards[i].createdAt >= start) {
        hazardTotal += 1;
      }
    }

    // 整改率：窗口内整改任务中已完成/已验收占比。
    let corrTotal: number = 0;
    let corrClosed: number = 0;
    for (let i = 0; i < corrections.length; i++) {
      if (corrections[i].createdAt >= start) {
        corrTotal += 1;
        if (isCorrectionClosed(corrections[i].status)) {
          corrClosed += 1;
        }
      }
    }
    const correctionRate: number = corrTotal > 0 ? Math.round((corrClosed * 100) / corrTotal) : 0;

    // 巡检完成率：今日已完成打卡的巡检点数 / 巡检点总数。
    const dayStart: number = Math.floor(now / DAY_MS) * DAY_MS;
    const donePointIds: string[] = [];
    for (let i = 0; i < patrolCheckins.length; i++) {
      const ck: PatrolCheckin = patrolCheckins[i];
      if (ck.status === PatrolStatus.Done && ck.checkinAt >= dayStart) {
        if (donePointIds.indexOf(ck.pointId) < 0) {
          donePointIds.push(ck.pointId);
        }
      }
    }
    const patrolCompletion: number = patrolPoints.length > 0
      ? Math.min(100, Math.round((donePointIds.length * 100) / patrolPoints.length))
      : 0;

    // 逾期整改数（操作口径，不限窗口）。
    let overdueCount: number = 0;
    for (let i = 0; i < corrections.length; i++) {
      if (isCorrectionOverdue(corrections[i], now)) {
        overdueCount += 1;
      }
    }

    const trendData: StatTrend[] = StatisticsService.trend(hazards, period, now);

    return {
      hazardTotal: hazardTotal,
      correctionRate: correctionRate,
      patrolCompletion: patrolCompletion,
      overdueCount: overdueCount,
      trendData: trendData,
    };
  }

  // 隐患趋势（按周期分桶）。day=近 7 天；week=近 4 周；month=近 6 月。
  static trend(hazards: Hazard[], period: StatisticsPeriod, now: number): StatTrend[] {
    const buckets: number = period === StatisticsPeriod.Day ? 7 : (period === StatisticsPeriod.Week ? 4 : 6);
    const spanMs: number = period === StatisticsPeriod.Day ? DAY_MS : (period === StatisticsPeriod.Week ? 7 * DAY_MS : 30 * DAY_MS);
    const result: StatTrend[] = [];
    for (let b = buckets - 1; b >= 0; b--) {
      const bucketEnd: number = Math.floor(now / spanMs) * spanMs - b * spanMs + spanMs;
      const bucketStart: number = bucketEnd - spanMs;
      let count: number = 0;
      for (let i = 0; i < hazards.length; i++) {
        const t: number = hazards[i].createdAt;
        if (t >= bucketStart && t < bucketEnd) {
          count += 1;
        }
      }
      const prefix: string = period === StatisticsPeriod.Day ? 'D' : (period === StatisticsPeriod.Week ? 'W' : 'M');
      const label: string = `${prefix}-${b}`;
      result.push({ label: label, value: count });
    }
    return result;
  }

  // 整改完成率（无窗口口径，列表/卡片复用）。
  static correctionRate(corrections: Correction[]): number {
    if (corrections.length === 0) {
      return 0;
    }
    let closed: number = 0;
    for (let i = 0; i < corrections.length; i++) {
      if (isCorrectionClosed(corrections[i].status)) {
        closed += 1;
      }
    }
    return Math.round((closed * 100) / corrections.length);
  }

  // 逾期数（无窗口口径）。
  static overdueCount(corrections: Correction[], now: number): number {
    let count: number = 0;
    for (let i = 0; i < corrections.length; i++) {
      if (isCorrectionOverdue(corrections[i], now)) {
        count += 1;
      }
    }
    return count;
  }

  // 判断单条整改是否逾期（供列表/详情渲染复用）。
  static isOverdue(c: Correction, now: number): boolean {
    return isCorrectionOverdue(c, now);
  }
}
