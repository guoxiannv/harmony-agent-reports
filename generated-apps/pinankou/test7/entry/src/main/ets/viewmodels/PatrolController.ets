// PatrolController.ets
//
// Headless logic for the Patrol (巡检打卡) domain. Owns the create-draft form
// state, task persistence, the per-point checkin state machine, and the
// abnormal->hazard seeding rule.

import { PatrolTask, PatrolPoint, Hazard, HazardStatus, PatrolPointStatus } from '../common/Models';
import { DataStore } from '../services/DataStore';
import { nextId } from '../common/Ids';

const KEY_DRAFT_TITLE: string = 'pinankou.patrol.draft.title';
const KEY_DRAFT_POINTS: string = 'pinankou.patrol.draft.points';

export class PatrolController {
  static ensureInit(): void {
    if (AppStorage.get<string>(KEY_DRAFT_TITLE) === undefined) {
      AppStorage.SetOrCreate<string>(KEY_DRAFT_TITLE, '');
    }
    if (AppStorage.get<PatrolPoint[]>(KEY_DRAFT_POINTS) === undefined) {
      AppStorage.SetOrCreate<PatrolPoint[]>(KEY_DRAFT_POINTS, []);
    }
  }

  // ---- draft (PatrolCreate page) ----
  static getDraftTitle(): string {
    return AppStorage.get<string>(KEY_DRAFT_TITLE) ?? '';
  }

  static setDraftTitle(title: string): void {
    AppStorage.SetOrCreate<string>(KEY_DRAFT_TITLE, title);
  }

  static getDraftPoints(): PatrolPoint[] {
    return AppStorage.get<PatrolPoint[]>(KEY_DRAFT_POINTS) ?? [];
  }

  // Semantic event: add-patrol-point
  static addDraftPoint(name: string, location: string): void {
    const points: PatrolPoint[] = PatrolController.getDraftPoints();
    points.push(new PatrolPoint(nextId('point'), name, location));
    AppStorage.SetOrCreate<PatrolPoint[]>(KEY_DRAFT_POINTS, points);
  }

  static removeDraftPoint(id: string): void {
    const points: PatrolPoint[] = PatrolController.getDraftPoints();
    const next: PatrolPoint[] = [];
    for (const p of points) {
      if (p.id !== id) {
        next.push(p);
      }
    }
    AppStorage.SetOrCreate<PatrolPoint[]>(KEY_DRAFT_POINTS, next);
  }

  static resetDraft(): void {
    AppStorage.SetOrCreate<string>(KEY_DRAFT_TITLE, '');
    AppStorage.SetOrCreate<PatrolPoint[]>(KEY_DRAFT_POINTS, []);
  }

  // Semantic event: save-patrol-task
  static commitDraft(): PatrolTask | null {
    const title: string = PatrolController.getDraftTitle().trim();
    if (title.length === 0) {
      return null;
    }
    const task: PatrolTask = new PatrolTask(nextId('patrol'), title);
    task.points = PatrolController.getDraftPoints();
    DataStore.upsertPatrolTask(task);
    PatrolController.resetDraft();
    return task;
  }

  static getTasks(): PatrolTask[] {
    return DataStore.getPatrolTasks();
  }

  // Semantic event: checkin-patrol-point. abnormal=true marks the point
  // abnormal and seeds a Hazard so it enters the rectification flow.
  static checkinPoint(taskId: string, pointId: string, abnormal: boolean): void {
    const tasks: PatrolTask[] = DataStore.getPatrolTasks();
    const updated: PatrolTask[] = [];
    for (const task of tasks) {
      if (task.id !== taskId) {
        updated.push(task);
        continue;
      }
      const cloned: PatrolTask = PatrolController.cloneTask(task);
      for (const point of cloned.points) {
        if (point.id === pointId) {
          point.status = (abnormal ? 'abnormal' : 'checked') as PatrolPointStatus;
          point.checkedAt = Date.now();
        }
      }
      updated.push(cloned);
    }
    DataStore.setPatrolTasks(updated);

    if (abnormal) {
      PatrolController.seedHazardForPoint(taskId, pointId);
    }
  }

  static seedHazardForPoint(taskId: string, pointId: string): void {
    const task: PatrolTask | undefined = PatrolController.findTask(taskId);
    if (task === undefined) {
      return;
    }
    const point: PatrolPoint | undefined = PatrolController.findPointInTask(task, pointId);
    if (point === undefined) {
      return;
    }
    const week: number = 7 * 24 * 60 * 60 * 1000;
    const hazard: Hazard = new Hazard(
      nextId('hazard'),
      `巡检异常：${point.name}`,
      'high',
      '',
      Date.now() + week
    );
    hazard.location = point.location;
    hazard.description = `巡检任务「${task.title}」在点位「${point.name}」发现异常，需整改。`;
    hazard.status = 'pending' as HazardStatus;
    DataStore.seedHazardFromPatrol(hazard);
  }

  static findTask(taskId: string): PatrolTask | undefined {
    const tasks: PatrolTask[] = DataStore.getPatrolTasks();
    for (const t of tasks) {
      if (t.id === taskId) {
        return t;
      }
    }
    return undefined;
  }

  static findPointInTask(task: PatrolTask, pointId: string): PatrolPoint | undefined {
    for (const p of task.points) {
      if (p.id === pointId) {
        return p;
      }
    }
    return undefined;
  }

  static cloneTask(src: PatrolTask): PatrolTask {
    const cloned: PatrolTask = new PatrolTask(src.id, src.title);
    cloned.createdAt = src.createdAt;
    const points: PatrolPoint[] = [];
    for (const p of src.points) {
      const cp: PatrolPoint = new PatrolPoint(p.id, p.name, p.location);
      cp.status = p.status;
      cp.checkedAt = p.checkedAt;
      points.push(cp);
    }
    cloned.points = points;
    return cloned;
  }

  // Patrol completion rate across all tasks (0-100).
  static patrolRate(tasks: PatrolTask[]): number {
    let total: number = 0;
    let checked: number = 0;
    for (const t of tasks) {
      for (const p of t.points) {
        total += 1;
        if (p.status === 'checked' || p.status === 'abnormal') {
          checked += 1;
        }
      }
    }
    if (total === 0) {
      return 0;
    }
    return Math.round((checked * 100) / total);
  }
}
