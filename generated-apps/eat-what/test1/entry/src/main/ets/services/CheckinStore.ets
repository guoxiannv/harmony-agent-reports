// CheckinStore — persistence-backed CRUD for daily checkin records, plus
// today/streak computations.

import { Checkin, makeCheckin, dateKeyFromTimestamp } from '../model/Checkin';
import { MealType } from '../model/Enums';
import { PersistenceService } from './PersistenceService';

export const KEY_CHECKINS: string = 'checkins';

const DAY_MS: number = 24 * 60 * 60 * 1000;

export class CheckinStore {
  private persistence: PersistenceService;
  private cache: Checkin[] = [];
  private loaded: boolean = false;

  constructor(persistence: PersistenceService) {
    this.persistence = persistence;
  }

  async ensureLoaded(): Promise<void> {
    if (this.loaded) {
      return;
    }
    const raw: string = await this.persistence.loadString(KEY_CHECKINS, '');
    if (raw.length > 0) {
      try {
        this.cache = JSON.parse(raw) as Checkin[];
      } catch (e) {
        this.cache = [];
      }
    }
    this.loaded = true;
  }

  all(): Checkin[] {
    const out: Checkin[] = [];
    for (let i = 0; i < this.cache.length; i++) {
      out.push(this.cache[i]);
    }
    return out;
  }

  todayList(todayKey: string): Checkin[] {
    const out: Checkin[] = [];
    for (let i = 0; i < this.cache.length; i++) {
      if (this.cache[i].dateKey === todayKey) {
        out.push(this.cache[i]);
      }
    }
    // newest first
    out.sort((a: Checkin, b: Checkin) => b.timestamp - a.timestamp);
    return out;
  }

  todayCalories(todayKey: string): number {
    let sum: number = 0;
    for (let i = 0; i < this.cache.length; i++) {
      if (this.cache[i].dateKey === todayKey) {
        sum += this.cache[i].calories;
      }
    }
    return sum;
  }

  totalCheckins(): number {
    return this.cache.length;
  }

  // Consecutive days (ending today or the most recent checkin day) with >=1 checkin.
  streakDays(todayKey: string): number {
    if (this.cache.length === 0) {
      return 0;
    }
    const keys: Set<string> = new Set<string>();
    for (let i = 0; i < this.cache.length; i++) {
      keys.add(this.cache[i].dateKey);
    }
    let cursor: number = this.epochFromKey(todayKey);
    if (Number.isNaN(cursor)) {
      return 0;
    }
    // If today has no checkin, allow the streak to start from yesterday.
    if (!keys.has(this.dateKeyAt(cursor))) {
      cursor = cursor - DAY_MS;
      if (!keys.has(this.dateKeyAt(cursor))) {
        return 0;
      }
    }
    let streak: number = 0;
    while (keys.has(this.dateKeyAt(cursor))) {
      streak++;
      cursor = cursor - DAY_MS;
    }
    return streak;
  }

  async upsert(checkin: Checkin): Promise<void> {
    let replaced: boolean = false;
    for (let i = 0; i < this.cache.length; i++) {
      if (this.cache[i].id === checkin.id) {
        this.cache[i] = checkin;
        replaced = true;
        break;
      }
    }
    if (!replaced) {
      this.cache.push(checkin);
    }
    await this.persist();
  }

  async remove(id: string): Promise<void> {
    const next: Checkin[] = [];
    for (let i = 0; i < this.cache.length; i++) {
      if (this.cache[i].id !== id) {
        next.push(this.cache[i]);
      }
    }
    this.cache = next;
    await this.persist();
  }

  async clear(): Promise<void> {
    this.cache = [];
    await this.persist();
  }

  findById(id: string): Checkin | null {
    for (let i = 0; i < this.cache.length; i++) {
      if (this.cache[i].id === id) {
        return this.cache[i];
      }
    }
    return null;
  }

  static buildCheckin(
    id: string,
    dishId: string,
    dishName: string,
    meal: string,
    note: string,
    calories: number,
    timestamp: number
  ): Checkin {
    return makeCheckin(id, dishId, dishName, meal as MealType, note, calories, timestamp, dateKeyFromTimestamp(timestamp));
  }

  private dateKeyAt(epochMs: number): string {
    return dateKeyFromTimestamp(epochMs);
  }

  // Parse a 'YYYY-MM-DD' key into epoch ms at local midnight.
  private epochFromKey(key: string): number {
    if (key.length < 10) {
      return Number.NaN;
    }
    const year: number = parseInt(key.substring(0, 4), 10);
    const month: number = parseInt(key.substring(5, 7), 10) - 1;
    const day: number = parseInt(key.substring(8, 10), 10);
    if (Number.isNaN(year) || Number.isNaN(month) || Number.isNaN(day)) {
      return Number.NaN;
    }
    const date: Date = new Date(year, month, day);
    return date.getTime();
  }

  private async persist(): Promise<void> {
    await this.persistence.saveString(KEY_CHECKINS, JSON.stringify(this.cache));
  }
}
