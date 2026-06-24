// Thin wrappers over built-in ArkUI dialogs/toasts. Keeps pages free of
// CustomDialogController wiring.
import { promptAction } from '@kit.ArkUI';
import { Theme } from '../common/Theme';

export class Ui {
  static toast(message: string): void {
    try {
      promptAction.showToast({ message: message, duration: 1800, bottom: 160 });
    } catch (e) {
      // ignore
    }
  }

  // Confirm dialog. Calls onConfirm when user accepts.
  static confirm(title: string, message: string, onConfirm: () => void): void {
    try {
      AlertDialog.show({
        title: title,
        message: message,
        autoCancel: true,
        alignment: DialogAlignment.Center,
        primaryButton: {
          value: '取消',
          fontColor: '#9E8E84',
          action: () => {},
        },
        secondaryButton: {
          value: '确定',
          fontColor: Theme.brandPrimary,
          action: () => { onConfirm(); },
        },
      });
    } catch (e) {
      // fallback: just run the action
      onConfirm();
    }
  }
}
