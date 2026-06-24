# 02 — Share Kit (系统分享)

## systemShare（分享）
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建分享数据对象 | systemShare.SharedData | `import { systemShare } from '@kit.ShareKit';` | `constructor(record: SharedRecord)` | `new systemShare.SharedData({utd: utd.UniformDataType.PLAIN_TEXT, content: 'Hello HarmonyOS'})` | `06_应用服务/26_Share Kit（分享服务）/01_ArkTS API/01_systemShare（分享）.md` |
| 追加分享数据记录 | sharedData.addRecord | `import { systemShare } from '@kit.ShareKit';` | `addRecord(record: SharedRecord): void` | `shareData.addRecord({utd: utd.UniformDataType.IMAGE, uri: '...', title: 'Picture'})` | 同上 |
| 创建分享面板控制器 | systemShare.ShareController | `import { systemShare } from '@kit.ShareKit';` | `constructor(data: SharedData)` | `new systemShare.ShareController(shareData)` | 同上 |
| 显示分享面板 | controller.show | `import { systemShare } from '@kit.ShareKit';` | `show(context: common.UIAbilityContext, options: ShareControllerOptions): Promise<void>` | `controller.show(context, {previewMode: systemShare.SharePreviewMode.DEFAULT, selectionMode: systemShare.SelectionMode.SINGLE})` | 同上 |
| 监听分享面板关闭 | controller.on('dismiss') | `import { systemShare } from '@kit.ShareKit';` | `on(event: 'dismiss', callback: () => void): void` | `controller.on('dismiss', () => { /* panel dismissed */ })` | 同上 |
| 监听分享完成事件 | controller.on('shareCompleted') | `import { systemShare } from '@kit.ShareKit';` | `on(type: 'shareCompleted', callback: Callback<ShareOperationResult>): void` | `controller.on('shareCompleted', (result) => { console.log(result.targetAbilityInfo.name) })` | 同上 |
| 接收端解析分享数据 | systemShare.getSharedData | `import { systemShare } from '@kit.ShareKit';` | `getSharedData(want: Want): Promise<SharedData>` | `systemShare.getSharedData(this.want).then((data) => { let records = data.getRecords() })` | 同上 |
| 解析联系人信息 | systemShare.getContactInfo | `import { systemShare } from '@kit.ShareKit';` | `getContactInfo(want: Want): Promise<ContactInfo>` | `systemShare.getContactInfo(this.want).then((contact) => { ... })` | 同上 |
| 构造Want数据（用于自定义分享通道） | systemShare.getWant | `import { systemShare } from '@kit.ShareKit';` | `getWant(data: SharedData, options?: ShareControllerOptions): Promise<Want>` | `systemShare.getWant(data).then((want) => { ... })` | 同上 |

## harmonyShare（华为分享）
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 注册设备轻贴分享监听 | harmonyShare.on('knockShare') | `import { harmonyShare } from '@kit.ShareKit';` | `on(event: 'knockShare', callback: Callback<SharableTarget>): void` | `harmonyShare.on('knockShare', (target) => { target.share(data) })` | `06_应用服务/26_Share Kit（分享服务）/01_ArkTS API/02_harmonyShare（华为分享）.md` |
| 注册隔空传送监听 | harmonyShare.on('gesturesShare') | `import { harmonyShare } from '@kit.ShareKit';` | `on(event: 'gesturesShare', callback: Callback<SharableTarget>): void` | `harmonyShare.on('gesturesShare', (target) => { ... })` | 同上 |
| 注册沙箱接收监听 | harmonyShare.on('dataReceive') | `import { harmonyShare } from '@kit.ShareKit';` | `on(event: 'dataReceive', capability: RecvCapabilityRegistry, callback: Callback<ReceivableTarget>): void` | `harmonyShare.on('dataReceive', {windowId, capabilities: [{utd: utd.UniformDataType.IMAGE, maxSupportedCount: 1}]}, this.dataReceiveCallback)` | 同上 |
| 跨端分享数据 | sharableTarget.share | `import { harmonyShare } from '@kit.ShareKit';` | `share(data: systemShare.SharedData): Promise<void>` | `target.share(shareData).then(() => { ... })` | 同上 |
| 拒绝分享 | sharableTarget.reject | `import { harmonyShare } from '@kit.ShareKit';` | `reject(error: SharableErrorCode): Promise<void>` | `target.reject(harmonyShare.SharableErrorCode.NO_CONTENT_ERROR)` | 同上 |
| 更新预览图（碰一碰） | sharableTarget.updateShareData | `import { harmonyShare } from '@kit.ShareKit';` | `updateShareData(data: UpdatedData): Promise<void>` | `target.updateShareData({thumbnailUri: '...'})` | 同上 |

## 模块要点
- **核心用途（今天吃什么 app）**：使用 `systemShare`（从 `@kit.ShareKit` 导入）即可完成分享卡片图片到社交/IM 应用的功能。创建 `SharedData` 时设置 `utd` 为图片类型（如 `utd.UniformDataType.PNG`），`uri` 指向卡片图片的应用文件 URI，然后通过 `ShareController.show()` 拉起系统分享面板。
- `@ohos.share.systemShare` 是系统分享的核心 API，支持分享文本、链接、图片、文件等到其他应用。`@ohos.share.harmonyShare` 是华为设备间近场分享（碰一碰、隔空传送），当前 app 场景下不需要使用。
- `SharedData` 最大支持 500 条记录，总大小不超过 IPC 200KB 上限。
- 缩略图（`thumbnail`）限制 32KB 以下，超限可使用 `ImagePacker.packToData()` 压缩。
- `ShareControllerOptions` 的 `previewMode`：图片/视频推荐 `DETAIL` 模式；文本/链接推荐 `DEFAULT` 模式。
- 图片分享时推荐的 `utd` 获取方式：`utd.getUniformDataTypeByFilenameExtension('.jpg', utd.UniformDataType.IMAGE)`。
- 分享面板显示支持锚点定位（`anchor` 属性），不传则居中显示。
- 分享结果通过 `controller.on('shareCompleted')` 回调获取用户选择的分享渠道。
