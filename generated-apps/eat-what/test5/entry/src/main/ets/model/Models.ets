// Models.ets
// Plain interfaces for persisted entities. Interfaces serialize/deserialize cleanly
// with JSON in ArkTS strict mode (no class constructor mapping needed).
// Pages hold @State arrays of these interfaces and reassign on mutation.

import { MealType } from './Enums';

export interface Dish {
  id: string;
  name: string;
  tags: string[];
  ingredients: string[];
  moods: string[];
  times: string[];
  createdAt: number;
}

export interface Checkin {
  id: string;
  dateKey: string;
  meal: MealType;
  dishName: string;
  note: string;
  createdAt: number;
}

export interface Ingredient {
  id: string;
  name: string;
  createdAt: number;
}

export interface WheelCandidate {
  id: string;
  name: string;
  createdAt: number;
}

export interface TodayStatus {
  hasBreakfast: boolean;
  hasLunch: boolean;
  hasDinner: boolean;
  count: number;
}

// Date helpers (local time). dateKey format: YYYY-MM-DD.
export function toDateKey(ts: number): string {
  const d = new Date(ts);
  const y = d.getFullYear();
  const m = d.getMonth() + 1;
  const day = d.getDate();
  const mm = m < 10 ? '0' + m : '' + m;
  const dd = day < 10 ? '0' + day : '' + day;
  return '' + y + '-' + mm + '-' + dd;
}

export function todayKey(): string {
  return toDateKey(Date.now());
}

export function genId(): string {
  // Stable-ish id without Math.random in tight loops; combine time + counter.
  return 'id_' + Date.now().toString(36) + '_' + (genIdCounter()).toString(36);
}

let __idCounter: number = 0;
function genIdCounter(): number {
  __idCounter = __idCounter + 1;
  return __idCounter;
}
