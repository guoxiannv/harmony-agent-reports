// Word.ets
//
// Domain types for the WordFlip Kids review flow.
// Mirrors the ui-tree.json binding `currentWord` (english / meaning / phonetic)
// and the review statistics (remainingCount / correctCount / totalCount).

/**
 * A learned word from the current stage's word bank.
 *
 * `id` is required for stable queue identity. `english` is the front face,
 * `meaning` and `phonetic` are the back face content.
 */
export interface Word {
  /** Stable unique id used for queue identity / dedup. */
  id: string;
  /** Front face text. */
  english: string;
  /** Back face Chinese meaning. */
  meaning: string;
  /** Back face phonetic, e.g. /wɜːd/. */
  phonetic: string;
}

/**
 * Round statistics derived from the review queue.
 * `totalCount` is frozen when a round starts; the others change as the
 * child reviews cards.
 */
export interface ReviewStats {
  /** Cards in the round when it started. Frozen at round start. */
  totalCount: number;
  /** Cards still in the queue. */
  remainingCount: number;
  /** Cards marked 认识 this round. */
  correctCount: number;
}
