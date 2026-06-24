import { WordCard } from '../model/WordCard';

/**
 * WordLibrary — local, offline word library data source.
 *
 * Per spec §6 the word library is a built-in local resource (no network, no backend).
 * `stage` groups words by the child's current learning stage so the review deck can
 * load "已学过的单词" for the current stage.
 *
 * The dataset below is a representative built-in library; persistence of which
 * stage is "current" is handled by PreferencesStore, not here.
 */

const DEFAULT_STAGE = 'stage-1';

const LIBRARY: WordCard[] = [
  { id: 'apple', word: 'apple', phonetic: '/ˈæpəl/', meaning: '苹果', stage: DEFAULT_STAGE },
  { id: 'banana', word: 'banana', phonetic: '/bəˈnænə/', meaning: '香蕉', stage: DEFAULT_STAGE },
  { id: 'cat', word: 'cat', phonetic: '/kæt/', meaning: '猫', stage: DEFAULT_STAGE },
  { id: 'dog', word: 'dog', phonetic: '/dɒɡ/', meaning: '狗', stage: DEFAULT_STAGE },
  { id: 'book', word: 'book', phonetic: '/bʊk/', meaning: '书', stage: DEFAULT_STAGE },
  { id: 'water', word: 'water', phonetic: '/ˈwɔːtər/', meaning: '水', stage: DEFAULT_STAGE },
  { id: 'sun', word: 'sun', phonetic: '/sʌn/', meaning: '太阳', stage: DEFAULT_STAGE },
  { id: 'moon', word: 'moon', phonetic: '/muːn/', meaning: '月亮', stage: DEFAULT_STAGE },
  { id: 'tree', word: 'tree', phonetic: '/triː/', meaning: '树', stage: DEFAULT_STAGE },
  { id: 'fish', word: 'fish', phonetic: '/fɪʃ/', meaning: '鱼', stage: DEFAULT_STAGE },
  { id: 'milk', word: 'milk', phonetic: '/mɪlk/', meaning: '牛奶', stage: DEFAULT_STAGE },
  { id: 'bread', word: 'bread', phonetic: '/bred/', meaning: '面包', stage: DEFAULT_STAGE },
];

export class WordLibrary {
  /**
   * Return a fresh copy of the words for a given stage.
   * A copy is returned so the review queue can be mutated without corrupting the library.
   */
  static getWordsByStage(stage: string): WordCard[] {
    return LIBRARY.filter((w: WordCard) => w.stage === stage).map((w: WordCard): WordCard => {
      return { id: w.id, word: w.word, phonetic: w.phonetic, meaning: w.meaning, stage: w.stage };
    });
  }

  static hasStage(stage: string): boolean {
    return LIBRARY.some((w: WordCard) => w.stage === stage);
  }

  static listStages(): string[] {
    const set: Set<string> = new Set<string>();
    LIBRARY.forEach((w: WordCard) => set.add(w.stage));
    return Array.from(set);
  }

  static defaultStage(): string {
    return DEFAULT_STAGE;
  }
}
