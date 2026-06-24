// Persistence.ets
//
// Thin wrapper over @ohos.data.preferences. All domain data is serialized to
// JSON strings and stored here. Initialized once from EntryAbility with the
// ability context. Static-only class (no `this` in static methods).

import { preferences } from '@kit.ArkData';
import { common } from '@kit.AbilityKit';

const STORE_NAME: string = 'pinankou_store';

export class Persistence {
  private static pref: preferences.Preferences | null = null;

  static async init(context: common.Context): Promise<void> {
    if (Persistence.pref !== null) {
      return;
    }
    try {
      const options: preferences.Options = { name: STORE_NAME };
      Persistence.pref = await preferences.getPreferences(context, options);
    } catch (e) {
      Persistence.pref = null;
    }
  }

  static isReady(): boolean {
    return Persistence.pref !== null;
  }

  static async getString(key: string): Promise<string> {
    if (Persistence.pref === null) {
      return '';
    }
    try {
      const v: preferences.ValueType = await Persistence.pref.get(key, '');
      if (typeof v === 'string') {
        return v;
      }
      return '';
    } catch (e) {
      return '';
    }
  }

  static async setString(key: string, value: string): Promise<void> {
    if (Persistence.pref === null) {
      return;
    }
    try {
      await Persistence.pref.put(key, value);
      await Persistence.pref.flush();
    } catch (e) {
      // best-effort persistence; ignore write failures.
    }
  }
}
