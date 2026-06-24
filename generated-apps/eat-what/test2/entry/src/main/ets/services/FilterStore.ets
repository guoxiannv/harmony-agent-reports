// FilterStore.ets
//
// Runtime-only filter state (mood / time / meal).
// Per spec: filter conditions are runtime state, not persisted
// (an MVP may remember the last selection; we keep it in-memory).

import { FilterCriteria, MoodType, CookTimeType, MealType, emptyFilter } from '../common/Models';

export class FilterStore {
  private state: FilterCriteria = emptyFilter();

  set(c: FilterCriteria): void {
    this.state = { mood: c.mood, time: c.time, meal: c.meal };
  }

  setMood(m: MoodType | ''): void {
    this.state = { mood: m, time: this.state.time, meal: this.state.meal };
  }

  setTime(t: CookTimeType | ''): void {
    this.state = { mood: this.state.mood, time: t, meal: this.state.meal };
  }

  setMeal(meal: MealType | ''): void {
    this.state = { mood: this.state.mood, time: this.state.time, meal };
  }

  get(): FilterCriteria {
    return { mood: this.state.mood, time: this.state.time, meal: this.state.meal };
  }

  reset(): void {
    this.state = emptyFilter();
  }
}
