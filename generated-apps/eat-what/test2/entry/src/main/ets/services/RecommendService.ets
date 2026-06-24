// RecommendService.ets
//
// Headless recommendation engine.
// 1) filterByCriteria: narrow the catalog by mood/time/meal (the FilterCriteria).
// 2) recommendByIngredients: rank dishes by how many of their ingredients
//    the user currently owns.

import { Dish, FilterCriteria, Ingredient, ScoredDish } from '../common/Models';
import { DishCatalog } from '../data/DishCatalog';

export class RecommendService {
  static filterByCriteria(criteria: FilterCriteria): Dish[] {
    const all = DishCatalog.all();
    const list: Dish[] = [];
    for (let i = 0; i < all.length; i++) {
      if (RecommendService.matches(all[i], criteria)) {
        list.push(all[i]);
      }
    }
    return list;
  }

  static matches(dish: Dish, c: FilterCriteria): boolean {
    if (c.mood !== '' && dish.moods.indexOf(c.mood) < 0) {
      return false;
    }
    if (c.time !== '' && dish.cookTime !== c.time) {
      return false;
    }
    if (c.meal !== '' && dish.meals.indexOf(c.meal) < 0) {
      return false;
    }
    return true;
  }

  static recommendByIngredients(ingredients: Ingredient[]): ScoredDish[] {
    const owned = RecommendService.normalizeOwned(ingredients);
    const all = DishCatalog.all();
    const scored: ScoredDish[] = [];
    for (let i = 0; i < all.length; i++) {
      const d = all[i];
      let matched = 0;
      for (let j = 0; j < d.ingredients.length; j++) {
        if (RecommendService.contains(owned, d.ingredients[j])) {
          matched++;
        }
      }
      if (matched > 0) {
        const total = d.ingredients.length;
        scored.push({
          dish: d,
          matched,
          total,
          score: matched / total,
        });
      }
    }
    scored.sort((a: ScoredDish, b: ScoredDish) => {
      if (b.score !== a.score) {
        return b.score - a.score;
      }
      return a.dish.cookMinutes - b.dish.cookMinutes;
    });
    return scored;
  }

  private static normalizeOwned(ingredients: Ingredient[]): string[] {
    const arr: string[] = [];
    for (let i = 0; i < ingredients.length; i++) {
      const n = ingredients[i].name.trim().toLowerCase();
      if (n.length > 0) {
        arr.push(n);
      }
    }
    return arr;
  }

  private static contains(arr: string[], v: string): boolean {
    const n = v.trim().toLowerCase();
    for (let i = 0; i < arr.length; i++) {
      if (arr[i] === n) {
        return true;
      }
    }
    return false;
  }
}
