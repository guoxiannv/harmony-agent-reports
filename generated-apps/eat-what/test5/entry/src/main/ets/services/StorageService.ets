// StorageService.ets
// Thin Preferences wrapper backed by @kit.ArkData. Loads JSON strings into memory
// once on init; persists on mutation. Falls back gracefully to in-memory only if
// Preferences is unavailable.
import { preferences } from '@kit.ArkData';
import { common } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const STORE_NAME = 'eat_what_store';
const DOMAIN = 0x0e1a;

export class StorageService {
  private static pref: preferences.Preferences | null = null;
  private static initialized: boolean = false;

  static async init(context: common.Context): Promise<void> {
    if (StorageService.initialized) {
      return;
    }
    try {
      StorageService.pref = await preferences.getPreferences(context, STORE_NAME);
      StorageService.initialized = true;
      hilog.info(DOMAIN, 'eatwhat', 'StorageService initialized');
    } catch (err) {
      hilog.error(DOMAIN, 'eatwhat', 'Storage init failed: %{public}s', JSON.stringify(err));
      StorageService.initialized = true; // proceed in-memory only
    }
  }

  static isReady(): boolean {
    return StorageService.pref !== null;
  }

  static async getString(key: string, fallback: string): Promise<string> {
    if (StorageService.pref === null) {
      return fallback;
    }
    try {
      const v = await StorageService.pref.get(key, fallback);
      return v as string;
    } catch (err) {
      hilog.error(DOMAIN, 'eatwhat', 'getString failed %{public}s', JSON.stringify(err));
      return fallback;
    }
  }

  static async putString(key: string, value: string): Promise<void> {
    if (StorageService.pref === null) {
      return;
    }
    try {
      await StorageService.pref.put(key, value);
      await StorageService.pref.flush();
    } catch (err) {
      hilog.error(DOMAIN, 'eatwhat', 'putString failed %{public}s', JSON.stringify(err));
    }
  }
}
