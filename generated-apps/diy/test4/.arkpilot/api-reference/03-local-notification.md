# 03 -- Local Notifications (Reminders)

## @ohos.notificationManager (NotificationManager)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| NotificationManager 模块导入，提供通知管理能力（发布、更新、取消通知等） | `notificationManager` | `import { notificationManager } from '@kit.NotificationKit';` | 模块导入语句 | `import { notificationManager } from '@kit.NotificationKit';` | `06_应用服务/18_Notification Kit（用户通知服务）/01_ArkTS API/01_ohos.notificationManager (NotificationManager模块).md` |

## notificationManager.publish (发布通知)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 发布通知（Promise 方式） | `notificationManager.publish` | `import { notificationManager } from '@kit.NotificationKit';` | `publish(request: NotificationRequest): Promise<void>` | 见下方示例 | `06_应用服务/18_Notification Kit（用户通知服务）/01_ArkTS API/01_ohos.notificationManager (NotificationManager模块).md` |
| 发布通知（Callback 方式） | `notificationManager.publish` | `import { notificationManager } from '@kit.NotificationKit';` | `publish(request: NotificationRequest, callback: AsyncCallback<void>): void` | 见下方示例 | `06_应用服务/18_Notification Kit（用户通知服务）/01_ArkTS API/01_ohos.notificationManager (NotificationManager模块).md` |

```ts
// Promise 方式
import { notificationManager } from '@kit.NotificationKit';
import { BusinessError } from '@kit.BasicServicesKit';

let notificationRequest: notificationManager.NotificationRequest = {
  id: 1,
  content: {
    notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
    normal: {
      title: "test_title",
      text: "test_text",
      additionalText: "test_additionalText"
    }
  }
};
notificationManager.publish(notificationRequest).then(() => {
  console.info(`Succeeded in publishing notification.`);
}).catch((err: BusinessError) => {
  console.error(`Failed to publish notification. Code is ${err.code}, message is ${err.message}`);
});
```

## notificationManager.requestEnableNotification (请求通知权限)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 拉起通知授权弹窗，请求用户允许发送通知（Promise 方式，API 10+） | `notificationManager.requestEnableNotification` | `import { notificationManager } from '@kit.NotificationKit';` | `requestEnableNotification(context: UIAbilityContext): Promise<void>` | 见下方示例 | `06_应用服务/18_Notification Kit（用户通知服务）/01_ArkTS API/01_ohos.notificationManager (NotificationManager模块).md` |
| 拉起通知授权弹窗，请求用户允许发送通知（Callback 方式，API 10+） | `notificationManager.requestEnableNotification` | `import { notificationManager } from '@kit.NotificationKit';` | `requestEnableNotification(context: UIAbilityContext, callback: AsyncCallback<void>): void` | 见下方示例 | `06_应用服务/18_Notification Kit（用户通知服务）/01_ArkTS API/01_ohos.notificationManager (NotificationManager模块).md` |

- 仅当应用界面加载完成后（即调用 `loadContent` 成功）方可使用。
- 如果用户拒绝授权，无法再次拉起弹窗，需使用 `openNotificationSettingsWithResult` 二次申请授权。
- 须在 Stage 模型下使用。

```ts
import { notificationManager } from '@kit.NotificationKit';
import { UIAbility } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

class MyAbility extends UIAbility {
  onWindowStageCreate(windowStage: window.WindowStage) {
    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) { return; }
      notificationManager.requestEnableNotification(this.context).then(() => {
        console.info(`requestEnableNotification success`);
      }).catch((err: BusinessError) => {
        console.error(`requestEnableNotification failed, code: ${err.code}`);
      });
    });
  }
}
```

## notificationManager.cancel (取消通知)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 根据通知 ID 取消通知（Promise 方式，label 可选） | `notificationManager.cancel` | `import { notificationManager } from '@kit.NotificationKit';` | `cancel(id: number, label?: string): Promise<void>` | `notificationManager.cancel(0).then(() => { ... });` | `06_应用服务/18_Notification Kit（用户通知服务）/01_ArkTS API/01_ohos.notificationManager (NotificationManager模块).md` |
| 取消当前应用所有已发布通知（Promise 方式） | `notificationManager.cancelAll` | `import { notificationManager } from '@kit.NotificationKit';` | `cancelAll(): Promise<void>` | `notificationManager.cancelAll().then(() => { ... });` | `06_应用服务/18_Notification Kit（用户通知服务）/01_ArkTS API/01_ohos.notificationManager (NotificationManager模块).md` |

## NotificationRequest (通知请求对象)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 描述通知请求的内容和配置信息 | `notificationManager.NotificationRequest` | `import { notificationManager } from '@kit.NotificationKit';` | 对象类型，通过 `notificationManager.NotificationRequest` 引用 | 见下方示例 | `06_应用服务/18_Notification Kit（用户通知服务）/01_ArkTS API/05_notification/07_NotificationRequest.md` |

**关键字段**（非只读）：`content`（必填，通知内容）、`id`（通知 ID）、`notificationSlotType`（通知渠道类型）、`wantAgent`（点击通知时触发的行为）、`label`（通知标签）、`badgeNumber`（角标数）、`groupName`（通知组）、`actionButtons`（通知按钮）、`isAlertOnce`（是否仅提醒一次）、`autoDeletedTime`（定时清除时间戳 ms）、`sound`（自定义铃声路径）、`appMessageId`（去重标识，24h 有效）。

```ts
let notificationRequest: notificationManager.NotificationRequest = {
  id: 1,
  notificationSlotType: notificationManager.SlotType.SOCIAL_COMMUNICATION,
  content: {
    notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
    normal: { title: "标题", text: "内容" }
  },
  wantAgent: wantAgentObj,
  badgeNumber: 1
};
```

## NotificationRequest.content (通知内容 / NotificationContent)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通知内容类型容器，包含多种内容格式 | `notificationManager.NotificationContent` | `import { notificationManager } from '@kit.NotificationKit';` | 对象类型，指定 `notificationContentType` 和对应内容字段 | 见下方示例 | `06_应用服务/18_Notification Kit（用户通知服务）/01_ArkTS API/05_notification/03_NotificationContent.md` |

**字段**：`notificationContentType`（ContentType 枚举）、`normal`（基本文本）、`longText`（长文本）、`multiLine`（多行文本）、`picture`（图片通知）。

**ContentType 枚举值**：`NOTIFICATION_CONTENT_BASIC_TEXT` (0)、`NOTIFICATION_CONTENT_LONG_TEXT` (1)、`NOTIFICATION_CONTENT_PICTURE` (2)、`NOTIFICATION_CONTENT_MULTILINE` (4)、`NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW` (5)。

## NotificationBasicContent (基本通知内容)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 普通文本通知内容 | `NotificationBasicContent` | `import { notificationManager } from '@kit.NotificationKit';` | 通过 `content.normal` 字段引用 | `normal: { title: "标题", text: "内容", additionalText: "附加" }` | `06_应用服务/18_Notification Kit（用户通知服务）/01_ArkTS API/05_notification/03_NotificationContent.md` |

**字段**：`title`（必填，标题，<=1024 字节）、`text`（必填，内容，<=3072 字节）、`additionalText`（可选，附加内容，<=3072 字节）。

## NotificationLongTextContent (长文本通知内容)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 长文本通知内容，继承 NotificationBasicContent | `NotificationLongTextContent` | `import { notificationManager } from '@kit.NotificationKit';` | 通过 `content.longText` 字段引用 | `longText: { title: "标题", text: "概要", longText: "很长...", briefText: "摘要", expandedTitle: "展开标题" }` | `06_应用服务/18_Notification Kit（用户通知服务）/01_ArkTS API/05_notification/03_NotificationContent.md` |

**特有字段**：`longText`（必填，长文本，<=3072 字节）、`briefText`（必填，概要，<=1024 字节）、`expandedTitle`（必填，展开标题，<=1024 字节）。继承 `title`、`text`、`additionalText`。

## @ohos.app.ability.wantAgent (WantAgent，点击通知跳转)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建 WantAgent 实例，封装通知点击后的跳转行为 | `wantAgent.getWantAgent` | `import { wantAgent } from '@kit.AbilityKit';` | `getWantAgent(info: WantAgentInfo): Promise<WantAgent>` | 见下方示例 | `02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/03_通用能力的接口(推荐)/14_ohos.app.ability.wantAgent (WantAgent模块).md` |

```ts
import { wantAgent, Want } from '@kit.AbilityKit';
import type { WantAgent } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';

let wantAgentInfo: wantAgent.WantAgentInfo = {
  wants: [
    {
      bundleName: 'com.example.myapplication',
      abilityName: 'EntryAbility',
      parameters: { key: 'value' }
    } as Want
  ],
  actionType: wantAgent.OperationType.START_ABILITY,
  requestCode: 0,
  wantAgentFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
};

wantAgent.getWantAgent(wantAgentInfo).then((data: WantAgent) => {
  // 将 data 赋值给 NotificationRequest 的 wantAgent 字段
}).catch((err: BusinessError) => {
  console.error(`getWantAgent failed, code: ${err.code}`);
});
```

**OperationType**：`UNKNOWN_TYPE` (0)、`START_ABILITY` (1, 启动有页面 Ability)、`START_ABILITIES` (2)、`SEND_COMMON_EVENT` (4)。

**WantAgentFlags**：`ONE_TIME_FLAG` (0)、`NO_BUILD_FLAG` (1)、`CANCEL_PRESENT_FLAG` (2)、`UPDATE_PRESENT_FLAG` (3)、`CONSTANT_FLAG` (4)。

## 模块备注

- 发送通知前必须先调用 `requestEnableNotification` 获取用户授权，或在 module.json5 中声明 `ohos.permission.NOTIFICATION_CONTROLLER`（仅系统应用）。
- 通知渠道（Slot）通过 `notificationManager.addSlot(SlotType)` 创建（例如 `SOCIAL_COMMUNICATION`、`SERVICE_INFORMATION`、`CONTENT_INFORMATION` 等），不同类型的通知渠道有不同的提醒等级。
- 使用 `wantAgent` 实现通知点击跳转时，`WantAgentInfo` 中的 `wants` 数组当前只支持一个元素，多传时只取第一个。
- `WantAgentInfo` 中的 `actionType` (API 11+) 替代了已废弃的 `operationType`；`actionFlags` (API 11+) 替代了已废弃的 `wantAgentFlags`。
- 通知去重：设置 `appMessageId` 后，同一应用发起的多条相同 ID 的通知 24h 内自动去重。
