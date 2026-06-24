import { promptAction } from '@kit.ArkUI'

export class CallService {
  call(phone: string): void {
    // Stub: real implementation requires call permission / startAbility.
    promptAction.showToast({ message: `拨号 ${phone}` })
  }
}
