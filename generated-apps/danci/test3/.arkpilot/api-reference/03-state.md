# 03 — State Management

## @Watch
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 监听状态变量变化（V1） | @Watch | 内置装饰器，无需导入 | `Watch: (value: string) => PropertyDecorator` | `@State @Watch('onChange') num: number = 0; onChange() { ... }` | 02_ArkTS组件/28_状态管理与渲染控制/03_状态变量变化监听.md |
- 参数 `value` 为回调函数名（字符串），由开发者指定
- 从 API version 7 开始支持，API version 9 起支持 ArkTS 卡片
- @Watch 用于状态管理 V1（@Component），V2 对应 @Monitor/@SyncMonitor

## @Provide
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 提供后代组件可用的状态变量（V1） | @Provide | 内置装饰器，无需导入 | ProvideOptions: `{ allowOverride?: string }` | `@Provide({ allowOverride: 'review' }) count: number = 0;` | 02_ArkTS组件/28_状态管理与渲染控制/02_状态管理V1装饰器参数.md |
- ProvideOptions 从 API version 11 开始支持
- `allowOverride` 参数配置 @Provide 支持被重写，默认不支持重写
- 详细使用方式见 @Provide 和 @Consume 开发指南

## Module Notes
The V1 state management decorators @State, @Prop, @Link, @Consume, @ObjectLink, @Observed, @StorageLink, @StorageProp, @LocalStorageLink, @LocalStorageProp are **built-in ArkUI framework decorators** that do not require imports. They are not defined as standalone API reference documents in the local docs repository — their usage is documented in the HarmonyOS ArkTS developer guides (arkts-guides), not the API references.

- @State, @Prop, @Link, @Consume, @ObjectLink, @Observed — found only as cross-references in error-code docs and component examples; no standalone API definition file exists in the reference docs.
- @StorageLink, @StorageProp — referenced in `01_应用级变量的状态管理.md` as subscribers of AppStorage properties; actual definition is in the dev guide.
- @LocalStorageLink, @LocalStorageProp — referenced in `01_应用级变量的状态管理.md` as subscribers of LocalStorage properties; actual definition is in the dev guide.
- The following decorators are fully documented in the API reference: @Watch (03_状态变量变化监听.md), @Provide options (02_状态管理V1装饰器参数.md).
- The local reference docs under `27_状态管理与渲染控制/` and `28_状态管理与渲染控制/` are duplicate directories with the same content (27 is the more up-to-date version).
