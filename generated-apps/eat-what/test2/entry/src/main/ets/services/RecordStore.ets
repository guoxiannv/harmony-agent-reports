// RecordStore.ets
//
// Persistence layer for daily meal check-in records.
// Backed by @ohos.data.preferences. Also provides calendar aggregation.

import { preferences } from '@kit.ArkData';
import { common } from '@kit.AbilityKit';
import { DishRecord, MealType } from '../common/Models';

const STORE_NAME = 'eat_records';
const KEY_PREFIX = 'record_';

// Input shape for add(): same fields as DishRecord minus the generated id.
export interface RecordInput {
  date: string;
  meal: MealType;
  dishName: string;
  rating: number;
  note: string;
}

export class RecordStore {
  private pref: preferences.Preferences | null = null;
  private seq: number = 0;

  async init(context: common.Context): Promise<void> {
    this.pref = await preferences.getPreferences(context, STORE_NAME);
  }

  private ensure(): preferences.Preferences {
    if (this.pref === null) {
      throw new Error('RecordStore not initialized');
    }
    return this.pref;
  }

  async add(rec: RecordInput): Promise<DishRecord> {
    const p = this.ensure();
    const record: DishRecord = {
      id: `rec_${Date.now()}_${this.nextSeq()}`,
      date: rec.date,
      meal: rec.meal,
      dishName: rec.dishName.trim(),
      rating: rec.rating,
      note: rec.note.trim(),
    };
    await p.put(KEY_PREFIX + record.id, JSON.stringify(record));
    await p.flush();
    return record;
  }

  async remove(id: string): Promise<void> {
    const p = this.ensure();
    await p.delete(KEY_PREFIX + id);
    await p.flush();
  }

  async list(): Promise<DishRecord[]> {
    const p = this.ensure();
    const all = await p.getAll() as Record<string, string>;
    const result: DishRecord[] = [];
    const keys = Object.keys(all);
    for (let i = 0; i < keys.length; i++) {
      const k = keys[i];
      if (k.indexOf(KEY_PREFIX) === 0) {
        const raw: string = all[k];
        const item = JSON.parse(raw) as DishRecord;
        if (item !== null && item !== undefined) {
          result.push(item);
        }
      }
    }
    // newest first by date then meal occurrence
    result.sort((a: DishRecord, b: DishRecord) => {
      if (b.date !== a.date) {
        return b.date < a.date ? -1 : 1;
      }
      return 0;
    });
    return result;
  }

  // YYYYMM -> Map<dateYYYYMMDD, count>
  async calendarForMonth(yearMonth: string): Promise<Map<string, number>> {
    const records = await this.list();
    const map: Map<string, number> = new Map<string, number>();
    for (let i = 0; i < records.length; i++) {
      const r = records[i];
      if (r.date.length >= 6 && r.date.substring(0, 6) === yearMonth) {
        const cur = map.get(r.date);
        map.set(r.date, (cur === undefined ? 0 : cur) + 1);
      }
    }
    return map;
  }

  async countForDay(yyyymmdd: string): Promise<number> {
    const records = await this.list();
    let count = 0;
    for (let i = 0; i < records.length; i++) {
      if (records[i].date === yyyymmdd) {
        count++;
      }
    }
    return count;
  }

  private nextSeq(): number {
    this.seq = (this.seq + 1) % 100000;
    return this.seq;
  }
}
