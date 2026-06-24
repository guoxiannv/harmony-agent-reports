# 06 — Page & App Lifecycle

## @Entry

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 声明自定义组件为UI页面的入口；每个页面仅允许一个@Entry装饰的组件 | @Entry | 内置装饰器，无需导入 | `@Entry` 或 `@Entry({ routeName?: string, storage?: LocalStorage, useSharedStorage?: boolean })` | `@Entry @Component struct Index { build() { Text('@Entry Test') } }` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/25_自定义组件/06_组件扩展装饰器/02_Entry：页面入口.md |

## @Component

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 声明一个自定义组件，必须配合struct使用；是自定义组件的基本单元 | @Component | 内置装饰器，无需导入 | `@Component` 装饰 struct | `@Component struct MyComponent { build() { Column() {} } }` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/25_自定义组件/01_自定义组件的生命周期.md |

## aboutToAppear / aboutToDisappear

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 组件创建后build()前调用，可修改状态变量 | aboutToAppear | 内置生命周期回调，无需导入 | `aboutToAppear?(): void` | `@Component struct MyComp { aboutToAppear() { this.data = 'init' } }` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/25_自定义组件/01_自定义组件的生命周期.md |
| 组件销毁前调用，执行资源清理 | aboutToDisappear | 内置生命周期回调，无需导入 | `aboutToDisappear?(): void` | `@Component struct MyComp { aboutToDisappear() { console.info('destroy') } }` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/25_自定义组件/01_自定义组件的生命周期.md |

## onPageShow / onPageHide

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| @Entry页面每次显示时触发（路由跳转、应用进入前台） | onPageShow | 内置生命周期回调，无需导入 | `onPageShow?(): void` | `@Entry @Component struct Index { onPageShow() { this.textColor = Color.Blue } }` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/25_自定义组件/01_自定义组件的生命周期.md |
| @Entry页面每次隐藏时触发（路由跳转、应用进入后台） | onPageHide | 内置生命周期回调，无需导入 | `onPageHide?(): void` | `@Entry @Component struct Index { onPageHide() { this.textColor = Color.Transparent } }` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/25_自定义组件/01_自定义组件的生命周期.md |

## UIAbility.onCreate / onDestroy

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| UIAbility实例创建时触发，执行初始化逻辑 | onCreate | `import { UIAbility } from '@kit.AbilityKit'` | `onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void` | `class MyAbility extends UIAbility { onCreate(want, launchParam) { hilog.info(...) } }` | 02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/01_Stage模型能力的接口/36_ohos.app.ability.UIAbility (带界面的应用组件).md |
| UIAbility被销毁时触发，执行资源清理和数据保存 | onDestroy | `import { UIAbility } from '@kit.AbilityKit'` | `onDestroy(): void | Promise<void>` | `class MyAbility extends UIAbility { onDestroy() { hilog.info('destroy') } }` | 02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/01_Stage模型能力的接口/36_ohos.app.ability.UIAbility (带界面的应用组件).md |

## window.getLastWindow

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取当前应用内层级最高的子窗口或主窗口 | window.getLastWindow | `import { window } from '@kit.ArkUI'` | `getLastWindow(ctx: BaseContext, callback: AsyncCallback<Window>): void` 或 `getLastWindow(ctx: BaseContext): Promise<Window>` | `window.getLastWindow(this.context).then((topWin) => { ... })` | 02_应用框架/05_ArkUI（方舟UI框架）/01_ArkTS API/02_窗口管理/03_ohos.window (窗口)/02_Functions.md |

## 页面可见性

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| @Entry页面可见性：通过onPageShow/onPageHide监听页面显示与隐藏 | onPageShow / onPageHide | 内置生命周期回调，无需导入 | `onPageShow?(): void; onPageHide?(): void` | `@Entry @Component struct Page { onPageShow() { /* 页面可见时执行 */ } onPageHide() { /* 页面不可见时执行 */ } }` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/25_自定义组件/01_自定义组件的生命周期.md |

## 模块说明

- `@Entry` 与 `@Component` 是 ArkUI 内置装饰器，无需显式 import，直接声明使用即可。
- `aboutToAppear/aboutToDisappear` 适用于所有自定义组件生命周期。`onPageShow/onPageHide` 仅适用于 `@Entry` 装饰的页面级组件。
- `UIAbility.onCreate/onDestroy` 是应用级生命周期，位于 Ability Kit（`@kit.AbilityKit`），与组件级生命周期 (`aboutToAppear/aboutToDisappear`) 作用范围不同。UIAbility 是应用进程的入口，其 `onCreate` 仅在冷启动时触发。
- HarmonyOS 中没有单独的"页面可见性"API；该能力通过 `onPageShow`（页面可见）和 `onPageHide`（页面不可见）两个回调实现。
- `window.getLastWindow` 用于获取当前应用内层级最高的窗口对象，用于窗口属性设置或状态查询场景。
- 从 API version 23 开始，HarmonyOS 提供了新生命周期装饰器模式 (`@ComponentInit`, `@ComponentAppear`, `@ComponentBuilt`, `@ComponentDisappear`) 作为旧回调模式的推荐替代。
