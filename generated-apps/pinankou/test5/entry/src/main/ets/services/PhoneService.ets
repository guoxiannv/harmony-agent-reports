// PhoneService.ets
//
// 应急联系人一键拨号（call-contact 流程）。
// 通过拉起系统拨号面板实现，无需额外授权。失败返回 false，由调用方给出提示。
// ArkTS strict-safe。

import { Want } from '@kit.AbilityKit';
import { Persistence } from './Persistence';

export class PhoneService {
  // 拉起拨号面板并预填号码。phone 应已通过 Validators.isPhoneLike 校验。
  static async makeCall(phone: string): Promise<boolean> {
    const trimmed: string = phone.trim();
    if (trimmed.length === 0) {
      return false;
    }
    const ctx = Persistence.getContext();
    if (ctx === null) {
      return false;
    }
    const want: Want = {
      action: 'ohos.want.action.dial',
      uri: `tel:${trimmed}`,
    };
    try {
      await ctx.startAbility(want);
      return true;
    } catch (err) {
      return false;
    }
  }
}
