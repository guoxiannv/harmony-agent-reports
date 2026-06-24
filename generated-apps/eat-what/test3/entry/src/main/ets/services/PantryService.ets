// PantryService.ets
//
// 冰箱食材的纯逻辑层。不直接读写存储——由 AppController 负责把结果同步到
// AppStorage 与 StorageService（spec 第6节）。这里只做增删与校验。

import { genId, PantryItem } from '../model/Types';

export class PantryService {
  // 添加食材：去除首尾空格、忽略重复（大小写不敏感），返回新数组。
  static addItem(items: PantryItem[], name: string): PantryItem[] {
    const trimmed: string = name.trim();
    if (trimmed.length === 0) {
      return items;
    }
    for (let i = 0; i < items.length; i++) {
      if (items[i].name === trimmed) {
        return items;
      }
    }
    const next: PantryItem = { id: genId('pantry'), name: trimmed };
    return items.concat([next]);
  }

  static removeItem(items: PantryItem[], id: string): PantryItem[] {
    const out: PantryItem[] = [];
    for (let i = 0; i < items.length; i++) {
      if (items[i].id !== id) {
        out.push(items[i]);
      }
    }
    return out;
  }
}
