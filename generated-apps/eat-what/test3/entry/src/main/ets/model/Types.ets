// Types.ets
//
// Shared domain types for the '今天吃什么' decision app.
// Keep these as the single source of truth for models used by services,
// controllers and pages. Do not duplicate these unions into page files.

// 心情标签（FR-3 / spec 第3节）
export type MoodTag = '放纵' | '健康' | '快手' | '治愈' | '解馋';

// 时间/餐别场景（FR-3 / spec 第3节）
export type MealType = '早餐' | '午餐' | '晚餐' | '夜宵' | '加餐';

// 时间场景筛选选项，'' 表示不筛选
export type TimeSceneFilter = MealType | '';

export const MOOD_OPTIONS: MoodTag[] = ['放纵', '健康', '快手', '治愈', '解馋'];
export const MEAL_OPTIONS: MealType[] = ['早餐', '午餐', '晚餐', '夜宵', '加餐'];

// 内置菜品
export interface Dish {
  id: string;
  name: string;
  ingredients: string[];
  moods: MoodTag[];
  timeScenes: MealType[];
  recommend: string;
  difficulty: string;
  estimatedMinutes: number;
}

// 冰箱食材
export interface PantryItem {
  id: string;
  name: string;
}

// 打卡记录
export interface CheckInRecord {
  id: string;
  date: string; // YYYY-MM-DD
  meal: MealType;
  dishName: string;
  moods: MoodTag[];
  note: string;
  createdAt: number;
}

// 分享卡片数据模型
export interface ShareCardModel {
  date: string;
  meal: MealType;
  dishName: string;
  moods: MoodTag[];
  recommend: string;
}

// 按日期分组的打卡记录（用于打卡页分组展示）
export interface CheckInDayGroup {
  date: string;
  records: CheckInRecord[];
}

// ID 生成器（模块级递增计数 + 时间戳，避免重复）
let idCounter: number = 0;
export function genId(prefix: string): string {
  idCounter += 1;
  return `${prefix}-${Date.now()}-${idCounter}`;
}

// 工具：把毫秒时间戳格式化为 YYYY-MM-DD（本地时区）
export function formatDateKey(ts: number): string {
  const d = new Date(ts);
  const y: number = d.getFullYear();
  const m: string = `${d.getMonth() + 1}`.padStart(2, '0');
  const day: string = `${d.getDate()}`.padStart(2, '0');
  return `${y}-${m}-${day}`;
}

export function todayKey(): string {
  return formatDateKey(Date.now());
}
