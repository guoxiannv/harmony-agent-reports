// RecommendationEngine.ets
//
// Pure recommendation logic. No UI, no persistence, no side effects.
// - spin(): deterministic result produced at settle time (the wheel UI drives
//   animation; the picked Dish is what the result resolves to).
// - rankByIngredients(): overlap-based ranking for the Fridge flow.
// - filterByMoodTime(): mood + time filtering for the Mood flow.

import { Dish, Recommendation, MoodTag, MealTime } from '../model/Models';

export class RecommendationEngine {
  // Pick one dish at random from the supplied pool. Returns null if empty.
  static spin(dishes: Dish[]): Dish | null {
    if (dishes.length === 0) {
      return null;
    }
    const idx: number = Math.floor(Math.random() * dishes.length);
    return dishes[idx];
  }

  // Rank dishes by how well they use the given ingredient names.
  // score blends ingredient coverage (of the user's input) and efficiency
  // (share of the dish's own ingredients that are available).
  static rankByIngredients(dishes: Dish[], ingredientNames: string[]): Recommendation[] {
    const normalized: string[] = [];
    for (let i = 0; i < ingredientNames.length; i++) {
      const n: string = ingredientNames[i].trim();
      if (n.length > 0) {
        normalized.push(n);
      }
    }

    const out: Recommendation[] = [];
    for (let i = 0; i < dishes.length; i++) {
      const dish: Dish = dishes[i];
      let match: number = 0;
      for (let j = 0; j < normalized.length; j++) {
        if (dish.ingredientNames.indexOf(normalized[j]) >= 0) {
          match++;
        }
      }
      if (match > 0) {
        const total: number = dish.ingredientNames.length;
        const coverage: number = normalized.length > 0 ? match / normalized.length : 0;
        const efficiency: number = total > 0 ? match / total : 0;
        const score: number = coverage * 0.6 + efficiency * 0.4;
        const rec: Recommendation = {
          dish: dish,
          matchCount: match,
          totalIngredients: total,
          score: score,
        };
        out.push(rec);
      }
    }

    out.sort((a: Recommendation, b: Recommendation) => {
      if (b.score !== a.score) {
        return b.score - a.score;
      }
      return b.matchCount - a.matchCount;
    });
    return out;
  }

  // Filter dishes by mood and/or meal time. Empty string means "no filter".
  static filterByMoodTime(dishes: Dish[], mood: MoodTag | string, time: MealTime | string): Dish[] {
    const out: Dish[] = [];
    const hasMood: boolean = mood.length > 0;
    const hasTime: boolean = time.length > 0;
    for (let i = 0; i < dishes.length; i++) {
      const dish: Dish = dishes[i];
      const moodOk: boolean = !hasMood || dish.moods.some((m: MoodTag) => m === mood);
      const timeOk: boolean = !hasTime || dish.times.some((t: MealTime) => t === time);
      if (moodOk && timeOk) {
        out.push(dish);
      }
    }
    return out;
  }
}
