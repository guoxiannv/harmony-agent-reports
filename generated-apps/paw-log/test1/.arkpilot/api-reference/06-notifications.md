# 06 — Notifications (本地通知)

## @ohos.notificationManager (notificationManager)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通知管理模块（发布/取消/渠道/状态） | notificationManager | `import { notificationManager } from '@kit.NotificationKit'` | — | `notificationManager.publish(req, cb)` | `06_应用服务/18_Notification Kit（用户通知服务）/01_ArkTS API/01_ohos.notificationManager (NotificationManager模块).md` |

## notificationManager.publish()

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 发布通知（Promise） | notificationManager.publish | `import { notificationManager } from '@kit.NotificationKit'` | `publish(request: NotificationRequest): Promise<void>` | `notificationManager.publish(req).then(...)` | `01_ohos.notificationManager (NotificationManager模块).md` |
| 发布通知（Callback） | notificationManager.publish | 同上 | `publish(request: NotificationRequest, callback: AsyncCallback<void>): void` | `notificationManager.publish(req, cb)` | 同上 |

## notificationManager.requestEnableNotification

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 拉起通知授权弹窗（需 UIAbilityContext） | notificationManager.requestEnableNotification | `import { notificationManager } from '@kit.NotificationKit'` | `requestEnableNotification(context: UIAbilityContext): Promise<void>` | `notificationManager.requestEnableNotification(this.context).then(...)` | `01_ohos.notificationManager (NotificationManager模块).md` |

## notificationManager.cancel()

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 按ID取消通知（Promise） | notificationManager.cancel | `import { notificationManager } from '@kit.NotificationKit'` | `cancel(id: number, label?: string): Promise<void>` | `notificationManager.cancel(0).then(...)` | `01_ohos.notificationManager (NotificationManager模块).md` |
| 按ID取消通知（Callback） | notificationManager.cancel | 同上 | `cancel(id: number, callback: AsyncCallback<void>): void` | `notificationManager.cancel(0, cb)` | 同上 |

## notificationManager.cancelAll()

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 取消当前应用所有通知（Promise） | notificationManager.cancelAll | `import { notificationManager } from '@kit.NotificationKit'` | `cancelAll(): Promise<void>` | `notificationManager.cancelAll().then(...)` | `01_ohos.notificationManager (NotificationManager模块).md` |
| 取消当前应用所有通知（Callback） | notificationManager.cancelAll | 同上 | `cancelAll(callback: AsyncCallback<void>): void` | `notificationManager.cancelAll(cb)` | 同上 |

## NotificationRequest

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通知请求（描述通知内容和配置） | NotificationRequest | `notificationManager.NotificationRequest`（通过 `@kit.NotificationKit`） | `type NotificationRequest = _NotificationRequest` | `let req: notificationManager.NotificationRequest = { id: 1, content: { notificationContentType: ..., normal: { title: "...", text: "..." } } }` | `05_notification/07_NotificationRequest.md` |

**关键字段**: `content`(必填), `id`, `wantAgent`(点击跳转), `notificationSlotType`, `actionButtons`, `badgeNumber`, `groupName`, `isAlertOnce`, `smallIcon`, `largeIcon`, `appMessageId`(去重), `sound`(自定义铃声), `deliveryTime`, `autoDeletedTime`

## NotificationBasicContent

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 普通文本通知内容 | NotificationBasicContent | `notificationManager.NotificationBasicContent` | `type NotificationBasicContent = _NotificationBasicContent` | `{ title: "标题", text: "正文", additionalText: "附加" }` | `05_notification/03_NotificationContent.md` |

**字段**: `title`(必填, <=1024B), `text`(必填, <=3072B), `additionalText`(可选, <=3072B), `lockscreenPicture`(可选)

## NotificationContent

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通知内容容器（选择内容类型） | NotificationContent | `notificationManager.NotificationContent` | `type NotificationContent = _NotificationContent` | `{ notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT, normal: { title: "t", text: "t" } }` | `05_notification/03_NotificationContent.md` |

**字段**: `notificationContentType` (ContentType枚举), `normal`, `longText`, `multiLine`, `picture`, `systemLiveView`

## NotificationSlot

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通知渠道（定义提醒方式） | NotificationSlot | `notificationManager.NotificationSlot` | `type NotificationSlot = _NotificationSlot` | — | `05_notification/08_NotificationSlot.md` |

**字段**: `notificationType`(SlotType), `notificationLevel`(SlotLevel), `desc`, `badgeFlag`, `bypassDnd`, `vibrationEnabled`, `sound`, `lightEnabled`, `enabled`

## notificationManager.addSlot()

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建通知渠道（Promise） | notificationManager.addSlot | `import { notificationManager } from '@kit.NotificationKit'` | `addSlot(type: SlotType): Promise<void>` | `notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then(...)` | `01_ohos.notificationManager (NotificationManager模块).md` |
| 创建通知渠道（Callback） | notificationManager.addSlot | 同上 | `addSlot(type: SlotType, callback: AsyncCallback<void>): void` | `notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION, cb)` | 同上 |

## SlotType

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通知渠道类型枚举 | SlotType | `notificationManager.SlotType` | 枚举 | `notificationManager.SlotType.SOCIAL_COMMUNICATION` | `01_ohos.notificationManager (NotificationManager模块).md` |

**值**: `UNKNOWN_TYPE(0)`, `SOCIAL_COMMUNICATION(1)`, `SERVICE_INFORMATION(2)`, `CONTENT_INFORMATION(3)`, `LIVE_VIEW(4)`, `CUSTOMER_SERVICE(5)`, `OTHER_TYPES(0xFFFF)`

## BundleInfo / NotificationSetting (notificationEnabled)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通知使能状态（位于 NotificationSetting 中） | NotificationSetting.notificationEnabled | `notificationManager.NotificationSetting` | `interface NotificationSetting { vibrationEnabled: boolean, soundEnabled: boolean, lockScreenEnabled?: boolean, bannerEnabled?: boolean, badgeNumberEnabled?: boolean, notificationEnabled?: boolean }` | `notificationManager.getNotificationSetting().then(setting => setting.notificationEnabled)` | `01_ohos.notificationManager (NotificationManager模块).md` |

## wantAgent (notification click)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 点击通知时拉起 Ability | WantAgent（NotificationRequest.wantAgent） | `notificationManager.NotificationRequest` 中 `wantAgent: WantAgent` | `import { wantAgent } from '@kit.AbilityKit'` | `wantAgent.getWantAgent({wants: [{bundleName: '...', abilityName: 'EntryAbility'}], actionType: wantAgent.OperationType.START_ABILITY, requestCode: 0})` | NotificationRequest 字段；wantAgent 在 `02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/03_通用能力的接口(推荐)/15_ohos.app.ability.wantAgent (WantAgent模块).md` |

## @ohos.wantAgent

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| WantAgent 创建/触发模块 | wantAgent | `import { wantAgent } from '@kit.AbilityKit'` | `getWantAgent(info: WantAgentInfo): Promise<WantAgent>` | `wantAgent.getWantAgent({wants: [...], actionType: wantAgent.OperationType.START_ABILITY, requestCode: 0})` | `15_ohos.app.ability.wantAgent (WantAgent模块).md` |

**关键**: 推荐使用 `@kit.AbilityKit` 导入；`OperationType.START_ABILITY` 用于通知点击跳转；`WantAgentInfo.wants` 数组只取第一个成员。

## 模块说明

- **`requestPermission()` 不存在**: Notification Kit 中没有名为 `requestPermission` 的 API。权限申请使用 `notificationManager.requestEnableNotification(context: UIAbilityContext)` 拉起通知授权弹窗。如需检查状态，使用 `isNotificationEnabled()` 或 `isNotificationEnabledSync()`。
- **`BundleInfo` 无 `notificationEnabled` 字段**: 通知使能状态位于 `NotificationSetting.notificationEnabled`，通过 `notificationManager.getNotificationSetting()` 获取。
- **最低 API 版本**: 模块首批接口从 API version 9 开始支持；`requestEnableNotification` 带 context 参数从 API 10 开始；`SlotType` 和 `ContentType` 从 API 12 支持元服务。
