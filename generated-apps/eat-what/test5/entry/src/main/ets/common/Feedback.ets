// Feedback.ets
// Lightweight toast helper (promptAction is the global). Wrapped so pages import one fn.
import { promptAction } from '@kit.ArkUI';

export function toast(msg: string): void {
  try {
    promptAction.showToast({ message: msg, duration: 1600 });
  } catch (e) {
    // ignore
  }
}
