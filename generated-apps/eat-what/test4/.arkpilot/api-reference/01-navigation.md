# 01 -- Navigation, Tabs & Sheet Routing

## Tabs

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 页签内容视图切换容器 | Tabs | 内置组件，无需导入 | `Tabs(options?: TabsOptions)` | `Tabs({ barPosition: BarPosition.Start }) { TabContent() { Text('Page1') }.tabBar('tab1') TabContent() { Text('Page2') }.tabBar('tab2') }` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/08_导航与切换/05_Tabs.md` |

**实现要点：** Tabs 仅支持 TabContent 子组件及 `if/else`、`ForEach` 渲染控制。从 API 11 开始默认安全区域避让底部。通过 `TabsController` 控制索引切换（`changeIndex` 带切换动效）。

## TabContent

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| Tabs 中单个页签内容视图 | TabContent | 内置组件，无需导入 | `TabContent()` | `TabContent() { Text('Content') }.tabBar({ text: 'Tab1', icon: $r('app.media.icon') })` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/08_导航与切换/06_TabContent.md` |

**实现要点：** 支持 `SubTabBarStyle`（子页签，文字+下划线/背板）与 `BottomTabBarStyle`（底部页签，图标+文字，无下划线）。`tabBar` 支持 string/Resource/CustomBuilder/TabBarOptions。

## Navigation

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 路由导航根视图容器 | Navigation | 内置组件，无需导入 | `Navigation()` / `Navigation(pathInfos: NavPathStack)` | `Navigation(new NavPathStack()) { Text('Home') .onClick(() => { this.stack.pushPath({ name: 'detail', param: { id: 1 } }) }) } .navDestination((name, param) => { NavDestination() { Text('Detail') } })` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/08_导航与切换/02_Navigation.md` |

**实现要点：** API 10 起推荐使用 `NavPathStack` 配合 `navDestination` 属性进行页面路由。API 9 及之前推荐配合 `NavRouter`。支持单栏(Stack)、分栏(Split)、自适应(Auto)三种模式。`hideTitleBar`、`hideToolBar`、`hideBackButton` 分别控制标题栏/工具栏/返回键显隐。

## Navigator (已停止维护)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 路由容器组件（已停止维护） | Navigator | 内置组件，无需导入 | `Navigator(value?: {target: string, type?: NavigationType})` | `Navigator({ target: 'pages/Detail', type: NavigationType.Push }) { Text('Go') }` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/31_已停止维护的组件与接口/04_Navigator.md` |

**实现要点：** 从 API 13 开始不再维护，建议使用 `Navigation` 组件替代。支持 `Push`、`Replace`、`Back` 三种跳转方式。

## @Entry

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 标识自定义组件为页面入口 | @Entry | 内置装饰器，无需导入 | `@Entry` / `@Entry(options?: EntryOptions)` | `@Entry({ routeName: 'myPage' }) @Component struct Index { build() { Text('Page') } }` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/25_自定义组件/06_组件扩展装饰器/02_Entry：页面入口.md` |

**实现要点：** 一个 UI 页面只能有一个 `@Entry` 装饰的自定义组件。`EntryOptions` 支持 `routeName`（命名路由页名）、`storage`（LocalStorage）、`useSharedStorage`（共享 LocalStorage）。

## CustomDialog

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通过控制器显示的自定义弹窗 | CustomDialog | 内置概念，通过 `@CustomDialog` 装饰器标记 | `@CustomDialog` 装饰 struct | `@CustomDialog @Component struct MyDialog { controller: CustomDialogController; build() { Column() { Text('Dialog content') } } }` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/19_弹窗/03_自定义弹窗 (CustomDialog).md` |

**实现要点：** 使用 `@CustomDialog` 装饰一个 `@Component struct`，通过 `CustomDialogController` 控制显示。优先考虑使用自定义弹窗以便样式自定义。

## CustomDialogController

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 自定义弹窗的控制器 | CustomDialogController | 内置类，无需导入 | `new CustomDialogController(value: CustomDialogControllerOptions)` | `dialogController: CustomDialogController = new CustomDialogController({ builder: MyDialog(), autoCancel: true })` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/19_弹窗/03_自定义弹窗 (CustomDialog).md` |

**实现要点：** 构造函数接收 `CustomDialogControllerOptions`，包含 `builder`（必选，自定义弹窗内容构造器）、`cancel`（返回/ESC/遮罩层关闭回调）、`autoCancel`（是否允许点击遮罩退出）、`alignment`（对齐方式）、`offset`（偏移量）、`customStyle`（是否自定义容器样式）、`maskColor`（遮罩颜色）、`showInSubWindow`（是否在子窗口显示）。通过 `open()` 显示，`close()` 关闭。

## SheetTransition (bindSheet)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 绑定半模态页面到组件 | bindSheet | 内置属性方式，无需导入 | `bindSheet(isShow: boolean, builder: CustomBuilder, options?: SheetOptions): T` | `Button('Show Sheet').bindSheet($$this.isShow, () => { Text('Sheet Content') }, { height: SheetSize.MEDIUM })` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/02_通用属性/08_模态转场设置/02_半模态转场.md` |

**实现要点：** API 10 起支持。`SheetOptions` 支持 `height`/`detents`（高度/挡位）、`preferType`（样式：底部/居中/跟手/侧边）、`showClose`（关闭图标）、`dragBar`（控制条）、`maskColor`（遮罩颜色）、`title`（标题）、`shouldDismiss`/`onWillDismiss`（关闭回调）、`mode`（显示层级：OVERLAY/EMBEDDED）。仅可在 Stage 模型下使用。

## @Component (未在本地参考文档中找到独立页面)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 标记 struct 为自定义组件 | @Component | 内置装饰器，无需导入 | `@Component` | `@Component struct MyComponent { build() { Text('Hello') } }` | 未找到独立参考文档页面 |

## @Builder (未在本地参考文档中找到独立页面)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 自定义构建函数 | @Builder | 内置装饰器，无需导入 | `@Builder MyBuilder() { ... }` | `@Builder RowBuilder() { Row() { Text('Custom') } }` | 未找到独立参考文档页面 |

## @BuilderParam (未在本地参考文档中找到独立页面)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 引用 @Builder 函数或方法 | @BuilderParam | 内置装饰器，无需导入 | `@BuilderParam content: () => void` | `@BuilderParam content: () => void` | 未找到独立参考文档页面 |

## 模块备注

- **导航体系选择：** 新项目应使用 `Navigation` + `NavPathStack`（API 10+），避免使用已停止维护的 `Navigator`（API 13 废弃）和 `@ohos.router`。
- **Tabs 体系：** `Tabs` + `TabContent` 是标准页签切换方案。底部导航可使用 `BottomTabBarStyle`，顶部子导航可使用 `SubTabBarStyle`。
- **弹窗体系：** `@CustomDialog` + `CustomDialogController` 是推荐的自定义弹窗方案；`bindSheet`（半模态转场）用于面板式弹窗。两者均在 Stage 模型下使用。
- **未找到独立页面：** `@Component`、`@Builder`、`@BuilderParam` 为 ArkUI 框架级装饰器，未在当前本地参考文档集中发现独立参考文档页面。其文档位于 HarmonyOS 开发指南（guides）的"自定义组件"章节中，而非 API 参考（references）目录。
