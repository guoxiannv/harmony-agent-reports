// Dish entity — a single dish in the dish bank.
// Fields are intentionally explicit to satisfy ArkTS strict mode (no untyped
// object literals) and to persist cleanly as JSON.

export interface Dish {
  id: string;
  name: string;
  category: string;          // e.g. 主食 / 汤 / 小菜 / 甜点
  tags: string[];            // display tags e.g. ['清淡','低卡']
  ingredients: string[];     // required ingredient names for recommendation matching
  steps: string[];           // short cooking steps
  calories: number;          // kcal per serving
  timeSlots: string[];       // TimeSlot values this dish suits
  moods: string[];           // MoodType values this dish suits
  source: string;            // 'builtin' | 'custom'
}

// Helper builders (ArkTS forbids spreads, so construct field-by-field).

export function makeBuiltinDish(
  id: string,
  name: string,
  category: string,
  tags: string[],
  ingredients: string[],
  steps: string[],
  calories: number,
  timeSlots: string[],
  moods: string[]
): Dish {
  const dish: Dish = {
    id: id,
    name: name,
    category: category,
    tags: tags,
    ingredients: ingredients,
    steps: steps,
    calories: calories,
    timeSlots: timeSlots,
    moods: moods,
    source: 'builtin',
  };
  return dish;
}

export function makeCustomDish(id: string, name: string): Dish {
  const dish: Dish = {
    id: id,
    name: name,
    category: '自定义',
    tags: [],
    ingredients: [],
    steps: [],
    calories: 0,
    timeSlots: [],
    moods: [],
    source: 'custom',
  };
  return dish;
}

// True when two dish ids or names match (name compare is case-insensitive).
export function dishMatchesName(dish: Dish, name: string): boolean {
  const trimmed: string = name.trim();
  if (trimmed.length === 0) {
    return false;
  }
  return dish.name.toLowerCase() === trimmed.toLowerCase();
}
