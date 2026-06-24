// RecommendService.ets
//
// 推荐 / 筛选 / 转盘抽取的纯逻辑层（无 UI、无持久化）。
// - filterCandidates: 按心情（任一命中）与时间场景筛选菜品。
// - recommendByPantry: 在筛选基础上按冰箱食材命中度排序。
// - spinPick: 从候选池随机抽取一个结果。

import { Dish, MoodTag, PantryItem, TimeSceneFilter } from '../model/Types';

export class RecommendService {
  // 心情多选：候选菜品需至少命中一个被选心情（未选则不筛）。
  // 时间场景单选：未选('')则不筛，否则菜品需包含该场景。
  static filterCandidates(dishes: Dish[], moods: MoodTag[], timeScene: TimeSceneFilter): Dish[] {
    const result: Dish[] = [];
    for (let i = 0; i < dishes.length; i++) {
      const d: Dish = dishes[i];
      const moodOk: boolean = moods.length === 0 || RecommendService.hasAnyMood(d, moods);
      const timeOk: boolean = timeScene === '' || d.timeScenes.includes(timeScene);
      if (moodOk && timeOk) {
        result.push(d);
      }
    }
    return result;
  }

  // 按冰箱食材推荐：命中主要食材即可，按命中数量降序排序。
  static recommendByPantry(dishes: Dish[], items: PantryItem[], moods: MoodTag[],
    timeScene: TimeSceneFilter): Dish[] {
    const names: string[] = items.map((item: PantryItem) => item.name);
    const filtered: Dish[] = RecommendService.filterCandidates(dishes, moods, timeScene);
    const scored: DishWithScore[] = [];
    for (let i = 0; i < filtered.length; i++) {
      const d: Dish = filtered[i];
      const score: number = RecommendService.matchScore(d, names);
      if (score > 0) {
        scored.push({ dish: d, score: score });
      }
    }
    scored.sort((a: DishWithScore, b: DishWithScore) => b.score - a.score);
    const out: Dish[] = [];
    for (let i = 0; i < scored.length; i++) {
      out.push(scored[i].dish);
    }
    return out;
  }

  // 从候选池随机抽取一个结果（FR-1）。
  static spinPick(candidates: Dish[]): Dish | null {
    if (candidates.length === 0) {
      return null;
    }
    const idx: number = Math.floor(Math.random() * candidates.length);
    return candidates[idx];
  }

  private static hasAnyMood(d: Dish, moods: MoodTag[]): boolean {
    for (let i = 0; i < moods.length; i++) {
      if (d.moods.includes(moods[i])) {
        return true;
      }
    }
    return false;
  }

  private static matchScore(d: Dish, names: string[]): number {
    let score: number = 0;
    for (let i = 0; i < d.ingredients.length; i++) {
      if (names.includes(d.ingredients[i])) {
        score += 1;
      }
    }
    return score;
  }
}

interface DishWithScore {
  dish: Dish;
  score: number;
}
