import { common } from '@kit.AbilityKit';
import { preferences } from '@kit.ArkData';

export class AppStore {
  private context: common.UIAbilityContext
  private storeName: string = 'paw_log_store'
  private pref?: preferences.Preferences

  constructor(context: common.UIAbilityContext) {
    this.context = context
  }

  async init(): Promise<void> {
    try {
      this.pref = await preferences.getPreferences(this.context, this.storeName)
    } catch (err) {
      console.error('[AppStore] init failed', JSON.stringify(err))
    }
  }

  async getString(key: string, defaultValue: string = ''): Promise<string> {
    if (!this.pref) {
      await this.init()
    }
    try {
      return await this.pref!.get(key, defaultValue) as string
    } catch (err) {
      console.error('[AppStore] getString failed', key, JSON.stringify(err))
      return defaultValue
    }
  }

  async setString(key: string, value: string): Promise<void> {
    if (!this.pref) {
      await this.init()
    }
    try {
      await this.pref!.put(key, value)
      await this.pref!.flush()
    } catch (err) {
      console.error('[AppStore] setString failed', key, JSON.stringify(err))
    }
  }

  async getObject<T>(key: string, defaultValue: T): Promise<T> {
    let raw: string = await this.getString(key, '')
    if (raw.length === 0) {
      return defaultValue
    }
    try {
      return JSON.parse(raw) as T
    } catch (_) {
      return defaultValue
    }
  }

  async setObject<T>(key: string, value: T): Promise<void> {
    await this.setString(key, JSON.stringify(value))
  }
}
