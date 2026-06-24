// MoodController.ets
//
// Controller for the mood-page surface. Owns /filters/mood, /filters/time,
// and /mood/results. Tap-a-dish-to-log is handled by logDish().

import { Dish, MoodTag, MealTime, LogEntry, inferMealTime } from '../model/Models';
import { DishCatalog } from '../data/DishCatalog';
import { RecommendationEngine } from '../service/RecommendationEngine';
import { LogRepository } from '../service/LogRepository';

export class MoodController {
  // /filters/mood
  selectedMood: MoodTag | string = '';
  // /filters/time
  selectedTime: MealTime | string = '';
  // /mood/results
  results: Dish[] = [];

  lastFeedback: string = '';
  private idCounter: number = 0;

  onChange: () => void = () => {};

  // input /filters/mood
  setMood(mood: MoodTag | string): void {
    this.selectedMood = this.selectedMood === mood ? '' : mood;
    this.notify();
  }

  // input /filters/time
  setTime(time: MealTime | string): void {
    this.selectedTime = this.selectedTime === time ? '' : time;
    this.notify();
  }

  // event apply-mood-filters
  apply(): void {
    this.results = RecommendationEngine.filterByMoodTime(
      DishCatalog.all(),
      this.selectedMood,
      this.selectedTime,
    );
    if (this.results.length === 0) {
      this.lastFeedback = '没有匹配的菜品';
    } else {
      this.lastFeedback = '';
    }
    this.notify();
  }

  // event log-selected-dish
  async logDish(dishId: string): Promise<void> {
    const dish: Dish | null = DishCatalog.byId(dishId);
    if (dish === null) {
      this.lastFeedback = '菜品不存在';
      this.notify();
      return;
    }
    const time: MealTime | string = this.selectedTime.length > 0 ? this.selectedTime : inferMealTime(new Date().getHours());
    const entry: LogEntry = {
      id: this.nextId(),
      dishId: dish.id,
      dishName: dish.name,
      timestamp: Date.now(),
      mealTime: time as MealTime,
      mood: this.selectedMood,
      note: '',
    };
    await LogRepository.addEntry(entry);
    this.lastFeedback = `已打卡：${dish.name}`;
    this.notify();
  }

  nextId(): string {
    this.idCounter += 1;
    return `mood-${Date.now()}-${this.idCounter}`;
  }

  private notify(): void {
    this.onChange();
  }
}

export const moodController: MoodController = new MoodController();
