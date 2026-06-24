# 05 — Telephony (拨号服务)

## @ohos.telephony.call (拨打电话)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 跳转到拨号界面并显示待拨号码（推荐，第三方应用可用） | call.makeCall | `import { call } from '@kit.TelephonyKit'` | `makeCall(phoneNumber: string): Promise<void>` (API 7+)<br>`makeCall(context: Context, phoneNumber: string): Promise<void>` (API 12+)<br>`makeCall(phoneNumber: string, options?: MakeCallOptions): Promise<void>` (API 24+) | `call.makeCall("138xxxxxxxx").then(() => { console.info('makeCall success'); })` | `03_系统/02_网络/08_Telephony Kit（蜂窝通信服务）/01_ArkTS API/01_ohos.telephony.call (拨打电话).md` |
| 直接拨打电话（API 9 起废弃，仅系统应用可用） | call.dial | `import { call } from '@kit.TelephonyKit'` | `dial(phoneNumber: string, options?: DialOptions): Promise<boolean>` (API 6-9 deprecated) | `call.dial("138xxxxxxxx", dialOptions).then((data) => { ... })` | 同上 |
| 判断是否存在通话 | call.hasCall | `import { call } from '@kit.TelephonyKit'` | `hasCall(): Promise<boolean>` | `call.hasCall().then((data) => { console.info(data); })` | 同上 |
| 获取当前通话状态 | call.getCallState | `import { call } from '@kit.TelephonyKit'` | `getCallState(): Promise<CallState>` | `call.getCallState().then((data: call.CallState) => { ... })` | 同上 |
| 检查设备是否具备语音通话能力 | call.hasVoiceCapability | `import { call } from '@kit.TelephonyKit'` | `hasVoiceCapability(): boolean` | `let result: boolean = call.hasVoiceCapability();` | 同上 |
| 判断是否是紧急电话号码 | call.isEmergencyPhoneNumber | `import { call } from '@kit.TelephonyKit'` | `isEmergencyPhoneNumber(phoneNumber: string, options?: EmergencyNumberOptions): Promise<boolean>` (API 7+) | `call.isEmergencyPhoneNumber("112").then((data) => { ... })` | 同上 |
| 格式化电话号码 | call.formatPhoneNumber | `import { call } from '@kit.TelephonyKit'` | `formatPhoneNumber(phoneNumber: string, options?: NumberFormatOptions): Promise<string>` (API 7+) | `call.formatPhoneNumber("138xxxxxxxx", {countryCode: "CN"}).then((data) => { ... })` | 同上 |
| 格式化电话号码为E.164 | call.formatPhoneNumberToE164 | `import { call } from '@kit.TelephonyKit'` | `formatPhoneNumberToE164(phoneNumber: string, countryCode: string): Promise<string>` (API 7+) | `call.formatPhoneNumberToE164("138xxxxxxxx", "CN").then((data) => { ... })` | 同上 |
| 接听来电（需系统权限） | call.answerCall | `import { call } from '@kit.TelephonyKit'` | `answerCall(callback: AsyncCallback<void>): void` (API 23+) | `call.answerCall((err) => { ... })` | 同上 |
| 挂断电话（需系统权限） | call.hangUpCall | `import { call } from '@kit.TelephonyKit'` | `hangUpCall(callback: AsyncCallback<void>): void` (API 23+) | `call.hangUpCall((err) => { ... })` | 同上 |
| 拒绝来电（需系统权限） | call.rejectCall | `import { call } from '@kit.TelephonyKit'` | `rejectCall(callback: AsyncCallback<void>): void` (API 23+) | `call.rejectCall((err) => { ... })` | 同上 |

## voipCall (应用内通话管理)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 上报来电消息（VoIP 应用） | voipCall.reportIncomingCall | `import { voipCall } from '@kit.CallServiceKit'` | `reportIncomingCall(voipCallAttribute: VoipCallAttribute): Promise<ErrorReason>` (API 11+) | `let error = await voipCall.reportIncomingCall(callInfo);` | `06_应用服务/06_Call Service Kit（通话服务）/01_ArkTS API/01_voipCall (应用内通话管理).md` |
| 上报去电消息 | voipCall.reportOutgoingCall | `import { voipCall } from '@kit.CallServiceKit'` | `reportOutgoingCall(voipCallAttribute: VoipCallAttribute): Promise<ErrorReason>` (API 12+) | `let error = await voipCall.reportOutgoingCall(callInfo);` | 同上 |
| 上报通话状态变化 | voipCall.reportCallStateChange | `import { voipCall } from '@kit.CallServiceKit'` | `reportCallStateChange(callId: string, callState: VoipCallState): Promise<void>` (API 11+); `reportCallStateChange(callId: string, callState: VoipCallState, callType: VoipCallType): Promise<void>` (API 12+) | `voipCall.reportCallStateChange("callId123", voipCall.VoipCallState.VOIP_CALL_STATE_ACTIVE)` | 同上 |
| 上报静音/扬声器事件 | voipCall.reportCallAudioEventChange | `import { voipCall } from '@kit.CallServiceKit'` | `reportCallAudioEventChange(callId: string, callAudioEvent: CallAudioEvent): Promise<void>` (API 12+) | `voipCall.reportCallAudioEventChange(callId, voipCall.CallAudioEvent.AUDIO_EVENT_MUTED)` | 同上 |
| 通知来电建立失败原因 | voipCall.reportIncomingCallError | `import { voipCall } from '@kit.CallServiceKit'` | `reportIncomingCallError(callId: string, voipCallFailureCause: VoipCallFailureCause): Promise<void>` (API 11+) | `voipCall.reportIncomingCallError("callId123", voipCall.VoipCallFailureCause.OTHER)` | 同上 |
| 订阅用户按键事件（接听/挂断等） | voipCall.on('voipCallUiEvent') | `import { voipCall } from '@kit.CallServiceKit'` | `on(type: 'voipCallUiEvent', callback: Callback<VoipCallUiEventInfo>): void` (API 11+) | `voipCall.on('voipCallUiEvent', (data) => { ... })` | 同上 |
| 取消订阅用户按键事件 | voipCall.off('voipCallUiEvent') | `import { voipCall } from '@kit.CallServiceKit'` | `off(type: 'voipCallUiEvent', callback?: Callback<VoipCallUiEventInfo>): void` (API 11+) | `voipCall.off('voipCallUiEvent')` | 同上 |

## 模块说明

- `call.dial()` 从 API 9 起废弃，替代能力仅对系统应用开放。第三方应用应使用 `call.makeCall()` 跳转到系统拨号界面。
- `call.makeCall()` 从 API 11 起支持在元服务中使用，API 15 起支持 `tel:` 格式电话号码。
- `voipCall` 所有接口仅限 Stage 模型使用（`SystemCapability.Telephony.VoipCallManager`），需要应用具备 `ohos.permission.PLACE_CALL`（仅系统应用）或通过 Call Service Kit 渠道集成。
- 如需订阅通话状态变化，使用 `observer.on('callStateChange')`（位于 `@ohos.telephony.observer` 模块）。
- `call.answerCall` / `call.hangUpCall` / `call.rejectCall`（API 23+）需要 `ohos.permission.ANSWER_CALL` 或 `ohos.permission.MANAGE_CALL_FOR_DEVICES` 权限，仅系统应用可用。
