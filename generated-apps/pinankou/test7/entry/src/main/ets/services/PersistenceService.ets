// PersistenceService.ets
//
// Best-effort local durability for Pinankou collections via
// @ohos.data.preferences. Stores each collection as a JSON string.
//
// Headless phase note: init(context) is wired from EntryAbility during visual
// integration. Until then trySave/tryLoad are safe no-ops that never throw and
// DataStore remains fully functional in-memory.

import dataPreferences from '@ohos.data.preferences';
import common from '@ohos.app.ability.common';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0x0001;
const TAG: string = 'Pinankou.Persistence';
const PREF_NAME: string = 'pinankou_store';

export class PersistenceService {
  private static context: common.Context | null = null;
  private static pref: dataPreferences.Preferences | null = null;

  static init(context: common.Context): void {
    PersistenceService.context = context;
    // Fire-and-forget prefetch of the preferences handle.
    PersistenceService.ensurePref().then((): void => {
      hilog.info(DOMAIN, TAG, 'preferences handle ready');
    }).catch((err: Error) => {
      hilog.error(DOMAIN, TAG, 'preferences init failed: %{public}s', err.message);
    });
  }

  private static async ensurePref(): Promise<void> {
    if (PersistenceService.pref !== null) {
      return;
    }
    const ctx: common.Context | null = PersistenceService.context;
    if (ctx === null) {
      return;
    }
    try {
      PersistenceService.pref = await dataPreferences.getPreferences(ctx, PREF_NAME);
    } catch (err) {
      hilog.error(DOMAIN, TAG, 'getPreferences failed: %{public}s', JSON.stringify(err));
    }
  }

  // Serialize and persist a single collection. Never throws — failures are
  // logged so the UI never crashes on a storage hiccup.
  static trySave(key: string, value: object): void {
    if (PersistenceService.context === null) {
      return; // persistence not wired yet (headless phase)
    }
    PersistenceService.ensurePref().then(async (): Promise<void> => {
      const pref: dataPreferences.Preferences | null = PersistenceService.pref;
      if (pref === null) {
        return;
      }
      try {
        const json: string = JSON.stringify(value);
        await pref.put(key, json);
        await pref.flush();
      } catch (err) {
        hilog.error(DOMAIN, TAG, 'save failed for %{public}s: %{public}s', key, JSON.stringify(err));
      }
    }).catch((err: Error) => {
      hilog.error(DOMAIN, TAG, 'save pref handle unavailable: %{public}s', err.message);
    });
  }

  // Read back a raw JSON string for a collection (used by future hydration).
  static async tryLoad(key: string): Promise<string | null> {
    await PersistenceService.ensurePref();
    const pref: dataPreferences.Preferences | null = PersistenceService.pref;
    if (pref === null) {
      return null;
    }
    try {
      const raw: string = (await pref.get(key, '')) as string;
      return raw.length > 0 ? raw : null;
    } catch (err) {
      hilog.error(DOMAIN, TAG, 'load failed for %{public}s: %{public}s', key, JSON.stringify(err));
      return null;
    }
  }
}
