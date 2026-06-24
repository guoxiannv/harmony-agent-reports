/**
 * PreferencesStore — durable store for the current learning stage.
 *
 * Spec §6 prefers local persistence (HarmonyOS preferences). During headless logic
 * work this is an in-memory implementation with the same interface; visual-integration
 * will swap the body to a real `preferences`-backed store without changing the API.
 *
 * Only `currentStage` is durable. Per-round review state is intentionally in-memory
 * only (spec §6: this-round counts, no cross-round history).
 */
import { WordLibrary } from '../data/WordLibrary';

export class PreferencesStore {
  private static current: string = WordLibrary.defaultStage();

  static getCurrentStage(): string {
    return PreferencesStore.current;
  }

  static setCurrentStage(stage: string): void {
    PreferencesStore.current = stage;
  }
}
