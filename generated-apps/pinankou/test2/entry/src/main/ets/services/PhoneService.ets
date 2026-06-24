// PhoneService.ets — initiate a phone call via @kit.TelephonyKit call.makeCall.
import { call } from '@kit.TelephonyKit';
import { promptAction } from '@kit.ArkUI';

export class PhoneService {
  static async call(phoneNumber: string): Promise<boolean> {
    const phone = (phoneNumber ?? '').replace(/\s+/g, '');
    if (phone.length === 0) {
      promptAction.showToast({ message: '未找到联系电话' });
      return false;
    }
    try {
      await call.makeCall(phone);
      return true;
    } catch (e) {
      promptAction.showToast({ message: '拨号失败，请检查权限' });
      return false;
    }
  }
}
