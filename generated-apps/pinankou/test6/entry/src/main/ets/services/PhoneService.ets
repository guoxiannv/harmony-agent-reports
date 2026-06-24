// PhoneService.ets
//
// Launches the system dialer for an emergency contact phone number. We do not
// place calls in-app (that needs ohos.permission.PLACE_CALL); instead we fire
// the ohos.want.action.dial intent. The ability context is provided by
// EntryAbility and typed as common.UIAbilityContext so startAbility resolves.

import { common, Want } from '@kit.AbilityKit';

export class PhoneService {
  private static ctx: common.UIAbilityContext | null = null;

  static setContext(ctx: common.UIAbilityContext): void {
    PhoneService.ctx = ctx;
  }

  static isReady(): boolean {
    return PhoneService.ctx !== null;
  }

  static async dial(phone: string): Promise<boolean> {
    if (PhoneService.ctx === null) {
      return false;
    }
    const trimmed: string = phone.trim();
    if (trimmed.length === 0) {
      return false;
    }
    const want: Want = {
      action: 'ohos.want.action.dial',
      uri: 'tel:' + trimmed,
    };
    try {
      await PhoneService.ctx.startAbility(want);
      return true;
    } catch (e) {
      return false;
    }
  }
}
