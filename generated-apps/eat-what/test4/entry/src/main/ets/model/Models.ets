// Models.ets
//
// Shared domain models + enum-style unions for the 今天吃什么 app.
// All types here are pure data (no UI dependencies) so services and
// controllers can depend on them freely.

export type MoodTag = 'rich' | 'light' | 'spicy' | 'sweet' | 'comfort' | 'quick';
export type MealTime = 'breakfast' | 'lunch' | 'dinner' | 'lateNight';

export interface MoodOption {
  value: MoodTag;
  label: string;
}

export interface MealTimeOption {
  value: MealTime;
  label: string;
}

export interface Ingredient {
  id: string;
  name: string;
}

export interface Dish {
  id: string;
  name: string;
  ingredientNames: string[];
  moods: MoodTag[];
  times: MealTime[];
  minutes: number;
  calories: number;
}

export interface Recommendation {
  dish: Dish;
  matchCount: number;
  totalIngredients: number;
  score: number;
}

export interface LogEntry {
  id: string;
  dishId: string;
  dishName: string;
  timestamp: number;
  mealTime: MealTime;
  mood: string;
  note: string;
}

export interface ShareCardPreview {
  dishName: string;
  date: string;
  mealTimeLabel: string;
  moodLabel: string;
  note: string;
}

// Mood options bound to /filters/mood.
export const MOOD_OPTIONS: MoodOption[] = [
  { value: 'rich', label: '想吃好的' },
  { value: 'light', label: '清淡' },
  { value: 'spicy', label: '重口味' },
  { value: 'sweet', label: '甜品' },
  { value: 'comfort', label: '暖胃' },
  { value: 'quick', label: '快手' },
];

// Meal-time options bound to /filters/time.
export const TIME_OPTIONS: MealTimeOption[] = [
  { value: 'breakfast', label: '早餐' },
  { value: 'lunch', label: '午餐' },
  { value: 'dinner', label: '晚餐' },
  { value: 'lateNight', label: '夜宵' },
];

export function moodLabel(value: string): string {
  for (let i = 0; i < MOOD_OPTIONS.length; i++) {
    if (MOOD_OPTIONS[i].value === value) {
      return MOOD_OPTIONS[i].label;
    }
  }
  return '';
}

export function mealTimeLabel(value: MealTime): string {
  for (let i = 0; i < TIME_OPTIONS.length; i++) {
    if (TIME_OPTIONS[i].value === value) {
      return TIME_OPTIONS[i].label;
    }
  }
  return '';
}

// Infer a meal time from the hour of day (0-23).
export function inferMealTime(hour: number): MealTime {
  if (hour < 10) {
    return 'breakfast';
  } else if (hour < 14) {
    return 'lunch';
  } else if (hour < 21) {
    return 'dinner';
  } else {
    return 'lateNight';
  }
}

export interface RawLogEntry {
  id: string;
  dishId: string;
  dishName: string;
  timestamp: number;
  mealTime: MealTime;
  mood: string;
  note: string;
}

// Build a typed LogEntry from a parsed object, tolerating missing fields.
export function toLogEntry(raw: RawLogEntry): LogEntry {
  return {
    id: raw.id,
    dishId: raw.dishId,
    dishName: raw.dishName,
    timestamp: raw.timestamp,
    mealTime: raw.mealTime,
    mood: raw.mood,
    note: raw.note,
  };
}
