# 05 — Lifecycle, Builder & Overlay

## @Component

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 装饰struct，声明一个自定义组件 | @Component | 内置装饰器，无需导入 | `@Component` | `@Component struct MyView { build() { ... } }` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/25_自定义组件/01_自定义组件的生命周期.md |

## @Entry

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 装饰自定义组件作为UI页面的入口，单个页面仅允许一个@Entry | @Entry | 内置装饰器，无需导入 | `@Entry` | `@Entry @Component struct Index { build() { Text('Entry Test') } }` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/25_自定义组件/06_组件扩展装饰器/02_Entry：页面入口.md |

## aboutToAppear

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 自定义组件实例创建后、build()执行前调用，可用于初始化状态变量 | aboutToAppear | 内置生命周期回调，无导入 | `aboutToAppear?(): void` | `aboutToAppear() { this.textColor = Color.Blue; }` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/25_自定义组件/01_自定义组件的生命周期.md |

## aboutToDisappear

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 自定义组件析构销毁时执行，不允许在其中修改状态变量 | aboutToDisappear | 内置生命周期回调，无导入 | `aboutToDisappear?(): void` | `aboutToDisappear() { this.dialogController = null; }` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/25_自定义组件/01_自定义组件的生命周期.md |

## onPageShow

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| router路由页面每次显示时触发（路由跳转、应用进前台） | onPageShow | 内置生命周期回调，无导入 | `onPageShow?(): void` | `onPageShow() { this.textColor = Color.Blue; }` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/25_自定义组件/01_自定义组件的生命周期.md |

## onPageHide

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| router路由页面每次隐藏时触发（路由跳转、应用进后台） | onPageHide | 内置生命周期回调，无导入 | `onPageHide?(): void` | `onPageHide() { this.textColor = Color.Transparent; }` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/25_自定义组件/01_自定义组件的生命周期.md |

## @Builder

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 装饰器：定义自定义构建函数，可全局或局部使用 | @Builder | 内置装饰器，无需导入 | `@Builder` | `@Builder myBuilder() { Column() { Text('content') } }` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/25_自定义组件/06_组件扩展装饰器/03_wrapBuilder.md |

## @LocalBuilder

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 装饰器：定义组件内自定义构建函数，仅当前组件可见 | @LocalBuilder | 内置装饰器，无需导入 | `@LocalBuilder` | `@LocalBuilder myBuilder() { Text('local builder') }` | 无独立API参考文件；在mutableBuilder文档中作为对比提及 |

## @CustomDialog (CustomDialogController)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通过CustomDialogController显示自定义弹窗 | CustomDialogController | 内置，无需导入；装饰器 @CustomDialog | `dialogController: CustomDialogController = new CustomDialogController(CustomDialogControllerOptions)` | `@CustomDialog @Component struct MyDialog { controller?: CustomDialogController; build() { ... } }` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/19_弹窗/03_自定义弹窗 (CustomDialog).md |

## bindSheet (bindSheet属性)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 为组件绑定半模态页面，参数控制显隐、内容和样式 | bindSheet | 组件属性，无需导入 | `bindSheet(isShow: boolean, builder: CustomBuilder, options?: SheetOptions): T` | `.bindSheet($$this.isShow, this.myBuilder(), { height: SheetSize.MEDIUM })` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/02_通用属性/08_模态转场设置/02_半模态转场.md |

## SheetTransition

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 半模态转场概念，通过bindSheet属性的SheetOptions配置实现；非独立API | bindSheet / SheetOptions | 组件属性，无导入 | 参见 bindSheet 条目 | `.bindSheet($$this.isShow, this.myBuilder(), { detents: [SheetSize.MEDIUM, SheetSize.LARGE] })` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/02_通用属性/08_模态转场设置/02_半模态转场.md |

## 模块备注

1. @Component 和 @Builder/@LocalBuilder 是 ArkUI 核心装饰器，在 API 参考中没有独立的 markdown 文件，仅在各类文档中以示例代码和 wrapBuilder/mutableBuilder 扩展文档方式出现。完整的装饰器定义位于 ArkTS 编程语言指南（非 API 参考）。
2. aboutToAppear / aboutToDisappear 从 API version 7 开始支持，onPageShow / onPageHide 从 API version 7 开始支持（元服务 API version 11）。
3. bindSheet 从 API version 10 开始支持，仅限 Stage 模型使用。
4. SheetTransition 并非独立 API 名称，是半模态转场 (bindSheet) 的功能描述，示例中常使用 struct SheetTransitionExample 作为演示组件名。
