// HomeController.ets
//
// Controller for the home-page surface (spin wheel + current recommendation +
// quick filters). Owns /wheel/state, /recommendation/current, and the home-side
// /filters/* selections. Plain class + onChange callback for later UI binding.

import { Dish, MoodTag, MealTime, LogEntry, inferMealTime } from '../model/Models';
import { DishCatalog } from '../data/DishCatalog';
import { RecommendationEngine } from '../service/RecommendationEngine';
import { LogRepository } from '../service/LogRepository';

export type WheelState = 'idle' | 'spinning' | 'settled';

export class HomeController {
  // /wheel/state
  wheelState: WheelState = 'idle';
  // /recommendation/current
  currentDish: Dish | null = null;
  // home quick filters (mirror MoodController selections)
  selectedMood: MoodTag | string = '';
  selectedTime: MealTime | string = '';

  lastFeedback: string = '';
  private idCounter: number = 0;

  onChange: () => void = () => {};

  // event spin-wheel
  spin(): void {
    this.wheelState = 'spinning';
    this.lastFeedback = '';
    this.notify();
    // Deterministic result is resolved at settle time. The wheel UI drives the
    // animation duration; here we compute the final dish immediately so the
    // result is always well-defined after the spin resolves.
    const pool: Dish[] = this.currentPool();
    const picked: Dish | null = RecommendationEngine.spin(pool);
    this.currentDish = picked;
    this.wheelState = 'settled';
    this.notify();
  }

  // event log-current-dish
  async logCurrent(): Promise<void> {
    const dish: Dish | null = this.currentDish;
    if (dish === null) {
      this.lastFeedback = '请先转动转盘';
      this.notify();
      return;
    }
    const entry: LogEntry = {
      id: this.nextId(),
      dishId: dish.id,
      dishName: dish.name,
      timestamp: Date.now(),
      mealTime: inferMealTime(new Date().getHours()),
      mood: this.selectedMood,
      note: '',
    };
    await LogRepository.addEntry(entry);
    this.lastFeedback = `已打卡：${dish.name}`;
    this.notify();
  }

  // input /filters/mood
  setMood(mood: MoodTag | string): void {
    this.selectedMood = mood;
    this.notify();
  }

  // input /filters/time
  setTime(time: MealTime | string): void {
    this.selectedTime = time;
    this.notify();
  }

  reset(): void {
    this.wheelState = 'idle';
    this.currentDish = null;
    this.lastFeedback = '';
    this.notify();
  }

  // Pool for spinning: apply active home filters when present, else full library.
  private currentPool(): Dish[] {
    return RecommendationEngine.filterByMoodTime(
      DishCatalog.all(),
      this.selectedMood,
      this.selectedTime,
    );
  }

  nextId(): string {
    this.idCounter += 1;
    return `home-${Date.now()}-${this.idCounter}`;
  }

  private notify(): void {
    this.onChange();
  }
}

export const homeController: HomeController = new HomeController();
