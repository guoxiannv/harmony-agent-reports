// AppServices.ets
//
// Singleton aggregation of the runtime service layer.
// Persistent stores are initialized once with the ability context
// (called from EntryAbility.onWindowStageCreate).

import { common } from '@kit.AbilityKit';
import { IngredientStore } from './IngredientStore';
import { RecordStore } from './RecordStore';
import { FilterStore } from './FilterStore';

export const ingredientStore: IngredientStore = new IngredientStore();
export const recordStore: RecordStore = new RecordStore();
export const filterStore: FilterStore = new FilterStore();

let initialized: boolean = false;

export async function initAppServices(context: common.Context): Promise<void> {
  if (initialized) {
    return;
  }
  await ingredientStore.init(context);
  await recordStore.init(context);
  initialized = true;
}

export function isAppServicesReady(): boolean {
  return initialized;
}
