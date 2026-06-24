// IngredientCatalog.ets
//
// Local ingredient catalog used for autocomplete suggestions on the Fridge
// screen. Pure reference data, no persistence.

export class IngredientCatalog {
  private static readonly NAMES: string[] = [
    '番茄', '鸡蛋', '米饭', '面条', '葱', '牛肉', '豆腐', '白菜', '辣椒',
    '猪肉', '大米', '皮蛋', '黄油', '生菜', '黄瓜', '奶油', '咖啡', '面粉',
    '土豆', '咖喱', '鸡肉', '面包', '三文鱼', '柠檬', '燕麦', '牛奶', '虾',
    '胡萝卜', '洋葱', '蒜', '姜', '酱油', '醋', '糖', '盐', '芝士', '蘑菇',
  ];

  static all(): string[] {
    return IngredientCatalog.NAMES;
  }

  // Return names containing the query substring (case-insensitive, trim).
  static suggest(query: string, limit: number = 8): string[] {
    const q: string = query.trim();
    if (q.length === 0) {
      return [];
    }
    const out: string[] = [];
    for (let i = 0; i < IngredientCatalog.NAMES.length && out.length < limit; i++) {
      if (IngredientCatalog.NAMES[i].indexOf(q) >= 0) {
        out.push(IngredientCatalog.NAMES[i]);
      }
    }
    return out;
  }
}
