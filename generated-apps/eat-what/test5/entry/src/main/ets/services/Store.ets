// Store.ets
// Central in-memory store + persistence for the 今天吃什么 app.
// Singleton via static fields (ArkTS strict: no `this` in static methods -> use class name).
// Loaded once from Preferences in EntryAbility; pages call ensureLoaded() then read synchronously.

import { StorageService } from './StorageService';
import { Dish, Checkin, Ingredient, WheelCandidate, TodayStatus, genId, todayKey, toDateKey } from '../model/Models';
import { MealType } from '../model/Enums';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { common } from '@kit.AbilityKit';

const DOMAIN = 0x0e1a;

export interface RankedDish {
  dish: Dish;
  matchCount: number;
}

export class Store {
  private static dishes: Dish[] = [];
  private static checkins: Checkin[] = [];
  private static ingredients: Ingredient[] = [];
  private static wheelCandidates: WheelCandidate[] = [];

  private static loaded: boolean = false;
  private static loading: boolean = false;

  static async ensureLoaded(): Promise<void> {
    if (Store.loaded) {
      return;
    }
    if (Store.loading) {
      // Wait for in-progress load.
      while (Store.loading) {
        await sleep(20);
      }
      return;
    }
    Store.loading = true;
    try {
      Store.dishes = await Store.loadArray<Dish>('dishes');
      Store.checkins = await Store.loadArray<Checkin>('checkins');
      Store.ingredients = await Store.loadArray<Ingredient>('ingredients');
      Store.wheelCandidates = await Store.loadArray<WheelCandidate>('wheelCandidates');
      Store.loaded = true;
      hilog.info(DOMAIN, 'eatwhat', 'Store loaded dishes=%{public}d checkins=%{public}d',
        Store.dishes.length.toString(), Store.checkins.length.toString());
    } catch (err) {
      hilog.error(DOMAIN, 'eatwhat', 'Store load failed %{public}s', JSON.stringify(err));
      Store.loaded = true;
    } finally {
      Store.loading = false;
    }
  }

  static async init(context: common.Context): Promise<void> {
    await StorageService.init(context);
    await Store.ensureLoaded();
  }

  private static async loadArray<T>(key: string): Promise<T[]> {
    const raw = await StorageService.getString(key, '[]');
    if (raw === '' || raw === '[]') {
      return [] as T[];
    }
    try {
      const parsed = JSON.parse(raw) as T[];
      if (Array.isArray(parsed)) {
        return parsed;
      }
      return [] as T[];
    } catch (err) {
      hilog.error(DOMAIN, 'eatwhat', 'parse %{public}s failed %{public}s', key, JSON.stringify(err));
      return [] as T[];
    }
  }

  private static persist(key: string, value: string): void {
    StorageService.putString(key, value);
  }

  // ---------- Dish library ----------
  static getDishes(): Dish[] {
    return Store.dishes;
  }

  static searchDishes(keyword: string): Dish[] {
    const kw = keyword.trim();
    if (kw.length === 0) {
      return Store.dishes;
    }
    const result: Dish[] = [];
    const lower = kw.toLowerCase();
    for (const d of Store.dishes) {
      if (d.name.toLowerCase().includes(lower)) {
        result.push(d);
      } else {
        for (const t of d.tags) {
          if (t.toLowerCase().includes(lower)) {
            result.push(d);
            break;
          }
        }
      }
    }
    return result;
  }

  static addDish(name: string, tags: string[], ingredients: string[], moods: string[], times: string[]): Dish {
    const dish: Dish = {
      id: genId(),
      name: name,
      tags: tags,
      ingredients: ingredients,
      moods: moods,
      times: times,
      createdAt: Date.now(),
    };
    Store.dishes.push(dish);
    Store.sortDishes();
    Store.persist('dishes', JSON.stringify(Store.dishes));
    return dish;
  }

  static updateDish(dish: Dish): void {
    for (let i = 0; i < Store.dishes.length; i++) {
      if (Store.dishes[i].id === dish.id) {
        Store.dishes[i] = dish;
        break;
      }
    }
    Store.sortDishes();
    Store.persist('dishes', JSON.stringify(Store.dishes));
  }

  static removeDish(id: string): void {
    const next: Dish[] = [];
    for (const d of Store.dishes) {
      if (d.id !== id) {
        next.push(d);
      }
    }
    Store.dishes = next;
    Store.persist('dishes', JSON.stringify(Store.dishes));
  }

  private static sortDishes(): void {
    Store.dishes.sort((a: Dish, b: Dish) => b.createdAt - a.createdAt);
  }

  // ---------- Ingredients ----------
  static getIngredients(): Ingredient[] {
    return Store.ingredients;
  }

  static addIngredient(name: string): Ingredient {
    const ing: Ingredient = { id: genId(), name: name, createdAt: Date.now() };
    Store.ingredients.push(ing);
    Store.persist('ingredients', JSON.stringify(Store.ingredients));
    return ing;
  }

  static removeIngredient(id: string): void {
    const next: Ingredient[] = [];
    for (const i of Store.ingredients) {
      if (i.id !== id) {
        next.push(i);
      }
    }
    Store.ingredients = next;
    Store.persist('ingredients', JSON.stringify(Store.ingredients));
  }

  static clearIngredients(): void {
    Store.ingredients = [];
    Store.persist('ingredients', JSON.stringify(Store.ingredients));
  }

  // ---------- Wheel candidates ----------
  static getCandidates(): WheelCandidate[] {
    return Store.wheelCandidates;
  }

  static addCandidate(name: string): WheelCandidate {
    const c: WheelCandidate = { id: genId(), name: name, createdAt: Date.now() };
    Store.wheelCandidates.push(c);
    Store.persist('wheelCandidates', JSON.stringify(Store.wheelCandidates));
    return c;
  }

  static removeCandidate(id: string): void {
    const next: WheelCandidate[] = [];
    for (const c of Store.wheelCandidates) {
      if (c.id !== id) {
        next.push(c);
      }
    }
    Store.wheelCandidates = next;
    Store.persist('wheelCandidates', JSON.stringify(Store.wheelCandidates));
  }

  static clearCandidates(): void {
    Store.wheelCandidates = [];
    Store.persist('wheelCandidates', JSON.stringify(Store.wheelCandidates));
  }

  // ---------- Checkins ----------
  static getCheckins(): Checkin[] {
    return Store.checkins;
  }

  static recentCheckins(n: number): Checkin[] {
    const sorted: Checkin[] = Store.checkins.slice();
    sorted.sort((a: Checkin, b: Checkin) => b.createdAt - a.createdAt);
    return sorted.slice(0, n);
  }

  static checkinsByDate(dateKey: string): Checkin[] {
    const result: Checkin[] = [];
    for (const c of Store.checkins) {
      if (c.dateKey === dateKey) {
        result.push(c);
      }
    }
    result.sort((a: Checkin, b: Checkin) => a.createdAt - b.createdAt);
    return result;
  }

  static addCheckin(dateKey: string, meal: MealType, dishName: string, note: string): Checkin {
    const c: Checkin = {
      id: genId(),
      dateKey: dateKey,
      meal: meal,
      dishName: dishName,
      note: note,
      createdAt: Date.now(),
    };
    Store.checkins.push(c);
    Store.persist('checkins', JSON.stringify(Store.checkins));
    return c;
  }

  static removeCheckin(id: string): void {
    const next: Checkin[] = [];
    for (const c of Store.checkins) {
      if (c.id !== id) {
        next.push(c);
      }
    }
    Store.checkins = next;
    Store.persist('checkins', JSON.stringify(Store.checkins));
  }

  static todayStatus(): TodayStatus {
    const key = todayKey();
    let hasB = false;
    let hasL = false;
    let hasD = false;
    let count = 0;
    for (const c of Store.checkins) {
      if (c.dateKey === key) {
        count += 1;
        if (c.meal === 'breakfast') {
          hasB = true;
        } else if (c.meal === 'lunch') {
          hasL = true;
        } else if (c.meal === 'dinner') {
          hasD = true;
        }
      }
    }
    const status: TodayStatus = { hasBreakfast: hasB, hasLunch: hasL, hasDinner: hasD, count: count };
    return status;
  }

  // Consecutive days (ending today or yesterday) with >=1 checkin.
  static streak(): number {
    if (Store.checkins.length === 0) {
      return 0;
    }
    const days = new Set<string>();
    for (const c of Store.checkins) {
      days.add(c.dateKey);
    }
    let streak = 0;
    let cursor = new Date();
    // Allow today to be unchecked: start from today, but if today missing start from yesterday.
    if (!days.has(toDateKey(cursor.getTime()))) {
      cursor.setDate(cursor.getDate() - 1);
      if (!days.has(toDateKey(cursor.getTime()))) {
        return 0;
      }
    }
    while (days.has(toDateKey(cursor.getTime()))) {
      streak += 1;
      cursor.setDate(cursor.getDate() - 1);
    }
    return streak;
  }

  static totalCheckinDays(): number {
    const days = new Set<string>();
    for (const c of Store.checkins) {
      days.add(c.dateKey);
    }
    return days.size;
  }

  static calendarKeys(year: number, month0: number): Set<string> {
    const keys = new Set<string>();
    for (const c of Store.checkins) {
      const parts = c.dateKey.split('-');
      if (parts.length === 3) {
        const y = parseInt(parts[0], 10);
        const m = parseInt(parts[1], 10) - 1;
        if (y === year && m === month0) {
          keys.add(c.dateKey);
        }
      }
    }
    return keys;
  }

  // ---------- Recommendation ----------
  static recommendByIngredients(): RankedDish[] {
    const userNames = new Set<string>();
    for (const i of Store.ingredients) {
      userNames.add(i.name.trim().toLowerCase());
    }
    const result: RankedDish[] = [];
    for (const d of Store.dishes) {
      let match = 0;
      for (const ing of d.ingredients) {
        if (userNames.has(ing.trim().toLowerCase())) {
          match += 1;
        }
      }
      if (match > 0) {
        result.push({ dish: d, matchCount: match });
      }
    }
    result.sort((a: RankedDish, b: RankedDish) => b.matchCount - a.matchCount);
    return result;
  }

  static recommendByFilter(moods: string[], times: string[]): Dish[] {
    const result: Dish[] = [];
    const moodSet = new Set<string>(moods);
    const timeSet = new Set<string>(times);
    const anyMood = moods.length === 0;
    const anyTime = times.length === 0;
    for (const d of Store.dishes) {
      const moodOk = anyMood || Store.intersects(d.moods, moodSet);
      const timeOk = anyTime || Store.intersects(d.times, timeSet);
      if (moodOk && timeOk) {
        result.push(d);
      }
    }
    return result;
  }

  private static intersects(a: string[], set: Set<string>): boolean {
    for (const v of a) {
      if (set.has(v)) {
        return true;
      }
    }
    return false;
  }

  static countCheckins(): number {
    return Store.checkins.length;
  }

  static clearAll(): void {
    Store.dishes = [];
    Store.checkins = [];
    Store.ingredients = [];
    Store.wheelCandidates = [];
    Store.persist('dishes', '[]');
    Store.persist('checkins', '[]');
    Store.persist('ingredients', '[]');
    Store.persist('wheelCandidates', '[]');
  }
}

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => setTimeout(resolve, ms));
}
