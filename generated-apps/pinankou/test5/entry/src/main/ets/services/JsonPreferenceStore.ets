import { preferences } from '@kit.ArkData';
import { Context } from '@kit.AbilityKit';

export class JsonPreferenceStore {
  private context: Context
  private name: string

  constructor(context: Context, name: string) {
    this.context = context
    this.name = name
  }

  async getString(key: string, defaultValue: string): Promise<string> {
    try {
      let pref: preferences.Preferences = await preferences.getPreferences(this.context, this.name)
      return await pref.get(key, defaultValue) as string
    } catch (err) {
      return defaultValue
    }
  }

  async setString(key: string, value: string): Promise<void> {
    try {
      let pref: preferences.Preferences = await preferences.getPreferences(this.context, this.name)
      await pref.put(key, value)
      await pref.flush()
    } catch (err) {
    }
  }
}
