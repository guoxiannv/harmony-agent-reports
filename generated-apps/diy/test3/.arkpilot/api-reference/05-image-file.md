# 05 — Image & File

## Image

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 显示图片（头像、作品集、课程图片等） | Image | 内置组件（无需导入） | `Image(src: PixelMap \| ResourceStr \| DrawableDescriptor)` | `Image($r('app.media.avatar'))` 或 `Image('https://example.com/photo.jpg')` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/11_图片与视频/01_Image.md` |

关键实现要点：
- 支持 png/jpg/bmp/svg/webp/gif/heif/tiff 格式，不支持 apng/svga。
- 网络图片需要 `ohos.permission.INTERNET` 权限。
- 沙箱文件使用 `file://<bundleName>/<sandboxPath>` URI 传入。
- 从 API version 7 开始支持，适应元服务需 API 11+。
- 图片加载失败时不占位，组件尺寸变为 0。

## ImageAnimator

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 逐帧动画（签到成功动画） | ImageAnimator | 内置组件（无需导入） | `ImageAnimator()` | 设置 `images` 属性传入 `Array<ImageFrameInfo>`，通过 `state` 控制播放 | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/11_图片与视频/02_ImageAnimator.md` |

关键实现要点：
- 通过 `images(value: Array<ImageFrameInfo>)` 设置帧序列，每帧可独立设置路径、尺寸、时长。
- `state(value: AnimationStatus)` 控制播放状态（Initial/Running/Paused/Stopped）。
- `duration` 设置总播放时长（当所有帧未单独设置时长时生效）。
- `iterations` 设置播放次数，`-1` 表示无限循环。
- `reverse` 控制正向/反向播放。

## @ohos.file.picker (PhotoViewPicker)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 选择照片/视频（作品集选择图片） | PhotoViewPicker | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `select(option?: PhotoSelectOptions): Promise<PhotoSelectResult>` | `let photoPicker = new photoAccessHelper.PhotoViewPicker(); photoPicker.select(options).then(result => { ... })` | `04_媒体/08_Media Library Kit（媒体文件管理服务）/01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/06_Class (PhotoViewPicker).md` |

关键实现要点：
- 从 API version 10 开始支持。
- `PhotoSelectOptions` 可设置 `MIMEType`（如 `PhotoViewMIMETypes.IMAGE_TYPE`）和 `maxSelectNumber`。
- 返回的 `PhotoSelectResult.photoUris` 具有永久授权，可通过 `photoAccessHelper.getAssets` 使用。
- 若需重复拉起，需先销毁前一个 PhotoViewPicker 实例。
- 若只想挑选文档/文件，可以使用 `picker.DocumentViewPicker`（来自 `@kit.CoreFileKit`）。

## photoAccessHelper

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 相册管理（访问/修改媒体数据） | photoAccessHelper | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | 为模块入口，提供 `getAssets`、`PhotoViewPicker`、`PhotoAsset` 等 | `photoAccessHelper.getAssets(phAccessHelper, options, predicates)` | `04_媒体/08_Media Library Kit（媒体文件管理服务）/01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/01_模块描述.md` |

关键实现要点：
- 从 API version 10 开始支持。
- 使用前需先通过 `photoAccessHelper.getPhotoAccessHelper(context)` 获取 PhotoAccessHelper 实例。
- 提供创建相册、访问和修改媒体数据的能力。

## @ohos.file.fs (fileIo)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 文件读写/复制/目录管理 | fileIo | `import { fileIo } from '@kit.CoreFileKit'` | `fileIo.openSync`, `fileIo.copyFile`, `fileIo.mkdir`, `fileIo.read`, `fileIo.write` 等 | `fileIo.copyFile(srcPath, dstPath)` | `02_应用框架/09_Core File Kit（文件基础服务）/01_ArkTS API/06_ohos.file.fs (文件管理).md` |

关键实现要点：
- 从 API version 9 开始支持。
- 需通过 `context.filesDir` 获取应用沙箱路径。
- `copyFile(src, dest)` — 复制文件，mode=0 覆盖目标。
- `mkdir(path, recursion)` — 创建目录，`recursion=true` 可递归创建。
- `openSync(path, mode)` — 打开文件，返回 `File` 对象。
- `read(fd, buffer)` / 同步 `readSync` — 读取文件数据。
- `write(fd, buffer)` — 写入文件数据。
- `stat(file)` / `statSync` — 获取文件属性。
- `access(path)` — 检查文件是否存在/权限。
- `close(file)` / `closeSync` — 关闭文件。

## SaveButton

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 安全保存控件（保存图片到相册） | SaveButton | 内置组件（无需导入） | `SaveButton()` / `SaveButton(options: SaveButtonOptions)` | `SaveButton({icon: SaveIconStyle.FULL_FILLED, text: SaveDescription.SAVE_IMAGE, buttonType: ButtonType.Capsule})` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/21_安全/03_SaveButton.md` |

关键实现要点：
- 从 API version 10 开始支持，仅限 Stage 模型。
- 安全控件首次点击弹窗授权后自动授权（API 19-：10 秒；API 20+：1 分钟）。
- `SaveButtonOnClickResult.SUCCESS` (0) 表示授权成功。
- `SaveButtonOptions` 中至少需传入 `icon` 或 `text`，否则 fallback 为默认样式。
- `SaveDescription` 枚举包含 `SAVE_IMAGE`（保存图片）、`SAVE_FILE`（保存文件）、`SAVE_TO_GALLERY`（保存至图库）等。
- 如需在保存后执行文件复制操作，需在 onClick 回调中检查 `result === SaveButtonOnClickResult.SUCCESS`。

## URI (File URI 模式)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 沙箱文件 URI 表示 | file:// URI | 标准 `file://` 格式（配合 `@kit.CoreFileKit` 的 fileUri） | `file://<bundleName>/<sandboxPath>` | `fileUri.getUriFromPath(path)` 将沙箱路径转为 URI | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/11_图片与视频/01_Image.md`（Image 组件文档中列出） |

关键实现要点：
- HarmonyOS 沙箱 URI 格式：`file://<bundleName>/<sandboxPath>`。
- 通过 `fileUri.getUriFromPath(path)` 转换沙箱路径为 URI（来自 `@kit.CoreFileKit`）。
- Image 组件的 `src` 和 `alt` 均支持 `file://` 前缀的字符串。
- 沙箱路径需要保证目录包路径下的文件有可读权限。
- 注意：ArkTS 卡片上不支持 `file://` 路径前缀。

## 模块备注

由于 `@ohos.file.picker` 下的 `DocumentViewPicker` 和 `PhotoViewPicker` 分属不同 Kit（CoreFileKit vs MediaLibraryKit），实现时注意区分：
- 文件选择：`import { picker } from '@kit.CoreFileKit'` → `picker.DocumentViewPicker`
- 图片选择：`import { photoAccessHelper } from '@kit.MediaLibraryKit'` → `photoAccessHelper.PhotoViewPicker`
- 文件操作：`import { fileIo } from '@kit.CoreFileKit'` → `fileIo.*`
