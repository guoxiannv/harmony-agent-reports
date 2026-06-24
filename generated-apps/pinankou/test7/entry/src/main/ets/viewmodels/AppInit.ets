// AppInit.ets
//
// One-shot initialization for Pinankou domain stores and controllers.
// Call PinankouApp.init(context) from EntryAbility.onCreate during visual
// integration. In the headless phase it is safe to call with no context;
// persistence stays a no-op until a real Context is supplied.

import common from '@ohos.app.ability.common';
import { DataStore } from '../services/DataStore';
import { PersistenceService } from '../services/PersistenceService';
import { SafetyController } from './SafetyController';
import { HazardController } from './HazardController';
import { PatrolController } from './PatrolController';
import { ContactsController } from './ContactsController';

export class PinankouApp {
  static init(context?: common.Context): void {
    if (context !== undefined) {
      PersistenceService.init(context);
    }
    DataStore.ensureInit();
    SafetyController.ensureInit();
    HazardController.ensureInit();
    PatrolController.ensureInit();
    ContactsController.ensureInit();
  }
}
