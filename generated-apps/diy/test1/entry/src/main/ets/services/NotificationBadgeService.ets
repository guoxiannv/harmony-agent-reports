import { notificationManager } from '@kit.NotificationKit';
import { BusinessError } from '@kit.BasicServicesKit';

export class NotificationBadgeService {
  async setBadge(count: number): Promise<void> {
    try {
      await notificationManager.setBadgeNumber(Math.max(0, count));
    } catch (err) {
      const _: BusinessError = err as BusinessError;
    }
  }

  async clearBadge(): Promise<void> {
    await this.setBadge(0);
  }
}
