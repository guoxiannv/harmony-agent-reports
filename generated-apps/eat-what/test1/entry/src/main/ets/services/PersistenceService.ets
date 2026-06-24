// PersistenceService — local-only storage backed by @ohos.data.preferences.
//
// Rationale: the spec requires all data stored locally with no backend. The
// dataset is small (a built-in dish bank, an ingredient list, daily checkins,
// custom/wheel dishes). preferences with JSON-stringified arrays is simpler and
// lower build-risk than relationalStore/ResultSet while fully satisfying the
// persistence requirement. See .arkpilot/api-reference/01-data-persistence.md.

import { preferences } from '@kit.ArkData';
import { common } from '@kit.AbilityKit';

export const PREF_STORE_NAME: string = 'eatwhat_store';

export class PersistenceService {
  private prefs: preferences.Preferences | null = null;
  private ready: boolean = false;

  // Must be called once (e.g. in EntryAbility.onCreate) before any load/save.
  async init(context: common.Context): Promise<void> {
    if (this.ready && this.prefs !== null) {
      return;
    }
    this.prefs = await preferences.getPreferences(context, PREF_STORE_NAME);
    this.ready = true;
  }

  private require(): preferences.Preferences {
    if (this.prefs === null) {
      throw new Error('PersistenceService not initialized. Call init(context) first.');
    }
    return this.prefs;
  }

  async loadString(key: string, def: string): Promise<string> {
    const p: preferences.Preferences = this.require();
    const has: boolean = await p.has(key);
    if (!has) {
      return def;
    }
    const value: string = (await p.get(key, def)) as string;
    return value;
  }

  async saveString(key: string, value: string): Promise<void> {
    const p: preferences.Preferences = this.require();
    await p.put(key, value);
    await p.flush();
  }

  async remove(key: string): Promise<void> {
    const p: preferences.Preferences = this.require();
    await p.delete(key);
    await p.flush();
  }

  // Wipe all app-owned keys. Used by the "清空所有数据" action.
  async clearAll(keys: string[]): Promise<void> {
    const p: preferences.Preferences = this.require();
    for (let i = 0; i < keys.length; i++) {
      const present: boolean = await p.has(keys[i]);
      if (present) {
        await p.delete(keys[i]);
      }
    }
    await p.flush();
  }

  isReady(): boolean {
    return this.ready;
  }
}
