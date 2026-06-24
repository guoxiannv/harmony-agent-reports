// LogController.ets
//
// Controller for the log-page surface. Owns /log/entries (today) and
// /log/todayCount. Reads persisted entries from LogRepository.

import { LogEntry } from '../model/Models';
import { LogRepository } from '../service/LogRepository';

export class LogController {
  // /log/entries (today, newest first)
  entries: LogEntry[] = [];
  // /log/todayCount
  todayCount: number = 0;

  lastFeedback: string = '';

  onChange: () => void = () => {};

  async refresh(): Promise<void> {
    this.entries = await LogRepository.getToday();
    this.todayCount = this.entries.length;
    this.notify();
  }

  async removeEntry(id: string): Promise<void> {
    await LogRepository.removeEntry(id);
    await this.refresh();
  }

  private notify(): void {
    this.onChange();
  }
}

export const logController: LogController = new LogController();
