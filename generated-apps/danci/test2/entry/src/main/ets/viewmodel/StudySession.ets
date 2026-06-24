// StudySession.ets
//
// View-model / state machine for the 童词卡 review session.
//
// Owns the runtime study state named in ui-behavior.json:
//   - queue: current review queue (queue[0] is the card being shown)
//   - isFlipped: whether the current card shows its back
//   - knownCount: number of cards marked known this session
//   - totalCount: size of the originally loaded queue (for stats)
//
// Transitions map 1:1 to the semantic events in ui-tree.json:
//   toggle-flip-card -> toggleFlip()
//   mark-known       -> markKnown()
//   mark-unknown     -> markUnknown()
//   restart-study    -> restart()
//
// Persistence: none. Spec section 6/9 requires runtime-only state; this class
// holds everything in memory and resets on restart().

import { WordItem } from '../model/WordItem';
import { loadStage } from '../services/WordBankService';

/** Coarse page status for the study surface (see ui-behavior.json stateMachine). */
export type StudyStatus = 'studying' | 'complete' | 'empty';

@Observed
export class StudySession {
  /** Current review queue; the head element is the card on screen. */
  queue: WordItem[] = [];
  /** Whether the current card is flipped to its back (meaning + phonetic). */
  isFlipped: boolean = false;
  /** Number of cards marked known this session. */
  knownCount: number = 0;
  /** Size of the queue as originally loaded; used for completion stats. */
  totalCount: number = 0;

  /** The stage this session was loaded from. Defaults via loadStage(). */
  private stage: string;

  constructor(stage: string = 'basic') {
    this.stage = stage;
    this.reload();
  }

  /**
   * Reloads the queue from the word bank for the current stage and resets all
   * session counters. Used by the constructor and by restart().
   */
  private reload(): void {
    const words: WordItem[] = loadStage(this.stage);
    this.queue = words;
    this.totalCount = words.length;
    this.knownCount = 0;
    this.isFlipped = false;
  }

  /** The card currently on screen, or undefined when the queue is empty. */
  get currentWord(): WordItem | undefined {
    return this.queue.length > 0 ? this.queue[0] : undefined;
  }

  /** Cards remaining in the queue (including the one on screen). */
  get remainingCount(): number {
    return this.queue.length;
  }

  /** True when every loaded card has been marked known this session. */
  get isComplete(): boolean {
    return this.totalCount > 0 && this.queue.length === 0;
  }

  /** True when the bank produced no words for the stage at all. */
  get isEmpty(): boolean {
    return this.totalCount === 0;
  }

  /** Coarse page status, derived from queue/totalCount. */
  get status(): StudyStatus {
    if (this.totalCount === 0) {
      return 'empty';
    }
    if (this.queue.length === 0) {
      return 'complete';
    }
    return 'studying';
  }

  /**
   * toggle-flip-card: flip the current card between front and back.
   * No queue or counter side effects.
   */
  toggleFlip(): void {
    if (this.queue.length === 0) {
      return;
    }
    this.isFlipped = !this.isFlipped;
  }

  /**
   * mark-known: remove the current card from the queue, record a correct
   * answer, reset the flip, and advance to the next card (or completion).
   */
  markKnown(): void {
    if (this.queue.length === 0) {
      return;
    }
    // Reassign (not in-place mutation) so V1 @ObjectLink observers rebuild.
    this.queue = this.queue.slice(1);
    this.knownCount += 1;
    this.isFlipped = false;
  }

  /**
   * mark-unknown: move the current card to the tail of the queue for later
   * re-review, reset the flip, and advance to the next card. remainingCount is
   * unchanged.
   */
  markUnknown(): void {
    if (this.queue.length === 0) {
      return;
    }
    const head: WordItem = this.queue[0];
    // Reassign (not in-place mutation) so V1 @ObjectLink observers rebuild.
    this.queue = this.queue.slice(1).concat([head]);
    this.isFlipped = false;
  }

  /** restart-study: refill the queue and reset all session counters. */
  restart(): void {
    this.reload();
  }
}
