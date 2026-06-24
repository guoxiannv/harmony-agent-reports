// IdGen.ets
//
// 轻量唯一 ID 生成器。ArkTS strict-safe，不依赖 Math.random 的任意位。
// 使用时间戳 + 自增计数器 + 域前缀，保证单进程内唯一。

let counter: number = 0;

function nextCounter(): number {
  counter = (counter + 1) % 1000000;
  return counter;
}

export function genId(prefix: string): string {
  // Date.now() 在运行时可用；构建期静态检查不会执行此函数。
  const ts: number = Date.now();
  return `${prefix}-${ts}-${nextCounter()}`;
}

export function newRecordId(): string {
  return genId('rec');
}

export function newHazardId(): string {
  return genId('hzd');
}

export function newPatrolPointId(): string {
  return genId('ptp');
}

export function newPatrolCheckinId(): string {
  return genId('ptc');
}

export function newContactId(): string {
  return genId('ctc');
}

export function newCorrectionId(): string {
  return genId('cor');
}
