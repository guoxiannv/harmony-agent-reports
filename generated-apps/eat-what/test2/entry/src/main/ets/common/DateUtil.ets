// DateUtil.ets
//
// Headless date helpers shared by RecordStore, calendar view-model, and
// share-card formatting. No UI here.

import { MealType } from './Models';

export class DateUtil {
  static pad2(n: number): string {
    return n < 10 ? '0' + n : '' + n;
  }

  static toYYYYMMDD(d: Date): string {
    return '' + d.getFullYear() + DateUtil.pad2(d.getMonth() + 1) + DateUtil.pad2(d.getDate());
  }

  static today(): string {
    return DateUtil.toYYYYMMDD(new Date());
  }

  // Guess the most likely meal for the current wall-clock hour.
  static currentMealNow(): MealType {
    const h = new Date().getHours();
    if (h < 10) {
      return 'breakfast';
    } else if (h < 14) {
      return 'lunch';
    } else if (h < 22) {
      return 'dinner';
    }
    return 'lateNight';
  }

  // YYYYMMDD -> YYYYMM
  static monthKey(yyyymmdd: string): string {
    if (yyyymmdd.length < 6) {
      return yyyymmdd;
    }
    return yyyymmdd.substring(0, 6);
  }

  static formatChinese(yyyymmdd: string): string {
    if (yyyymmdd.length !== 8) {
      return yyyymmdd;
    }
    const year = yyyymmdd.substring(0, 4);
    const month = yyyymmdd.substring(4, 6);
    const day = yyyymmdd.substring(6, 8);
    return `${year}年${month}月${day}日`;
  }
}
