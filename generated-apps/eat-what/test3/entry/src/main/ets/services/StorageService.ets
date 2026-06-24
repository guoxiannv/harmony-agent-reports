// StorageService.ets
//
// 本地持久化服务（spec 第6节）。基于 @kit.ArkData preferences 把
// 冰箱食材与打卡记录落盘，应用启动时由 AppController.init() 加载并写入
// AppStorage 作为跨页面的响应式共享状态。无后端、无网络。

import { preferences } from '@kit.ArkData';
import { common } from '@kit.AbilityKit';
import { CheckInRecord, PantryItem } from '../model/Types';

const STORE_NAME: string = 'eatwhat_store';
const KEY_PANTRY: string = 'pantry_items';
const KEY_CHECK_INS: string = 'checkin_records';
const EMPTY_JSON: string = '[]';

export class StorageService {
  private static instance: StorageService | null = null;
  private store: preferences.Preferences | null = null;

  static getInstance(): StorageService {
    if (StorageService.instance === null) {
      StorageService.instance = new StorageService();
    }
    return StorageService.instance;
  }

  // 由 EntryAbility.onCreate 调用，注入 UIAbility context。
  async init(context: common.Context): Promise<void> {
    try {
      this.store = await preferences.getPreferences(context, STORE_NAME);
    } catch (err) {
      this.store = null;
    }
  }

  async loadPantry(): Promise<PantryItem[]> {
    const raw: string = await this.readString(KEY_PANTRY);
    return this.parsePantry(raw);
  }

  async savePantry(items: PantryItem[]): Promise<void> {
    await this.writeString(KEY_PANTRY, JSON.stringify(items));
  }

  async loadCheckIns(): Promise<CheckInRecord[]> {
    const raw: string = await this.readString(KEY_CHECK_INS);
    return this.parseCheckIns(raw);
  }

  async saveCheckIns(records: CheckInRecord[]): Promise<void> {
    await this.writeString(KEY_CHECK_INS, JSON.stringify(records));
  }

  private async readString(key: string): Promise<string> {
    if (this.store === null) {
      return EMPTY_JSON;
    }
    try {
      const val: preferences.ValueType = await this.store.get(key, EMPTY_JSON);
      if (typeof val === 'string') {
        return val;
      }
      return EMPTY_JSON;
    } catch (err) {
      return EMPTY_JSON;
    }
  }

  private async writeString(key: string, value: string): Promise<void> {
    if (this.store === null) {
      return;
    }
    try {
      await this.store.put(key, value);
      await this.store.flush();
    } catch (err) {
      // 忽略写盘失败，内存状态仍可用。
    }
  }

  // 显式重建类型化对象，避免对 JSON.parse 结果做索引访问（ArkTS strict）。
  private parsePantry(raw: string): PantryItem[] {
    let parsed: PantryItem[];
    try {
      parsed = JSON.parse(raw) as PantryItem[];
    } catch (err) {
      return [];
    }
    const out: PantryItem[] = [];
    for (let i = 0; i < parsed.length; i++) {
      const item: PantryItem = parsed[i];
      out.push({ id: item.id, name: item.name });
    }
    return out;
  }

  private parseCheckIns(raw: string): CheckInRecord[] {
    let parsed: CheckInRecord[];
    try {
      parsed = JSON.parse(raw) as CheckInRecord[];
    } catch (err) {
      return [];
    }
    const out: CheckInRecord[] = [];
    for (let i = 0; i < parsed.length; i++) {
      const r: CheckInRecord = parsed[i];
      out.push({
        id: r.id,
        date: r.date,
        meal: r.meal,
        dishName: r.dishName,
        moods: r.moods,
        note: r.note,
        createdAt: r.createdAt,
      });
    }
    return out;
  }
}
