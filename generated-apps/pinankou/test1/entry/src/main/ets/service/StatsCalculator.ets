// StatsCalculator.ets - pure stat computation for 平安扣.
//
// All functions are pure (no I/O, no state). The controller passes in the raw
// arrays; this module derives HomeSummary and StatsSnapshot.
import {
  SafetyItem,
  Hazard,
  InspectionTask,
  StatsSnapshot,
  StatsPeriod,
  StatsTrendPoint,
  StatsDistributionSlice,
  HomeSummary,
  HazardLevel,
} from '../model/Types';

const ONE_DAY_MS: number = 24 * 60 * 60 * 1000;

function pad2(n: number): string {
  if (n < 10) {
    return '0' + n;
  }
  return '' + n;
}

// Format a timestamp to YYYY-MM-DD (local).
export function formatDate(ts: number): string {
  const d: Date = new Date(ts);
  const y: number = d.getFullYear();
  const m: number = d.getMonth() + 1;
  const day: number = d.getDate();
  return `${y}-${pad2(m)}-${pad2(day)}`;
}

// Format a timestamp to MM-DD label for charts.
export function formatMonthDay(ts: number): string {
  const d: Date = new Date(ts);
  return `${pad2(d.getMonth() + 1)}-${pad2(d.getDate())}`;
}

// Parse YYYY-MM-DD to a timestamp at local midnight. Returns NaN if invalid.
export function parseDate(s: string): number {
  if (s === null || s === undefined || s.length === 0) {
    return Number.NaN;
  }
  const parts: string[] = s.split('-');
  if (parts.length !== 3) {
    return Number.NaN;
  }
  const y: number = parseInt(parts[0], 10);
  const m: number = parseInt(parts[1], 10);
  const d: number = parseInt(parts[2], 10);
  const dt: Date = new Date(y, m - 1, d);
  return dt.getTime();
}

export function isOverdue(dueDate: string, status: string): boolean {
  if (dueDate === null || dueDate.length === 0) {
    return false;
  }
  if (status === '已完成') {
    return false;
  }
  const due: number = parseDate(dueDate);
  if (Number.isNaN(due)) {
    return false;
  }
  const todayMidnight: number = parseDate(formatDate(Date.now()));
  return due < todayMidnight;
}

export function periodToDays(period: StatsPeriod): number {
  if (period === '本周') {
    return 7;
  }
  if (period === '本月') {
    return 30;
  }
  return 90;
}

// Count hazards created on each of the last N days.
export function computeTrend(hazards: Hazard[], period: StatsPeriod): StatsTrendPoint[] {
  const days: number = periodToDays(period);
  const points: StatsTrendPoint[] = [];
  const todayMidnight: number = parseDate(formatDate(Date.now()));
  const buckets: number[] = new Array<number>(days).fill(0);
  for (let i = 0; i < hazards.length; i++) {
    const h: Hazard = hazards[i];
    const createdDay: number = parseDate(formatDate(h.createdAt));
    const diff: number = Math.round((todayMidnight - createdDay) / ONE_DAY_MS);
    if (diff >= 0 && diff < days) {
      buckets[days - 1 - diff] += 1;
    }
  }
  for (let i = 0; i < days; i++) {
    const ts: number = todayMidnight - (days - 1 - i) * ONE_DAY_MS;
    points.push({ label: formatMonthDay(ts), value: buckets[i] } as StatsTrendPoint);
  }
  return points;
}

export function computeDistribution(hazards: Hazard[]): StatsDistributionSlice[] {
  let high: number = 0;
  let mid: number = 0;
  let low: number = 0;
  for (let i = 0; i < hazards.length; i++) {
    const lvl: HazardLevel = hazards[i].level;
    if (lvl === '高') {
      high += 1;
    } else if (lvl === '中') {
      mid += 1;
    } else {
      low += 1;
    }
  }
  return [
    { label: '高风险', value: high, color: '#EF4444' } as StatsDistributionSlice,
    { label: '中风险', value: mid, color: '#F59E0B' } as StatsDistributionSlice,
    { label: '低风险', value: low, color: '#3B82F6' } as StatsDistributionSlice,
  ];
}

export function computeCompletionRate(hazards: Hazard[]): number {
  if (hazards.length === 0) {
    return 0;
  }
  let done: number = 0;
  for (let i = 0; i < hazards.length; i++) {
    if (hazards[i].status === '已完成') {
      done += 1;
    }
  }
  return Math.round((done * 100) / hazards.length);
}

export function computeInspectionRate(inspections: InspectionTask[]): number {
  if (inspections.length === 0) {
    return 0;
  }
  let done: number = 0;
  for (let i = 0; i < inspections.length; i++) {
    if (inspections[i].status === '已完成') {
      done += 1;
    }
  }
  return Math.round((done * 100) / inspections.length);
}

export function computeOverdueCount(items: SafetyItem[]): number {
  let n: number = 0;
  for (let i = 0; i < items.length; i++) {
    if (isOverdue(items[i].dueDate, items[i].status)) {
      n += 1;
    }
  }
  return n;
}

export function computePendingCount(items: SafetyItem[]): number {
  let n: number = 0;
  for (let i = 0; i < items.length; i++) {
    if (items[i].status !== '已完成') {
      n += 1;
    }
  }
  return n;
}

export function computeSnapshot(
  hazards: Hazard[],
  items: SafetyItem[],
  inspections: InspectionTask[],
  period: StatsPeriod,
): StatsSnapshot {
  let pending: number = 0;
  for (let i = 0; i < hazards.length; i++) {
    if (hazards[i].status !== '已完成') {
      pending += 1;
    }
  }
  return {
    hazardTotal: hazards.length,
    pendingCount: pending,
    completionRate: computeCompletionRate(hazards),
    inspectionRate: computeInspectionRate(inspections),
    overdueCount: computeOverdueCount(items),
    trend: computeTrend(hazards, period),
    distribution: computeDistribution(hazards),
  } as StatsSnapshot;
}

export function computeHomeSummary(
  items: SafetyItem[],
  inspections: InspectionTask[],
): HomeSummary {
  let todayDone: number = 0;
  let todayTotal: number = 0;
  const todayLabel: string = formatDate(Date.now());
  for (let i = 0; i < inspections.length; i++) {
    const due: string = inspections[i].dueDate;
    if (due === todayLabel) {
      todayTotal += 1;
      if (inspections[i].status === '已完成') {
        todayDone += 1;
      }
    }
  }
  let status: string = '今日暂无巡检';
  if (todayTotal > 0) {
    status = `今日 ${todayDone}/${todayTotal}`;
  }
  return {
    pendingCount: computePendingCount(items),
    overdueCount: computeOverdueCount(items),
    todayInspectionStatus: status,
  } as HomeSummary;
}
