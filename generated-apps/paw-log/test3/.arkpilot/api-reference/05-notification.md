# 05 -- 本地通知 (Notification)

## notificationManager.publish
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 发布/更新通知（支持 callback 和 Promise 两种模式） | notificationManager.publish | `import { notificationManager } from '@kit.NotificationKit';` | `publish(request: NotificationRequest, callback: AsyncCallback<void>): void` <br> `publish(request: NotificationRequest): Promise<void>` | `notificationManager.publish(request).then(() => {});` | `01_ohos.notificationManager (NotificationManager模块).md` |

## notificationManager.cancel
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 根据通知ID（及标签）取消已发布的通知 | notificationManager.cancel | `import { notificationManager } from '@kit.NotificationKit';` | `cancel(id: number, label?: string): Promise<void>` <br> `cancel(id: number, callback: AsyncCallback<void>): void` <br> `cancel(id: number, label: string, callback: AsyncCallback<void>): void` | `notificationManager.cancel(0).then(() => {});` | `01_ohos.notificationManager (NotificationManager模块).md` |

## notificationManager.cancelAll
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 取消当前应用所有已发布的通知 | notificationManager.cancelAll | `import { notificationManager } from '@kit.NotificationKit';` | `cancelAll(): Promise<void>` <br> `cancelAll(callback: AsyncCallback<void>): void` | `notificationManager.cancelAll().then(() => {});` | `01_ohos.notificationManager (NotificationManager模块).md` |

## notificationManager.requestEnableNotification
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 拉起通知授权弹窗，获取用户通知许可（API 10+，需 UIAbilityContext） | notificationManager.requestEnableNotification | `import { notificationManager } from '@kit.NotificationKit';` | `requestEnableNotification(context: UIAbilityContext): Promise<void>` <br> `requestEnableNotification(context: UIAbilityContext, callback: AsyncCallback<void>): void` | `notificationManager.requestEnableNotification(this.context).then(() => {});` | `01_ohos.notificationManager (NotificationManager模块).md` |

## NotificationRequest
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通知请求对象，包含内容、ID、渠道类型、按钮、角标等完整配置 | NotificationRequest | `notificationManager.NotificationRequest` (通过 `import { notificationManager } from '@kit.NotificationKit'`) | `type NotificationRequest = _NotificationRequest` <br> 关键字段：`content`（必填）, `id`, `notificationSlotType`, `actionButtons`, `wantAgent`, `badgeNumber`, `label`, `smallIcon`, `largeIcon`, `autoDeletedTime` | `let request: notificationManager.NotificationRequest = { id: 1, content: {...} };` | `05_notification/07_NotificationRequest.md` |

## NotificationContent
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通知内容的容器，通过 contentType + 具体内容子对象组合使用 | NotificationContent | `notificationManager.NotificationContent` | `type NotificationContent = _NotificationContent` <br> 字段：`notificationContentType` (ContentType), `normal` (NotificationBasicContent), `longText`, `multiLine`, `picture`, `systemLiveView` | `{ notificationContentType: ContentType.NOTIFICATION_CONTENT_BASIC_TEXT, normal: { title: "t", text: "t" } }` | `05_notification/03_NotificationContent.md` |

## NotificationBasicContent
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 普通文本通知内容，含标题、正文、附加文本 | NotificationBasicContent | `notificationManager.NotificationBasicContent` | `type NotificationBasicContent = _NotificationBasicContent` <br> 必填字段：`title` (string, <=1024B), `text` (string, <=3072B) <br> 可选字段：`additionalText` (string, <=3072B) | `{ title: "test_title", text: "test_text", additionalText: "test_additionalText" }` | `05_notification/03_NotificationContent.md` |

## NotificationActionButton
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通知中显示的操作按钮，含标题和点击 WantAgent | NotificationActionButton | `notificationManager.NotificationActionButton` | `type NotificationActionButton = _NotificationActionButton` <br> 必填：`title` (string, <=200B), `wantAgent` (WantAgent) <br> 可选：`userInput` (NotificationUserInput), `extras` | `{ title: "Reply", wantAgent: wantAgentObj, userInput: input }` | `05_notification/01_NotificationActionButton.md` |

## NotificationSlot
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通知渠道，定义通知的级别、振动、声音、角标等提醒行为 | NotificationSlot | `notificationManager.NotificationSlot` | `type NotificationSlot = _NotificationSlot` <br> 关键字段：`notificationType` (SlotType), `notificationLevel` (SlotLevel), `desc`, `badgeFlag`, `vibrationEnabled`, `sound`, `enabled` | 通过 `notificationManager.getSlot(SlotType.SOCIAL_COMMUNICATION)` 获取 | `05_notification/08_NotificationSlot.md` |

## notificationManager.enableNotificationSlot
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 未在当前文档中找到该 API | notificationManager.enableNotificationSlot | -- | -- | -- | -- |

## NotificationUserInput
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 保存用户输入的通知消息，配合 ActionButton 实现快捷回复 | NotificationUserInput | `notificationManager.NotificationUserInput` | `type NotificationUserInput = _NotificationUserInput` <br> 字段：`inputKey` (string, 必填) | `{ inputKey: "reply_key" }` | `05_notification/10_NotificationUserInput.md` |

## @ohos.notification
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 已停止维护的旧通知模块（API 7-11），已被 @ohos.notificationManager 替代 | @ohos.notification | `import { notification } from '@kit.NotificationKit';`（旧） | 从 API 11 开始废弃，建议使用 `@ohos.notificationManager` | -- | `06_已停止维护的接口/01_ohos.notification (Notification模块).md` |

## @ohos.notificationManager
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通知管理模块（API 9+），提供发布/取消/查询通知、管理渠道、授权等能力 | @ohos.notificationManager | `import { notificationManager } from '@kit.NotificationKit';` | 模块级导入路径 | `import { notificationManager } from '@kit.NotificationKit';` | `01_ohos.notificationManager (NotificationManager模块).md` |

## 模块说明

- `enableNotificationSlot` 未在当前版本文档中找到。通知渠道的启用/禁用通过 `NotificationSlot.enabled` 只读字段反映状态，创建渠道使用 `notificationManager.addSlot(type)`。
- 所有通知操作需先请求通知授权（`requestEnableNotification`），且需要 `SystemCapability.Notification.Notification` 系统能力。
- `@ohos.notification` 已废弃（API 11+），统一使用 `@ohos.notificationManager`。
- `NotificationRequest.actionButtons` 最多支持 2 个按钮（wearable 最多 3 个）。
- `NotificationBasicContent.title` 不超过 1024 字节，`text` 不超过 3072 字节，超长会被截断。
