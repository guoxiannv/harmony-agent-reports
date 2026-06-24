import { call } from '@kit.TelephonyKit';

export class DialService {
  async dial(phoneNumber: string): Promise<boolean> {
    let normalized: string = phoneNumber.replace(/[^0-9+\-]/g, '')
    if (normalized.length === 0) {
      return false
    }
    try {
      await call.makeCall(normalized)
      return true
    } catch (err) {
      return false
    }
  }
}
