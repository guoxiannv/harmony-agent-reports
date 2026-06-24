// Enums.ets
// Shared enumerations and label helpers for the 今天吃什么 app.
// ArkTS strict: avoid indexed access on consts — use if/switch helpers.

export type MealType = 'breakfast' | 'lunch' | 'dinner';

export type WheelState = 'idle' | 'spinning' | 'finished';

export type RecommendSegment = 'wheel' | 'ingredient' | 'filter';

export const MOOD_OPTIONS: string[] = ['开心', '想吃辣', '清淡', '治愈', '放纵', '随便'];

export const TIME_SLOT_OPTIONS: string[] = ['早餐', '午餐', '晚餐', '夜宵'];

export const MEAL_ORDER: MealType[] = ['breakfast', 'lunch', 'dinner'];

export function mealLabel(meal: MealType): string {
  if (meal === 'breakfast') {
    return '早餐';
  } else if (meal === 'lunch') {
    return '午餐';
  }
  return '晚餐';
}
