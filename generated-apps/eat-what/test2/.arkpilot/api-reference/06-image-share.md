# 06 — Image Capture & Share

## @ohos.arkui.componentSnapshot (组件截图)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取已加载组件的截图（异步，回调） | componentSnapshot.get | `import { componentSnapshot } from '@kit.ArkUI';` | `get(id: string, callback: AsyncCallback<image.PixelMap>, options?: SnapshotOptions): void` | `componentSnapshot.get("root", (err, pixmap) => { this.pixmap = pixmap }, { scale: 2 })` | 02_应用框架/05_ArkUI（方舟UI框架）/01_ArkTS API/01_UI界面/02_ohos.arkui.componentSnapshot (组件截图).md |
| 获取已加载组件的截图（同步） | componentSnapshot.getSync | `import { componentSnapshot } from '@kit.ArkUI';` | `getSync(id: string, options?: SnapshotOptions): image.PixelMap` | `let pixmap = componentSnapshot.getSync("root", { scale: 2 })` | 同上 |
| 离屏渲染自定义组件并截图 | componentSnapshot.createFromBuilder | `import { componentSnapshot } from '@kit.ArkUI';` | `createFromBuilder(builder: CustomBuilder, callback: AsyncCallback<image.PixelMap>, delay?: number, checkImageStatus?: boolean, options?: SnapshotOptions): void` | `componentSnapshot.createFromBuilder(() => { this.RandomBuilder() }, (err, pixmap) => { ... }, 300)` | 同上 |

**注意：** get 和 createFromBuilder 从 API 18 开始废弃，推荐通过 `this.getUIContext().getComponentSnapshot().get()` / `.createFromBuilder()` 替代。

## @ohos.multimedia.image (imagePacker)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建 ImagePacker 实例 | image.createImagePacker | `import { image } from '@kit.ImageKit';` | `createImagePacker(): ImagePacker` | `const packer = image.createImagePacker()` | 04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/06_Interface (ImagePacker).md |
| 将 PixelMap 编码为压缩数据 | ImagePacker.packToData | `import { image } from '@kit.ImageKit';` | `packToData(source: PixelMap, options: PackingOption): Promise<ArrayBuffer>` | `packer.packToData(pixelMap, { format: "image/jpeg", quality: 98 }).then(data => ...)` | 同上 |
| 将 PixelMap 编码写入文件 | ImagePacker.packToFile | `import { image } from '@kit.ImageKit';` | `packToFile(source: PixelMap, fd: number, options: PackingOption): Promise<void>` | `packer.packToFile(pixelMap, file.fd, { format: "image/jpeg", quality: 98 })` | 同上 |
| 释放 ImagePacker 实例 | ImagePacker.release | `import { image } from '@kit.ImageKit';` | `release(): Promise<void>` | `packer.release()` | 同上 |

## @ohos.multimedia.image (PixelMap)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 读取 PixelMap 像素数据到缓冲区 | PixelMap.readPixelsToBuffer | `import { image } from '@kit.ImageKit';` | `readPixelsToBuffer(dst: ArrayBuffer): Promise<void>` | `pixelMap.readPixelsToBuffer(buffer).then(() => ...)` | 04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/15_Interface (PixelMap).md |
| 同步读取 PixelMap 像素数据 | PixelMap.readPixelsToBufferSync | `import { image } from '@kit.ImageKit';` | `readPixelsToBufferSync(dst: ArrayBuffer): void` | `pixelMap.readPixelsToBufferSync(buffer)` | 同上 |

## systemShare（分享）

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建分享控制器 | systemShare.ShareController | `import { systemShare } from '@kit.ShareKit';` | `new ShareController(data: SharedData)` | `let controller = new systemShare.ShareController(shareData)` | 06_应用服务/26_Share Kit（分享服务）/01_ArkTS API/01_systemShare（分享）.md |
| 显示分享面板 | ShareController.show | `import { systemShare } from '@kit.ShareKit';` | `show(context: common.UIAbilityContext, options: ShareControllerOptions): Promise<void>` | `controller.show(context, { previewMode: systemShare.SharePreviewMode.DETAIL })` | 同上 |
| 创建分享数据对象 | systemShare.SharedData | `import { systemShare } from '@kit.ShareKit';` | `new SharedData(record: SharedRecord)` | `new systemShare.SharedData({ utd: utd.UniformDataType.IMAGE, uri: "file://..." })` | 同上 |
| 构造分享数据记录 | systemShare.SharedRecord | `import { systemShare } from '@kit.ShareKit';` | SharedRecord 接口 | `{ utd: "...", title: "...", uri: "...", content: "..." }` 用于描述一条分享数据 | 同上 |

**注意：** SharedRecord 的 thumbnail 限制 32KB 以内，过大的图片可通过 ImagePacker.packToData 压缩。

## @ohos.file.photoAccessHelper（相册管理模块）

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取相册管理实例 | photoAccessHelper.getPhotoAccessHelper | `import { photoAccessHelper } from '@kit.MediaLibraryKit';` | `getPhotoAccessHelper(context: Context): PhotoAccessHelper` | `let helper = photoAccessHelper.getPhotoAccessHelper(context)` | 04_媒体/08_Media Library Kit（媒体文件管理服务）/01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/02_Functions.md |
| 在媒体库中创建文件 | PhotoAccessHelper.createAsset | `import { photoAccessHelper } from '@kit.MediaLibraryKit';` | `createAsset(photoType: PhotoType, extension: string): Promise<string>` | `let uri = await helper.createAsset(photoAccessHelper.PhotoType.IMAGE, 'png')` | 同上 (Interface - PhotoAccessHelper) |

## SaveButton（安全控件）

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 保存控件（默认样式） | SaveButton | 内置组件，无需额外导入 | `SaveButton()` | `SaveButton().onClick((event, result) => { ... })` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/21_安全/03_SaveButton.md |
| 保存控件（指定元素） | SaveButton | 内置组件，无需额外导入 | `SaveButton(options: SaveButtonOptions)` | `SaveButton({ icon: SaveIconStyle.FULL_FILLED, text: SaveDescription.SAVE_IMAGE })` | 同上 |
| 保存控件点击事件 | SaveButton.onClick | 内置组件，无需额外导入 | `onClick(event: SaveButtonCallback)` | `SaveButton().onClick((event, result) => { if (result === SaveButtonOnClickResult.SUCCESS) { ... } })` | 同上 |

**注意：** SaveButton 是安全控件，点击后获取短暂媒体库写入授权（API 19及之前持续10秒，API 20起持续1分钟）。常用于与 photoAccessHelper.createAsset 配合保存图片到图库。

## 模块备注

- 典型图片截取并分享流程：`componentSnapshot.get()` 获取 PixelMap → `image.createImagePacker().packToData(pixelMap, options)` 编码为 ArrayBuffer → 写入文件 → `systemShare.ShareController` 拉起分享面板。
- 保存到图库流程：`SaveButton.onClick` 获取授权 → `photoAccessHelper.getPhotoAccessHelper(context).createAsset()` 创建文件 → 写入编码后的图片数据。
