# 05 -- Gesture & Lifecycle

## onClick

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 组件被点击时触发回调 | onClick | 全局内置，无需额外导入 | `onClick(event: (event: ClickEvent) => void): T` (API 7+) / `onClick(event: Callback<ClickEvent>, distanceThreshold: number): T` (API 12+) | `Button('Click').onClick((event) => { console.info('clicked') })` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/01_通用事件/02_交互响应事件/01_点击事件.md` |

## TapGesture

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 单击/双击/多次点击手势识别 | TapGesture | 全局内置，无需额外导入 | `TapGesture(value?: TapGestureParameters)` (API 7+)，参数包括 `count`（点击次数，默认1）、`fingers`（手指数，默认1）、`distanceThreshold`（移动阈值） | `Text('Click twice').gesture(TapGesture({ count: 2 }).onAction((event) => { ... }))` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/03_手势处理/02_基础手势/01_TapGesture.md` |

## onTouch

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 手指、手写笔或鼠标在组件上按下/滑动/抬起时触发 | onTouch | 全局内置，无需额外导入 | `onTouch(event: (event: TouchEvent) => void): T` (API 7+) | `Button('Touch').onTouch((event) => { if (event.type === TouchType.Down) { ... } })` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/01_通用事件/01_基础输入事件/01_触摸事件.md` |

## aboutToAppear

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 自定义组件创建后、build()执行前调用，用于初始化 | aboutToAppear | 全局内置（@Component 生命周期回调） | `aboutToAppear?(): void` (API 7+) | `@Component struct MyComp { aboutToAppear() { console.info('init') } build() { ... } }` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/25_自定义组件/01_自定义组件的生命周期.md` |

## onPageShow

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| @Entry 页面每次显示时触发（路由跳转、切前台等） | onPageShow | 全局内置（@Entry @Component 生命周期回调） | `onPageShow?(): void` (API 7+) | `@Entry @Component struct Index { onPageShow() { this.textColor = Color.Blue } build() { ... } }` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/25_自定义组件/01_自定义组件的生命周期.md` |

## AlertDialog

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 显示警告弹窗，可设置标题/内容/按钮和回调 | AlertDialog | `this.getUIContext().showAlertDialog(...)`（推荐，API 18+）；或 `AlertDialog.show(...)`（已废弃，API 7-17） | `static show(value: AlertDialogParamWithConfirm | AlertDialogParamWithButtons | AlertDialogParamWithOptions): void` (API 7+, deprecated 18+) | `this.getUIContext().showAlertDialog({ title: 'title', message: 'text', confirm: { value: '确定', action: () => {} } })` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/19_弹窗/01_警告弹窗 (AlertDialog).md` |

## Module Notes

- `AlertDialog.show()` 从 API 18 开始废弃，建议统一使用 `getUIContext().showAlertDialog()`。
- `onClick` 和 `TapGesture` 都可实现点击响应，区别在于 `onClick` 是通用事件（自动识别点击），`TapGesture` 是手势对象（可自定义点击次数、手指数、移动阈值），通过 `.gesture()` 绑定。当两者同时存在时，TapGesture 优先级更高。
- `onTouch` 触摸事件默认冒泡，可通过 `event.stopPropagation()` 阻止。
- `aboutToAppear` 和 `onPageShow` 属于自定义组件生命周期：`aboutToAppear` 在组件创建后 build() 前调用（每次创建均触发），`onPageShow` 仅在 @Entry 页面每次显示时触发（路由跳转、切前台等）。
