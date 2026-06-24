// LogRepository.ets
//
// CRUD for LogEntry, persisted as JSON via StorageService. Also derives the
// today-count and date-window filtering used by /log/todayCount and /log/entries.

import { LogEntry, RawLogEntry, toLogEntry } from '../model/Models';
import { StorageService } from './StorageService';

const KEY_ENTRIES = 'log_entries';

export class LogRepository {
  static async getAll(): Promise<LogEntry[]> {
    const raw: string = await StorageService.getJsonText(KEY_ENTRIES, '');
    if (raw.length === 0) {
      return [];
    }
    try {
      const parsed: RawLogEntry[] = JSON.parse(raw) as RawLogEntry[];
      const out: LogEntry[] = [];
      for (let i = 0; i < parsed.length; i++) {
        out.push(toLogEntry(parsed[i]));
      }
      return out;
    } catch (e) {
      return [];
    }
  }

  static async saveAll(entries: LogEntry[]): Promise<void> {
    await StorageService.putJson(KEY_ENTRIES, JSON.stringify(entries));
  }

  static async addEntry(entry: LogEntry): Promise<void> {
    const all: LogEntry[] = await LogRepository.getAll();
    all.push(entry);
    await LogRepository.saveAll(all);
  }

  static async removeEntry(id: string): Promise<void> {
    const all: LogEntry[] = await LogRepository.getAll();
    const next: LogEntry[] = [];
    for (let i = 0; i < all.length; i++) {
      if (all[i].id !== id) {
        next.push(all[i]);
      }
    }
    await LogRepository.saveAll(next);
  }

  // Entries logged today (local calendar day), newest first.
  static async getToday(): Promise<LogEntry[]> {
    const all: LogEntry[] = await LogRepository.getAll();
    const startOfDay: number = LogRepository.startOfTodayMs();
    const out: LogEntry[] = [];
    for (let i = 0; i < all.length; i++) {
      if (all[i].timestamp >= startOfDay) {
        out.push(all[i]);
      }
    }
    out.sort((a: LogEntry, b: LogEntry) => b.timestamp - a.timestamp);
    return out;
  }

  static async todayCount(): Promise<number> {
    const today: LogEntry[] = await LogRepository.getToday();
    return today.length;
  }

  static startOfTodayMs(): number {
    const d: Date = new Date();
    d.setHours(0, 0, 0, 0);
    return d.getTime();
  }
}
