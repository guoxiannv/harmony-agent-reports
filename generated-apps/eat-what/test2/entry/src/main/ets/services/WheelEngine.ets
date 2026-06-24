// WheelEngine.ets
//
// Builds the wheel candidate pool from the active FilterCriteria and
// performs the random spin. Headless: returns data + index, not animation.

import { Dish, FilterCriteria, WheelSpinResult } from '../common/Models';
import { RecommendService } from './RecommendService';
import { DishCatalog } from '../data/DishCatalog';

const MAX_WHEEL_SLOTS = 8;

export class WheelEngine {
  static buildCandidates(criteria: FilterCriteria): Dish[] {
    let pool = RecommendService.filterByCriteria(criteria);
    if (pool.length < 2) {
      // Fallback to the full catalog when the filter is too restrictive,
      // so the wheel is never empty / single-slot.
      pool = DishCatalog.all().slice();
    }
    if (pool.length > MAX_WHEEL_SLOTS) {
      pool = pool.slice(0, MAX_WHEEL_SLOTS);
    }
    return pool;
  }

  static spin(candidates: Dish[]): WheelSpinResult | null {
    if (candidates.length === 0) {
      return null;
    }
    const idx = Math.floor(Math.random() * candidates.length);
    return {
      candidates,
      selectedIndex: idx,
      dish: candidates[idx],
    };
  }
}
