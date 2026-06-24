# 06 -- Notification & Reminder

## notificationManager
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 发布通知（Promise） | notificationManager.publish | import { notificationManager } from '@kit.NotificationKit' | publish(request: NotificationRequest): Promise<void> | notificationManager.publish(notificationRequest).then(() => { console.info('publish success'); }) | 06_应用服务/18_Notification Kit/01_ArkTS API/01_ohos.notificationManager.md |
| 发布通知（Callback） | notificationManager.publish | import { notificationManager } from '@kit.NotificationKit' | publish(request: NotificationRequest, callback: AsyncCallback<void>): void | notificationManager.publish(notificationRequest, publishCallback) | 06_应用服务/18_Notification Kit/01_ArkTS API/01_ohos.notificationManager.md |
| 取消通知（Promise） | notificationManager.cancel | import { notificationManager } from '@kit.NotificationKit' | cancel(id: number, label?: string): Promise<void> | notificationManager.cancel(0).then(...) | 06_应用服务/18_Notification Kit/01_ArkTS API/01_ohos.notificationManager.md |
| 取消所有通知 | notificationManager.cancelAll | import { notificationManager } from '@kit.NotificationKit' | cancelAll(): Promise<void> | notificationManager.cancelAll().then(...) | 06_应用服务/18_Notification Kit/01_ArkTS API/01_ohos.notificationManager.md |
| 创建通知渠道 | notificationManager.addSlot | import { notificationManager } from '@kit.NotificationKit' | addSlot(type: SlotType): Promise<void> | notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION) | 06_应用服务/18_Notification Kit/01_ArkTS API/01_ohos.notificationManager.md |
| 查询通知使能 | notificationManager.isNotificationEnabled | import { notificationManager } from '@kit.NotificationKit' | isNotificationEnabled(): Promise<boolean> | notificationManager.isNotificationEnabled().then((data: boolean) => { ... }) | 06_应用服务/18_Notification Kit/01_ArkTS API/01_ohos.notificationManager.md |
| 请求通知授权（拉起弹窗） | notificationManager.requestEnableNotification | import { notificationManager } from '@kit.NotificationKit' | requestEnableNotification(context: UIAbilityContext): Promise<void> | notificationManager.requestEnableNotification(this.context).then(...) | 06_应用服务/18_Notification Kit/01_ArkTS API/01_ohos.notificationManager.md |
| 获取通知中wantAgent的部分信息 | notificationManager.getNotificationParameters | import { notificationManager } from '@kit.NotificationKit' | getNotificationParameters(id: number, label?: string): Promise<NotificationParameters> | notificationManager.getNotificationParameters(id, label).then(...) | 06_应用服务/18_Notification Kit/01_ArkTS API/01_ohos.notificationManager.md |
| 设置角标 | notificationManager.setBadgeNumber | import { notificationManager } from '@kit.NotificationKit' | setBadgeNumber(badgeNumber: number): Promise<void> | notificationManager.setBadgeNumber(10).then(...) | 06_应用服务/18_Notification Kit/01_ArkTS API/01_ohos.notificationManager.md |
| 获取未删除通知数 | notificationManager.getActiveNotificationCount | import { notificationManager } from '@kit.NotificationKit' | getActiveNotificationCount(): Promise<number> | notificationManager.getActiveNotificationCount().then(...) | 06_应用服务/18_Notification Kit/01_ArkTS API/01_ohos.notificationManager.md |
| 获取未删除通知列表 | notificationManager.getActiveNotifications | import { notificationManager } from '@kit.NotificationKit' | getActiveNotifications(): Promise<Array<NotificationRequest>> | notificationManager.getActiveNotifications().then(...) | 06_应用服务/18_Notification Kit/01_ArkTS API/01_ohos.notificationManager.md |

## notificationManager.publish (原 notification.request/publish)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 发布通知（旧模块，已废弃） | Notification.publish | import Notification from '@ohos.notification'（已废弃） | publish(request: NotificationRequest, callback: AsyncCallback<void>): void | Notification.publish(notificationRequest, publishCallback) | 06_应用服务/18_Notification Kit/01_ArkTS API/06_已停止维护的接口/01_ohos.notification.md |
| 发布通知（推荐模块） | notificationManager.publish | import { notificationManager } from '@kit.NotificationKit' | publish(request: NotificationRequest): Promise<void> | notificationManager.publish(notificationRequest).then(...) | 06_应用服务/18_Notification Kit/01_ArkTS API/01_ohos.notificationManager.md |

## WantAgent (notificationWant/Agent)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建WantAgent | wantAgent.getWantAgent | import { wantAgent } from '@kit.AbilityKit' | getWantAgent(info: WantAgentInfo): Promise<WantAgent> | wantAgent.getWantAgent(wantAgentInfo).then((data) => { wantAgentData = data }) | 02_应用框架/01_Ability Kit/01_ArkTS API/03_通用能力的接口(推荐)/15_ohos.app.ability.wantAgent.md |
| 触发WantAgent | wantAgent.trigger | import { wantAgent } from '@kit.AbilityKit' | trigger(agent: WantAgent, triggerInfo: TriggerInfo, callback?: AsyncCallback<CompleteData>): void | wantAgent.trigger(wantAgentData, triggerInfo, triggerCallback) | 02_应用框架/01_Ability Kit/01_ArkTS API/03_通用能力的接口(推荐)/15_ohos.app.ability.wantAgent.md |
| 取消WantAgent | wantAgent.cancel | import { wantAgent } from '@kit.AbilityKit' | cancel(agent: WantAgent): Promise<void> | wantAgent.cancel(wantAgentData).then(...) | 02_应用框架/01_Ability Kit/01_ArkTS API/03_通用能力的接口(推荐)/15_ohos.app.ability.wantAgent.md |
| 获取包名 | wantAgent.getBundleName | import { wantAgent } from '@kit.AbilityKit' | getBundleName(agent: WantAgent): Promise<string> | wantAgent.getBundleName(wantAgentData).then(...) | 02_应用框架/01_Ability Kit/01_ArkTS API/03_通用能力的接口(推荐)/15_ohos.app.ability.wantAgent.md |
| 判断相等 | wantAgent.equal | import { wantAgent } from '@kit.AbilityKit' | equal(agent: WantAgent, otherAgent: WantAgent): Promise<boolean> | wantAgent.equal(wantAgent1, wantAgent2).then(...) | 02_应用框架/01_Ability Kit/01_ArkTS API/03_通用能力的接口(推荐)/15_ohos.app.ability.wantAgent.md |
| 获取操作类型 | wantAgent.getOperationType | import { wantAgent } from '@kit.AbilityKit' | getOperationType(agent: WantAgent): Promise<OperationType> | wantAgent.getOperationType(wantAgentData).then(...) | 02_应用框架/01_Ability Kit/01_ArkTS API/03_通用能力的接口(推荐)/15_ohos.app.ability.wantAgent.md |

## Want
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 信息传递载体 | Want | import { Want } from '@kit.AbilityKit' | interface Want { deviceId?: string; bundleName?: string; moduleName?: string; abilityName?: string; action?: string; entities?: Array<string>; uri?: string; type?: string; parameters?: Record<string, Object>; flags?: number } | let want: Want = { bundleName: 'com.example.myapplication', abilityName: 'EntryAbility' } | 02_应用框架/01_Ability Kit/01_ArkTS API/03_通用能力的接口(推荐)/14_ohos.app.ability.Want.md |

## reminderAgentManager (后台代理提醒)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 发布代理提醒（Promise） | reminderAgentManager.publishReminder | import { reminderAgentManager } from '@kit.BackgroundTasksKit' | publishReminder(reminderReq: ReminderRequest): Promise<number> | reminderAgentManager.publishReminder(timer).then((reminderId) => { ... }) | 02_应用框架/07_Background Tasks Kit/01_ArkTS API/01_ohos.reminderAgentManager.md |
| 取消代理提醒 | reminderAgentManager.cancelReminder | import { reminderAgentManager } from '@kit.BackgroundTasksKit' | cancelReminder(reminderId: number): Promise<void> | reminderAgentManager.cancelReminder(reminderId).then(...) | 02_应用框架/07_Background Tasks Kit/01_ArkTS API/01_ohos.reminderAgentManager.md |
| 获取有效提醒 | reminderAgentManager.getValidReminders | import { reminderAgentManager } from '@kit.BackgroundTasksKit' | getValidReminders(): Promise<Array<ReminderRequest>> | reminderAgentManager.getValidReminders().then((reminders) => { ... }) | 02_应用框架/07_Background Tasks Kit/01_ArkTS API/01_ohos.reminderAgentManager.md |
| 发布倒计时提醒 | ReminderRequestTimer | import { reminderAgentManager } from '@kit.BackgroundTasksKit' | interface ReminderRequestTimer extends ReminderRequest { reminderType: ReminderType.REMINDER_TYPE_TIMER; triggerTimeInSeconds: number } | let timer: reminderAgentManager.ReminderRequestTimer = { reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_TIMER, triggerTimeInSeconds: 10 } | 02_应用框架/07_Background Tasks Kit/01_ArkTS API/01_ohos.reminderAgentManager.md |
| 发布日历提醒 | ReminderRequestCalendar | import { reminderAgentManager } from '@kit.BackgroundTasksKit' | interface ReminderRequestCalendar extends ReminderRequest { reminderType: ReminderType.REMINDER_TYPE_CALENDAR; dateTime: ReminderDateTime; repeatMonths?: Array<number>; repeatDays?: Array<number> } | 见官方文档 | 02_应用框架/07_Background Tasks Kit/01_ArkTS API/01_ohos.reminderAgentManager.md |
| 发布闹钟提醒 | ReminderRequestAlarm | import { reminderAgentManager } from '@kit.BackgroundTasksKit' | interface ReminderRequestAlarm extends ReminderRequest { reminderType: ReminderType.REMINDER_TYPE_ALARM; hour: number; minute: number; daysOfWeek?: Array<number> } | 见官方文档 | 02_应用框架/07_Background Tasks Kit/01_ArkTS API/01_ohos.reminderAgentManager.md |
| 修改提醒 | reminderAgentManager.updateReminder | import { reminderAgentManager } from '@kit.BackgroundTasksKit' | updateReminder(reminderId: number, reminderReq: ReminderRequest): Promise<void> | reminderAgentManager.updateReminder(reminderId, timer).then(...) | 02_应用框架/07_Background Tasks Kit/01_ArkTS API/01_ohos.reminderAgentManager.md |

## Module Notes

- `notificationManager` (API 9+) is the recommended module. The old `@ohos.notification` module was deprecated at API 9; do not use it in new code. Use `import { notificationManager } from '@kit.NotificationKit'`.
- `notification.request/publish` in the API list refers to the old `Notification.publish()` from the deprecated `@ohos.notification` module. The modern equivalent is `notificationManager.publish()`.
- `notificationWant` (Agent) is the `WantAgent` used in notification click actions. Import from `@kit.AbilityKit` as `wantAgent`. Create via `wantAgent.getWantAgent()`, set on `NotificationRequest.wantAgent`.
- `reminderAgent` (reminder notification) has been renamed to `reminderAgentManager` since API 9. The old `@ohos.reminderAgent` module is deprecated. Use `import { reminderAgentManager } from '@kit.BackgroundTasksKit'`.
- Reminder publishing requires the `ohos.permission.PUBLISH_AGENT_REMINDER` permission and notification to be enabled via `notificationManager.requestEnableNotification()` first.
- The Want interface limits data to 200KB (API 23+) or 100KB (API 22 and before) due to IPC constraints.
