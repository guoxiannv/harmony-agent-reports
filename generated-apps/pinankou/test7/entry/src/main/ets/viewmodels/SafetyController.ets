// SafetyController.ets
//
// Headless logic for the Safety (安全事项) domain. Owns filter/search form
// state (AppStorage keys) and CRUD against DataStore. Page/view wiring is
// added during visual integration.

import { SafetyItem, SafetyLevel } from '../common/Models';
import { DataStore } from '../services/DataStore';
import { nextId } from '../common/Ids';

export type SafetyFilter = 'all' | 'pending' | 'completed';

const KEY_FILTER: string = 'pinankou.safety.filter';
const KEY_SEARCH: string = 'pinankou.safety.search';

export class SafetyController {
  static ensureInit(): void {
    if (AppStorage.get<SafetyFilter>(KEY_FILTER) === undefined) {
      AppStorage.SetOrCreate<SafetyFilter>(KEY_FILTER, 'all');
    }
    if (AppStorage.get<string>(KEY_SEARCH) === undefined) {
      AppStorage.SetOrCreate<string>(KEY_SEARCH, '');
    }
  }

  static getFilter(): SafetyFilter {
    return AppStorage.get<SafetyFilter>(KEY_FILTER) ?? 'all';
  }

  static setFilter(filter: SafetyFilter): void {
    AppStorage.SetOrCreate<SafetyFilter>(KEY_FILTER, filter);
  }

  static getSearch(): string {
    return AppStorage.get<string>(KEY_SEARCH) ?? '';
  }

  static setSearch(value: string): void {
    AppStorage.SetOrCreate<string>(KEY_SEARCH, value);
  }

  // Semantic event: change-safety-filter / search-safety
  static filteredItems(): SafetyItem[] {
    const filter: SafetyFilter = SafetyController.getFilter();
    const rawSearch: string = SafetyController.getSearch();
    const search: string = rawSearch.trim().toLowerCase();
    const all: SafetyItem[] = DataStore.getSafetyItems();
    const out: SafetyItem[] = [];
    for (const item of all) {
      if (!SafetyController.matchesFilter(item, filter)) {
        continue;
      }
      if (search.length > 0 && !SafetyController.matchesSearch(item, search)) {
        continue;
      }
      out.push(item);
    }
    return out;
  }

  static matchesFilter(item: SafetyItem, filter: SafetyFilter): boolean {
    if (filter === 'pending') {
      return !item.completed;
    } else if (filter === 'completed') {
      return item.completed;
    }
    return true;
  }

  static matchesSearch(item: SafetyItem, search: string): boolean {
    return item.title.toLowerCase().includes(search)
      || item.description.toLowerCase().includes(search)
      || item.owner.toLowerCase().includes(search);
  }

  // Semantic event: save-safety (create path)
  static create(title: string, level: SafetyLevel, owner: string, description: string): SafetyItem {
    const item: SafetyItem = new SafetyItem(nextId('safety'), title, level, owner);
    item.description = description;
    DataStore.upsertSafety(item);
    return item;
  }

  // Semantic event: save-safety (edit path)
  static save(item: SafetyItem): void {
    item.updatedAt = Date.now();
    DataStore.upsertSafety(item);
  }

  static toggleCompleted(item: SafetyItem): void {
    item.completed = !item.completed;
    item.updatedAt = Date.now();
    DataStore.upsertSafety(item);
  }

  // Semantic event: delete-safety
  static remove(id: string): void {
    DataStore.removeSafety(id);
  }
}
