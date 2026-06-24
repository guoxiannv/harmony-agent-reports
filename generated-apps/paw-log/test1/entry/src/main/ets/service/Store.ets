import { preferences } from '@kit.ArkData'

export class JsonPreferenceStore {
  private pref?: preferences.Preferences

  constructor(context: Context, name: string) {
    try {
      this.pref = preferences.getPreferencesSync(context, { name })
    } catch (_) {
    }
  }

  getString(key: string, fallback: string): string {
    try {
      return (this.pref?.getSync(key, fallback) as string) ?? fallback
    } catch (_) {
      return fallback
    }
  }

  async setJson<T>(key: string, value: T): Promise<void> {
    try {
      this.pref?.putSync(key, JSON.stringify(value))
      await this.pref?.flush()
    } catch (_) {
    }
  }

  async delete(key: string): Promise<void> {
    try {
      this.pref?.deleteSync(key)
      await this.pref?.flush()
    } catch (_) {
    }
  }
}
