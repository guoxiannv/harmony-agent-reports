// CheckInService.ets
//
// 打卡记录的纯逻辑层（FR-4）。增删改、按日期分组、连续打卡天数与总数。
// 持久化与响应式状态由 AppController 负责。

import { CheckInDayGroup, CheckInRecord, formatDateKey } from '../model/Types';

export class CheckInService {
  // 新增一条打卡。
  static add(records: CheckInRecord[], record: CheckInRecord): CheckInRecord[] {
    return records.concat([record]);
  }

  // 编辑（按 id 替换）。
  static update(records: CheckInRecord[], record: CheckInRecord): CheckInRecord[] {
    const out: CheckInRecord[] = [];
    for (let i = 0; i < records.length; i++) {
      if (records[i].id === record.id) {
        out.push(record);
      } else {
        out.push(records[i]);
      }
    }
    return out;
  }

  static remove(records: CheckInRecord[], id: string): CheckInRecord[] {
    const out: CheckInRecord[] = [];
    for (let i = 0; i < records.length; i++) {
      if (records[i].id !== id) {
        out.push(records[i]);
      }
    }
    return out;
  }

  static getById(records: CheckInRecord[], id: string): CheckInRecord | null {
    for (let i = 0; i < records.length; i++) {
      if (records[i].id === id) {
        return records[i];
      }
    }
    return null;
  }

  // 按日期分组，日期降序（最新在前），同一天内按创建时间降序。
  static groupByDate(records: CheckInRecord[]): CheckInDayGroup[] {
    const map: Map<string, CheckInRecord[]> = new Map();
    for (let i = 0; i < records.length; i++) {
      const r: CheckInRecord = records[i];
      const list: CheckInRecord[] | undefined = map.get(r.date);
      if (list === undefined) {
        map.set(r.date, [r]);
      } else {
        list.push(r);
      }
    }
    const groups: CheckInDayGroup[] = [];
    map.forEach((list: CheckInRecord[], date: string) => {
      const sorted: CheckInRecord[] = list.slice().sort((a: CheckInRecord, b: CheckInRecord) =>
        b.createdAt - a.createdAt);
      groups.push({ date: date, records: sorted });
    });
    groups.sort((a: CheckInDayGroup, b: CheckInDayGroup) => {
      if (a.date < b.date) {
        return 1;
      }
      if (a.date > b.date) {
        return -1;
      }
      return 0;
    });
    return groups;
  }

  static total(records: CheckInRecord[]): number {
    return records.length;
  }

  // 连续打卡天数：从今天（若今天无打卡则从昨天）往前数，直到遇到空缺日。
  static streak(records: CheckInRecord[], now: number): number {
    const days: Set<string> = new Set();
    for (let i = 0; i < records.length; i++) {
      days.add(records[i].date);
    }
    let streak: number = 0;
    let cursor: number = now;
    // 若今天没有打卡，streak 仍可从昨天起算（不要求今天必打卡）。
    if (!days.has(formatDateKey(cursor))) {
      cursor = cursor - 24 * 60 * 60 * 1000;
    }
    while (days.has(formatDateKey(cursor))) {
      streak += 1;
      cursor = cursor - 24 * 60 * 60 * 1000;
    }
    return streak;
  }
}
