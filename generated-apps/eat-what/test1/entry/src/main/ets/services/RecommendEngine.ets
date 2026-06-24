// RecommendEngine — ranks dishes by how well the user's fridge ingredients
// cover each dish's required ingredients. Pure logic, no persistence.

import { Dish } from '../model/Dish';
import { Ingredient } from '../model/Ingredient';

export interface Recommendation {
  dish: Dish;
  matchRatio: number;     // 0..1, fraction of required ingredients owned
  matchedCount: number;
  requiredCount: number;
}

export class RecommendEngine {
  // Returns dishes sorted by matchRatio desc then name. Dishes with no required
  // ingredients are excluded (cannot meaningfully match). Dishes with zero match
  // are also excluded so the list only shows dishes the user can partially cook.
  recommend(dishes: Dish[], owned: Ingredient[]): Recommendation[] {
    const ownedLower: string[] = [];
    for (let i = 0; i < owned.length; i++) {
      ownedLower.push(owned[i].name.trim().toLowerCase());
    }

    const recs: Recommendation[] = [];
    for (let i = 0; i < dishes.length; i++) {
      const dish: Dish = dishes[i];
      if (dish.ingredients.length === 0) {
        continue;
      }
      let matched: number = 0;
      for (let r = 0; r < dish.ingredients.length; r++) {
        const requiredLower: string = dish.ingredients[r].trim().toLowerCase();
        if (this.contains(ownedLower, requiredLower)) {
          matched++;
        }
      }
      if (matched === 0) {
        continue;
      }
      const ratio: number = matched / dish.ingredients.length;
      const rec: Recommendation = {
        dish: dish,
        matchRatio: ratio,
        matchedCount: matched,
        requiredCount: dish.ingredients.length,
      };
      recs.push(rec);
    }

    // Sort by ratio desc, then matchedCount desc, then name asc.
    this.sort(recs);
    return recs;
  }

  // Convenience: just the ordered dish list.
  rankedDishes(dishes: Dish[], owned: Ingredient[]): Dish[] {
    const recs: Recommendation[] = this.recommend(dishes, owned);
    const out: Dish[] = [];
    for (let i = 0; i < recs.length; i++) {
      out.push(recs[i].dish);
    }
    return out;
  }

  private sort(recs: Recommendation[]): void {
    // Simple stable insertion sort (ArkTS-friendly, no spread / index-on-object).
    for (let i = 1; i < recs.length; i++) {
      const current: Recommendation = recs[i];
      let j: number = i - 1;
      while (j >= 0 && this.shouldComeBefore(current, recs[j])) {
        recs[j + 1] = recs[j];
        j--;
      }
      recs[j + 1] = current;
    }
  }

  private shouldComeBefore(a: Recommendation, b: Recommendation): boolean {
    if (a.matchRatio !== b.matchRatio) {
      return a.matchRatio > b.matchRatio;
    }
    if (a.matchedCount !== b.matchedCount) {
      return a.matchedCount > b.matchedCount;
    }
    return a.dish.name.localeCompare(b.dish.name) < 0;
  }

  private contains(arr: string[], value: string): boolean {
    for (let i = 0; i < arr.length; i++) {
      if (arr[i] === value) {
        return true;
      }
    }
    return false;
  }
}
