// HomeFeed.ets
//
// 首页工作台聚合：待办（整改）与最近动态（跨域活动）。
// 纯函数，从各集合派生，便于首页 / 测试复用。
// 与 ui-behavior.json dataModel.computedState.homeTodos / homeRecent 对齐。
// ArkTS strict-safe。

import {
  SafetyRecord,
  Hazard,
  PatrolCheckin,
  Correction,
  CorrectionStatus,
} from '../model/Types';

// 待办整改项（首页 home-todo-list）。携带派生的逾期标记。
export interface TodoItem {
  correction: Correction;
  overdue: boolean;
}

// 首页最近动态（home-recent-list）。统一时间线。
export interface RecentActivity {
  id: string;
  kind: 'record' | 'hazard' | 'patrol' | 'correction';
  title: string;
  subtitle: string;
  ts: number;
}

export class HomeFeed {
  // 待办：未完成/未验收的整改，按 dueDate 升序，最多 limit 条。
  static todos(corrections: Correction[], now: number, limit: number): TodoItem[] {
    const open: Correction[] = [];
    for (let i = 0; i < corrections.length; i++) {
      const c: Correction = corrections[i];
      if (c.status !== CorrectionStatus.Completed && c.status !== CorrectionStatus.Verified) {
        open.push(c);
      }
    }
    // 升序：逾期（dueDate 小）排前。
    open.sort((a: Correction, b: Correction): number => a.dueDate - b.dueDate);
    const result: TodoItem[] = [];
    const n: number = open.length < limit ? open.length : limit;
    for (let i = 0; i < n; i++) {
      const c: Correction = open[i];
      result.push({
        correction: c,
        overdue: c.dueDate < now,
      });
    }
    return result;
  }

  // 最近动态：合并各域最新更新，按时间倒序，最多 limit 条。
  static recent(
    records: SafetyRecord[],
    hazards: Hazard[],
    checkins: PatrolCheckin[],
    corrections: Correction[],
    limit: number,
  ): RecentActivity[] {
    const items: RecentActivity[] = [];

    for (let i = 0; i < records.length; i++) {
      const r: SafetyRecord = records[i];
      items.push({
        id: r.id,
        kind: 'record',
        title: r.title,
        subtitle: '安全事项',
        ts: r.updatedAt,
      });
    }
    for (let i = 0; i < hazards.length; i++) {
      const h: Hazard = hazards[i];
      items.push({
        id: h.id,
        kind: 'hazard',
        title: h.title,
        subtitle: '风险隐患',
        ts: h.updatedAt,
      });
    }
    for (let i = 0; i < checkins.length; i++) {
      const c: PatrolCheckin = checkins[i];
      items.push({
        id: c.id,
        kind: 'patrol',
        title: c.pointName.length > 0 ? c.pointName : '巡检点',
        subtitle: '巡检打卡',
        ts: c.checkinAt,
      });
    }
    for (let i = 0; i < corrections.length; i++) {
      const c: Correction = corrections[i];
      items.push({
        id: c.id,
        kind: 'correction',
        title: c.title,
        subtitle: '整改进度',
        ts: c.updatedAt,
      });
    }

    items.sort((a: RecentActivity, b: RecentActivity): number => b.ts - a.ts);

    const n: number = items.length < limit ? items.length : limit;
    const result: RecentActivity[] = [];
    for (let i = 0; i < n; i++) {
      result.push(items[i]);
    }
    return result;
  }
}
