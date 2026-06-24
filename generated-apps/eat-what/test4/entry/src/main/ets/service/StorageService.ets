// StorageService.ets
//
// Preferences-backed persistence for the 今天吃什么 app. Initialized once with
// a UIAbility context (see EntryAbility). JSON values are stored as strings
// and parsed by the caller/repository to keep typing explicit.

import { preferences } from '@kit.ArkData';
import { common } from '@kit.AbilityKit';

const STORE_NAME = 'eat_what_store';

export class StorageService {
  private static pref: preferences.Preferences | null = null;

  static async init(context: common.Context): Promise<void> {
    if (StorageService.pref === null) {
      try {
        StorageService.pref = await preferences.getPreferences(context, STORE_NAME);
      } catch (e) {
        StorageService.pref = null;
      }
    }
  }

  static isReady(): boolean {
    return StorageService.pref !== null;
  }

  private static prefOrThrow(): preferences.Preferences {
    if (StorageService.pref === null) {
      throw new Error('StorageService not initialized. Call StorageService.init(context) first.');
    }
    return StorageService.pref;
  }

  static async putString(key: string, val: string): Promise<void> {
    const p: preferences.Preferences = StorageService.prefOrThrow();
    try {
      await p.put(key, val);
      await p.flush();
    } catch (e) {
      // Ignore persistence errors; reads will fall back to defaults.
    }
  }

  static async getString(key: string, def: string): Promise<string> {
    const p: preferences.Preferences = StorageService.prefOrThrow();
    try {
      const raw: preferences.ValueType = await p.get(key, def);
      return typeof raw === 'string' ? raw : def;
    } catch (e) {
      return def;
    }
  }

  // Store a pre-stringified JSON payload.
  static async putJson(key: string, jsonText: string): Promise<void> {
    await StorageService.putString(key, jsonText);
  }

  // Read a JSON payload as raw text (callers parse + validate).
  static async getJsonText(key: string, def: string): Promise<string> {
    return StorageService.getString(key, def);
  }

  static async remove(key: string): Promise<void> {
    const p: preferences.Preferences = StorageService.prefOrThrow();
    try {
      await p.delete(key);
      await p.flush();
    } catch (e) {
      // Ignore persistence errors.
    }
  }
}
