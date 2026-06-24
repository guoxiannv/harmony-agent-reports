let counter = 0;

export function generateId(prefix: string): string {
  counter++;
  return `${prefix}_${Date.now().toString(36)}_${counter.toString(36)}`;
}

export function formatDate(ts: number | null | undefined): string {
  if (!ts) return '';
  const d = new Date(ts);
  const y = d.getFullYear();
  const m = String(d.getMonth() + 1).padStart(2, '0');
  const day = String(d.getDate()).padStart(2, '0');
  return `${y}-${m}-${day}`;
}

export function parseDate(value: string): number | null {
  if (!value) return null;
  const ts = Date.parse(value);
  return isNaN(ts) ? null : ts;
}

export function daysAgo(n: number): number {
  const d = new Date();
  d.setDate(d.getDate() - n);
  d.setHours(0, 0, 0, 0);
  return d.getTime();
}
