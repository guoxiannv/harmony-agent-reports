// ShareCardBuilder.ets
//
// Builds a ShareCardPreview from a LogEntry. Pure formatting; the actual
// export (clipboard copy of a text summary) is owned by ShareCardController.

import { LogEntry, ShareCardPreview, mealTimeLabel, moodLabel } from '../model/Models';

export class ShareCardBuilder {
  static build(entry: LogEntry): ShareCardPreview {
    const moodStr: string = entry.mood.length > 0 ? moodLabel(entry.mood) : '';
    const preview: ShareCardPreview = {
      dishName: entry.dishName,
      date: ShareCardBuilder.formatDate(entry.timestamp),
      mealTimeLabel: mealTimeLabel(entry.mealTime),
      moodLabel: moodStr,
      note: entry.note,
    };
    return preview;
  }

  // Human-readable export summary (v1 local-only share output).
  static toShareText(entry: LogEntry): string {
    const timeLabel: string = mealTimeLabel(entry.mealTime);
    const moodStr: string = entry.mood.length > 0 ? '· ' + moodLabel(entry.mood) : '';
    const noteStr: string = entry.note.length > 0 ? '\n备注：' + entry.note : '';
    return `今天我吃了【${entry.dishName}】（${timeLabel} ${moodStr}）${noteStr}`;
  }

  static formatDate(timestamp: number): string {
    const d: Date = new Date(timestamp);
    const y: number = d.getFullYear();
    const m: number = d.getMonth() + 1;
    const day: number = d.getDate();
    return `${y}年${m}月${day}日`;
  }
}
