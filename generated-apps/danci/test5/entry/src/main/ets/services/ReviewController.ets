// ReviewController.ets
//
// Owns the in-memory review session state machine:
//   - working queue (mutated by mark-known / mark-unknown)
//   - known (correct) count
//   - current head word
//   - flip state
//
// This is a plain class (not @Observed) by design: ArkUI reactivity is driven
// from the page via @State fields that mirror controller state after each
// action. Mutating nested array elements is fragile in ArkUI, so the page
// reassigns its @State from controller getters after every transition.
//
// Persistence: none (spec Non-Goal). State is session-scoped and in-memory.

import { Word } from '../model/Word';
import { WordBankService } from './WordBankService';

export class ReviewController {
  private queue: Word[] = [];
  private knownCount: number = 0;
  readonly totalCount: number;
  isFlipped: boolean = false;

  constructor() {
    this.queue = WordBankService.loadStageWords();
    this.totalCount = this.queue.length;
  }

  // Words still in the review queue (not yet removed by 认识).
  get remainingCount(): number {
    return this.queue.length;
  }

  get correctCount(): number {
    return this.knownCount;
  }

  get isComplete(): boolean {
    return this.queue.length === 0;
  }

  get currentWord(): Word | undefined {
    return this.queue.length > 0 ? this.queue[0] : undefined;
  }

  // flip-card: toggle front <-> back. No queue/score change.
  flipCard(): void {
    this.isFlipped = !this.isFlipped;
  }

  // mark-known: remove head, increment known count, reset flip to front.
  // Returns true if the session is now complete.
  markKnown(): boolean {
    if (this.queue.length === 0) {
      return true;
    }
    this.queue.shift();
    this.knownCount += 1;
    this.isFlipped = false;
    return this.isComplete;
  }

  // mark-unknown: move head to bottom of queue, reset flip to front.
  markUnknown(): void {
    if (this.queue.length <= 1) {
      this.isFlipped = false;
      return;
    }
    const head = this.queue.shift();
    if (head !== undefined) {
      this.queue.push(head);
    }
    this.isFlipped = false;
  }

  // restart-session: reload word bank, rebuild queue, reset counters.
  restartSession(): void {
    this.queue = WordBankService.loadStageWords();
    this.knownCount = 0;
    this.isFlipped = false;
  }
}
