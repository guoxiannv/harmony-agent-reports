let counter: number = 0

export function uuid(): string {
  counter++
  return `${Date.now().toString(36)}-${counter.toString(36)}-${Math.floor(Math.random() * 1000000).toString(36)}`
}
