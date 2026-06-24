// Ids.ets
//
// Stable id generator for Pinankou domain entities. Uses a monotonic counter
// seeded from the current epoch millisecond so ids are unique within a session
// without depending on crypto or random APIs in ArkTS.

let _counter: number = 0;

export function nextId(prefix: string): string {
  _counter += 1;
  return `${prefix}-${currentTimeKey()}-${_counter}`;
}

function currentTimeKey(): string {
  // Pad-free numeric key; uniqueness comes from counter, readability from time.
  return `${Date.now()}`;
}
