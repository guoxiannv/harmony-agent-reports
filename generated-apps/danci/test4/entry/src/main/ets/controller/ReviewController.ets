import { WordCard } from '../model/WordCard';
import { WordLibrary } from '../data/WordLibrary';
import { PreferencesStore } from '../services/PreferencesStore';

/**
 * ReviewController — the review-round state machine / view-model.
 *
 * Implements the behavior contract in `.arkpilot/designs/ui-behavior.json` and
 * exposes state + event methods that map 1:1 to the ui-tree.json events:
 *   flip-card -> flipCard()
 *   mark-known -> markKnown()
 *   mark-unknown -> markUnknown()
 *   restart-round -> restartRound()
 *   load-words -> loadWords()
 *
 * State machine: empty -> active -> complete -> active (restart).
 *
 * Uses ArkUI state-management V2 (@ObservedV2 / @Trace) so bound UI updates reactively.
 */
@ObservedV2
export class ReviewController {
  // --- persistent-ish settings ---
  @Trace currentStage: string = WordLibrary.defaultStage();

  // --- round state ---
  @Trace queue: WordCard[] = [];
  @Trace total: number = 0;
  @Trace knownCount: number = 0;
  @Trace isFlipped: boolean = false;
  @Trace isComplete: boolean = false;
  @Trace started: boolean = false;

  // --- completion snapshot (final counts shown in completion panel) ---
  @Trace finalKnownCount: number = 0;
  @Trace finalReviewCount: number = 0;

  constructor() {
    this.currentStage = PreferencesStore.getCurrentStage();
  }

  // ---------- computed bindings ----------

  /** Current card (queue front) or null when deck is empty. */
  get currentWord(): WordCard | null {
    return this.queue.length > 0 ? this.queue[0] : null;
  }

  /** Remaining cards not yet removed via 认识. */
  get remainingCount(): number {
    return this.queue.length;
  }

  /** "/review/empty" — no words available for current stage at all. */
  get empty(): boolean {
    return !this.started && this.queue.length === 0;
  }

  /** Progress text e.g. "剩余 8 / 10". */
  get progressText(): string {
    if (this.total === 0) {
      return '剩余 0 / 0';
    }
    return `剩余 ${this.remainingCount} / ${this.total}`;
  }

  // ---------- events ----------

  /** load-words: load current stage words; transitions empty -> active (or stays empty). */
  loadWords(): void {
    const words: WordCard[] = WordLibrary.getWordsByStage(this.currentStage);
    this.queue = words;
    this.total = words.length;
    this.knownCount = 0;
    this.isFlipped = false;
    this.isComplete = false;
    this.started = words.length > 0;
    this.finalKnownCount = 0;
    this.finalReviewCount = 0;
  }

  /** flip-card: toggle front/back. */
  flipCard(): void {
    if (!this.canInteractWithCard()) {
      return;
    }
    this.isFlipped = !this.isFlipped;
  }

  /** mark-known: remove front card, knownCount++, advance; complete if drained. */
  markKnown(): void {
    if (!this.canInteractWithCard()) {
      return;
    }
    this.queue.shift();
    this.knownCount += 1;
    this.isFlipped = false;
    if (this.queue.length === 0) {
      this.finishRound();
    }
  }

  /** mark-unknown: move front card to tail (preserve order, never shuffle). */
  markUnknown(): void {
    if (!this.canInteractWithCard()) {
      return;
    }
    const front: WordCard | undefined = this.queue.shift();
    if (front !== undefined) {
      // Push to the bottom of the queue for later review (spec §3/§9).
      this.queue.push(front);
    }
    this.isFlipped = false;
  }

  /** restart-round: rebuild queue from library for the current stage, reset counts. */
  restartRound(): void {
    this.loadWords();
  }

  // ---------- helpers ----------

  /** Card interaction is only valid while a deck is active and not complete. */
  private canInteractWithCard(): boolean {
    return this.started && !this.isComplete && this.queue.length > 0;
  }

  private finishRound(): void {
    this.isComplete = true;
    this.finalKnownCount = this.knownCount;
    this.finalReviewCount = Math.max(this.total - this.knownCount, 0);
  }
}
