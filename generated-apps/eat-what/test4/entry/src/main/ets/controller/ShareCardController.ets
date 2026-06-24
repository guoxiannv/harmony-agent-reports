// ShareCardController.ets
//
// Controller for the share-card-sheet surface. Owns /share/preview and the
// open/closed state machine. Export (v1, local-only) copies a text summary to
// the system clipboard via @kit.BasicServicesKit pasteboard.

import { LogEntry, ShareCardPreview } from '../model/Models';
import { LogRepository } from '../service/LogRepository';
import { ShareCardBuilder } from '../service/ShareCardBuilder';
import { pasteboard } from '@kit.BasicServicesKit';

export type ShareCardState = 'closed' | 'open';

export class ShareCardController {
  state: ShareCardState = 'closed';
  // /share/preview
  preview: ShareCardPreview | null = null;
  currentEntry: LogEntry | null = null;
  lastFeedback: string = '';

  onChange: () => void = () => {};

  // event open-share-card
  async open(logEntryId: string): Promise<void> {
    const all: LogEntry[] = await LogRepository.getAll();
    let target: LogEntry | null = null;
    for (let i = 0; i < all.length; i++) {
      if (all[i].id === logEntryId) {
        target = all[i];
        break;
      }
    }
    if (target === null) {
      this.lastFeedback = '记录不存在';
      this.notify();
      return;
    }
    this.currentEntry = target;
    this.preview = ShareCardBuilder.build(target);
    this.state = 'open';
    this.lastFeedback = '';
    this.notify();
  }

  // event close-share-card
  close(): void {
    this.state = 'closed';
    this.preview = null;
    this.currentEntry = null;
    this.notify();
  }

  // event export-share-card
  async export(): Promise<void> {
    const entry: LogEntry | null = this.currentEntry;
    if (entry === null) {
      this.lastFeedback = '没有可分享的记录';
      this.notify();
      return;
    }
    try {
      const text: string = ShareCardBuilder.toShareText(entry);
      const data: pasteboard.PasteData = pasteboard.createData(
        pasteboard.MIMETYPE_TEXT_PLAIN,
        text,
      );
      const board: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      await board.setData(data);
      this.lastFeedback = '已复制分享文案';
    } catch (e) {
      this.lastFeedback = '复制失败，请重试';
    }
    this.notify();
  }

  private notify(): void {
    this.onChange();
  }
}

export const shareCardController: ShareCardController = new ShareCardController();
