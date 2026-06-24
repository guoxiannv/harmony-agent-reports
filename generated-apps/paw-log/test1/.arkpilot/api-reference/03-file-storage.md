# 03 — File Storage (文件存储)

## @ohos.file.fs (fileIo)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 基础文件操作模块: 文件基本管理、文件目录管理、文件信息统计、文件流式读写 | `@ohos.file.fs` | `import { fileIo } from '@kit.CoreFileKit';` | 模块内提供 open/mkdir/read/write/copyFile/unlink/stat/close 等接口 | — | `02_应用框架/09_Core File Kit/01_ArkTS API/06_ohos.file.fs (文件管理).md` |

## fileIo.open()
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 打开文件或目录，返回 File 对象（含 fd），支持沙箱路径/URI | `fileIo.open()` | `import { fileIo } from '@kit.CoreFileKit';` | `open(path: string, mode?: number): Promise<File>` | `fileIo.open(path, fileIo.OpenMode.READ_WRITE \| fileIo.OpenMode.CREATE).then((file) => { ... })` | `06_ohos.file.fs (文件管理).md` |

## fileIo.mkdir()
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建目录，API 11+ 支持递归创建 | `fileIo.mkdir()` | `import { fileIo } from '@kit.CoreFileKit';` | `mkdir(path: string, recursion?: boolean): Promise<void>` | `fileIo.mkdir(dirPath).then(() => { ... })` | `06_ohos.file.fs (文件管理).md` |

## fileIo.read()
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 从已打开文件的 fd 读取数据到 ArrayBuffer | `fileIo.read()` | `import { fileIo } from '@kit.CoreFileKit';` | `read(fd: number, buffer: ArrayBuffer, options?: ReadOptions): Promise<number>` | `fileIo.read(file.fd, arrayBuffer).then((readLen) => { ... })` | `06_ohos.file.fs (文件管理).md` |

## fileIo.write()
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 将数据写入已打开文件的 fd，支持 ArrayBuffer 或 string | `fileIo.write()` | `import { fileIo } from '@kit.CoreFileKit';` | `write(fd: number, buffer: ArrayBuffer \| string, options?: WriteOptions): Promise<number>` | `fileIo.write(file.fd, "hello, world").then((writeLen) => { ... })` | `06_ohos.file.fs (文件管理).md` |

## fileIo.copyFile()
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 复制文件，支持路径或 fd | `fileIo.copyFile()` | `import { fileIo } from '@kit.CoreFileKit';` | `copyFile(src: string \| number, dest: string \| number, mode?: number): Promise<void>` | `fileIo.copyFile(srcPath, dstPath, 0).then(() => { ... })` | `06_ohos.file.fs (文件管理).md` |

## fileIo.unlink()
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 删除单个文件（非目录） | `fileIo.unlink()` | `import { fileIo } from '@kit.CoreFileKit';` | `unlink(path: string): Promise<void>` | `fileIo.unlink(filePath).then(() => { ... })` | `06_ohos.file.fs (文件管理).md` |

## fileIo.stat / Stat (fileStat)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取文件/目录详细属性信息（size/mtime/atime/ctime/mode 等） | `fileIo.stat()` | `import { fileIo } from '@kit.CoreFileKit';` | `stat(file: string \| number): Promise<Stat>` | `fileIo.stat(filePath).then((stat) => { let size = stat.size; })` | `06_ohos.file.fs (文件管理).md` |

## @ohos.file.fileuri (fileUri)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通过 PATH 获取文件 URI，或通过 URI 获取文件 name/path | `@ohos.file.fileuri` | `import { fileUri } from '@kit.CoreFileKit';` | `fileUri.getUriFromPath(path: string): string` / `new fileUri.FileUri(uriOrPath)` | `let uri = fileUri.getUriFromPath(path); let obj = new fileUri.FileUri(uri);` | `02_应用框架/09_Core File Kit/01_ArkTS API/05_ohos.file.fileuri (文件URI).md` |

## Context: filesDir / cacheDir (应用沙箱路径)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取应用文件目录 / 缓存目录的沙箱路径（Stage 模型核心入口） | `Context.filesDir` / `Context.cacheDir` | `import { common } from '@kit.AbilityKit';` | `filesDir: string` / `cacheDir: string`（Context 属性） | `let context = this.context; let pathDir = context.filesDir;` | `02_应用框架/01_Ability Kit/01_ArkTS API/04_接口依赖的元素及定义/02_application/15_Context (Stage模型的上下文基类).md` |

## applicationContext
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 应用级上下文，继承自 Context，提供应用生命周期监听等能力 | `ApplicationContext` | `import { common } from '@kit.AbilityKit';` | `type ApplicationContext = _ApplicationContext.default` | `let appContext = context.getApplicationContext();` | `02_应用框架/01_Ability Kit/04_接口依赖的元素及定义/02_application/10_ApplicationContext (应用上下文).md` |

## 模块 Notes

- **沙箱路径获取**: 所有 fileIo 文件操作前必须先通过 `this.context.filesDir` / `this.context.cacheDir` 获取应用沙箱路径作为根目录拼接完整路径。URI 也可作为入参（API 22+），通过 `fileUri` 模块转换。
- **fileIo 同步后缀**: 每个异步方法都有对应的 Sync 同步版本（如 `openSync`、`readSync`、`copyFileSync`），使用后需调用 `closeSync(file)` 关闭 fd。
- **fileIo.open() mode 默认值**: 默认为 `OpenMode.READ_ONLY(0o0)`，需配合 `OpenMode.CREATE(0o100)` 创建新文件。
- **fileIo.read() / write() 要求**: 需先通过 `fileIo.openSync`/`open` 获取 File 对象的 fd，再基于 fd 进行读写。
- **fileIo.stat() 返回值 Stat**: 包含 `size`（文件大小）、`mtime`/`atime`/`ctime`（时间戳）、`mode`（权限）、`isFile()`/`isDirectory()` 等判断方法。
- **fileUri.getUriFromPath**: 将沙箱路径转换为 `file://<bundleName>/data/storage/...` 格式的 URI，用于跨模块文件分享。
- **fileManagerService**: 位于 `@kit.FileManagerServiceKit`，提供 `deleteToTrash`（删除到回收站）、`getFileIconSync`（获取文件图标）等文件管理服务能力，为独立 Kit 模块。
- **文件管理服务 vs Core File Kit**: fileIo (Core File Kit) 负责应用沙箱内的基础文件 IO；fileManagerService (File Manager Service Kit) 负责用户公共目录文件的回收站删除、图标获取等系统级文件管理。
