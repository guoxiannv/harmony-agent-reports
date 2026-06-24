// Checkin entity — one recorded meal on a given day.

import { MealType } from './Enums';

export interface Checkin {
  id: string;
  dishId: string;
  dishName: string;
  meal: string;        // MealType
  note: string;
  calories: number;
  timestamp: number;   // epoch ms
  dateKey: string;     // 'YYYY-MM-DD'
}

export function makeCheckin(
  id: string,
  dishId: string,
  dishName: string,
  meal: MealType,
  note: string,
  calories: number,
  timestamp: number,
  dateKey: string
): Checkin {
  const checkin: Checkin = {
    id: id,
    dishId: dishId,
    dishName: dishName,
    meal: meal,
    note: note,
    calories: calories,
    timestamp: timestamp,
    dateKey: dateKey,
  };
  return checkin;
}

// Convert an epoch-ms timestamp to a 'YYYY-MM-DD' key in local time.
export function dateKeyFromTimestamp(timestamp: number): string {
  const date: Date = new Date(timestamp);
  const year: number = date.getFullYear();
  const month: number = date.getMonth() + 1;
  const day: number = date.getDate();
  const monthStr: string = month < 10 ? '0' + month : '' + month;
  const dayStr: string = day < 10 ? '0' + day : '' + day;
  return year + '-' + monthStr + '-' + dayStr;
}
