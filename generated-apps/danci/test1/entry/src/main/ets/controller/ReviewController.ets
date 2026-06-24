// ReviewController.ets
//
// State machine for the 小小单词卡 review page.
//
// Owns the runtime review queue and exposes the state + event methods declared
// in .arkpilot/designs/ui-behavior.json:
//   events: flip-card, mark-known, mark-unknown, restart-review
//
// State machine:
//   Loading --loadStage(非空)--> Reviewing
//   Loading --loadStage(空)  --> Empty
//   Reviewing --mark-known(队列变空)--> Completed
//   Reviewing --mark-known / mark-unknown / flip-card--> Reviewing
//   Completed --restart-review--> Reviewing/Empty
//
// Uses ArkTS v2 observable state (@ObservedV2 + @Trace) so the future ReviewPage
// can bind directly to these fields and getters. This file contains no layout.

import { Word } from '../model/Word';
import { WordBankService } from '../services/WordBankService';

/** Behavioral states of the review page (not visual decoration). */
export enum ReviewState {
  Loading = 0,
  Reviewing = 1,
  Completed = 2,
  Empty = 3,
}

/**
 * Drives the review experience. The page reads observable state and getter
 * derivations; the page calls event methods on user actions.
 */
@ObservedV2
export class ReviewController {
  /** Current behavioral state. */
  @Trace reviewState: ReviewState = ReviewState.Loading;

  /** Working queue; mutated in place per mark-known / mark-unknown. */
  @Trace reviewQueue: Word[] = [];

  /** True when the card shows its back (Chinese + phonetic). */
  @Trace isFlipped: boolean = false;

  /** Number of words mastered (removed via 认识) this round. */
  @Trace correctCount: number = 0;

  /** Fixed size of this round's initial queue (set on load). */
  @Trace totalForRound: number = 0;

  /** Current card; equals reviewQueue[0], or null when the queue is empty. */
  @Trace currentWord: Word | null = null;

  /** Fixed page title for the review surface. */
  readonly pageTitle: string = '今日复习';

  /** Fixed empty-state message. */
  readonly emptyMessage: string = '还没有要复习的单词哦';

  /**
   * Loads the current stage's words into a fresh working queue.
   * Called on construction and on restart-review.
   */
  loadStage(): void {
    const stageWords: Word[] = WordBankService.loadCurrentStage();
    this.reviewQueue = stageWords;
    this.totalForRound = stageWords.length;
    this.correctCount = 0;
    this.isFlipped = false;
    this.refreshCurrentWord();
  }

  // ---- Event methods (ui-tree.json events) ----

  /** flip-card: toggle between front (English) and back (Chinese + phonetic). */
  flipCard(): void {
    if (this.reviewState !== ReviewState.Reviewing) {
      return;
    }
    this.isFlipped = !this.isFlipped;
  }

  /**
   * mark-known: remove the head word from the queue, count it correct, and
   * advance. When the queue becomes empty, transition to Completed.
   */
  markKnown(): void {
    if (this.reviewState !== ReviewState.Reviewing || this.reviewQueue.length === 0) {
      return;
    }
    this.reviewQueue.shift();
    this.correctCount += 1;
    this.isFlipped = false;
    this.refreshCurrentWord();
  }

  /**
   * mark-unknown: move the head word to the tail of the queue so it is reviewed
   * again later this round. Queue length is unchanged.
   */
  markUnknown(): void {
    if (this.reviewState !== ReviewState.Reviewing || this.reviewQueue.length === 0) {
      return;
    }
    const head: Word = this.reviewQueue.shift() as Word;
    this.reviewQueue.push(head);
    this.isFlipped = false;
    this.refreshCurrentWord();
  }

  /** restart-review: reload the stage queue from the data source. */
  restartReview(): void {
    this.loadStage();
  }

  // ---- Derived state (bindings from ui-tree.json) ----

  /** /progress/currentAndTotal — `${completedCount} / ${totalForRound}`. */
  get progressCurrentAndTotal(): string {
    return `${this.correctCount} / ${this.totalForRound}`;
  }

  /** /progress/percent — 0..100. */
  get progressPercent(): number {
    if (this.totalForRound <= 0) {
      return 0;
    }
    return Math.round((this.correctCount / this.totalForRound) * 100);
  }

  /** /completion/isVisible — round finished and source was non-empty. */
  get isCompleted(): boolean {
    return this.reviewState === ReviewState.Completed;
  }

  /** /completion/correctAndTotal. */
  get completionCorrectAndTotal(): string {
    return `${this.correctCount} / ${this.totalForRound}`;
  }

  /** /empty/isVisible — data source had no words. */
  get isEmpty(): boolean {
    return this.reviewState === ReviewState.Empty;
  }

  /** Whether the user can act on the current card. */
  get isReviewing(): boolean {
    return this.reviewState === ReviewState.Reviewing;
  }

  // ---- Internal helpers ----

  /**
   * Recompute currentWord and the behavioral state from the working queue.
   * Transitions Reviewing <-> Completed/Empty based on queue length and the
   * original stage size.
   */
  private refreshCurrentWord(): void {
    if (this.reviewQueue.length === 0) {
      this.currentWord = null;
      // Empty source (nothing ever loaded) vs. finished a round.
      this.reviewState = this.totalForRound === 0 ? ReviewState.Empty : ReviewState.Completed;
      return;
    }
    this.currentWord = this.reviewQueue[0];
    this.reviewState = ReviewState.Reviewing;
  }
}
