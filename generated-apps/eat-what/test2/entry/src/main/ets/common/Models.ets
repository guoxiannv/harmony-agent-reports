// Models.ets
//
// Shared domain types for the "今天吃什么" decision app.
// These are headless data contracts consumed by services, controllers, and
// (later) the final UI. No layout, no ArkUI decoration here.

// 用餐类别
export type MealType = 'breakfast' | 'lunch' | 'dinner' | 'lateNight';

// 当前心情
export type MoodType = 'happy' | 'tired' | 'spicy' | 'light' | 'comfort' | 'adventurous';

// 可用时间 / 烹饪规模
export type CookTimeType = 'quick' | 'normal' | 'weekend';

// 难度
export type DifficultyType = 'easy' | 'medium' | 'hard';

// 分享卡片来源
export type ShareCardSource = 'wheel' | 'ingredient' | 'filter' | 'record';

// 内置菜谱
export interface Dish {
  id: string;
  name: string;
  tags: string[];
  ingredients: string[];
  cookMinutes: number;
  meals: MealType[];
  difficulty: DifficultyType;
  moods: MoodType[];
  cookTime: CookTimeType;
  cuisine: string;
}

// 用户冰箱食材
export interface Ingredient {
  id: string;
  name: string;
  quantity: string;
  addedAt: number;
}

// 每日饮食打卡记录
export interface DishRecord {
  id: string;
  date: string; // YYYYMMDD
  meal: MealType;
  dishName: string;
  rating: number; // 1..5
  note: string;
}

// 运行时筛选条件，每个维度可为 '' 表示不限制
export interface FilterCriteria {
  mood: MoodType | '';
  time: CookTimeType | '';
  meal: MealType | '';
}

// 分享卡片展示数据
export interface ShareCardData {
  dishName: string;
  dateLabel: string;
  mealLabel: string;
  reason: string;
  tags: string[];
  source: ShareCardSource;
}

// 带匹配度的推荐菜谱（按食材匹配场景）
export interface ScoredDish {
  dish: Dish;
  matched: number; // 命中的食材数
  total: number; // 该菜谱所需食材数
  score: number; // matched / total
}

// 转盘抽取结果
export interface WheelSpinResult {
  candidates: Dish[];
  selectedIndex: number;
  dish: Dish;
}

// 标签/餐别等枚举的展示映射（给 UI 使用，逻辑层只提供数据）
export interface MealLabelMap {
  breakfast: string;
  lunch: string;
  dinner: string;
  lateNight: string;
}

export interface MoodLabelMap {
  happy: string;
  tired: string;
  spicy: string;
  light: string;
  comfort: string;
  adventurous: string;
}

export interface CookTimeLabelMap {
  quick: string;
  normal: string;
  weekend: string;
}

export interface DifficultyLabelMap {
  easy: string;
  medium: string;
  hard: string;
}

export const MEAL_LABELS: MealLabelMap = {
  breakfast: '早餐',
  lunch: '午餐',
  dinner: '晚餐',
  lateNight: '夜宵',
};

export const MOOD_LABELS: MoodLabelMap = {
  happy: '心情不错',
  tired: '有点累',
  spicy: '想吃辣',
  light: '想清淡',
  comfort: '想吃治愈',
  adventurous: '想尝鲜',
};

export const COOK_TIME_LABELS: CookTimeLabelMap = {
  quick: '快手菜',
  normal: '正经一餐',
  weekend: '周末大餐',
};

export const DIFFICULTY_LABELS: DifficultyLabelMap = {
  easy: '简单',
  medium: '中等',
  hard: '较难',
};

export function emptyFilter(): FilterCriteria {
  return { mood: '', time: '', meal: '' };
}

// ArkTS forbids indexed access on interface-typed label maps, so expose
// explicit accessors instead of MOOD_LABELS[m] etc.
export function mealLabelOf(m: MealType): string {
  if (m === 'breakfast') return MEAL_LABELS.breakfast;
  if (m === 'lunch') return MEAL_LABELS.lunch;
  if (m === 'dinner') return MEAL_LABELS.dinner;
  return MEAL_LABELS.lateNight;
}

export function moodLabelOf(mo: MoodType): string {
  if (mo === 'happy') return MOOD_LABELS.happy;
  if (mo === 'tired') return MOOD_LABELS.tired;
  if (mo === 'spicy') return MOOD_LABELS.spicy;
  if (mo === 'light') return MOOD_LABELS.light;
  if (mo === 'comfort') return MOOD_LABELS.comfort;
  return MOOD_LABELS.adventurous;
}

export function cookTimeLabelOf(t: CookTimeType): string {
  if (t === 'quick') return COOK_TIME_LABELS.quick;
  if (t === 'normal') return COOK_TIME_LABELS.normal;
  return COOK_TIME_LABELS.weekend;
}

export function difficultyLabelOf(d: DifficultyType): string {
  if (d === 'easy') return DIFFICULTY_LABELS.easy;
  if (d === 'medium') return DIFFICULTY_LABELS.medium;
  return DIFFICULTY_LABELS.hard;
}

// 是否任意维度被选中
export function isFilterActive(f: FilterCriteria): boolean {
  return f.mood !== '' || f.time !== '' || f.meal !== '';
}
