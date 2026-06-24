# 03 — Controls & Display

## Text
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 显示一段文本 | Text | 内置组件，无需导入 | `Text(content?: string \| Resource, value?: TextOptions)` | `Text('Hello World').fontSize(16).fontColor(Color.Black)` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/10_文本与输入/01_Text.md` |

关键属性：`fontSize`（默认16fp）、`fontColor`（默认#e6182431）、`textAlign`、`maxLines`、`textOverflow`、`lineHeight`、`letterSpacing`、`decoration`、`fontWeight`、`copyOption`、`textSelectable`、`lineSpacing`。支持子组件 Span、ImageSpan、SymbolSpan、ContainerSpan。从 API version 7 开始支持。

## Button
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 按钮组件，可快速创建不同样式的按钮 | Button | 内置组件，无需导入 | `Button(label: ResourceStr, options?: ButtonOptions)` | `Button('OK', { type: ButtonType.Normal, stateEffect: true }).borderRadius(8).backgroundColor(0x317aff)` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/09_按钮与选择/01_Button.md` |

三种接口重载：`Button()`（空按钮）、`Button(label, options?)`（文本按钮）、`Button(options)`（含子组件）。ButtonOptions 支持 `type`（ButtonType 枚举：Normal/Capsule/Circle/ROUNDED_RECTANGLE）、`stateEffect`、`buttonStyle`（ButtonStyleMode：NORMAL/EMPHASIZED/TEXTUAL）、`controlSize`（SMALL/NORMAL）、`role`（NORMAL/ERROR）。属性包括 `fontSize`、`fontColor`、`fontWeight`、`fontStyle`、`labelStyle`、`contentModifier`。从 API version 7 开始支持。

## Progress
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 进度条组件，显示内容加载或操作处理等进度 | Progress | 内置组件，无需导入 | `Progress(options: ProgressOptions)` | `Progress({ value: 10, type: ProgressType.Linear }).width(200)` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/12_信息展示/10_Progress.md` |

ProgressOptions 参数：`value`（当前进度）、`total`（总长，默认100）、`type`（ProgressType 枚举：Linear/Ring/Eclipse/ScaleRing/Capsule）。属性包括 `value`、`color`（支持 ResourceColor 和 LinearGradient 渐变色）、`style`（各类型对应样式选项）。无子组件。从 API version 7 开始支持。

## Module Notes
- 三个组件均为 ArkUI 内置组件，无显式导入声明，直接在 .ets 文件中使用。
- Progress 的 `style` 参数从 API version 8 开始推荐使用 `type` 替代，`style`（ProgressStyle）已废弃。
- Button 的默认 `type` 在 API version 18 之后从 `Capsule` 变更为 `ROUNDED_RECTANGLE`。
