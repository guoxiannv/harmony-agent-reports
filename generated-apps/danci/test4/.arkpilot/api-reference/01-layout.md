# 01 -- Layout & Basic Components

## Column

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 垂直方向线性布局容器，沿垂直方向排列子组件 | Column | 内置组件，无需导入 | `Column(options?: ColumnOptions)` 设置子组件在水平方向对齐：`.alignItems(value: HorizontalAlign)`，设置子组件在垂直方向对齐：`.justifyContent(value: FlexAlign)`，设置反转排列：`.reverse(isReversed: Optional<boolean>)` | ```ts\nColumn({ space: 5 }) {\n  Text('item1').width('90%').height(30)\n  Text('item2').width('90%').height(30)\n}\n.alignItems(HorizontalAlign.Start)\n.justifyContent(FlexAlign.Center)\n``` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/04_行列与堆叠/02_Column.md |

## Row

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 水平方向线性布局容器，沿水平方向排列子组件 | Row | 内置组件，无需导入 | `Row(options?: RowOptions)` 设置子组件在垂直方向对齐：`.alignItems(value: VerticalAlign)`，设置子组件在水平方向对齐：`.justifyContent(value: FlexAlign)`，设置反转排列：`.reverse(isReversed: Optional<boolean>)` | ```ts\nRow({ space: 5 }) {\n  Text('item1').width('30%').height(50)\n  Text('item2').width('30%').height(50)\n}\n.alignItems(VerticalAlign.Center)\n.justifyContent(FlexAlign.SpaceBetween)\n``` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/04_行列与堆叠/03_Row.md |

## Stack

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 堆叠容器，子组件按顺序入栈，后一个覆盖前一个 | Stack | 内置组件，无需导入 | `Stack(options?: StackOptions)` 设置子组件对齐方式：`.alignContent(value: Alignment)`，设置是否同步加载子组件：`.syncLoad(enable: boolean)` | ```ts\nStack({ alignContent: Alignment.Bottom }) {\n  Text('First').width('90%').height('100%').backgroundColor(0xd2cab3)\n  Text('Second').width('70%').height('60%').backgroundColor(0xc1cbac)\n}.width('100%').height(150)\n``` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/04_行列与堆叠/04_Stack.md |

## Flex

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 弹性布局容器，高效排列、对齐子元素并分配剩余空间 | Flex | 内置组件，无需导入 | `Flex(value?: FlexOptions)` 参数：direction(FlexDirection)、wrap(FlexWrap)、justifyContent(FlexAlign)、alignItems(ItemAlign)、alignContent(FlexAlign)、space(FlexSpaceOptions) | ```ts\nFlex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween }) {\n  Text('1').width('20%').height(50).backgroundColor(0xF5DEB3)\n  Text('2').width('20%').height(50).backgroundColor(0xD2B48C)\n}\n.height(70).width('90%')\n``` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/04_行列与堆叠/01_Flex.md |

## Text

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 显示一段文本的组件，支持图文混排 | Text | 内置组件，无需导入 | `Text(content?: string | Resource, value?: TextOptions)` 支持子组件Span、ImageSpan、SymbolSpan、ContainerSpan。关键属性：`.fontSize(value)`、`.fontColor(value)`、`.fontWeight(value)`、`.textAlign(value)`、`.maxLines(value)`、`.textOverflow(options)`、`.lineHeight(value)`、`.letterSpacing(value)` | ```ts\nText('Hello World')\n  .fontSize(16)\n  .fontColor('#e6182431')\n  .textAlign(TextAlign.Center)\n  .maxLines(2)\n  .textOverflow({ overflow: TextOverflow.Ellipsis })\n``` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/10_文本与输入/01_Text.md |

## Button

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 按钮组件，可快速创建不同样式的按钮 | Button | 内置组件，无需导入 | `Button(options: ButtonOptions)` 或 `Button(label: ResourceStr, options?: ButtonOptions)` 或 `Button()`。ButtonOptions包含：type(ButtonType)、stateEffect(boolean)、buttonStyle(ButtonStyleMode)、controlSize(ControlSize)、role(ButtonRole)。关键属性：`.fontSize(value)`、`.fontColor(value)`、`.fontWeight(value)`、`.labelStyle(value)` | ```ts\nButton('OK', { type: ButtonType.Normal, stateEffect: true })\n  .borderRadius(8)\n  .backgroundColor(0x317aff)\n  .width(90)\n  .onClick(() => { console.info('clicked') })\n``` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/09_按钮与选择/01_Button.md |

## Blank

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 空白填充组件，在容器主轴方向自动填充容器空余空间 | Blank | 内置组件，无需导入 | `Blank(min?: number | string)` 仅在父组件为Row/Column/Flex时生效。支持设置填充颜色：`.color(value: ResourceColor)` | ```ts\nRow() {\n  Text('Bluetooth').fontSize(18)\n  Blank()\n  Toggle({ type: ToggleType.Switch })\n}.width('100%').backgroundColor(0xFFFFFF)\n``` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/13_空白与分隔/01_Blank.md |

## Divider

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 提供分割线组件，用于分隔不同内容块 | Divider | 内置组件，无需导入 | `Divider()` 关键属性：`.vertical(value: boolean)`（水平/垂直分割线）、`.color(value: ResourceColor)`、`.strokeWidth(value: number | string)`、`.lineCap(value: LineCapStyle)` | ```ts\nDivider()\n  .vertical(false)\n  .strokeWidth(8)\n  .color('#F1F3F5')\n  .lineCap(LineCapStyle.Butt)\n``` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/13_空白与分隔/02_Divider.md |

## Image

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 图片组件，用于在应用中显示图片，支持多种格式 | Image | 内置组件，无需导入 | `Image(src: PixelMap | ResourceStr | DrawableDescriptor)` 支持png/jpg/jpeg/bmp/svg/webp/gif/heif/tiff。关键属性：`.alt(value)`（占位图）、`.objectFit(value: ImageFit)`、`.sourceSize(value)`、`.fillColor(value)`（仅SVG）、`.syncLoad(value: boolean)`、`.copyOption(value: CopyOptions)` | ```ts\nImage($r('app.media.example'))\n  .width(110).height(110)\n  .objectFit(ImageFit.Cover)\n  .alt($r('app.media.placeholder'))\n``` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/11_图片与视频/01_Image.md |

## Scroll

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 可滚动的容器组件，子组件布局尺寸超出父组件尺寸时可滚动 | Scroll | 内置组件，无需导入 | `Scroll(scroller?: Scroller)` 关键属性：`.scrollable(value: ScrollDirection)`（滚动方向）、`.scrollBar(barState: BarState)`（滚动条状态）、`.scrollBarColor(value)`、`.scrollBarWidth(value)`、`.edgeEffect(value)`（边缘效果）、`.nestedScroll(value)`（嵌套滚动）、`.friction(value)`（摩擦系数）、`.enablePaging(value: boolean)`（划动翻页） | ```ts\nScroll(this.scroller) {\n  Column() {\n    // content here\n  }.width('100%')\n}\n.scrollable(ScrollDirection.Vertical)\n.scrollBar(BarState.On)\n.edgeEffect(EdgeEffect.Spring)\n``` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/07_滚动与滑动/08_Scroll.md |

## Module Notes

- 所有布局和基础组件都是 ArkUI 内置组件，无需显式 import，可直接在 @Component 中使用。
- Column/Row 未设置高度或宽度时，在主轴或交叉轴方向上自适应子组件大小。
- Flex 组件存在二次布局过程，对性能有要求的场景建议使用 Column/Row 代替。
- Blank 仅在父组件为 Row/Column/Flex 时生效；Divider 不支持子组件。
- Image 使用网络图片时需要申请 ohos.permission.INTERNET 权限。
- Scroll 组件的 clip 属性默认值为 true，子组件超出部分会被裁剪。
- 通用属性（如 width、height、padding、margin、backgroundColor、borderRadius 等）通过通用属性文档查阅：02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/02_通用属性/。
