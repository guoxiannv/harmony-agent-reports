// WordBankService.ets
//
// Loads the current learning stage's word set.
//
// Data strategy (spec Open Question): hard-coded in ArkTS rather than loaded from
// a rawfile JSON. This keeps the data path simple and self-contained for a
// single-screen review app with no persistence requirement.
//
// The words below are a curated beginner-stage set appropriate for children.
// In a future scope the parent/teacher would manage this list; out of scope here.

import { Word } from '../model/Word';

const STAGE_WORDS: Word[] = [
  { id: 'w-apple', word: 'apple', meaning: '苹果', phonetic: '/ˈæp.əl/' },
  { id: 'w-banana', word: 'banana', meaning: '香蕉', phonetic: '/bəˈnɑː.nə/' },
  { id: 'w-cat', word: 'cat', meaning: '猫', phonetic: '/kæt/' },
  { id: 'w-dog', word: 'dog', meaning: '狗', phonetic: '/dɒɡ/' },
  { id: 'w-water', word: 'water', meaning: '水', phonetic: '/ˈwɔː.tər/' },
  { id: 'w-book', word: 'book', meaning: '书', phonetic: '/bʊk/' },
  { id: 'w-sun', word: 'sun', meaning: '太阳', phonetic: '/sʌn/' },
  { id: 'w-moon', word: 'moon', meaning: '月亮', phonetic: '/muːn/' },
  { id: 'w-tree', word: 'tree', meaning: '树', phonetic: '/triː/' },
  { id: 'w-fish', word: 'fish', meaning: '鱼', phonetic: '/fɪʃ/' },
  { id: 'w-milk', word: 'milk', meaning: '牛奶', phonetic: '/mɪlk/' },
  { id: 'w-star', word: 'star', meaning: '星星', phonetic: '/stɑːr/' },
];

export class WordBankService {
  // Returns a fresh shallow copy so callers can mutate without affecting the bank.
  static loadStageWords(): Word[] {
    return STAGE_WORDS.slice();
  }
}
