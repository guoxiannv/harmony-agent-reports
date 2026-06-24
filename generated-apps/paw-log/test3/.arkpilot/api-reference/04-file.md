# 04 -- 文件管理 (File)

## @ohos.file.fs (文件管理) -- 基础文件 IO
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 打开文件/目录 | fileIo.open | `import { fileIo } from '@kit.CoreFileKit'` | `open(path: string, mode?: number): Promise<File>` | `fileIo.open(path, fileIo.OpenMode.READ_WRITE \| fileIo.OpenMode.CREATE).then((file) => { ... })` | 02_应用框架/09_Core File Kit（文件基础服务）/01_ArkTS API/06_ohos.file.fs (文件管理).md |
| 同步打开文件/目录 | fileIo.openSync | 同上 | `openSync(path: string, mode?: number): File` | `let file = fileIo.openSync(path, fileIo.OpenMode.READ_WRITE \| fileIo.OpenMode.CREATE)` | 同上 |
| 读取文件数据 | fileIo.read | 同上 | `read(fd: number, buffer: ArrayBuffer, options?: ReadOptions): Promise<number>` | `fileIo.read(file.fd, arrayBuffer).then((readLen) => { ... })` | 同上 |
| 写入数据到文件 | fileIo.write | 同上 | `write(fd: number, buffer: ArrayBuffer \| string, options?: WriteOptions): Promise<number>` | `fileIo.write(file.fd, "hello, world").then((writeLen) => { ... })` | 同上 |
| 创建目录 | fileIo.mkdir | 同上 | `mkdir(path: string, recursion?: boolean): Promise<void>` | `fileIo.mkdir(dirPath, true).then(() => { ... })` | 同上 |
| 检查文件是否存在/权限 | fileIo.access | 同上 | `access(path: string, mode?: AccessModeType): Promise<boolean>` | `fileIo.access(filePath).then((res) => { ... })` | 同上 |
| 列出目录下文件 | fileIo.listFile | 同上 | `listFile(path: string, options?: ListFileOptions): Promise<string[]>` | `fileIo.listFile(pathDir, listFileOption).then((filenames) => { ... })` | 同上 |
| 删除单个文件 | fileIo.unlink | 同上 | `unlink(path: string): Promise<void>` | `fileIo.unlink(filePath).then(() => { ... })` | 同上 |
| 复制文件 | fileIo.copyFile | 同上 | `copyFile(src: string \| number, dest: string \| number, mode?: number): Promise<void>` | `fileIo.copyFile(srcPath, dstPath, 0).then(() => { ... })` | 同上 |
| 重命名文件/目录 | fileIo.rename | 同上 | `rename(oldPath: string, newPath: string): Promise<void>` | `fileIo.rename(srcFile, dstFile).then(() => { ... })` | 同上 |
| 关闭文件句柄 | fileIo.close | 同上 | `close(file: File): Promise<void>` | `fileIo.close(file).then(() => { ... })` | 同上 |
| 获取文件/目录属性 | fileIo.stat | 同上 | `stat(file: string \| number): Promise<Stat>` | `fileIo.stat(path).then((stat) => { ... })` | 同上 |
| 同步写入数据 | fileIo.writeSync | 同上 | `writeSync(fd: number, buffer: ArrayBuffer \| string, options?: WriteOptions): number` | `let writeLen = fileIo.writeSync(file.fd, str)` | 同上 |

## fileUri -- 文件 URI
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 从路径获取 URI | fileUri.getUriFromPath | `import { fileUri } from '@kit.CoreFileKit'` | `getUriFromPath(path: string): string` | `let uri = fileUri.getUriFromPath(pathDir + "/test")` | 02_应用框架/09_Core File Kit（文件基础服务）/01_ArkTS API/05_ohos.file.fileuri (文件URI).md |
| 构造 FileUri 对象 | fileUri.FileUri | `import { fileUri } from '@kit.CoreFileKit'` | `constructor(uriOrPath: string)` | `let fileUriObject = new fileUri.FileUri(uri)` | 同上 |
| 获取文件名称 | FileUri.name | 同上 | `name: string` (只读) | `fileUriObject.name` | 同上 |
| 获取沙箱路径 | FileUri.path | 同上 | `path: string` | `fileUriObject.path` | 同上 |
| URI 转字符串 | FileUri.toString | 同上 | `toString(): string` | `fileUriObject.toString()` | 同上 |

## @ohos.file.picker -- 选择器
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建文档选择器 | picker.DocumentViewPicker | `import { picker } from '@kit.CoreFileKit'` | `constructor(context: Context)` | `let documentPicker = new picker.DocumentViewPicker(context)` | 02_应用框架/09_Core File Kit（文件基础服务）/01_ArkTS API/08_ohos.file.picker (选择器).md |
| 选择文件 | DocumentViewPicker.select | 同上 | `select(option?: DocumentSelectOptions): Promise<Array<string>>` | `documentPicker.select(options).then((uris) => { ... })` | 同上 |
| 保存文件 | DocumentViewPicker.save | 同上 | `save(option?: DocumentSaveOptions): Promise<Array<string>>` | `documentPicker.save(options).then((uris) => { ... })` | 同上 |
| 获取保存后缀类型下标 | DocumentViewPicker.getSelectedIndex | 同上 | `getSelectedIndex(): number` | `let index = documentPicker.getSelectedIndex()` | 同上 |

## securityLabel -- 数据安全标签
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 设置数据安全等级 | securityLabel.setSecurityLabel | `import { securityLabel } from '@kit.CoreFileKit'` | `setSecurityLabel(path: string, type: DataLevel): Promise<void>` | `securityLabel.setSecurityLabel(filePath, "s0").then(() => { ... })` | 02_应用框架/09_Core File Kit（文件基础服务）/01_ArkTS API/09_ohos.file.securityLabel (数据标签).md |
| 获取数据安全等级 | securityLabel.getSecurityLabel | 同上 | `getSecurityLabel(path: string): Promise<string>` | `securityLabel.getSecurityLabel(filePath).then((type) => { ... })` | 同上 |
| 同步设置安全等级 | securityLabel.setSecurityLabelSync | 同上 | `setSecurityLabelSync(path: string, type: DataLevel): void` | `securityLabel.setSecurityLabelSync(filePath, "s0")` | 同上 |
| 同步获取安全等级 | securityLabel.getSecurityLabelSync | 同上 | `getSecurityLabelSync(path: string): string` | `let type = securityLabel.getSecurityLabelSync(filePath)` | 同上 |

## context.filesDir
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取应用沙箱文件目录路径 | context.filesDir | `import { UIAbility } from '@kit.AbilityKit'` | `filesDir: string` (Context 属性，只读) | `let pathDir = this.context.filesDir` (在 UIAbility 中) | 02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/04_接口依赖的元素及定义/02_application/15_Context (Stage模型的上下文基类).md |

## 模块说明

- `@ohos.file.fs` 模块的命名空间导入名为 `fileIo`（非 `fs`），所有基础文件操作 API 均为 `fileIo.*` 形式。
- 所有基础文件操作前需通过 `context.filesDir` 获取应用沙箱路径作为路径前缀。
- 推荐使用 `constructor(context: Context)` 创建 `DocumentViewPicker`，无参构造存在概率性拉起失败问题。
- `securityLabel` 的数据安全等级支持 `s0`~`s4`，未设置时默认返回 `s3`，仅可由低向高或平级设置。
- `fileUri.getUriFromPath` 从 API 9 开始，`FileUri` 类从 API 10 开始支持。
- `@ohos.file.fs` 的 `open` 方法支持传入文件 URI（通过 `fileUri` 模块获取），而 `access`/`mkdir`/`unlink`/`rename`/`listFile` 等需要沙箱路径。
- `File Manager Service Kit` (`@kit.FileManagerServiceKit`) 提供 `fileManagerService.deleteToTrash` 等文件管理扩展能力，不属于基础文件 IO 范畴。
