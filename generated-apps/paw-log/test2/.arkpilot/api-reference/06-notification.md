# 06 — Notification Kit

## @ohos.notificationManager (NotificationManager模块)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通知管理器模块，提供发布、更新、取消通知，创建/获取/移除通知渠道，查询通知使能状态等能力 | notificationManager | import { notificationManager } from '@kit.NotificationKit' | 模块对象，无构造函数 | import { notificationManager } from '@kit.NotificationKit'; | 06_应用服务/18_Notification Kit/01_ArkTS API/01_ohos.notificationManager (NotificationManager模块).md |

## notificationManager.publish
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 发布或更新通知（相同ID+标签则替换） | notificationManager.publish | @kit.NotificationKit | publish(request: NotificationRequest): Promise\<void\>; publish(request: NotificationRequest, callback: AsyncCallback\<void\>): void | notificationManager.publish(notificationRequest).then(() => { console.info('Succeeded'); }); | 06_应用服务/18_Notification Kit/01_ArkTS API/01_ohos.notificationManager (NotificationManager模块).md |

## NotificationRequest
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 描述通知的请求对象，包含内容、ID、渠道类型、按钮、角标、自定义铃声等 | NotificationRequest | type NotificationRequest = _NotificationRequest 来自 @kit.NotificationKit | content: NotificationContent (必填), id?: number, notificationSlotType?: SlotType, wantAgent?: WantAgent, actionButtons?: NotificationActionButton[], badgeNumber?: number, sound?: string, appMessageId?: string, autoDeletedTime?: number, groupName?: string | let req: notificationManager.NotificationRequest = { id: 1, content: { notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT, normal: { title: 'title', text: 'text' } } }; | 06_应用服务/18_Notification Kit/01_ArkTS API/05_notification/07_NotificationRequest.md |

## NotificationSlot
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通知渠道，控制通知的提醒方式（级别、振动、铃声、角标等） | NotificationSlot | type NotificationSlot = _NotificationSlot 来自 @kit.NotificationKit | notificationType?: SlotType, notificationLevel?: SlotLevel, desc?: string, badgeFlag?: boolean, vibrationEnabled?: boolean, sound?: string, enabled?: boolean | 通过 addSlot(type) 创建；通过 getSlot(slotType) 查询 | 06_应用服务/18_Notification Kit/01_ArkTS API/05_notification/08_NotificationSlot.md |

## NotificationContent
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通知内容的联合类型，支持普通文本、长文本、多行文本、图片、实况窗 | NotificationContent | type NotificationContent = _NotificationContent 来自 @kit.NotificationKit | notificationContentType: ContentType, normal?: NotificationBasicContent, longText?: NotificationLongTextContent, multiLine?: NotificationMultiLineContent, picture?: NotificationPictureContent, systemLiveView?: NotificationSystemLiveViewContent | { notificationContentType: ContentType.NOTIFICATION_CONTENT_BASIC_TEXT, normal: { title: 'test', text: 'test' } } | 06_应用服务/18_Notification Kit/01_ArkTS API/05_notification/03_NotificationContent.md |

## notificationManager.requestEnableNotification
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 拉起通知授权弹窗获取用户通知授权（Stage模型，需在loadContent成功后调用） | notificationManager.requestEnableNotification | @kit.NotificationKit | requestEnableNotification(context: UIAbilityContext): Promise\<void\>; requestEnableNotification(context: UIAbilityContext, callback: AsyncCallback\<void\>): void | notificationManager.requestEnableNotification(this.context).then(() => { ... }); | 06_应用服务/18_Notification Kit/01_ArkTS API/01_ohos.notificationManager (NotificationManager模块).md |

## notificationManager.setSlot
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 未找到该API | notificationManager.setSlot | — | — | — | — |

## 模块说明
- `setSlot` 不是 Notification Kit 的真实 API。通知渠道管理通过 `addSlot(type)`、`getSlot(slotType)`、`removeSlot(slotType)`、`removeAllSlots()` 完成，不支持直接 "set" 一个 Slot 对象。
- `requestEnableNotification` 从 API 12 起需要使用 `UIAbilityContext` 参数（旧版无参重载已废弃）。仅首次调用会拉起弹窗，拒绝后需通过 `openNotificationSettings` 或 `openNotificationSettingsWithResult` 二次引导。
- `publish` 的错误码 1600004 表示通知被全局禁用，1600005 表示通知渠道被禁用。
- 通知去重：通过 `NotificationRequest.appMessageId` 实现 24 小时内静默去重。
- `onlyIn` 标记：Wearable 不支持 `setBadgeNumber`（返回 801）。`isDistributedEnabled` 在 Wearable/TV 始终返回 false。
