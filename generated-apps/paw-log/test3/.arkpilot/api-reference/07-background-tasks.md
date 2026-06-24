# 07 — 后台任务 (Background Tasks)

## workScheduler.startWork
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 申请延迟任务，添加到执行队列，满足触发条件后由系统调度执行 | workScheduler.startWork | `import { workScheduler } from '@kit.BackgroundTasksKit'` | `startWork(work: WorkInfo): void` | 见下方 | `02_应用框架/07_Background Tasks Kit（后台任务开发服务）/01_ArkTS API/03_ohos.resourceschedule.workScheduler (延迟任务调度).md` |

```ts
import { BusinessError } from '@kit.BasicServicesKit';
import { workScheduler } from '@kit.BackgroundTasksKit';

let workInfo: workScheduler.WorkInfo = {
    workId: 1,
    batteryStatus: workScheduler.BatteryStatus.BATTERY_STATUS_LOW,
    isRepeat: false,
    isPersisted: true,
    bundleName: "com.example.myapplication",
    abilityName: "MyExtension",
    parameters: { mykey0: 1, mykey1: "string value", mykey2: true, mykey3: 1.5 }
};
try {
  workScheduler.startWork(workInfo);
} catch (error) {
  console.error(`startwork failed. code is ${(error as BusinessError).code}`);
}
```

## workScheduler.stopWork
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 取消延迟任务，可选是否从执行队列移除 | workScheduler.stopWork | 同上 | `stopWork(work: WorkInfo, needCancel?: boolean): void` | `workScheduler.stopWork(workInfo, false)` | 同上 |

## workScheduler.getWorkStatus
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通过 workId 获取延迟任务状态（Callback 和 Promise 两种重载） | workScheduler.getWorkStatus | 同上 | `getWorkStatus(workId: number, callback: AsyncCallback<WorkInfo>): void` / `getWorkStatus(workId: number): Promise<WorkInfo>` | 见下方 | 同上 |

```ts
// Promise 方式
workScheduler.getWorkStatus(50).then((res: workScheduler.WorkInfo) => {
  console.info(`getWorkStatus success, ${JSON.stringify(res)}`);
}).catch((error: BusinessError) => {
  console.error(`getWorkStatus failed. code is ${error.code}`);
});
```

## WorkInfo
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 延迟任务信息，用于设置触发条件（workId/bundleName/abilityName 为必填，至少设置一个触发条件） | WorkInfo | 同上 | `workScheduler.WorkInfo` — 包含 workId、bundleName、abilityName、networkType、isCharging、chargerType、batteryLevel、batteryStatus、storageRequest、isRepeat、repeatCycleTime、repeatCount、isPersisted、isDeepIdle、idleWaitTime、parameters、earliestStartTime22+ | 见 startWork 示例 | 同上 |

## workScheduler.work（模块命名空间）
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| workScheduler 模块命名空间，所有延迟任务 API 及类型挂载于此命名空间下 | workScheduler | `import { workScheduler } from '@kit.BackgroundTasksKit'` | 模块命名空间，包含 startWork/stopWork/getWorkStatus/obtainAllWorks/stopAndClearWorks/isLastWorkTimeOut 及 WorkInfo/NetworkType/ChargingType/BatteryStatus/StorageRequest 类型 | `workScheduler.WorkInfo` `workScheduler.BatteryStatus.BATTERY_STATUS_LOW` | 同上 |

## @ohos.resourceschedule.workScheduler
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 延迟任务调度模块，提供延迟任务注册、取消、查询能力。Stage 模型专用，API 9+。 | `@ohos.resourceschedule.workScheduler` | `import { workScheduler } from '@kit.BackgroundTasksKit'` | 模块 | 见上方 startWork 示例 | 同上 |

## backgroundTaskManager.startBackgroundRunning
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 申请长时任务（需 ohos.permission.KEEP_BACKGROUND_RUNNING）；支持 callback/Promise 两种方式，以及单类型/多类型/多任务三种重载 | backgroundTaskManager.startBackgroundRunning | `import { backgroundTaskManager } from '@kit.BackgroundTasksKit'` | `startBackgroundRunning(context: Context, bgMode: BackgroundMode, wantAgent: WantAgent, callback: AsyncCallback<void>): void` 等 3 种重载 | 见下方 | `02_应用框架/07_Background Tasks Kit（后台任务开发服务）/01_ArkTS API/02_ohos.resourceschedule.backgroundTaskManager (后台任务管理).md` |

```ts
import { backgroundTaskManager } from '@kit.BackgroundTasksKit';
import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { wantAgent, WantAgent } from '@kit.AbilityKit';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    let wantAgentInfo: wantAgent.WantAgentInfo = {
      wants: [{ bundleName: "com.example.myapplication", abilityName: "EntryAbility" }],
      actionType: wantAgent.OperationType.START_ABILITY,
      requestCode: 0,
      wantAgentFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
    };
    wantAgent.getWantAgent(wantAgentInfo).then((wantAgentObj: WantAgent) => {
      backgroundTaskManager.startBackgroundRunning(this.context,
        backgroundTaskManager.BackgroundMode.AUDIO_PLAYBACK, wantAgentObj, () => {});
    });
  }
};
```

## backgroundTaskManager.requestSuspendDelay
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 申请短时任务（防止应用进程被终止/挂起）；超时前 6 秒回调通知 | backgroundTaskManager.requestSuspendDelay | 同上 | `requestSuspendDelay(reason: string, callback: Callback<void>): DelaySuspendInfo` | `let delayInfo = backgroundTaskManager.requestSuspendDelay("reason", () => { console.info("will time out"); });` | 同上 |

## backgroundTaskManager.cancelSuspendDelay
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 取消短时任务 | backgroundTaskManager.cancelSuspendDelay | 同上 | `cancelSuspendDelay(requestId: number): void` | `backgroundTaskManager.cancelSuspendDelay(id);` | 同上 |

## backgroundTaskManager.BackgroundMode
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 长时任务类型枚举：DATA_TRANSFER(1)/AUDIO_PLAYBACK(2)/AUDIO_RECORDING(3)/LOCATION(4)/BLUETOOTH_INTERACTION(5)/MULTI_DEVICE_CONNECTION(6)/VOIP(8)/TASK_KEEPING(9) | BackgroundMode | 同上 | 枚举 | `backgroundTaskManager.BackgroundMode.AUDIO_PLAYBACK` | 同上 |

## @ohos.backgroundTaskManager
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 后台任务管理模块（完整模块名为 @ohos.resourceschedule.backgroundTaskManager），提供长时任务和短时任务申请/取消/查询能力，API 9+ | `@ohos.resourceschedule.backgroundTaskManager` | `import { backgroundTaskManager } from '@kit.BackgroundTasksKit'` | 模块 | `backgroundTaskManager.startBackgroundRunning(this.context, ...)` | 同上 |

## 模块笔记

- **导入路径**：两个模块均从 `@kit.BackgroundTasksKit` 导入，非旧式 `@ohos.resourceschedule.workScheduler` / `@ohos.resourceschedule.backgroundTaskManager` 路径。
- **WorkSchedulerInfo**：文档中无此类型名称；实际类型名为 `WorkInfo`（`workScheduler.WorkInfo`）。
- **Stage 模型限制**：workScheduler 和 backgroundTaskManager 接口仅可在 Stage 模型下使用。
- **长时任务权限**：`startBackgroundRunning` 需声明 `ohos.permission.KEEP_BACKGROUND_RUNNING`；一个 UIAbility 同一时刻可申请一个长时任务（API 21+ 支持多个）。
- **短时任务时间**：最长 3 分钟，低电量时最长 1 分钟。可通过 `getRemainingDelayTime` 查询剩余时间。
- **延迟任务规则**：WorkInfo 中 workId/bundleName/abilityName 必填；至少设置一个触发条件；循环任务间隔至少 2 小时；bundleName 必须为本应用包名。
