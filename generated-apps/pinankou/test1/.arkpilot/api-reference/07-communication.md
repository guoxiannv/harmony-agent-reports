# 07 — Phone, SMS & Communication

## @ohos.telephony.call
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 跳转到拨号界面 | makeCall | `import { call } from '@kit.TelephonyKit'` | `makeCall(phoneNumber: string): Promise<void>` | `call.makeCall("138xxxxxxxx").then(() => { console.info("success"); })` | `01_ohos.telephony.call (拨打电话).md` |
| 带上下文的拨号跳转 | makeCall (12+) | `import { call } from '@kit.TelephonyKit'` | `makeCall(context: Context, phoneNumber: string): Promise<void>` | `call.makeCall(context, "138xxxxxxxx")` | `01_ohos.telephony.call (拨打电话).md` |
| 隐藏拨号盘的拨号跳转 | makeCall (24+) | `import { call } from '@kit.TelephonyKit'` | `makeCall(phoneNumber: string, options?: MakeCallOptions): Promise<void>` | `call.makeCall("138xxx", { isHideDialScreen: true })` | `01_ohos.telephony.call (拨打电话).md` |
| 判断是否存在通话 | hasCall | `import { call } from '@kit.TelephonyKit'` | `hasCall(): Promise<boolean>` | `call.hasCall().then(data => {})` | `01_ohos.telephony.call (拨打电话).md` |
| 获取通话状态 | getCallState | `import { call } from '@kit.TelephonyKit'` | `getCallState(): Promise<CallState>` | `call.getCallState().then(data => {})` | `01_ohos.telephony.call (拨打电话).md` |
| 检查语音通话能力 | hasVoiceCapability | `import { call } from '@kit.TelephonyKit'` | `hasVoiceCapability(): boolean` | `let result = call.hasVoiceCapability()` | `01_ohos.telephony.call (拨打电话).md` |
| 接听来电 | answerCall (23+) | `import { call } from '@kit.TelephonyKit'` | `answerCall(callback: AsyncCallback<void>): void` | `call.answerCall((err) => {})` | `01_ohos.telephony.call (拨打电话).md` |
| 挂断电话 | hangUpCall (23+) | `import { call } from '@kit.TelephonyKit'` | `hangUpCall(callback: AsyncCallback<void>): void` | `call.hangUpCall((err) => {})` | `01_ohos.telephony.call (拨打电话).md` |
| 拒绝来电 | rejectCall (23+) | `import { call } from '@kit.TelephonyKit'` | `rejectCall(callback: AsyncCallback<void>): void` | `call.rejectCall((err) => {})` | `01_ohos.telephony.call (拨打电话).md` |
| 格式化电话号码 | formatPhoneNumber (7+) | `import { call } from '@kit.TelephonyKit'` | `formatPhoneNumber(phoneNumber: string, options?: NumberFormatOptions): Promise<string>` | `call.formatPhoneNumber("138xxx", {countryCode: "CN"})` | `01_ohos.telephony.call (拨打电话).md` |

## @ohos.telephony.sms
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 发送短信 | sendShortMessage (10+) | `import { sms } from '@kit.TelephonyKit'` | `sendShortMessage(options: SendMessageOptions): Promise<void>` | `sms.sendShortMessage({slotId:0, content:'text', destinationHost:'+86xxx'})` | `07_ohos.telephony.sms (短信服务).md` |
| 创建短信实例(PDU) | createMessage | `import { sms } from '@kit.TelephonyKit'` | `createMessage(pdu: Array<number>, specification: string): Promise<ShortMessage>` | `sms.createMessage(pdu, '3gpp').then(data => {})` | `07_ohos.telephony.sms (短信服务).md` |
| 获取默认短信卡槽 | getDefaultSmsSlotId (7+) | `import { sms } from '@kit.TelephonyKit'` | `getDefaultSmsSlotId(): Promise<number>` | `sms.getDefaultSmsSlotId().then(slotId => {})` | `07_ohos.telephony.sms (短信服务).md` |
| 检查设备短信能力 | hasSmsCapability (7+) | `import { sms } from '@kit.TelephonyKit'` | `hasSmsCapability(): boolean` | `let result = sms.hasSmsCapability()` | `07_ohos.telephony.sms (短信服务).md` |
| 获取默认短信SIM ID | getDefaultSmsSimId (10+) | `import { sms } from '@kit.TelephonyKit'` | `getDefaultSmsSimId(): Promise<number>` | `sms.getDefaultSmsSimId().then(simId => {})` | `07_ohos.telephony.sms (短信服务).md` |

## @ohos.telephony.radio
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取网络状态 | getNetworkState | `import { radio } from '@kit.TelephonyKit'` | `getNetworkState(slotId?: number): Promise<NetworkState>` | `radio.getNetworkState(0).then(data => {})` | `05_ohos.telephony.radio (网络搜索).md` |
| 获取无线接入技术 | getRadioTech | `import { radio } from '@kit.TelephonyKit'` | `getRadioTech(slotId: number): Promise<NetworkRadioTech>` | `radio.getRadioTech(0).then(data => {})` | `05_ohos.telephony.radio (网络搜索).md` |
| 获取选网模式 | getNetworkSelectionMode | `import { radio } from '@kit.TelephonyKit'` | `getNetworkSelectionMode(slotId: number): Promise<NetworkSelectionMode>` | `radio.getNetworkSelectionMode(0).then(data => {})` | `05_ohos.telephony.radio (网络搜索).md` |
| 获取信号强度 | getSignalInformation (7+) | `import { radio } from '@kit.TelephonyKit'` | `getSignalInformation(slotId: number): Promise<Array<SignalInformation>>` | `radio.getSignalInformation(0).then(data => {})` | `05_ohos.telephony.radio (网络搜索).md` |
| 获取运营商名称 | getOperatorName (7+) | `import { radio } from '@kit.TelephonyKit'` | `getOperatorName(slotId: number): Promise<string>` | `radio.getOperatorName(0).then(data => {})` | `05_ohos.telephony.radio (网络搜索).md` |
| 获取主卡槽索引 | getPrimarySlotId (7+) | `import { radio } from '@kit.TelephonyKit'` | `getPrimarySlotId(): Promise<number>` | `radio.getPrimarySlotId().then(slotId => {})` | `05_ohos.telephony.radio (网络搜索).md` |
| 获取国家码 | getISOCountryCodeForNetwork (7+) | `import { radio } from '@kit.TelephonyKit'` | `getISOCountryCodeForNetwork(slotId: number): Promise<string>` | `radio.getISOCountryCodeForNetwork(0).then(code => {})` | `05_ohos.telephony.radio (网络搜索).md` |
| 判断 Radio 是否打开 | isRadioOn (7+) | `import { radio } from '@kit.TelephonyKit'` | `isRadioOn(slotId?: number): Promise<boolean>` | `radio.isRadioOn(0).then(data => {})` | `05_ohos.telephony.radio (网络搜索).md` |

## Want
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 应用组件间信息传递载体 | Want | `import { Want } from '@kit.AbilityKit'` | 对象定义：`{deviceId?, bundleName?, moduleName?, abilityName?, action?, entities?, uri?, type?, parameters?, flags?}` | `let want: Want = { bundleName: 'com.example', abilityName: 'FuncAbility', parameters: { key: 'value' } }` | `13_ohos.app.ability.Want (Want).md` |

## startAbility
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 启动UIAbility (callback) | startAbility | `import { common } from '@kit.AbilityKit'` | `startAbility(want: Want, callback: AsyncCallback<void>): void` | `this.context.startAbility(want, (err) => {})` | `24_UIAbilityContext.md` |
| 启动UIAbility (callback+options) | startAbility | `import { common } from '@kit.AbilityKit'` | `startAbility(want: Want, options: StartOptions, callback: AsyncCallback<void>): void` | `this.context.startAbility(want, options, (err) => {})` | `24_UIAbilityContext.md` |
| 启动UIAbility (Promise) | startAbility | `import { common } from '@kit.AbilityKit'` | `startAbility(want: Want, options?: StartOptions): Promise<void>` | `this.context.startAbility(want).then(() => {})` | `24_UIAbilityContext.md` |

## 模块说明
- 通话/短信/网络搜索 API 均通过 `@kit.TelephonyKit` 导入；Want 和 startAbility 通过 `@kit.AbilityKit` 导入。
- API `call.dial` (API 6) 已从 API 9 起废弃，系统应用替代方案未公开。第三方应用应使用 `call.makeCall` 跳转到系统拨号界面。
- `call.makeCall` 从 API 12 起支持传入 Context，从 API 15 起支持 `tel:` 格式号码，从 API 24 起支持 `MakeCallOptions`（可隐藏拨号界面）。
- `sms.sendMessage` (API 6) 已从 API 10 起废弃，应改用 `sms.sendShortMessage`。
- 短信发送（`sendShortMessage`）需要系统权限 `ohos.permission.SEND_MESSAGES`，仅系统应用可申请；第三方应用需通过 `call.makeCall` 或显式/隐式 Want 跳转系统能力。
- `radio.getNetworkState`、`getRadioTech`、`isRadioOn` 需要权限 `ohos.permission.GET_NETWORK_INFO`。
- Want 在 API 23 起支持最大 200KB 数据传递（之前为 100KB）。
- `startAbility` 仅支持在主线程调用，组件启动规则遵循 Stage 模型规则。
