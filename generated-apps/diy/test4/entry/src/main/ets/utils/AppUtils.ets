import { util } from '@kit.ArkTS';

export class IdGen {
  static make(): string {
    return util.generateRandomUUID(true);
  }
}

export class DateUtil {
  static today(): string {
    return DateUtil.formatDate(new Date());
  }

  static formatDate(d: Date): string {
    const y = d.getFullYear();
    const m = String(d.getMonth() + 1).padStart(2, '0');
    const day = String(d.getDate()).padStart(2, '0');
    return `${y}-${m}-${day}`;
  }

  static parseDate(s: string): Date {
    const parts: string[] = s.split('-');
    const y = Number(parts[0]);
    const m = Number(parts[1]);
    const d = Number(parts[2]);
    return new Date(y, m - 1, d);
  }

  static startOfMonth(d: Date): Date {
    return new Date(d.getFullYear(), d.getMonth(), 1);
  }

  static endOfMonth(d: Date): Date {
    return new Date(d.getFullYear(), d.getMonth() + 1, 0);
  }

  static monthLabel(d: Date): string {
    return `${d.getFullYear()}年${d.getMonth() + 1}月`;
  }

  static addMonths(d: Date, n: number): Date {
    return new Date(d.getFullYear(), d.getMonth() + n, 1);
  }

  static daysInMonth(d: Date): number {
    return new Date(d.getFullYear(), d.getMonth() + 1, 0).getDate();
  }

  static firstDayOfWeek(d: Date): number {
    return new Date(d.getFullYear(), d.getMonth(), 1).getDay();
  }

  static isSameDay(a: Date, b: Date): boolean {
    return a.getFullYear() === b.getFullYear() &&
      a.getMonth() === b.getMonth() &&
      a.getDate() === b.getDate();
  }

  static dayStartTs(d: Date): number {
    return new Date(d.getFullYear(), d.getMonth(), d.getDate()).getTime();
  }

  static timeSlots(): string[] {
    return ['09:00', '10:30', '14:00', '15:30', '17:00', '19:00'];
  }
}

export class LevelResolver {
  static fromPoints(points: number): string {
    if (points < 100) return '陶坯';
    if (points < 300) return '素烧';
    if (points < 600) return '釉色';
    return '窑变';
  }
}
