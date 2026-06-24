# 01 -- Layout & UI Components

## Column
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 垂直方向线性布局容器，子组件沿垂直方向排列 | Column | 内置组件（@kit.ArkUI） | Column(options?: ColumnOptions) / `Column(options?: ColumnOptions \| ColumnOptionsV2)` (API 18+) | `Column({ space: 10 }) { Text('A'); Text('B') }.alignItems(HorizontalAlign.Center)` | 02_应用框架/05_ArkUI/02_ArkTS组件/04_行列与堆叠/02_Column.md |
## Row
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 水平方向线性布局容器，子组件沿水平方向排列 | Row | 内置组件（@kit.ArkUI） | Row(options?: RowOptions) / `Row(options?: RowOptions \| RowOptionsV2)` (API 18+) | `Row({ space: 8 }) { Text('A'); Button('B') }.alignItems(VerticalAlign.Center)` | 02_应用框架/05_ArkUI/02_ArkTS组件/04_行列与堆叠/03_Row.md |
## Stack
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 堆叠容器，子组件按顺序入栈，后者覆盖前者 | Stack | 内置组件（@kit.ArkUI） | Stack(options?: StackOptions) | `Stack({ alignContent: Alignment.TopStart }) { Circle().width(100); Text('overlay') }` | 02_应用框架/05_ArkUI/02_ArkTS组件/04_行列与堆叠/04_Stack.md |
## Text
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 显示一段文本的组件 | Text | 内置组件（@kit.ArkUI） | Text(content?: string \| Resource, value?: TextOptions) | `Text('Hello').fontSize(16).fontColor(Color.Black).textAlign(TextAlign.Center)` | 02_应用框架/05_ArkUI/02_ArkTS组件/10_文本与输入/01_Text.md |
## Button
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 按钮组件，可快速创建不同样式的按钮 | Button | 内置组件（@kit.ArkUI） | Button(options: ButtonOptions) / `Button(label: ResourceStr, options?)` | `Button('Submit').type(ButtonType.ROUNDED_RECTANGLE).onClick(() => {})` | 02_应用框架/05_ArkUI/02_ArkTS组件/09_按钮与选择/01_Button.md |
## Blank
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 空白填充组件，自动填充容器主轴剩余空间 | Blank | 内置组件（@kit.ArkUI） | Blank(min?: number \| string) | `Row() { Text('A'); Blank().color(Color.Yellow); Toggle({ type: ToggleType.Switch }) }.width('100%')` | 02_应用框架/05_ArkUI/02_ArkTS组件/13_空白与分隔/01_Blank.md |
## Divider
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 分割线组件，分隔不同内容块 | Divider | 内置组件（@kit.ArkUI） | Divider() | `Divider().vertical(false).color('#33182431').strokeWidth(1)` | 02_应用框架/05_ArkUI/02_ArkTS组件/13_空白与分隔/02_Divider.md |
## Scroll
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 可滚动的容器组件，子组件超尺寸时可滚动 | Scroll | 内置组件（@kit.ArkUI） | Scroll(scroller?: Scroller) | `Scroll() { Column() { Text('A'); Text('B') } }.scrollable(ScrollDirection.Vertical)` | 02_应用框架/05_ArkUI/02_ArkTS组件/07_滚动与滑动/08_Scroll.md |
## Flex
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 弹性布局容器组件，高效排列对齐子元素并分配剩余空间 | Flex | 内置组件（@kit.ArkUI） | Flex(value?: FlexOptions) | `Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) { Text('A'); Text('B') }` | 02_应用框架/05_ArkUI/02_ArkTS组件/04_行列与堆叠/01_Flex.md |
## Align / justifyContent / alignItems
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 设置子组件在容器主轴/交叉轴的对齐方式 | `justifyContent` / `alignItems` / `alignSelf` | 内置组件方法（@kit.ArkUI） | `justifyContent(value: FlexAlign): T` / `alignItems(value: HorizontalAlign \| VerticalAlign \| ItemAlign): T` | `Column().alignItems(HorizontalAlign.Center).justifyContent(FlexAlign.SpaceBetween)` | 02_应用框架/05_ArkUI/02_ArkTS组件/04_行列与堆叠/02_Column.md, 03_Row.md, 02_通用属性/02_布局与边框/04_Flex布局.md |
## layoutWeight
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 设置组件的布局权重，在父容器主轴按权重分配尺寸 | layoutWeight | 内置组件方法（@kit.ArkUI） | `layoutWeight(value: number \| string): T` | `Row() { Text('A').layoutWeight(1); Text('B').layoutWeight(2) }` — A 占 1/3，B 占 2/3 | 02_应用框架/05_ArkUI/02_ArkTS组件/02_通用属性/02_布局与边框/01_尺寸设置.md |
## Width / Height （尺寸设置）
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 设置组件自身的宽度和高度 | `width` / `height` / `size` / `constraintSize` | 内置组件方法（@kit.ArkUI） | `width(value: Length): T` / `height(value: Length): T` / `size(value: SizeOptions): T` | `Text('Hello').width(100).height(50).size({ width: 200, height: 100 })` | 02_应用框架/05_ArkUI/02_ArkTS组件/02_通用属性/02_布局与边框/01_尺寸设置.md |
## backgroundColor
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 设置组件背景色 | backgroundColor / background | 内置组件方法（@kit.ArkUI） | `backgroundColor(value: ResourceColor): T` / `background(content: CustomBuilder \| ResourceColor, options?: BackgroundOptions)` | `Column().backgroundColor(0xFFFFFF)` / `Column().background(Color.Red, { align: Alignment.Center })` | 02_应用框架/05_ArkUI/02_ArkTS组件/02_通用属性/01_基础属性/04_背景设置.md |
## borderRadius
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 设置组件边框圆角半径 | borderRadius / border | 内置组件方法（@kit.ArkUI） | `borderRadius(value: Length \| BorderRadiuses \| LocalizedBorderRadiuses): T` / `border(value: BorderOptions): T` | `Text('Hello').borderRadius(12)` / `Column().border({ width: 1, color: Color.Gray, radius: 8 })` | 02_应用框架/05_ArkUI/02_ArkTS组件/02_通用属性/02_布局与边框/08_边框设置.md |

## 模块说明

- 所有以上组件和属性均为 HarmonyOS ArkUI 内置，无需额外 import，通过 @kit.ArkUI 按需导入。
- `Flex` 组件在渲染时存在二次布局过程，对性能敏感的场景建议使用 `Column` / `Row` 替代。
- `Column` / `Row` 未设置宽高时自动在主轴或交叉轴方向自适应子组件大小；`Flex` 默认主轴撑满父容器。
- `justifyContent` 在 Column/Row 中设置 `SpaceBetween` / `SpaceAround` / `SpaceEvenly` 时，`space` 间距属性失效。
- `layoutWeight` 仅在 `Row` / `Column` / `Flex` 父容器中生效，且设置了大于 0 的 layoutWeight 后不再按照 `flexShrink` / `flexGrow` 布局。
- `backgroundColor` 默认值为透明（`Color.Transparent`）；同时设置 `background`（CustomBuilder） / `backgroundColor` / `backgroundImage` 时，三者有固定叠加层次。
- `borderRadius` 支持百分比（基于组件宽度），可配合 `clip` 裁剪子组件超出部分。
- `Blank` 仅在 Row / Column / Flex 作为父容器时生效。
- `Scroll` 组件的 `clip` 属性默认值为 `true`。
