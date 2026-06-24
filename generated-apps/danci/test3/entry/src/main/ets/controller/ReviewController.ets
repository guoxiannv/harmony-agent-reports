// ReviewController.ets
//
// Headless state machine + FIFO queue logic for the WordFlip Kids review flow.
//
// This module owns the queue algorithm and round statistics described in
// ui-behavior.json. It is deliberately free of ArkUI layout: the page layer
// (@State + build) reads these getters and calls these mutators. Keeping the
// algorithm here makes it unit-testable and reusable.
//
// Queue semantics (spec section 7):
//   - mark-known  → dequeue the current card; correctCount++; if the queue is
//                   now empty (and the round had cards) the round is complete.
//   - mark-unknown → move the current card to the tail of the queue; the card
//                    stays in the round (remainingCount unchanged); flip resets.
//   - toggle-flip  → flip the current card between front and back; no queue change.
//   - restart      → reload the stage queue and reset counters/flip.

import { Word, ReviewStats } from '../model/Word';
import { loadStage, defaultStageId } from '../services/WordBankService';
import { common } from '@kit.AbilityKit';

export type ReviewPhase = 'loading' | 'empty' | 'review' | 'complete';

/**
 * Mutable review state. The page mirrors these fields into @State and binds
 * the matching semantic targets from ui-tree.json.
 */
export class ReviewController {
  private queue: Word[] = [];
  private stageId: string = defaultStageId();

  // Round counters.
  private totalCount: number = 0;
  private correctCount: number = 0;

  // Card face: false = front (English), true = back (Chinese + phonetic).
  private flipped: boolean = false;

  // High-level phase derived from the queue + completion flag.
  private phase: ReviewPhase = 'loading';
  private isComplete: boolean = false;

  /**
   * (Re)load the current stage's word bank and start a fresh round.
   * Resets correctCount and flip. After this call the phase is either
   * 'empty' (no words) or 'review'.
   */
  startRound(context: common.Context, stageId?: string): void {
    const id = stageId !== undefined && stageId.length > 0 ? stageId : defaultStageId();
    this.stageId = id;
    const words = loadStage(context, id);
    this.beginWith(words);
  }

  /**
   * Begin a round directly from an in-memory word list (used by tests and by
   * restart-from-existing-data paths). Defensive copy so external mutation of
   * the source array cannot corrupt the queue.
   */
  beginWith(words: Word[]): void {
    this.queue = words.slice();
    this.totalCount = this.queue.length;
    this.correctCount = 0;
    this.flipped = false;
    this.isComplete = false;
    this.recomputePhase();
  }

  // ---- Read accessors (ui-tree bindings) ---------------------------------

  /** Current card on top of the queue, or null when empty/complete. */
  get currentWord(): Word | null {
    if (this.queue.length === 0) {
      return null;
    }
    return this.queue[0];
  }

  get remainingCount(): number {
    return this.queue.length;
  }

  get correctCountValue(): number {
    return this.correctCount;
  }

  get totalCountValue(): number {
    return this.totalCount;
  }

  get isFlipped(): boolean {
    return this.flipped;
  }

  get reviewPhase(): ReviewPhase {
    return this.phase;
  }

  get isQueueEmpty(): boolean {
    // Empty means the stage genuinely has nothing to review, not "round done".
    return this.totalCount === 0;
  }

  get isRoundComplete(): boolean {
    return this.isComplete;
  }

  get currentStageId(): string {
    return this.stageId;
  }

  /** Snapshot of derived stats for header/overlay rendering. */
  get stats(): ReviewStats {
    return {
      totalCount: this.totalCount,
      remainingCount: this.queue.length,
      correctCount: this.correctCount,
    };
  }

  // ---- Mutators (ui-tree events) -----------------------------------------

  /** Event toggle-flip: flip the current card between faces. */
  toggleFlip(): void {
    if (this.queue.length === 0) {
      return;
    }
    this.flipped = !this.flipped;
  }

  /** Force a known face. Used by action buttons to reset the next card to front. */
  setFlipped(value: boolean): void {
    this.flipped = value;
  }

  /**
   * Event mark-known: dequeue the current card and count it as correct.
   * If the queue drains after a non-empty round, the round completes.
   */
  markKnown(): void {
    if (this.queue.length === 0) {
      return;
    }
    this.queue.shift();
    this.correctCount += 1;
    this.flipped = false;
    if (this.queue.length === 0 && this.totalCount > 0) {
      this.isComplete = true;
    }
    this.recomputePhase();
  }

  /**
   * Event mark-unknown: move the current card to the tail for later review.
   * The card stays in the round, so remainingCount and correctCount are
   * unchanged. Flip resets so the next card shows its front first.
   *
   * When only one card remains this is a self-rotation: the same card stays
   * on top (still safe — flip just resets).
   */
  markUnknown(): void {
    if (this.queue.length === 0) {
      return;
    }
    const top = this.queue.shift() as Word;
    this.queue.push(top);
    this.flipped = false;
    // Phase unchanged (still 'review').
  }

  /**
   * Event restart-review: reload the stage queue and reset counters.
   * Requires a context to re-read the rawfile word bank.
   */
  restart(context: common.Context): void {
    this.startRound(context, this.stageId);
  }

  // ---- Internal ---------------------------------------------------------

  private recomputePhase(): void {
    if (this.isComplete) {
      this.phase = 'complete';
      return;
    }
    if (this.totalCount === 0) {
      this.phase = 'empty';
      return;
    }
    this.phase = 'review';
  }
}
