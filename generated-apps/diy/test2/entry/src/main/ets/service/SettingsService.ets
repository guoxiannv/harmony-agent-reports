import { Settings } from '../model/Models';
import { StorageService } from './StorageService';

const KEY = 'settings_v1';

export class SettingsService {
  private storage: StorageService;

  constructor(storage: StorageService) {
    this.storage = storage;
  }

  async load(): Promise<Settings> {
    return await this.storage.getObject<Settings>(KEY, new Settings());
  }

  async save(settings: Settings): Promise<void> {
    await this.storage.setObject(KEY, settings);
  }
}
