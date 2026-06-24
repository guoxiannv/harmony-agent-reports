# 平安扣 Pinankou — API Reference Index

**Spec**: `.arkpilot/autopilot/spec.md`  
**Docs Root**: `vendor/harmony-knowledge-base/data/harmonyos_docs/cn/harmonyos-references/`  
**Total APIs Researched**: 90 (86 found, 4 missing/renamed)  
**Module Groups**: 7

Implement agents should read this index first, then load individual module files as needed.

---

## API 速查表

| API / 组件 | 用途 | 详细文档 |
|------------|------|----------|
| `abilityAccessCtrl` | 程序访问控制，权限校验与用户授权 | [01-permissions.md](01-permissions.md#abilityaccessctrl) |
| `AtManager.requestPermissionsFromUser` | 运行时弹框请求用户授权 | [01-permissions.md](01-permissions.md#requestpermissionsfromuser) |
| `UIAbility` | 带界面应用组件，生命周期回调 | [01-permissions.md](01-permissions.md#ohosabilityuiability) |
| `bundleManager` | 应用包管理，获取 BundleInfo/AccessTokenId | [01-permissions.md](01-permissions.md#bundlemanager) |
| `PermissionRequestResult` | 权限请求结果对象 | [01-permissions.md](01-permissions.md#permissionrequestresult) |
| `relationalStore` / `RdbStore` | 关系型数据库 CRUD | [02-persistence-rdb.md](02-persistence-rdb.md#relationalstore--ohosdatarelationalstore) |
| `ValuesBucket` | 数据库读写键值数据集 | [02-persistence-rdb.md](02-persistence-rdb.md#valuesbucket) |
| `ResultSet` | 查询结果集，行遍历与列值读取 | [02-persistence-rdb.md](02-persistence-rdb.md#resultset) |
| `StoreConfig` | RDB 配置（名称/安全级别/加密） | [02-persistence-rdb.md](02-persistence-rdb.md#storeconfig) |
| `dataSharePredicates` / `RdbPredicates` | 查询条件与排序构造 | [02-persistence-rdb.md](02-persistence-rdb.md#datasharepredicates) |
| `preferences` | 轻量级键值持久化 | [02-persistence-rdb.md](02-persistence-rdb.md#preferences--ohosdatapreferences) |
| `@ohos.file.fs` (fileIo) | 文件读写、目录管理、流式操作 | [03-file-management.md](03-file-management.md#fileiostat) |
| `Context.filesDir` / `cacheDir` | 应用沙箱目录路径 | [03-file-management.md](03-file-management.md#context) |
| `PhotoViewPicker` | 图库选择器，选择图片/视频 | [03-file-management.md](03-file-management.md#class-photoviewpicker) |
| `DocumentViewPicker` | 文件选择器，选择/保存文档 | [03-file-management.md](03-file-management.md#documentviewpicker) |
| `photoAccessHelper` | 相册管理，创建/访问媒体数据 | [03-file-management.md](03-file-management.md#ohosfilephotoaccesshelper-相册管理模块) |
| `@ohos.multimedia.image` | 图片解码/编码/像素处理 | [03-file-management.md](03-file-management.md#ohosmultimediaimage-图片处理) |
| `@ohos.multimedia.camera` | 相机模块入口 | [04-camera.md](04-camera.md#@ohosmultimediacamera) |
| `CameraManager` | 相机管理器，获取设备/创建会话 | [04-camera.md](04-camera.md#cameramanager) |
| `PhotoSession` | 拍照模式会话 (API 11+, 替代 CaptureSession) | [04-camera.md](04-camera.md#photosession) |
| `CameraInput` | 相机设备输入，开关与异常监听 | [04-camera.md](04-camera.md#camerainput) |
| `ImageReceiver` | 图片接收器，提供 surfaceId (@kit.ImageKit) | [04-camera.md](04-camera.md#imagereceiver) |
| `AVRecorder` | 音视频录制，推荐用于语音记录 | [05-audio-recording.md](05-audio-recording.md#avrecorder) |
| `@ohos.multimedia.audio` | 音频管理，音量/设备/采集/渲染 | [05-audio-recording.md](05-audio-recording.md#ohosmultimediaaudio) |
| `AudioCapturer` | PCM 音频采集（底层） | [05-audio-recording.md](05-audio-recording.md#audiocapturer) |
| `AudioRenderer` | PCM 音频渲染（播放） | [05-audio-recording.md](05-audio-recording.md#audiorenderer) |
| `AudioManager` | 音量与音频设备管理 | [05-audio-recording.md](05-audio-recording.md#audiomanager) |
| `call.makeCall` | 免权限跳转拨号界面 | [06-phone-sms.md](06-phone-sms.md#callmakecall) |
| `@ohos.telephony.call` | 拨号模块（dial 已废弃） | [06-phone-sms.md](06-phone-sms.md#ohostelegonycall) |
| `@ohos.telephony.sms` | 短信模块（sendShortMessage 需系统权限） | [06-phone-sms.md](06-phone-sms.md#ohostelephonysis) |
| `@ohos.telephony.radio` | 网络搜索与信号状态 | [06-phone-sms.md](06-phone-sms.md#ohostelephonyradio) |
| `geoLocationManager` | 位置服务入口 (@kit.LocationKit) | [07-location.md](07-location.md#geolocationmanager-位置服务) |
| `geoLocationManager.getCurrentLocation` | 获取当前位置（异步） | [07-location.md](07-location.md#geolocationmanagergetcurrentlocation) |
| `geoLocationManager.getLastLocation` | 获取上次缓存位置（同步） | [07-location.md](07-location.md#geolocationmanagergetlastlocation) |
| `LocationRequest` / `CurrentLocationRequest` | 定位请求参数配置 | [07-location.md](07-location.md#locationrequest) |
| `Location` | 位置信息结构体（经纬度/海拔/精度等） | [07-location.md](07-location.md#location) |

## 缺失/重命名 API 备忘

| 猜测的 API | 实际名称 | 状态 |
|-----------|---------|------|
| `camera.CameraArea` | 无此类型，使用 `Point` + `setFocusPoint/setMeteringPoint` | 🔄 替代方案 |
| `AudioRingtone` | `@kit.RingtoneKit` 提供 `ringtone.startRingtoneSetting()` | 🔄 不同 Kit |
| `sms.sendSms` | `sms.sendShortMessage()` (需系统权限) | 🔄 已重命名 |
| `call.dialCall` | `call.dial()` (API 9 已废弃) | ❌ 已废弃 |
| `call.formatCallNumber` | `call.formatPhoneNumber()` | 🔄 已重命名 |

## 关键 Import 路径速记

| Kit | 导入语句 |
|-----|----------|
| Ability Kit | `import { abilityAccessCtrl, common, bundleManager, PermissionRequestResult } from '@kit.AbilityKit'` |
| ArkData | `import { relationalStore, preferences } from '@kit.ArkData'` |
| Core File Kit | `import { fileIo } from '@kit.CoreFileKit'` |
| Image Kit | `import { image } from '@kit.ImageKit'` |
| Media Library Kit | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` |
| Camera Kit | `import { camera } from '@kit.CameraKit'` |
| Media Kit | `import { AVRecorder } from '@kit.MediaKit'` |
| Audio Kit | `import { audio } from '@kit.AudioKit'` |
| Telephony Kit | `import { call, sms, radio } from '@kit.TelephonyKit'` |
| Location Kit | `import { geoLocationManager } from '@kit.LocationKit'` |
