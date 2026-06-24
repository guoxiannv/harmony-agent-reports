import { promptAction } from '@kit.ArkUI'

export class NotificationService {
  show(title: string, body: string): void {
    promptAction.showToast({ message: `${title}: ${body}` })
  }
}
