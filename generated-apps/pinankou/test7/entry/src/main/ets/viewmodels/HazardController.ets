// HazardController.ets
//
// Headless logic for the Hazards (风险隐患 / 整改跟踪) domain. Owns filter
// state and CRUD + status transitions against DataStore.

import { Hazard, SafetyLevel, HazardStatus } from '../common/Models';
import { DataStore } from '../services/DataStore';
import { nextId } from '../common/Ids';

export type HazardFilter = 'all' | HazardStatus;

const KEY_FILTER: string = 'pinankou.hazards.filter';

export class HazardController {
  static ensureInit(): void {
    if (AppStorage.get<HazardFilter>(KEY_FILTER) === undefined) {
      AppStorage.SetOrCreate<HazardFilter>(KEY_FILTER, 'all');
    }
  }

  static getFilter(): HazardFilter {
    return AppStorage.get<HazardFilter>(KEY_FILTER) ?? 'all';
  }

  static setFilter(filter: HazardFilter): void {
    AppStorage.SetOrCreate<HazardFilter>(KEY_FILTER, filter);
  }

  // Semantic event: change-hazard-filter
  static filteredItems(): Hazard[] {
    const filter: HazardFilter = HazardController.getFilter();
    const all: Hazard[] = DataStore.getHazards();
    if (filter === 'all') {
      return all;
    }
    const out: Hazard[] = [];
    for (const h of all) {
      if (h.status === filter) {
        out.push(h);
      }
    }
    return out;
  }

  // Semantic event: save-hazard (create path)
  static create(
    title: string,
    level: SafetyLevel,
    owner: string,
    deadline: number,
    description: string,
    location: string,
    photoUri: string
  ): Hazard {
    const hazard: Hazard = new Hazard(nextId('hazard'), title, level, owner, deadline);
    hazard.description = description;
    hazard.location = location;
    hazard.photoUri = photoUri;
    DataStore.upsertHazard(hazard);
    return hazard;
  }

  // Semantic event: save-hazard (edit path)
  static save(item: Hazard): void {
    item.updatedAt = Date.now();
    DataStore.upsertHazard(item);
  }

  static setStatus(item: Hazard, status: HazardStatus): void {
    item.status = status;
    item.updatedAt = Date.now();
    DataStore.upsertHazard(item);
  }

  // Semantic event: delete-hazard
  static remove(id: string): void {
    DataStore.removeHazard(id);
  }

  // Rectify completion rate (0-100), part of dashboard aggregation.
  static rectifyRate(items: Hazard[]): number {
    if (items.length === 0) {
      return 0;
    }
    let rectified: number = 0;
    for (const h of items) {
      if (h.status === 'rectified') {
        rectified += 1;
      }
    }
    return Math.round((rectified * 100) / items.length);
  }
}
