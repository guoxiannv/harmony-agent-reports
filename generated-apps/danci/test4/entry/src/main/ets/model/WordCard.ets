/**
 * WordCard — shared word entity for the review deck.
 * Maps to /review/currentWord in the semantic UI protocol.
 */
export interface WordCard {
  /** Stable id (used for list itemIdPattern review-card-{index} at view layer). */
  id: string;
  /** English word shown on the card front. */
  word: string;
  /** Phonetic shown on the card back, e.g. "/həˈloʊ/". */
  phonetic: string;
  /** Chinese meaning shown on the card back. */
  meaning: string;
  /** Stage / level id this word belongs to. */
  stage: string;
}
