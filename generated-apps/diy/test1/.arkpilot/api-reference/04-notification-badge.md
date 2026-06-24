# 04 -- 通知角标 (Notification Badge)

## notificationManager (模块)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通知管理模块导入 | notificationManager | `@kit.NotificationKit` | `import { notificationManager } from '@kit.NotificationKit';` | `import { notificationManager } from '@kit.NotificationKit';` | `01_ohos.notificationManager (NotificationManager模块).md` |

## notificationManager.setBadgeNumber (Promise)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 设定桌面图标角标个数（Promise 回调） | notificationManager.setBadgeNumber | `@kit.NotificationKit` | `setBadgeNumber(badgeNumber: number): Promise<void>` | `let badgeNumber: number = 10;\nnotificationManager.setBadgeNumber(badgeNumber).then(() => {\n  console.info(\`Succeeded in setting badge number.\`);\n}).catch((err: BusinessError) => {\n  console.error(\`Failed to set badge number. Code is ${err.code}, message is ${err.message}\`);\n});` | `01_ohos.notificationManager (NotificationManager模块).md` |

## notificationManager.setBadgeNumber (Callback)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 设定桌面图标角标个数（Callback 回调） | notificationManager.setBadgeNumber | `@kit.NotificationKit` | `setBadgeNumber(badgeNumber: number, callback: AsyncCallback<void>): void` | `let setBadgeNumberCallback = (err: BusinessError): void => {\n  if (err) {\n    console.error(\`Failed to set badge number. Code is ${err.code}, message is ${err.message}\`);\n  } else {\n    console.info(\`Succeeded in setting badge number.\`);\n  }\n}\nlet badgeNumber: number = 10;\nnotificationManager.setBadgeNumber(badgeNumber, setBadgeNumberCallback);` | `01_ohos.notificationManager (NotificationManager模块).md` |

## notificationManager.getBadgeNumber

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取当前应用角标数量（Promise 回调） | notificationManager.getBadgeNumber | `@kit.NotificationKit` | `getBadgeNumber(): Promise<number>` | `notificationManager.getBadgeNumber().then((badgeNumber: number) => {\n  console.info(\`Succeeded in getting badge number, badgeNumber is ${JSON.stringify(badgeNumber)}\`);\n}).catch((err: BusinessError) => {\n  console.error(\`Failed to get badge number. Code is ${err.code}, message is ${err.message}\`);\n});` | `01_ohos.notificationManager (NotificationManager模块).md` |

## notificationManager.NotificationRequest.badgeNumber

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通知请求对象上的角标数字属性（累加展示） | NotificationRequest.badgeNumber | `@kit.NotificationKit` | `badgeNumber: number` （可选，默认值 0） | `let notificationRequest: notificationManager.NotificationRequest = {\n  id: 1,\n  badgeNumber: 3,\n  content: {\n    notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,\n    normal: { title: "title", text: "text" }\n  }\n};` | `05_notification/07_NotificationRequest.md` |

## notificationManager.NotificationSlot.badgeFlag

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通知渠道是否显示角标 | NotificationSlot.badgeFlag | `@kit.NotificationKit` | `badgeFlag: boolean` （可选，默认值 true） | `let slot: notificationManager.NotificationSlot = {\n  notificationType: notificationManager.SlotType.SOCIAL_COMMUNICATION,\n  badgeFlag: true\n};` | `05_notification/08_NotificationSlot.md` |

## notificationManager.ContentType (枚举)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通知内容类型枚举，用于 NotificationContent | notificationManager.ContentType | `@kit.NotificationKit` | 枚举值：NOTIFICATION_CONTENT_BASIC_TEXT, NOTIFICATION_CONTENT_LONG_TEXT, NOTIFICATION_CONTENT_MULTILINE, NOTIFICATION_CONTENT_PICTURE, NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW | `notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT` | `01_ohos.notificationManager (NotificationManager模块).md` |

## notificationManager.publish

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 发布通知 | notificationManager.publish | `@kit.NotificationKit` | `publish(request: NotificationRequest): Promise<void>` | `notificationManager.publish(notificationRequest).then(() => {\n  console.info(\`Succeeded in publishing notification.\`);\n}).catch((err: BusinessError) => {\n  console.error(\`Failed to publish notification. Code is ${err.code}, message is ${err.message}\`);\n});` | `01_ohos.notificationManager (NotificationManager模块).md` |

## 模块说明

- `NotificationBadgeStyle` 在 Notification Kit 文档中不存在作为独立 API 或类型定义。角标样式通过 `badgeIconStyle` 属性控制，但该属性为"预留能力，暂未支持"。
- 角标数字设置有两条路径：
  1. 在发布通知时通过 `NotificationRequest.badgeNumber` 设置（API 9+，累加逻辑）。
  2. 直接调用 `notificationManager.setBadgeNumber()` 设置（API 10+，覆盖逻辑）。
- 当 `badgeNumber <= 0` 时清除角标，`> 99` 时显示 `99+`。
- 角标显示受 `NotificationSlot.badgeFlag` 控制，需要先创建或获取渠道并确认 `badgeFlag` 为 `true`（默认值）。
