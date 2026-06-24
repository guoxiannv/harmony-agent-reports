# 06 — 一键拨号 (One-Click Dialing)

## @ohos.telephony.call (拨打电话)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 跳转拨号界面（推荐，元服务可用） | call.makeCall | `import { call } from '@kit.TelephonyKit';` | `makeCall(phoneNumber: string): Promise<void>` (API 7+); `makeCall(context: Context, phoneNumber: string): Promise<void>` (API 12+) | `call.makeCall("138xxxxxxxx").then(() => { console.info('makeCall success'); }).catch(...)` | `03_系统/02_网络/08_Telephony Kit（蜂窝通信服务）/01_ArkTS API/01_ohos.telephony.call (拨打电话).md` |
| 拨打电话（已废弃 API 9，仅系统应用） | call.dial | 同上 | `dial(phoneNumber: string, options?: DialOptions): Promise<boolean>` (API 6-9 deprecated) | `call.dial("138xxxxxxxx").then(...)` | 同上 |
| 判断设备语音通话能力 | call.hasVoiceCapability | 同上 | `hasVoiceCapability(): boolean` | `let result = call.hasVoiceCapability();` | 同上 |
| 获取当前通话状态 | call.getCallState | 同上 | `getCallState(): Promise<CallState>` | `call.getCallState().then((state) => {...})` | 同上 |

## @ohos.app.ability.wantAgent (WantAgent模块)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建 WantAgent 实例 | wantAgent.getWantAgent | `import { wantAgent } from '@kit.AbilityKit';` | `getWantAgent(info: WantAgentInfo): Promise<WantAgent>` (API 9+) | `wantAgent.getWantAgent(wantAgentInfo).then((data) => {...})` | `02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/03_通用能力的接口(推荐)/14_ohos.app.ability.wantAgent (WantAgent模块).md` |
| 触发 WantAgent 执行操作 | wantAgent.trigger | 同上 | `trigger(agent: WantAgent, triggerInfo: TriggerInfo, callback?: AsyncCallback<CompleteData>): void` (API 9+) | `wantAgent.trigger(wantAgentData, triggerInfo, triggerCallback)` | 同上 |
| 获取 WantAgent 实例的包名 | wantAgent.getBundleName | 同上 | `getBundleName(agent: WantAgent): Promise<string>` | `wantAgent.getBundleName(wantAgentData).then(...)` | 同上 |
| 取消 WantAgent 实例 | wantAgent.cancel | 同上 | `cancel(agent: WantAgent): Promise<void>` | `wantAgent.cancel(wantAgentData).then(...)` | 同上 |
| WantAgentInfo（创建输入参数） | WantAgentInfo | 同上（类型定义） | `{ wants: Want[], actionType: OperationType, requestCode: number, wantAgentFlags?: WantAgentFlags[], extraInfos?: Record<string, Object> }` | 见下方集成示例 | `02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/04_接口依赖的元素及定义/05_wantAgent/02_WantAgentInfo.md` |
| TriggerInfo（触发输入参数） | TriggerInfo | 同上（类型定义） | `{ code: number, want?: Want, permission?: string, extraInfos?: Record<string, Object> }` | `{ code: 0 }` | `02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/04_接口依赖的元素及定义/05_wantAgent/01_TriggerInfo.md` |

## @ohos.app.ability.Want (Want)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 页面间信息传递载体 | Want | `import { Want } from '@kit.AbilityKit';` | `interface Want { deviceId?: string; bundleName?: string; moduleName?: string; abilityName?: string; action?: string; entities?: string[]; uri?: string; type?: string; parameters?: Record<string, Object>; flags?: number; }` | `let want: Want = { bundleName: 'com.example', abilityName: 'FuncAbility', parameters: { key: 'value' } }` | `02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/03_通用能力的接口(推荐)/13_ohos.app.ability.Want (Want).md` |

## 模块说明

- **一键拨号核心路径**：使用 `call.makeCall(phoneNumber)` 跳转到系统拨号界面，无需 `ohos.permission.PLACE_CALL` 权限。API 12+ 支持传入 Context 的后台调用（需 `ohos.permission.START_ABILITIES_FROM_BACKGROUND`）。从 API 15 开始支持 `tel:` 格式电话号码。
- **`call.dial` 已废弃**：从 API 9 开始废弃（需 `ohos.permission.PLACE_CALL`，仅系统应用可申请），普通应用应使用 `call.makeCall`。
- **WantAgent 典型场景**：通知点击回调。创建时通过 `WantAgentInfo.wants` 指定目标 Ability，`actionType` 设为 `START_ABILITY`，触发时调用 `wantAgent.trigger`。
- **Want 限制**：跨进程通信时 Want 最大数据量 200KB（API 23+），100KB（API 22 及之前）。parameters 值仅支持基本数据类型（String/Number/Boolean/Object/undefined/null）。
