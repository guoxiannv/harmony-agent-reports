// WordBank.ets
//
// Built-in vocabulary library for the 童词卡 review app.
//
// Per spec section 6, the initial data source is an application-bundled word
// library, filtered by learning stage. This module is the static seed data;
// WordBankService.loadStage reads from here. No network, no login, no seeding
// from HTML sample data.

import { WordItem } from '../model/WordItem';

/**
 * Default (and currently only) learning stage. Kept as a named constant so a
 * future multi-stage extension can branch on stage without scattered literals.
 */
export const DEFAULT_STAGE: string = 'basic';

/**
 * Built-in word library. Each entry carries a stable id so the review queue can
 * re-queue an unknown card and still key ForEach items deterministically.
 */
export const WORD_BANK: WordItem[] = [
  { id: 'word-apple', english: 'apple', meaning: '苹果', phonetic: '/ˈæpl/', stage: 'basic' },
  { id: 'word-banana', english: 'banana', meaning: '香蕉', phonetic: '/bəˈnɑːnə/', stage: 'basic' },
  { id: 'word-cat', english: 'cat', meaning: '猫', phonetic: '/kæt/', stage: 'basic' },
  { id: 'word-dog', english: 'dog', meaning: '狗', phonetic: '/dɒɡ/', stage: 'basic' },
  { id: 'word-egg', english: 'egg', meaning: '鸡蛋', phonetic: '/eɡ/', stage: 'basic' },
  { id: 'word-fish', english: 'fish', meaning: '鱼', phonetic: '/fɪʃ/', stage: 'basic' },
  { id: 'word-grape', english: 'grape', meaning: '葡萄', phonetic: '/ɡreɪp/', stage: 'basic' },
  { id: 'word-house', english: 'house', meaning: '房子', phonetic: '/haʊs/', stage: 'basic' },
  { id: 'word-ice', english: 'ice', meaning: '冰', phonetic: '/aɪs/', stage: 'basic' },
  { id: 'word-juice', english: 'juice', meaning: '果汁', phonetic: '/dʒuːs/', stage: 'basic' },
  { id: 'word-kite', english: 'kite', meaning: '风筝', phonetic: '/kaɪt/', stage: 'basic' },
  { id: 'word-lion', english: 'lion', meaning: '狮子', phonetic: '/ˈlaɪən/', stage: 'basic' },
  { id: 'word-milk', english: 'milk', meaning: '牛奶', phonetic: '/mɪlk/', stage: 'basic' },
  { id: 'word-nose', english: 'nose', meaning: '鼻子', phonetic: '/nəʊz/', stage: 'basic' },
  { id: 'word-orange', english: 'orange', meaning: '橙子', phonetic: '/ˈɒrɪndʒ/', stage: 'basic' },
];
