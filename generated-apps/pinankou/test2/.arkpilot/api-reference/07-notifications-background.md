# 07 — 通知与后台任务 Notifications Background

## notificationManager
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 发布通知 | notificationManager.publish | `import { notificationManager } from '@kit.NotificationKit';` | `publish(request: NotificationRequest, callback: AsyncCallback<void>): void` | `notificationManager.publish(notificationRequest, publishCallback);` | `06_应用服务/18_Notification Kit/01_ArkTS API/01_ohos.notificationManager (NotificationManager模块).md` |
| 取消通知 (按ID+label) | notificationManager.cancel | 同上 | `cancel(id: number, label: string, callback: AsyncCallback<void>): void` | `notificationManager.cancel(0, "label", cancelCallback);` | 同上 |
| 取消所有通知 | notificationManager.cancelAll | 同上 | `cancelAll(callback: AsyncCallback<void>): void` | `notificationManager.cancelAll(cancelAllCallback);` | 同上 |
| 创建通知渠道 | notificationManager.addSlot | 同上 | `addSlot(type: SlotType, callback: AsyncCallback<void>): void` | `notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION, addSlotCallBack);` | 同上 |
| 获取通知渠道 | notificationManager.getSlot | 同上 | `getSlot(slotType: SlotType, callback: AsyncCallback<NotificationSlot>): void` | `notificationManager.getSlot(slotType, getSlotCallback);` | 同上 |
| 获取所有通知渠道 | notificationManager.getSlots | 同上 | `getSlots(callback: AsyncCallback<Array<NotificationSlot>>): void` | `notificationManager.getSlots(getSlotsCallback);` | 同上 |
| 请求通知权限 | notificationManager.requestEnableNotification | 同上 | `requestEnableNotification(context: UIAbilityContext, callback: AsyncCallback<void>): void` | `notificationManager.requestEnableNotification(this.context, requestEnableNotificationCallback);` | 同上 |

## notificationWantAgent
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建 WantAgent (用于通知点击跳转) | wantAgent.getWantAgent | `import { wantAgent } from '@kit.AbilityKit';` | `getWantAgent(info: WantAgentInfo, callback: AsyncCallback<WantAgent>): void` | `wantAgent.getWantAgent(wantAgentInfo, getWantAgentCallback);` | `02_应用框架/01_Ability Kit/01_ArkTS API/03_通用能力的接口(推荐)/14_ohos.app.ability.wantAgent (WantAgent模块).md` |
| 触发 WantAgent | wantAgent.trigger | 同上 | `trigger(agent: WantAgent, triggerInfo: TriggerInfo, callback?: AsyncCallback<CompleteData>): void` | `wantAgent.trigger(wantAgentData, triggerInfo, triggerCallback);` | 同上 |
| 在 NotificationRequest 中使用 wantAgent | notificationRequest.wantAgent | (NotificationRequest 字段) | `wantAgent: WantAgent` | 在 NotificationRequest 中设置 wantAgent 字段，点击通知时触发跳转 | `06_应用服务/18_Notification Kit/01_ArkTS API/05_notification/07_NotificationRequest.md` |

## notificationContent
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通知内容类型定义 | NotificationContent | `import { notificationManager } from '@kit.NotificationKit';` (通过 notificationManager.NotificationRequest 使用) | 包含 contentType / notificationContentType、normal、longText、multiLine、picture、systemLiveView 等字段 | `{ notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT, normal: { title: "title", text: "text" } }` | `06_应用服务/18_Notification Kit/01_ArkTS API/05_notification/03_NotificationContent.md` |
| 普通文本内容 | NotificationBasicContent | 同上 (inherited) | `{ title: string, text: string, additionalText?: string }` | `{ title: "test_title", text: "test_text" }` | 同上 |
| 长文本内容 | NotificationLongTextContent | 同上 | `{ longText: string, briefText: string, expandedTitle: string }` | `{ longText: "...", briefText: "...", expandedTitle: "..." }` | 同上 |
| 多行内容 | NotificationMultiLineContent | 同上 | `{ briefText: string, longTitle: string, lines: Array<string> }` | lines 最多三行 | 同上 |

## notificationSlot
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通知渠道定义 | NotificationSlot | `import { notificationManager } from '@kit.NotificationKit';` (类型引用) | 字段: notificationType, level/notificationLevel, desc, badgeFlag, bypassDnd, vibrationEnabled, sound, lightEnabled, enabled | 与 addSlot 配合使用创建通知渠道 | `06_应用服务/18_Notification Kit/01_ArkTS API/05_notification/08_NotificationSlot.md` |

## workScheduler
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 申请延迟任务 | workScheduler.startWork | `import { workScheduler } from '@kit.BackgroundTasksKit';` | `startWork(work: WorkInfo): void` | `workScheduler.startWork(workInfo);` | `02_应用框架/07_Background Tasks Kit/01_ArkTS API/03_ohos.resourceschedule.workScheduler (延迟任务调度).md` |
| 停止延迟任务 | workScheduler.stopWork | 同上 | `stopWork(work: WorkInfo, needCancel?: boolean): void` | `workScheduler.stopWork(workInfo, false);` | 同上 |
| 获取任务状态 | workScheduler.getWorkStatus | 同上 | `getWorkStatus(workId: number, callback: AsyncCallback<WorkInfo>): void` | `workScheduler.getWorkStatus(50, (error, res) => {});` | 同上 |
| 获取所有任务 | workScheduler.obtainAllWorks | 同上 | `obtainAllWorks(): Promise<Array<WorkInfo>>` | `workScheduler.obtainAllWorks().then((res) => {});` | 同上 |

## workScheduler (WorkInfo)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 延迟任务配置信息 | WorkInfo | `import { workScheduler } from '@kit.BackgroundTasksKit';` | 字段: workId, bundleName, abilityName, networkType, isCharging, chargerType, batteryLevel, batteryStatus, storageRequest, isRepeat, repeatCycleTime, repeatCount, isPersisted, isDeepIdle, idleWaitTime, parameters, earliestStartTime | `let workInfo: workScheduler.WorkInfo = { workId: 1, batteryStatus: workScheduler.BatteryStatus.BATTERY_STATUS_LOW, isRepeat: false, isPersisted: true, bundleName: "com.example.myapplication", abilityName: "MyExtension" }` | 同上 |

## backgroundTaskManager
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 申请短时任务 | backgroundTaskManager.requestSuspendDelay | `import { backgroundTaskManager } from '@kit.BackgroundTasksKit';` | `requestSuspendDelay(reason: string, callback: Callback<void>): DelaySuspendInfo` | `let delayInfo = backgroundTaskManager.requestSuspendDelay(myReason, () => {});` | `02_应用框架/07_Background Tasks Kit/01_ArkTS API/02_ohos.resourceschedule.backgroundTaskManager (后台任务管理).md` |
| 获取短时任务剩余时间 | backgroundTaskManager.getRemainingDelayTime | 同上 | `getRemainingDelayTime(requestId: number): Promise<number>` | `backgroundTaskManager.getRemainingDelayTime(id).then((res) => {});` | 同上 |
| 取消短时任务 | backgroundTaskManager.cancelSuspendDelay | 同上 | `cancelSuspendDelay(requestId: number): void` | `backgroundTaskManager.cancelSuspendDelay(id);` | 同上 |
| 申请长时任务 | backgroundTaskManager.startBackgroundRunning | 同上 | `startBackgroundRunning(context: Context, bgMode: BackgroundMode, wantAgent: WantAgent, callback: AsyncCallback<void>): void` | `backgroundTaskManager.startBackgroundRunning(context, bgMode, wantAgent, callback);` | 同上 |
| 获取短时任务信息 | backgroundTaskManager.getTransientTaskInfo | 同上 | `getTransientTaskInfo(): Promise<TransientTaskInfo>` | `backgroundTaskManager.getTransientTaskInfo().then((res) => {});` | 同上 |

## delaySuspend
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 短时任务信息返回值 | DelaySuspendInfo | backgroundTaskManager 返回值类型 | 字段: requestId: number, actualDelayTime: number | 通过 requestSuspendDelay 返回: `let id = delayInfo.requestId; let time = delayInfo.actualDelayTime;` | `02_应用框架/07_Background Tasks Kit/01_ArkTS API/02_ohos.resourceschedule.backgroundTaskManager (后台任务管理).md` |

## reminderAgent (reminder)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 发布代理提醒 | reminderAgentManager.publishReminder | `import { reminderAgentManager } from '@kit.BackgroundTasksKit';` | `publishReminder(reminderReq: ReminderRequest, callback: AsyncCallback<number>): void` | `reminderAgentManager.publishReminder(timer, (err, reminderId) => {});` | `02_应用框架/07_Background Tasks Kit/01_ArkTS API/01_ohos.reminderAgentManager (后台代理提醒).md` |
| 取消代理提醒 | reminderAgentManager.cancelReminder | 同上 | `cancelReminder(reminderId: number, callback: AsyncCallback<void>): void` | `reminderAgentManager.cancelReminder(reminderId, (err) => {});` | 同上 |
| 获取所有有效提醒 | reminderAgentManager.getValidReminders | 同上 | `getValidReminders(callback: AsyncCallback<Array<ReminderRequest>>): void` | `reminderAgentManager.getValidReminders((err, reminders) => {});` | 同上 |
| 取消所有提醒 | reminderAgentManager.cancelAllReminders | 同上 | `cancelAllReminders(callback: AsyncCallback<void>): void` | `reminderAgentManager.cancelAllReminders((err) => {});` | 同上 |

## Module Notes

- **notificationWantAgent**: 并非独立模块 API，实质是 `WantAgent` 在 Notification 场景下的使用。WantAgent 的导入路径为 `import { wantAgent } from '@kit.AbilityKit'`，在 `NotificationRequest.wantAgent` 字段中设置。
- **delaySuspend**: 并非独立 API，而是 `backgroundTaskManager.requestSuspendDelay()` 的返回值类型 `DelaySuspendInfo`，包含 `requestId` 和 `actualDelayTime` 字段。
- **reminderAgent**: 文档中的实际模块名为 `reminderAgentManager`（`@ohos.reminderAgentManager`），API 调用时使用 `reminderAgentManager.publishReminder` 等。
- 短时任务 `requestSuspendDelay` 申请时间最长为 3 分钟，低电量时最长为 1 分钟。
- `workScheduler.startWork` 至少设置一个触发条件（网络、充电、存储、电池状态等），循环任务执行间隔至少 2 小时。
