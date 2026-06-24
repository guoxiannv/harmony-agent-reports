// WordBankService.ets
//
// Data source for the 小小单词卡 review app.
//
// Responsibilities:
// - Provide the current stage's learned words as a Word[].
// - Represent an external learning-system / parent-configured word bank.
// - Return a REAL empty list when the current stage has no words, so the
//   review page can show its real empty state. Do NOT seed decorative HTML
//   sample data here.
//
// The default implementation uses a bundled local word bank (see
// STAGE_DEFAULT). The contract intentionally returns a fresh copy each call
// so callers can mutate the working queue in place without touching the source.

import { Word } from '../model/Word';

/**
 * Current stage's learned word bank.
 *
 * This is real domain data (a children's basic English vocabulary stage),
 * standing in for the external learning system's JSON array of learned words.
 * Edit this list to change the current stage's review set; an empty list
 * triggers the real empty state.
 */
const STAGE_DEFAULT: Word[] = [
  { english: 'apple', phonetic: '/ˈæp.əl/', chinese: '苹果' },
  { english: 'banana', phonetic: '/bəˈnɑː.nə/', chinese: '香蕉' },
  { english: 'cat', phonetic: '/kæt/', chinese: '猫' },
  { english: 'dog', phonetic: '/dɒɡ/', chinese: '狗' },
  { english: 'egg', phonetic: '/eɡ/', chinese: '鸡蛋' },
  { english: 'fish', phonetic: '/fɪʃ/', chinese: '鱼' },
  { english: 'milk', phonetic: '/mɪlk/', chinese: '牛奶' },
  { english: 'sun', phonetic: '/sʌn/', chinese: '太阳' },
  { english: 'moon', phonetic: '/muːn/', chinese: '月亮' },
  { english: 'book', phonetic: '/bʊk/', chinese: '书' },
];

/**
 * Loads the current stage's learned words.
 *
 * @returns a fresh copy of the stage word list (empty when the stage has no words).
 */
export class WordBankService {
  static loadCurrentStage(): Word[] {
    const copy: Word[] = [];
    for (let i = 0; i < STAGE_DEFAULT.length; i++) {
      const w: Word = STAGE_DEFAULT[i];
      copy.push({ english: w.english, phonetic: w.phonetic, chinese: w.chinese });
    }
    return copy;
  }
}
