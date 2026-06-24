// DashboardController.ets
//
// Headless aggregation logic for the Dashboard (统计看板). Pure computations
// over DataStore that back the dashboard assertion targets:
// todayTodoCount, hazardCount, rectifyRate, patrolRate, recentSafetyItems.

import { SafetyItem, Hazard, PatrolTask } from '../common/Models';
import { DataStore } from '../services/DataStore';
import { HazardController } from './HazardController';
import { PatrolController } from './PatrolController';

export interface DashboardStats {
  todayTodoCount: number;
  hazardCount: number;
  rectifyRate: number;
  patrolRate: number;
}

export class DashboardController {
  static computeStats(): DashboardStats {
    const safety: SafetyItem[] = DataStore.getSafetyItems();
    const hazards: Hazard[] = DataStore.getHazards();
    const tasks: PatrolTask[] = DataStore.getPatrolTasks();

    let todo: number = 0;
    for (const item of safety) {
      if (!item.completed) {
        todo += 1;
      }
    }

    let openHazards: number = 0;
    for (const h of hazards) {
      if (h.status !== 'rectified') {
        openHazards += 1;
      }
    }

    const stats: DashboardStats = {
      todayTodoCount: todo,
      hazardCount: openHazards,
      rectifyRate: HazardController.rectifyRate(hazards),
      patrolRate: PatrolController.patrolRate(tasks),
    };
    return stats;
  }

  // Binding /dashboard/recentSafetyItems — top 5 by updatedAt desc.
  static recentSafetyItems(): SafetyItem[] {
    const all: SafetyItem[] = DataStore.getSafetyItems();
    const sorted: SafetyItem[] = all.slice();
    sorted.sort((a: SafetyItem, b: SafetyItem): number => b.updatedAt - a.updatedAt);
    const out: SafetyItem[] = [];
    const limit: number = Math.min(5, sorted.length);
    for (let i: number = 0; i < limit; i += 1) {
      out.push(sorted[i]);
    }
    return out;
  }
}
