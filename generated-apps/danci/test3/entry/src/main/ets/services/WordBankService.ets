// WordBankService.ets
//
// Local data source for the WordFlip Kids review flow.
//
// Per spec section 7, the word library is a local resource (rawfile JSON).
// This is the product's word bank — the legitimate data source named by the
// spec — NOT HTML demo data. When the bank yields zero words for a stage,
// `loadStage` returns an empty array so the review page can render its empty
// state. If the resource is missing or unparseable, we degrade to [] rather
// than crash.

import { buffer } from '@kit.ArkTS';
import { common } from '@kit.AbilityKit';
import { Word } from '../model/Word';

interface RawWordItem {
  id?: string;
  english?: string;
  meaning?: string;
  phonetic?: string;
}

interface RawWordBank {
  stageId?: string;
  stageName?: string;
  words?: RawWordItem[];
}

/**
 * Pure, side-effect-free parser used to turn raw JSON text into a validated
 * `Word[]`. Kept separate from the resource loader so queue logic can be
 * exercised without a device resource manager.
 */
export function parseStage(jsonText: string): Word[] {
  try {
    const parsed: RawWordBank = JSON.parse(jsonText) as RawWordBank;
    const items: RawWordItem[] = parsed.words ?? [];
    const result: Word[] = [];
    for (let i = 0; i < items.length; i++) {
      const item = items[i];
      if (item === null || item === undefined) {
        continue;
      }
      const english = (item.english ?? '').trim();
      if (english.length === 0) {
        // An entry without an English front face is unusable; skip it.
        continue;
      }
      const word: Word = {
        id: (item.id ?? `w${i}`).trim(),
        english: english,
        meaning: (item.meaning ?? '').trim(),
        phonetic: (item.phonetic ?? '').trim(),
      };
      result.push(word);
    }
    return result;
  } catch (err) {
    // Malformed bank → behave as an empty stage (empty state), never crash.
    return [];
  }
}

/**
 * Filename convention for stage word banks inside rawfile/.
 */
function stageFileName(stageId: string): string {
  return `word_bank_${stageId}.json`;
}

/**
 * Loads the current stage's learned words from the local rawfile resource.
 * Returns [] when the stage has no words (or the resource cannot be read),
 * which drives the review page empty state.
 *
 * @param context Ability/UIAbility context exposing `resourceManager`.
 * @param stageId Stage id; defaults to the active stage when omitted.
 */
export function loadStage(context: common.Context, stageId?: string): Word[] {
  const id = stageId !== undefined && stageId.length > 0 ? stageId : defaultStageId();
  try {
    const fileName = stageFileName(id);
    const bytes: Uint8Array = context.resourceManager.getRawFileContentSync(fileName);
    const text: string = buffer.from(bytes.buffer).toString('utf-8');
    return parseStage(text);
  } catch (err) {
    return [];
  }
}

/**
 * The active stage id for this MVP. A single stage is enough for the
 * minimum viable flow described in the spec.
 */
export function defaultStageId(): string {
  return 'stage1';
}
