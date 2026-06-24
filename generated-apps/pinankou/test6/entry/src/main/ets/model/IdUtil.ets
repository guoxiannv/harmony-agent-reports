// IdUtil.ets
//
// Tiny id + time helpers. Uses counter + timestamp to avoid Math.random-style
// ids while staying deterministic enough for local persistence.

let counter: number = 0;

export function genId(prefix: string): string {
  counter = counter + 1;
  return prefix + '_' + Date.now().toString(36) + '_' + counter.toString(36);
}

export function nowMs(): number {
  return Date.now();
}

// Start of today (local midnight) in ms.
export function startOfToday(now: number): number {
  const dayMs: number = 86400000;
  return Math.floor(now / dayMs) * dayMs;
}

export function daysBetween(fromMs: number, toMs: number): number {
  if (toMs <= fromMs) {
    return 0;
  }
  return (toMs - fromMs) / 86400000;
}
