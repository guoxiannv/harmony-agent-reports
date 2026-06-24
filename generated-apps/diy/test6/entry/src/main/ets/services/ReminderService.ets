// Reminder / summary helpers for the home surface and sleeping-member flows.
// Reads from AppStore; does not mutate except the explicit wake action.

import { AppStore } from './AppStore';
import { TimeUtil, IdUtil } from '../common/Util';
import { Member } from '../common/Models';

export interface HomeReminder {
  kind: 'sleeping' | 'lowStock';
  count: number;
  message: string;
}

export class ReminderService {
  static sleepingCount(): number {
    return AppStore.get().sleepingCount();
  }

  static lowStockCount(): number {
    return AppStore.get().lowStockCount();
  }

  static reminders(): HomeReminder[] {
    const out: HomeReminder[] = [];
    const sleeping = ReminderService.sleepingCount();
    if (sleeping > 0) {
      out.push({ kind: 'sleeping', count: sleeping, message: `${sleeping} 位会员已沉睡，建议唤醒` });
    }
    const low = ReminderService.lowStockCount();
    if (low > 0) {
      out.push({ kind: 'lowStock', count: low, message: `${low} 项物料库存不足` });
    }
    return out;
  }

  // MVP wake action: record a contact note + refresh lastVisitAt so the member
  // leaves the sleeping list. Local push-notification is best-effort and not
  // wired (documented in handoff).
  static wakeMember(memberId: string, note: string): void {
    const store = AppStore.get();
    const m = store.getMember(memberId);
    if (m === null) {
      return;
    }
    const stamp = TimeUtil.now();
    const suffix = note.trim().length > 0 ? `（唤醒：${note.trim()}）` : '（已唤醒联系）';
    const updated: Member = {
      id: m.id, name: m.name, phone: m.phone, nickname: m.nickname, birthday: m.birthday,
      crafts: m.crafts, notes: (m.notes + (m.notes.length > 0 ? '\n' : '') + TimeUtil.dateLabel(stamp) + suffix),
      allergy: m.allergy, workImages: m.workImages, points: m.points, totalSpend: m.totalSpend,
      lastVisitAt: stamp, createdAt: m.createdAt,
    };
    store.saveMember(updated, m.id);
  }

  static todayLabel(): string {
    const d = new Date(TimeUtil.now());
    const weekdays = ['日', '一', '二', '三', '四', '五', '六'];
    return `${d.getMonth() + 1}月${d.getDate()}日 · 周${weekdays[d.getDay()]}`;
  }

  static placeholderId(prefix: string): string {
    return IdUtil.next(prefix);
  }
}
