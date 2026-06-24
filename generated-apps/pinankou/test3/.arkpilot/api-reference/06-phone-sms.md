# 06 — Phone & SMS 一键拨号与短信

## @ohos.telephony.call
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 拨打电话模块，提供 makeCall/dial/hasCall/formatPhoneNumber 等呼叫管理能力 | `@ohos.telephony.call` | `import { call } from '@kit.TelephonyKit';` | 模块级导入 | `call.makeCall("138xxxxxxxx")` | `03_系统/02_网络/08_Telephony Kit（蜂窝通信服务）/01_ArkTS API/01_ohos.telephony.call (拨打电话).md` |

## call.makeCall
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 跳转到拨号界面并显示待拨号码（无权限要求，推荐用于非系统应用） | `call.makeCall` | `import { call } from '@kit.TelephonyKit';` | `makeCall(phoneNumber: string): Promise<void>` | `call.makeCall("138xxxxxxxx").then(() => { console.info('makeCall success'); }).catch((err: BusinessError) => { console.error('fail', err); });` | `01_ohos.telephony.call (拨打电话).md` |

## @ohos.telephony.sms
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 短信服务模块，提供 createMessage/sendShortMessage/getDefaultSmsSlotId 等短信管理能力 | `@ohos.telephony.sms` | `import { sms } from '@kit.TelephonyKit';` | 模块级导入 | `sms.sendShortMessage({ slotId: 0, content: '短信内容', destinationHost: '+861xxxxxxxxxx' })` | `03_系统/02_网络/08_Telephony Kit（蜂窝通信服务）/01_ArkTS API/07_ohos.telephony.sms (短信服务).md` |

## @ohos.telephony.radio
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 网络搜索模块，提供 getRadioTech/getNetworkState/getSignalInformation 等网络状态管理能力 | `@ohos.telephony.radio` | `import { radio } from '@kit.TelephonyKit';` | 模块级导入 | `radio.getNetworkState().then((data: radio.NetworkState) => { console.info('state:', data); });` | `03_系统/02_网络/08_Telephony Kit（蜂窝通信服务）/01_ArkTS API/05_ohos.telephony.radio (网络搜索).md` |

## 模块 Notes

| 预期 API | 实际 API | 说明 |
|----------|----------|------|
| `sms.sendSms` | `sms.sendShortMessage()` (API 10+) 或已废弃的 `sms.sendMessage()` | 文档中不存在 `sendSms` 方法名；正确接口为 `sendShortMessage`。需要 `ohos.permission.SEND_MESSAGES`（仅系统应用可申请）。 |
| `call.dialCall` | `call.dial()` (已废弃，API 9) | 文档中不存在 `dialCall` 方法名；实际为 `call.dial`。从 API 9 开始废弃，替代接口仅对系统应用开放。非系统应用应使用 `call.makeCall` 跳转拨号界面。 |
| `call.formatCallNumber` | `call.formatPhoneNumber()` | 文档中不存在 `formatCallNumber` 方法名；实际为 `call.formatPhoneNumber`（支持国家码参数 `NumberFormatOptions`）。 |
