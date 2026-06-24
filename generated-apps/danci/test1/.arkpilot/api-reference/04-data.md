# 04 — Data & Resource Loading

## getContext()

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 在页面中获取当前 Ability 的 Context（从 API 18 起废弃，改用 getHostContext） | getContext | 内置全局函数 | getContext(component?: Object): Context | `let context: Context = getContext(this) as Context;` | 02_应用框架/05_ArkUI（方舟UI框架）/01_ArkTS API/01_UI界面/24_getContext.md |

**注意：** 从 API version 18 开始废弃，建议先获取 UIContext 实例再使用 `getHostContext()`。该接口仅限 Stage 模型使用。

## context.resourceManager

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通过 Ability Context 获取 ResourceManager 对象（Stage 模型） | context.resourceManager | 无需额外导入（通过 Context 获取） | context.resourceManager: ResourceManager | `let resourceManager = context.resourceManager;` | 02_应用框架/14_Localization Kit（本地化开发服务）/01_ArkTS API/03_ohos.resourceManager (资源管理).md |

## resourceManager

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 资源管理模块，提供访问应用资源和系统资源的能力 | @ohos.resourceManager | `import { resourceManager } from '@kit.LocalizationKit';` | — | `import { resourceManager } from '@kit.LocalizationKit';` | 02_应用框架/14_Localization Kit（本地化开发服务）/01_ArkTS API/03_ohos.resourceManager (资源管理).md |

**注意：** Stage 模型下通过 Context 获取资源管理对象，无需导入模块；FA 模型需导入模块后调用 `getResourceManager()`。

## ResourceManager.getStringValue()

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取指定资源 ID 对应的字符串（callback 回调） | ResourceManager.getStringValue | @kit.LocalizationKit | getStringValue(resId: number, callback: AsyncCallback\<string\>): void | `context.resourceManager.getStringValue($r('app.string.test').id, (err, value) => { ... })` | 02_应用框架/14_Localization Kit（本地化开发服务）/01_ArkTS API/03_ohos.resourceManager (资源管理).md |
| 获取指定资源 ID 对应的字符串（Promise 异步） | ResourceManager.getStringValue | @kit.LocalizationKit | getStringValue(resId: number): Promise\<string\> | `context.resourceManager.getStringValue($r('app.string.test').id).then((value) => { ... })` | 02_应用框架/14_Localization Kit（本地化开发服务）/01_ArkTS API/03_ohos.resourceManager (资源管理).md |

## ResourceManager.getRawFileContent()

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取 rawfile 目录下文件内容（同步） | ResourceManager.getRawFileContentSync | @kit.LocalizationKit | getRawFileContentSync(path: string): Uint8Array | `let data: Uint8Array = context.resourceManager.getRawFileContentSync("test.txt");` | 02_应用框架/14_Localization Kit（本地化开发服务）/01_ArkTS API/03_ohos.resourceManager (资源管理).md |
| 获取 rawfile 目录下文件内容（callback 回调） | ResourceManager.getRawFileContent | @kit.LocalizationKit | getRawFileContent(path: string, callback: AsyncCallback\<Uint8Array\>): void | `context.resourceManager.getRawFileContent("test.txt", (err, value) => { ... })` | 02_应用框架/14_Localization Kit（本地化开发服务）/01_ArkTS API/03_ohos.resourceManager (资源管理).md |
| 获取 rawfile 目录下文件内容（Promise 异步） | ResourceManager.getRawFileContent | @kit.LocalizationKit | getRawFileContent(path: string): Promise\<Uint8Array\> | `context.resourceManager.getRawFileContent("test.txt").then((value) => { ... })` | 02_应用框架/14_Localization Kit（本地化开发服务）/01_ArkTS API/03_ohos.resourceManager (资源管理).md |

## rawfile

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| resources/rawfile 目录下的资源文件访问方式 | rawfile | 编译期资源路径 | — | 文件放置在 `src/main/resources/rawfile/` 目录下，通过 `$rawfile()` 或 `resourceManager.getRawFileContent()` 访问 | 02_应用框架/14_Localization Kit（本地化开发服务）/01_ArkTS API/03_ohos.resourceManager (资源管理).md |

## $rawfile()

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 编译期获取 rawfile 目录下的资源信息 | $rawfile | 内置编译期函数（ArkUI） | $rawfile(value: string): Resource | `Image($rawfile("startIcon.png"))` | 02_应用框架/05_ArkUI（方舟UI框架）/01_ArkTS API/01_UI界面/26_arkui/11_Resource.md |

## RawFileDescriptor

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| rawfile 文件所在 HAP 的文件描述符信息 | RawFileDescriptor | `import { resourceManager } from '@kit.LocalizationKit'` | type RawFileDescriptor = _RawFileDescriptor（字段：fd: number, offset: number, length: number） | `let rawfile: resourceManager.RawFileDescriptor = context.resourceManager.getRawFdSync("test.txt");` | 02_应用框架/14_Localization Kit（本地化开发服务）/01_ArkTS API/05_global/01_RawFileDescriptor.md |

## JSON.parse()

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 解析 JSON 字符串生成 ArkTS 对象 | JSON.parse | `import { JSON } from '@kit.ArkTS';` | JSON.parse(text: string, reviver?: Transformer, options?: ParseOptions): Object \| null | `let obj = JSON.parse('{"name":"John","age":30}');` | 02_应用框架/04_ArkTS（方舟编程语言）/01_ArkTS API/17_ohos.util.json (JSON解析与生成).md |

## JSON.stringify()

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 将 ArkTS 对象或数组转换为 JSON 字符串 | JSON.stringify | `import { JSON } from '@kit.ArkTS';` | JSON.stringify(value: Object, replacer?: (number \| string)[] \| null, space?: string \| number): string | `let str = JSON.stringify(person, ["name", "age"]);` | 02_应用框架/04_ArkTS（方舟编程语言）/01_ArkTS API/17_ohos.util.json (JSON解析与生成).md |
| 将 ArkTS 对象通过转换函数序列化为 JSON 字符串 | JSON.stringify | `import { JSON } from '@kit.ArkTS';` | JSON.stringify(value: Object, replacer?: Transformer, space?: string \| number): string | `let str = JSON.stringify(inputObj, replacer);` | 02_应用框架/04_ArkTS（方舟编程语言）/01_ArkTS API/17_ohos.util.json (JSON解析与生成).md |

## Resource

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 资源引用类型，用于设置组件属性的值 | Resource | 内置类型（ArkUI / resourceManager） | type Resource = _Resource（包含资源 ID、包名、模块名等信息） | `Text($r('app.string.app_name'))` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/30_公共定义/01_基础类型定义.md |

## $r()

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 编译期获取应用资源或系统资源的 Resource 对象 | $r | 内置编译期函数（ArkUI） | $r(value: string, ...params: any[]): Resource | `Text($r('app.string.app_name'))` | 02_应用框架/05_ArkUI（方舟UI框架）/01_ArkTS API/01_UI界面/26_arkui/11_Resource.md |

## 模块记录

- **stage模型**：`getContext()`、`context.resourceManager`、`JSON.parse/stringify` 均需在 Stage 模型（ArkTS）下使用。
- **getContext 已废弃**：API 18 起 `getContext()` 废弃，建议使用 `this.getUIContext().getHostContext()`。
- **JSON 模块注意**：ArkTS 的 JSON 模块从 API 12 开始支持，导入路径为 `@kit.ArkTS`，支持线性容器但不支持非线性容器。
- **$m() 未找到**：`$m()`（复数资源访问）未在本地参考文档中找到明确 API 文档，可能仅作为编译期语法存在于 HarmonyOS 资源访问指南中。
