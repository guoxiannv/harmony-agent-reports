// DateUtil.ets — 日期工具(纯函数，避免重复构造)
export class DateUtil {
  static today(): Date {
    return new Date();
  }

  static toStr(d: Date): string {
    const y = d.getFullYear();
    const m = (d.getMonth() + 1).toString().padStart(2, '0');
    const day = d.getDate().toString().padStart(2, '0');
    return `${y}-${m}-${day}`;
  }

  static todayStr(): string {
    return DateUtil.toStr(DateUtil.today());
  }

  static parseStr(s: string): Date {
    const parts = s.split('-');
    if (parts.length !== 3) {
      return DateUtil.today();
    }
    const y = parseInt(parts[0], 10);
    const m = parseInt(parts[1], 10);
    const d = parseInt(parts[2], 10);
    return new Date(y, m - 1, d);
  }

  static daysBetween(a: string, b: string): number {
    const da = DateUtil.parseStr(a);
    const db = DateUtil.parseStr(b);
    const ms = db.getTime() - da.getTime();
    return Math.floor(ms / (1000 * 60 * 60 * 24));
  }

  static daysSince(dateStr: string): number {
    return DateUtil.daysBetween(dateStr, DateUtil.todayStr());
  }

  static addDays(dateStr: string, days: number): string {
    const d = DateUtil.parseStr(dateStr);
    d.setDate(d.getDate() + days);
    return DateUtil.toStr(d);
  }

  static weekdayLabel(dateStr: string): string {
    const d = DateUtil.parseStr(dateStr);
    const names = ['周日', '周一', '周二', '周三', '周四', '周五', '周六'];
    return names[d.getDay()];
  }

  static shortDate(dateStr: string): string {
    const d = DateUtil.parseStr(dateStr);
    return `${d.getMonth() + 1}月${d.getDate()}日`;
  }

  // 当前周(以今天为周三居中)的 7 天 yyyy-MM-dd
  static currentWeek(): string[] {
    const today = DateUtil.today();
    const day = today.getDay(); // 0 周日 ... 6 周六
    const offset = day === 0 ? -6 : 1 - day; // 周一为起点的偏移
    const monday = new Date(today);
    monday.setDate(today.getDate() + offset);
    const week: string[] = [];
    for (let i = 0; i < 7; i++) {
      const d = new Date(monday);
      d.setDate(monday.getDate() + i);
      week.push(DateUtil.toStr(d));
    }
    return week;
  }
}
