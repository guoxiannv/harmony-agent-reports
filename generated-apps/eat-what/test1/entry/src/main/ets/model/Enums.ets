// Shared domain enums and display labels for the 今天吃什么 app.
// String union types are used so values can be persisted as JSON strings and
// bound directly to semantic-list bindings (e.g. /discover/selectedMoods: string[]).

// 用餐时段 / 用餐类别
export type MealType = 'breakfast' | 'lunch' | 'dinner' | 'lateNight';

// 菜品适用的用餐时段（与 MealType 取值一致）
export type TimeSlot = 'breakfast' | 'lunch' | 'dinner' | 'lateNight';

// 心情标签
export type MoodType = 'light' | 'heavy' | 'quick' | 'healthy' | 'indulge' | 'comfort';

// 分享卡片模板风格
export type ShareTemplate = 'classic' | 'warm' | 'fresh';

// ArkTS strict mode forbids indexed access on object literals, so label lookup
// is done via explicit functions instead of a record map.

export function mealLabel(meal: MealType): string {
  if (meal === 'breakfast') {
    return '早餐';
  } else if (meal === 'lunch') {
    return '午餐';
  } else if (meal === 'dinner') {
    return '晚餐';
  }
  return '夜宵';
}

export function moodLabel(mood: MoodType): string {
  if (mood === 'light') {
    return '想吃清淡';
  } else if (mood === 'heavy') {
    return '重口味';
  } else if (mood === 'quick') {
    return '快手菜';
  } else if (mood === 'healthy') {
    return '健康减脂';
  } else if (mood === 'indulge') {
    return '放纵一下';
  }
  return '治愈系';
}

export function timeSlotLabel(slot: TimeSlot): string {
  return mealLabel(slot);
}

export function templateLabel(template: ShareTemplate): string {
  if (template === 'warm') {
    return '温暖橙';
  } else if (template === 'fresh') {
    return '清新绿';
  }
  return '经典金';
}

export const ALL_MOODS: MoodType[] = ['light', 'heavy', 'quick', 'healthy', 'indulge', 'comfort'];
export const ALL_TIME_SLOTS: TimeSlot[] = ['breakfast', 'lunch', 'dinner', 'lateNight'];
export const ALL_MEALS: MealType[] = ['breakfast', 'lunch', 'dinner', 'lateNight'];
export const ALL_TEMPLATES: ShareTemplate[] = ['classic', 'warm', 'fresh'];
