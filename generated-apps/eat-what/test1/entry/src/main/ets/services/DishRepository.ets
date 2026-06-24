// DishRepository — owns the dish bank (built-in + persisted custom dishes) and
// all read-side queries: by id, by name search, by mood/time filter, and by
// ingredient recommendation. Custom dishes are persisted via PersistenceService.

import { Dish, dishMatchesName } from '../model/Dish';
import { DishBank } from '../data/DishBank';
import { PersistenceService } from './PersistenceService';

export const KEY_CUSTOM_DISHES: string = 'custom_dishes';
export const KEY_WHEEL_DISHES: string = 'wheel_custom_dishes';

export class DishRepository {
  private persistence: PersistenceService;
  private builtinCache: Dish[] = [];
  private customCache: Dish[] = [];
  private wheelCustomCache: Dish[] = [];
  private loaded: boolean = false;

  constructor(persistence: PersistenceService) {
    this.persistence = persistence;
    this.builtinCache = DishBank.all();
  }

  async ensureLoaded(): Promise<void> {
    if (this.loaded) {
      return;
    }
    this.customCache = await this.loadDishes(KEY_CUSTOM_DISHES);
    this.wheelCustomCache = await this.loadDishes(KEY_WHEEL_DISHES);
    this.loaded = true;
  }

  // Full bank available to discover/recommend/detail.
  allAvailable(): Dish[] {
    const out: Dish[] = [];
    for (let i = 0; i < this.builtinCache.length; i++) {
      out.push(this.builtinCache[i]);
    }
    for (let i = 0; i < this.customCache.length; i++) {
      out.push(this.customCache[i]);
    }
    return out;
  }

  // Wheel pool: persisted wheel-custom dishes if any, otherwise the built-in
  // default selection.
  wheelPool(): Dish[] {
    if (this.wheelCustomCache.length > 0) {
      return this.clone(this.wheelCustomCache);
    }
    const defaults: string[] = DishBank.defaultWheelIds();
    const out: Dish[] = [];
    for (let i = 0; i < defaults.length; i++) {
      const dish: Dish | null = this.findById(defaults[i]);
      if (dish !== null) {
        out.push(dish);
      }
    }
    return out;
  }

  findById(id: string): Dish | null {
    const all: Dish[] = this.allAvailable();
    for (let i = 0; i < all.length; i++) {
      if (all[i].id === id) {
        return all[i];
      }
    }
    return null;
  }

  // First dish whose name matches the query (case-insensitive exact).
  findByName(name: string): Dish | null {
    const all: Dish[] = this.allAvailable();
    for (let i = 0; i < all.length; i++) {
      if (dishMatchesName(all[i], name)) {
        return all[i];
      }
    }
    return null;
  }

  // Dishes whose name contains the query (case-insensitive).
  searchByName(query: string): Dish[] {
    const trimmed: string = query.trim().toLowerCase();
    const out: Dish[] = [];
    if (trimmed.length === 0) {
      return out;
    }
    const all: Dish[] = this.allAvailable();
    for (let i = 0; i < all.length; i++) {
      if (all[i].name.toLowerCase().includes(trimmed)) {
        out.push(all[i]);
      }
    }
    return out;
  }

  // Filter by selected moods and time slots (empty selection = no constraint).
  filter(moods: string[], times: string[]): Dish[] {
    const out: Dish[] = [];
    const all: Dish[] = this.allAvailable();
    for (let i = 0; i < all.length; i++) {
      const dish: Dish = all[i];
      if (!this.matchesAll(dish.moods, moods)) {
        continue;
      }
      if (!this.matchesAll(dish.timeSlots, times)) {
        continue;
      }
      out.push(dish);
    }
    return out;
  }

  // ---- mutations (persisted) ----

  async addCustomDish(name: string): Promise<Dish | null> {
    const trimmed: string = name.trim();
    if (trimmed.length === 0) {
      return null;
    }
    if (this.findByName(trimmed) !== null) {
      return null;
    }
    const dish: Dish = {
      id: 'c_' + Date.now() + '_' + this.customCache.length,
      name: trimmed,
      category: '自定义',
      tags: [],
      ingredients: [],
      steps: [],
      calories: 0,
      timeSlots: [],
      moods: [],
      source: 'custom',
    };
    this.customCache.push(dish);
    await this.saveDishes(KEY_CUSTOM_DISHES, this.customCache);
    return dish;
  }

  async addWheelDish(name: string): Promise<Dish | null> {
    const trimmed: string = name.trim();
    if (trimmed.length === 0) {
      return null;
    }
    if (this.wheelNameExists(trimmed)) {
      return null;
    }
    const dish: Dish = {
      id: 'w_' + Date.now() + '_' + this.wheelCustomCache.length,
      name: trimmed,
      category: '转盘',
      tags: [],
      ingredients: [],
      steps: [],
      calories: 0,
      timeSlots: [],
      moods: [],
      source: 'custom',
    };
    this.wheelCustomCache.push(dish);
    await this.saveDishes(KEY_WHEEL_DISHES, this.wheelCustomCache);
    return dish;
  }

  async removeWheelDish(id: string): Promise<void> {
    const next: Dish[] = [];
    for (let i = 0; i < this.wheelCustomCache.length; i++) {
      if (this.wheelCustomCache[i].id !== id) {
        next.push(this.wheelCustomCache[i]);
      }
    }
    this.wheelCustomCache = next;
    await this.saveDishes(KEY_WHEEL_DISHES, this.wheelCustomCache);
  }

  async resetWheelDishes(): Promise<void> {
    this.wheelCustomCache = [];
    await this.persistence.remove(KEY_WHEEL_DISHES);
  }

  async clearAllUserData(): Promise<void> {
    this.customCache = [];
    this.wheelCustomCache = [];
    await this.persistence.remove(KEY_CUSTOM_DISHES);
    await this.persistence.remove(KEY_WHEEL_DISHES);
  }

  // expose caches for debug / external read
  customDishes(): Dish[] {
    return this.clone(this.customCache);
  }

  wheelCustomDishes(): Dish[] {
    return this.clone(this.wheelCustomCache);
  }

  // ---- helpers ----

  private wheelNameExists(name: string): boolean {
    const lowered: string = name.toLowerCase();
    for (let i = 0; i < this.wheelCustomCache.length; i++) {
      if (this.wheelCustomCache[i].name.toLowerCase() === lowered) {
        return true;
      }
    }
    return false;
  }

  private matchesAll(dishValues: string[], selected: string[]): boolean {
    if (selected.length === 0) {
      return true;
    }
    for (let s = 0; s < selected.length; s++) {
      let found: boolean = false;
      for (let d = 0; d < dishValues.length; d++) {
        if (dishValues[d] === selected[s]) {
          found = true;
          break;
        }
      }
      if (!found) {
        return false;
      }
    }
    return true;
  }

  private clone(arr: Dish[]): Dish[] {
    const out: Dish[] = [];
    for (let i = 0; i < arr.length; i++) {
      out.push(arr[i]);
    }
    return out;
  }

  private async loadDishes(key: string): Promise<Dish[]> {
    const raw: string = await this.persistence.loadString(key, '');
    if (raw.length === 0) {
      return [];
    }
    try {
      const parsed: Dish[] = JSON.parse(raw) as Dish[];
      return parsed;
    } catch (e) {
      return [];
    }
  }

  private async saveDishes(key: string, dishes: Dish[]): Promise<void> {
    const raw: string = JSON.stringify(dishes);
    await this.persistence.saveString(key, raw);
  }
}
