// WordBankService.ets
//
// Service boundary that loads the built-in word library, filtered by learning
// stage. Per spec section 6 there is no backend, login, or sync; this service
// owns the data-access boundary so the view-model never reaches into the raw
// seed data directly.

import { WordItem } from '../model/WordItem';
import { WORD_BANK, DEFAULT_STAGE } from '../data/WordBank';

/**
 * Loads the words for a given learning stage.
 *
 * Returns a fresh array (shallow copies of the bank entries) so the caller can
 * mutate the queue (remove / re-order) without corrupting the bundled library.
 *
 * @param stage Learning stage filter. Defaults to DEFAULT_STAGE when omitted.
 * @returns WordItem[] for the stage; empty array if the stage has no words.
 */
export function loadStage(stage: string = DEFAULT_STAGE): WordItem[] {
  return WORD_BANK
    .filter((word: WordItem) => word.stage === stage)
    .map((word: WordItem): WordItem => {
      return {
        id: word.id,
        english: word.english,
        meaning: word.meaning,
        phonetic: word.phonetic,
        stage: word.stage,
      };
    });
}

/**
 * The single currently-supported stage. Exposed so callers (e.g. a future stage
 * selector or restart flow) can refer to it without importing the data module.
 */
export const SUPPORTED_STAGES: string[] = [DEFAULT_STAGE];
