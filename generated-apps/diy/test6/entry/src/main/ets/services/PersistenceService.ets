// Best-effort local persistence via preferences.
// AppStorage is the reactive layer; this service snapshots AppStorage to
// preferences on mutation and hydrates it on app start.
// ArkTS strict-safe: named interfaces, no spreads, JSON.parse typed via `as`.

import { preferences } from '@kit.ArkData';
import { common } from '@kit.AbilityKit';
import {
  AppSettings, Member, Course, Booking, PointTransaction, Material, InventoryTransaction,
  KEY_MEMBERS, KEY_COURSES, KEY_BOOKINGS, KEY_POINT_TX, KEY_MATERIALS, KEY_INV_TX, KEY_SETTINGS,
} from '../common/Models';

interface PersistState {
  members: Member[];
  courses: Course[];
  bookings: Booking[];
  pointTx: PointTransaction[];
  materials: Material[];
  invTx: InventoryTransaction[];
  settings: AppSettings;
}

const PREF_STORE = 'handmade-mark-store';
const PREF_KEY = 'app-state';
const PREF_LOADED = '__prefLoaded';

export class PersistenceService {
  private static store: preferences.Preferences | null = null;
  private static saveTimer: number = -1;

  static init(context: common.UIAbilityContext): void {
    try {
      PersistenceService.store = preferences.getPreferencesSync(context, { name: PREF_STORE });
    } catch (e) {
      // Preferences unavailable; app falls back to in-memory only.
      PersistenceService.store = null;
    }
  }

  static isLoaded(): boolean {
    const v = AppStorage.get<boolean>(PREF_LOADED);
    return v === true;
  }

  static load(): void {
    if (PersistenceService.store === null) {
      AppStorage.setOrCreate<boolean>(PREF_LOADED, true);
      return;
    }
    try {
      const raw = PersistenceService.store.getSync(PREF_KEY, '') as string;
      if (raw !== undefined && raw !== null && raw.length > 0) {
        const parsed = JSON.parse(raw) as PersistState;
        AppStorage.setOrCreate<Member[]>(KEY_MEMBERS, parsed.members ?? []);
        AppStorage.setOrCreate<Course[]>(KEY_COURSES, parsed.courses ?? []);
        AppStorage.setOrCreate<Booking[]>(KEY_BOOKINGS, parsed.bookings ?? []);
        AppStorage.setOrCreate<PointTransaction[]>(KEY_POINT_TX, parsed.pointTx ?? []);
        AppStorage.setOrCreate<Material[]>(KEY_MATERIALS, parsed.materials ?? []);
        AppStorage.setOrCreate<InventoryTransaction[]>(KEY_INV_TX, parsed.invTx ?? []);
        if (parsed.settings !== undefined && parsed.settings !== null) {
          AppStorage.setOrCreate<AppSettings>(KEY_SETTINGS, parsed.settings);
        }
      }
    } catch (e) {
      // Corrupt blob -> start fresh.
    }
    AppStorage.setOrCreate<boolean>(PREF_LOADED, true);
  }

  // Debounced snapshot of the live AppStorage into preferences.
  static scheduleSave(): void {
    if (PersistenceService.store === null) {
      return;
    }
    if (PersistenceService.saveTimer !== -1) {
      clearTimeout(PersistenceService.saveTimer);
    }
    PersistenceService.saveTimer = setTimeout(() => {
      PersistenceService.flush();
    }, 250);
  }

  static flush(): void {
    if (PersistenceService.store === null) {
      return;
    }
    try {
      const state: PersistState = {
        members: AppStorage.get<Member[]>(KEY_MEMBERS) ?? [],
        courses: AppStorage.get<Course[]>(KEY_COURSES) ?? [],
        bookings: AppStorage.get<Booking[]>(KEY_BOOKINGS) ?? [],
        pointTx: AppStorage.get<PointTransaction[]>(KEY_POINT_TX) ?? [],
        materials: AppStorage.get<Material[]>(KEY_MATERIALS) ?? [],
        invTx: AppStorage.get<InventoryTransaction[]>(KEY_INV_TX) ?? [],
        settings: PersistenceService.readSettings(),
      };
      const json = JSON.stringify(state);
      PersistenceService.store.putSync(PREF_KEY, json);
      PersistenceService.store.flush();
    } catch (e) {
      // Best effort; ignore write errors.
    }
  }

  static readSettings(): AppSettings {
    const s = AppStorage.get<AppSettings>(KEY_SETTINGS);
    if (s !== undefined && s !== null) {
      return s;
    }
    return PersistenceService.defaultSettings();
  }

  static defaultSettings(): AppSettings {
    return {
      pointsPerYuan: 1,
      checkinPoints: 5,
      sleepingThresholdDays: 30,
    };
  }
}
