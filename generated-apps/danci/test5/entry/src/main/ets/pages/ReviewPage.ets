// ReviewPage.ets
//
// The only route-worthy surface: the flashcard review flow.
// Owns the ReviewController (session state machine) and mirrors its state into
// @State fields that drive the reactive UI.
//
// Layout (page-review-page.html):
//  - Sky-blue gradient background with two decorative radial blobs.
//  - White ProgressHeader at the top.
//  - Centered Flashcard stage + ActionBar below it.
//  - CompletionState panel when the queue is exhausted.
// Content is constrained to contentMaxWidth (390vp) and centered; never full-width.

import { Theme, BrandGradient } from '../common/Theme';
import { ReviewController } from '../services/ReviewController';
import { ProgressHeader } from '../components/ProgressHeader';
import { Flashcard } from '../components/Flashcard';
import { ActionBar } from '../components/ActionBar';
import { CompletionState } from '../components/CompletionState';

@Component
export struct ReviewPage {
  private controller: ReviewController = new ReviewController();

  @State private totalCount: number = 0;
  @State private remainingCount: number = 0;
  @State private knownCount: number = 0;
  @State private isComplete: boolean = false;
  @State private currentWord: string = '';
  @State private currentMeaning: string = '';
  @State private currentPhonetic: string = '';
  @State private isFlipped: boolean = false;

  aboutToAppear(): void {
    this.syncFromController();
  }

  private syncFromController(): void {
    const c: ReviewController = this.controller;
    this.totalCount = c.totalCount;
    this.remainingCount = c.remainingCount;
    this.knownCount = c.correctCount;
    this.isComplete = c.isComplete;
    const w = c.currentWord;
    this.currentWord = w ? w.word : '';
    this.currentMeaning = w ? w.meaning : '';
    this.currentPhonetic = w ? w.phonetic : '';
    this.isFlipped = c.isFlipped;
  }

  // flip-card
  private onFlipCard(): void {
    this.controller.flipCard();
    this.isFlipped = this.controller.isFlipped;
  }

  // mark-known
  private onMarkKnown(): void {
    this.controller.markKnown();
    this.syncFromController();
  }

  // mark-unknown
  private onMarkUnknown(): void {
    this.controller.markUnknown();
    this.syncFromController();
  }

  // restart-session
  private onRestart(): void {
    this.controller.restartSession();
    this.syncFromController();
  }

  build() {
    Stack() {
      // Decorative radial blobs (behind content).
      Circle({ width: 340, height: 340 })
        .fill(Theme.blobYellow)
        .position({ x: -90, y: '42%' })

      Circle({ width: 360, height: 360 })
        .fill(Theme.blobPurple)
        .position({ x: 140, y: '12%' })

      // Content column, centered and width-constrained.
      Column() {
        ProgressHeader({
          totalCount: this.totalCount,
          remainingCount: this.remainingCount,
          knownCount: this.knownCount,
        })

        if (this.isComplete) {
          Column() {
            CompletionState({
              knownCount: this.knownCount,
              totalCount: this.totalCount,
              onRestart: () => this.onRestart(),
            })
          }
          .width('100%')
          .layoutWeight(1)
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)
        } else {
          // Card stage + actions
          Column() {
            Flashcard({
              word: this.currentWord,
              meaning: this.currentMeaning,
              phonetic: this.currentPhonetic,
              isFlipped: this.isFlipped,
              onTap: () => this.onFlipCard(),
            })
            ActionBar({
              onKnown: () => this.onMarkKnown(),
              onUnknown: () => this.onMarkUnknown(),
            })
            .margin({ top: 44 })
          }
          .width('100%')
          .layoutWeight(1)
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)
        }
      }
      .width('100%')
      .height('100%')
      .constraintSize({ maxWidth: Theme.contentMaxWidth })
    }
    .width('100%')
    .height('100%')
    .linearGradient(BrandGradient.pageTop)
    .alignContent(Alignment.Center)
  }
}
