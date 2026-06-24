// Lightweight unique id generator for new entities.
// Combines a monotonic counter with a timestamp to avoid collisions within a session.

let counter: number = 0;

export class IdGenerator {
  static next(prefix: string): string {
    counter += 1;
    const ts: number = Date.now();
    return `${prefix}_${ts}_${counter}`;
  }
}
