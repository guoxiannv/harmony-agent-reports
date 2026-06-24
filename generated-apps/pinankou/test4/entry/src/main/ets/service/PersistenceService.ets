// PersistenceService: local-first storage wrapper over @ohos.data.preferences.
// Each entity collection is persisted as a single JSON string under its own key.
// The Preferences instance is injected at app startup (wired in EntryAbility during
// the visual integration phase) so this module stays UI/runtime-framework decoupled.

import { preferences } from '@kit.ArkData';

const PREF_NAME: string = 'pinankou_store';
const KEY_RECORDS: string = 'records';
const KEY_RISKS: string = 'risks';
const KEY_INSPECTIONS: string = 'inspections';
const KEY_CURRENT_INSPECTION: string = 'current_inspection';
const KEY_CONTACTS: string = 'contacts';
const KEY_RECTIFICATIONS: string = 'rectifications';

export class PersistenceService {
  private static prefs: preferences.Preferences | null = null;

  static init(context: Context): Promise<void> {
    try {
      const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: PREF_NAME });
      PersistenceService.prefs = pref;
    } catch (e) {
      PersistenceService.prefs = null;
    }
    return Promise.resolve();
  }

  static isReady(): boolean {
    return PersistenceService.prefs !== null;
  }

  static async loadString(key: string): Promise<string> {
    const p: preferences.Preferences | null = PersistenceService.prefs;
    if (p === null) {
      return '';
    }
    try {
      const raw: preferences.ValueType = await p.get(key, '');
      if (typeof raw === 'string') {
        return raw;
      }
    } catch (e) {
      return '';
    }
    return '';
  }

  static async saveString(key: string, value: string): Promise<void> {
    const p: preferences.Preferences | null = PersistenceService.prefs;
    if (p === null) {
      return;
    }
    try {
      await p.put(key, value);
      await p.flush();
    } catch (e) {
      // Best-effort persistence; ignore write failures.
    }
  }

  static keyRecords(): string { return KEY_RECORDS; }
  static keyRisks(): string { return KEY_RISKS; }
  static keyInspections(): string { return KEY_INSPECTIONS; }
  static keyCurrentInspection(): string { return KEY_CURRENT_INSPECTION; }
  static keyContacts(): string { return KEY_CONTACTS; }
  static keyRectifications(): string { return KEY_RECTIFICATIONS; }
}
