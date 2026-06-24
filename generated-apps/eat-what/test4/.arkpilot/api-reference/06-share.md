# 06 — Share Card & Image Export

## systemShare (分享)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建分享数据记录并拉起系统分享面板 | `systemShare` | `import { systemShare } from '@kit.ShareKit'` | `systemShare.execute(data: SharedData, controllerOptions?: ShareControllerOptions): Promise<void>` | `systemShare.execute({ sharedRecords: [{ utd: 'general.image', uri: '...' }] })` | `06_应用服务/26_Share Kit（分享服务）/01_ArkTS API/01_systemShare（分享）.md` |

**SharedRecord** 字段：`utd` (必需), `title`, `label`, `description`, `thumbnail` (Uint8Array, <=32KB), `thumbnailUri`, `uri`, `content`, `extraData`, `revisitShareRecordData`。

## harmonyShare (华为分享)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 华为设备间跨端分享事件注册 | `harmonyShare` | `import { harmonyShare } from '@kit.ShareKit'` | `harmonyShare.share(data: systemShare.SharedData): Promise<void>` | `harmonyShare.share({ sharedRecords: [...] })` | `06_应用服务/26_Share Kit（分享服务）/01_ArkTS API/02_harmonyShare（华为分享）.md` |

## ohos.multimedia.image (图片处理)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 图片处理模块入口，提供编解码/编辑/元数据处理能力 | `image` | `import { image } from '@kit.ImageKit'` | 模块级命名空间 | `image.createImagePacker()` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/01_模块描述.md` |

## image.createImagePacker

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建 ImagePacker 实例用于图片编码 | `image.createImagePacker` | `import { image } from '@kit.ImageKit'` | `createImagePacker(): ImagePacker` | `const packer: image.ImagePacker = image.createImagePacker()` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/02_Functions.md` |

## image.ImagePacker

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 图片编码器，支持 packToData/packToFile/packing/release | `image.ImagePacker` | `import { image } from '@kit.ImageKit'` | `interface ImagePacker { packToData(source, options): Promise<ArrayBuffer>; release(): void }` | `packer.packToData(pixelMap, { format: 'image/jpeg', quality: 98 })` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/06_Interface (ImagePacker).md` |

## image.PackingOption

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 图片编码选项：格式、质量、缓冲区大小、动态范围 | `PackingOption` | 通过 `image` 命名空间引用 | `interface PackingOption { format: string; quality: number; bufferSize?: number; desiredDynamicRange?: PackingDynamicRange; needsPackProperties?: boolean }` | `{ format: 'image/jpeg', quality: 98 }` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/16_Interfaces (其他).md` |

## ohos.window (窗口)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 窗口管理模块，提供 Window/WindowStage 接口 | `window` | `import { window } from '@kit.ArkUI'` | 模块级命名空间 | `window.getLastWindow(context)` | `02_应用框架/05_ArkUI（方舟UI框架）/01_ArkTS API/02_窗口管理/03_ohos.window (窗口)/01_模块描述.md` |

## window.snapshot (窗口截图)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取当前窗口截图，返回 PixelMap | `window.snapshot` | `import { window } from '@kit.ArkUI'` | `snapshot(): Promise<image.PixelMap>` 或 `snapshot(callback: AsyncCallback<image.PixelMap>): void` | `windowClass.snapshot().then(pixelMap => { ... })` | `02_应用框架/05_ArkUI（方舟UI框架）/01_ArkTS API/02_窗口管理/03_ohos.window (窗口)/03_Interface (Window).md` |

## ohos.pasteboard (剪贴板)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 系统剪贴板模块，支持文本/HTML/URI/Want/PixelMap 操作 | `pasteboard` | `import { pasteboard } from '@kit.BasicServicesKit'` | 模块级命名空间 | `pasteboard.getSystemPasteboard()` | `03_系统/03_基础功能/01_Basic Services Kit（基础服务）/01_ArkTS API/03_数据文件处理/02_ohos.pasteboard (剪贴板).md` |

## pasteboard.createData

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建剪贴板内容对象（支持单类型或多类型） | `pasteboard.createData` | `import { pasteboard } from '@kit.BasicServicesKit'` | `createData(mimeType: string, value: ValueType): PasteData` 或 `createData(data: Record<string, ValueType>): PasteData` | `pasteboard.createData({ 'text/plain': 'hello', 'pixelMap': pixelMap })` | `03_系统/03_基础功能/01_Basic Services Kit（基础服务）/01_ArkTS API/03_数据文件处理/02_ohos.pasteboard (剪贴板).md` |

## pasteboard.setData (SystemPasteboard.setData)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 将 PasteData 写入系统剪贴板 | `systemPasteboard.setData` | `import { pasteboard } from '@kit.BasicServicesKit'` | `setData(data: PasteData): Promise<void>` 或 `setData(data: PasteData, callback): void` | `pasteboard.getSystemPasteboard().setData(pasteData)` | `03_系统/03_基础功能/01_Basic Services Kit（基础服务）/01_ArkTS API/03_数据文件处理/02_ohos.pasteboard (剪贴板).md` |

## componentSnapshot (组件截图)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取组件截图能力（支持已加载或自定义 Builder 组件） | `componentSnapshot` | `import { componentSnapshot } from '@kit.ArkUI'` | 模块级命名空间 | `import { componentSnapshot } from '@kit.ArkUI'` | `02_应用框架/05_ArkUI（方舟UI框架）/01_ArkTS API/01_UI界面/02_ohos.arkui.componentSnapshot (组件截图).md` |

## ComponentSnapshot.get (UIContext 方式，推荐)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通过 UIContext 获取 ComponentSnapshot 对象并截图 | `ComponentSnapshot.get` | `import { componentSnapshot } from '@kit.ArkUI'` | `get(id: string, options?: SnapshotOptions): Promise<image.PixelMap>` | `this.getUIContext().getComponentSnapshot().get('root', { scale: 2 })` | `02_应用框架/05_ArkUI（方舟UI框架）/01_ArkTS API/01_UI界面/12_ohos.arkui.UIContext (UIContext)/02_Class (ComponentSnapshot).md` |

## 模块备注

- **`ohos.share`** 并非有效的模块名。分享服务使用 `@kit.ShareKit`，其下分为 `systemShare`（系统分享面板）和 `harmonyShare`（华为跨端分享）两个子模块。正确导入：`import { systemShare } from '@kit.ShareKit'` 或 `import { harmonyShare } from '@kit.ShareKit'`。
- **`window.screenshot`** 并非 API 名。窗口截图的正确 API 是 `window.snapshot()`（Window 实例方法，返回 `Promise<image.PixelMap>`）。另外还存在独立的 `@ohos.screenshot` 模块用于系统级截图。
- **`component.snapshot`** 并非独立 API。组件截图推荐通过 `UIContext.getComponentSnapshot().get()` 获取。`componentSnapshot.get()` (直接导入) 已从 API 18 废弃，建议迁移到 UIContext 方式。
- 使用 `image.PackingOption` 时注意：format 字段为 MIME 字符串（如 `'image/jpeg'`），quality 仅对 JPEG/HEIF 生效，取值范围 0-100。
- `systemPasteboard.setData()` 是 SystemPasteboard 实例方法，不是 `pasteboard` 的直接函数。需要先调用 `pasteboard.getSystemPasteboard()` 获取实例。
- 组件截图和窗口截图的区别：组件截图只截取组件内容区域，不包含兄弟或父组件；窗口截图截取整个窗口画面。
