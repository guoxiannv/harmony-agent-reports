// WordItem.ets
//
// Core vocabulary entity for the 童词卡 review app.
// Shared by the word bank data layer, the loader service, and the
// StudySession view-model. Keep this file free of UI decorators.

/**
 * A single vocabulary card.
 *
 * Fields mirror the semantic bindings in ui-tree.json:
 *   /study/currentWord/{english, meaning, phonetic}
 */
export interface WordItem {
  /** Stable unique id, used for ForEach keys when cards are re-queued. */
  id: string;
  /** English word shown on the card front. */
  english: string;
  /** Chinese meaning shown on the card back. */
  meaning: string;
  /** Phonetic transcription shown on the card back. */
  phonetic: string;
  /** Learning stage used by WordBankService.loadStage. Default 'basic'. */
  stage: string;
}
