// Small pure helpers. No spreads, no Date.now() inside static that needs `this`.
// ArkTS strict-safe.

export class TimeUtil {
  static now(): number {
    return Date.now();
  }

  static startOfDay(ms: number): number {
    const d = new Date(ms);
    d.setHours(0, 0, 0, 0);
    return d.getTime();
  }

  static isSameDay(a: number, b: number): boolean {
    return TimeUtil.startOfDay(a) === TimeUtil.startOfDay(b);
  }

  static dateLabel(ms: number): string {
    if (ms <= 0) {
      return '—';
    }
    const d = new Date(ms);
    const y = d.getFullYear();
    const m = d.getMonth() + 1;
    const day = d.getDate();
    return `${y}-${m < 10 ? '0' + m : m}-${day < 10 ? '0' + day : day}`;
  }

  static dateTimeLabel(ms: number): string {
    if (ms <= 0) {
      return '—';
    }
    const d = new Date(ms);
    const m = d.getMonth() + 1;
    const day = d.getDate();
    const hh = d.getHours();
    const mm = d.getMinutes();
    return `${m}月${day}日 ${hh < 10 ? '0' + hh : hh}:${mm < 10 ? '0' + mm : mm}`;
  }

  static timeLabel(ms: number): string {
    const d = new Date(ms);
    const hh = d.getHours();
    const mm = d.getMinutes();
    return `${hh < 10 ? '0' + hh : hh}:${mm < 10 ? '0' + mm : mm}`;
  }

  // Friendly relative label for last visit.
  static relativeDays(fromMs: number, nowMs: number): string {
    if (fromMs <= 0) {
      return '未到店';
    }
    const days = Math.floor((nowMs - fromMs) / (24 * 3600 * 1000));
    if (days <= 0) {
      return '今天';
    }
    if (days === 1) {
      return '昨天';
    }
    if (days < 30) {
      return `${days}天前`;
    }
    const months = Math.floor(days / 30);
    return `${months}个月前`;
  }

  // yyyy-mm-dd for a year/month (0-based month)/day.
  static ymd(year: number, month0: number, day: number): string {
    const m = month0 + 1;
    return `${year}-${m < 10 ? '0' + m : m}-${day < 10 ? '0' + day : day}`;
  }
}

let idCounter: number = 1;

export class IdUtil {
  // Deterministic-ish unique id without crypto dependency.
  static next(prefix: string): string {
    idCounter += 1;
    return `${prefix}_${Date.now().toString(36)}_${idCounter.toString(36)}`;
  }
}

export class TextUtil {
  static isEmpty(s: string): boolean {
    return s === undefined || s === null || s.trim().length === 0;
  }

  static trim(s: string): string {
    return s === undefined || s === null ? '' : s.trim();
  }

  static join(arr: string[], sep: string): string {
    let out = '';
    for (let i = 0; i < arr.length; i++) {
      if (i > 0) {
        out += sep;
      }
      out += arr[i];
    }
    return out;
  }
}
