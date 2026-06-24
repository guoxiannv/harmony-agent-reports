# 01 — Layout & Container Components

## Column

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 沿垂直方向布局的容器，可设置子组件间距 | Column | 内置组件（无需额外import） | `Column(options?: ColumnOptions)` | `Column({ space: 5 }) { Text('item') }` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/04_行列与堆叠/02_Column.md` |

## Row

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 沿水平方向布局的容器，可设置子组件间距 | Row | 内置组件（无需额外import） | `Row(options?: RowOptions)` | `Row({ space: 5 }) { Text('item') }` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/04_行列与堆叠/03_Row.md` |

## Stack

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 堆叠容器，子组件依次入栈，后一个覆盖前一个 | Stack | 内置组件（无需额外import） | `Stack(options?: StackOptions)` | `Stack({ alignContent: Alignment.Bottom }) { Text('first'); Text('second') }` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/04_行列与堆叠/04_Stack.md` |

## Flex

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 以弹性方式布局子组件的容器，可高效排列、对齐子元素并分配剩余空间 | Flex | 内置组件（无需额外import）；使用空间参数时需导入 `import { LengthMetrics } from '@kit.ArkUI'` | `Flex(value?: FlexOptions)` | `Flex({ direction: FlexDirection.Row }) { Text('1').width('20%'); Text('2').width('20%') }` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/04_行列与堆叠/01_Flex.md` |

## Scroll

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 可滚动的容器组件，当子组件尺寸超出父组件时内容可滚动 | Scroll | 内置组件（无需额外import）；Scroller 控制器无需额外import；动画曲线需 `import { curves } from '@kit.ArkUI'` | `Scroll(scroller?: Scroller)` | `Scroll(this.scroller) { Column() { Text('item') } }` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/07_滚动与滑动/08_Scroll.md` |

## List

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 列表容器，包含一系列相同宽度的列表项，适合连续多行呈现同类数据 | List | 内置组件（无需额外import） | `List(options?: ListOptions)` | `List({ space: 10 }) { ForEach(arr, item => { ListItem() { Text('item-' + item) } }) }` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/07_滚动与滑动/01_List.md` |

## Grid / ForEach

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 网格容器，由"行"和"列"分割的单元格组成 | Grid | 内置组件（无需额外import） | `Grid(scroller?: Scroller, layoutOptions?: GridLayoutOptions)` | `Grid() { ForEach(this.numbers, day => { GridItem() { Text(day) } }) }.columnsTemplate('1fr 1fr 1fr')` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/07_滚动与滑动/06_Grid.md` |
| 基于数组类型数据进行循环渲染（渲染控制语法） | ForEach | 内置渲染控制语法（无需额外import） | `ForEach(arr: Array<any>, itemGenerator: (item: any, index: number) => void, keyGenerator?: (item: any, index: number) => string)` | `ForEach(this.arr, (item: number) => { Text(item.toString()) }, (item: number) => item.toString())` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/28_状态管理与渲染控制/05_ForEach.md` |

## Tabs / TabContent

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通过页签进行内容视图切换的容器组件 | Tabs | 内置组件（无需额外import） | `Tabs(options?: TabsOptions)` | `Tabs() { TabContent() { Column() }.tabBar(SubTabBarStyle.of('Tab1')) }` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/08_导航与切换/05_Tabs.md` |
| 对应TabContent页签切换的内容视图 | TabContent | 内置组件（无需额外import） | `TabContent()` (通过 `.tabBar()` 属性设置导航文字/样式) | `TabContent() { Text('内容') }.tabBar('页面标题')` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/08_导航与切换/06_TabContent.md` |

## Blank

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 空白填充组件，在容器主轴方向上自动填充容器空余部分（仅当父组件为 Row/Column/Flex 时生效） | Blank | 内置组件（无需额外import） | `Blank(min?: number | string)` | `Row() { Text('Bluetooth'); Blank(); Toggle({ type: ToggleType.Switch }) }` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/13_空白与分隔/01_Blank.md` |

## Divider

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 提供分割线组件，分割不同内容块/内容元素 | Divider | 内置组件（无需额外import） | `Divider()` | `Divider().strokeWidth(8).color('#F1F3F5')` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/13_空白与分隔/02_Divider.md` |

## Badge

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 信息标记组件，附加在单个组件上用于信息提醒 | Badge | 内置组件（无需额外import） | `Badge(value: BadgeParamWithNumber)` / `Badge(value: BadgeParamWithString)` | `Badge({ count: 1, style: {}, position: BadgePosition.RightTop }) { Image($r('app.media.startIcon')) }` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/12_信息展示/03_Badge.md` |

## Swiper

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 滑块视图容器，提供子组件滑动轮播显示的能力 | Swiper | 内置组件（无需额外import）；SwiperController 无需额外import | `Swiper(controller?: SwiperController)` | `Swiper(this.swiperController) { Text('slide1'); Text('slide2') }.autoPlay(true)` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/07_滚动与滑动/09_Swiper.md` |

## router (page routing)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 提供通过不同 url 访问不同页面的页面路由能力（不推荐，建议使用 Navigation 组件替代） | router | `import { router } from '@kit.ArkUI'` | `router.pushUrl(options: RouterOptions): Promise<void>` | `router.pushUrl({ url: 'pages/routerpage2', params: new RouterParams('message', [123, 456, 789]) })` | `02_应用框架/05_ArkUI（方舟UI框架）/01_ArkTS API/01_UI界面/22_ohos.router (页面路由)(不推荐).md` |

## Module Notes

- 上述所有布局容器组件（Column/Row/Stack/Flex/Scroll/List/Grid/Swiper/Tabs/Badge/Blank/Divider）均为 ArkUI 内置组件，继承自 Component，在 ArkTS 中可直接使用，无需额外 import 语句。
- **性能建议**: Flex 组件在渲染时存在二次布局过程，对性能要求高的场景推荐使用 Column/Row 替代。Scroll 嵌套 List 时若 List 不设置宽高则默认全部加载，建议指定 List 宽高。
- **ForEach vs LazyForEach**: ForEach 一次性创建所有子节点（按需布局/渲染），LazyForEach 按需创建（划出屏幕销毁），对大数据集推荐 LazyForEach。
- **router 废弃**: `@ohos.router` 从 API version 18 开始废弃，推荐使用 Navigation 组件或 `this.getUIContext().getRouter()` 替代。
- Badge 支持数字型（`BadgeParamWithNumber`）和字符串型（`BadgeParamWithString`）两种构造参数。
- Blank 仅在父组件为 Row/Column/Flex 时生效，交叉轴默认 `alignSelf: ItemAlign.Stretch`。
