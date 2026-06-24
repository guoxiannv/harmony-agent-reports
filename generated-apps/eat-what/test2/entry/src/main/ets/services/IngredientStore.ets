// IngredientStore.ets
//
// Persistence layer for the user's fridge ingredients.
// Backed by @ohos.data.preferences. Initialized with a Context via AppServices.

import { preferences } from '@kit.ArkData';
import { common } from '@kit.AbilityKit';
import { Ingredient } from '../common/Models';

const STORE_NAME = 'eat_ingredients';
const KEY_PREFIX = 'ingredient_';

export class IngredientStore {
  private pref: preferences.Preferences | null = null;
  private seq: number = 0;

  async init(context: common.Context): Promise<void> {
    this.pref = await preferences.getPreferences(context, STORE_NAME);
  }

  private ensure(): preferences.Preferences {
    if (this.pref === null) {
      throw new Error('IngredientStore not initialized');
    }
    return this.pref;
  }

  async add(name: string, quantity: string): Promise<Ingredient> {
    const p = this.ensure();
    const trimmed = name.trim();
    const item: Ingredient = {
      id: `ing_${Date.now()}_${this.nextSeq()}`,
      name: trimmed,
      quantity: quantity.trim(),
      addedAt: Date.now(),
    };
    await p.put(KEY_PREFIX + item.id, JSON.stringify(item));
    await p.flush();
    return item;
  }

  async remove(id: string): Promise<void> {
    const p = this.ensure();
    await p.delete(KEY_PREFIX + id);
    await p.flush();
  }

  async list(): Promise<Ingredient[]> {
    const p = this.ensure();
    const all = await p.getAll() as Record<string, string>;
    const result: Ingredient[] = [];
    const keys = Object.keys(all);
    for (let i = 0; i < keys.length; i++) {
      const k = keys[i];
      if (k.indexOf(KEY_PREFIX) === 0) {
        const raw: string = all[k];
        const item = JSON.parse(raw) as Ingredient;
        if (item !== null && item !== undefined) {
          result.push(item);
        }
      }
    }
    result.sort((a: Ingredient, b: Ingredient) => b.addedAt - a.addedAt);
    return result;
  }

  private nextSeq(): number {
    this.seq = (this.seq + 1) % 100000;
    return this.seq;
  }
}
