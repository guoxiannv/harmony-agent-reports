// Word.ets
//
// Domain model for the 小小单词卡 review app.
// One Word = one flashcard. Front shows `english`; back shows `chinese` + `phonetic`.

/**
 * A single reviewable word entry (one flashcard).
 */
export interface Word {
  /** English word shown on the card front. */
  english: string;
  /** Phonetic transcription shown on the card back, e.g. "/ˈæp.əl/". */
  phonetic: string;
  /** Chinese meaning shown on the card back. */
  chinese: string;
}
