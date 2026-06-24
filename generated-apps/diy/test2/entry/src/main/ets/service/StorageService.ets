import { preferences } from '@kit.ArkData';
import { BusinessError } from '@kit.BasicServicesKit';

export class StorageService {
  private static readonly PREF_NAME: string = 'craft_mark_app';
  private context: Context;
  private pref?: preferences.Preferences;

  constructor(context: Context) {
    this.context = context;
  }

  async init(): Promise<void> {
    this.pref = await preferences.getPreferences(this.context, StorageService.PREF_NAME);
  }

  async getString(key: string, defaultValue: string = ''): Promise<string> {
    if (!this.pref) {
      await this.init();
    }
    try {
      const value = this.pref!.getSync(key, defaultValue);
      return typeof value === 'string' ? value : defaultValue;
    } catch (err) {
      console.error(`StorageService.getString failed: ${key}`, JSON.stringify(err));
      return defaultValue;
    }
  }

  async setString(key: string, value: string): Promise<void> {
    if (!this.pref) {
      await this.init();
    }
    await this.pref!.put(key, value);
    await this.pref!.flush();
  }

  async getObject<T>(key: string, defaultValue: T): Promise<T> {
    const raw = await this.getString(key, '');
    if (!raw) {
      return defaultValue;
    }
    try {
      return JSON.parse(raw) as T;
    } catch (err) {
      console.error(`StorageService.getObject parse failed: ${key}`, JSON.stringify(err));
      return defaultValue;
    }
  }

  async setObject<T>(key: string, value: T): Promise<void> {
    await this.setString(key, JSON.stringify(value));
  }

  async remove(key: string): Promise<void> {
    if (!this.pref) {
      await this.init();
    }
    await this.pref!.delete(key);
    await this.pref!.flush();
  }
}
