# 01 — Layout Components & Basic UI Elements

## Column
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 垂直方向布局容器，可设置子组件间距 | Column | ArkTS内置组件，无需额外导入 | `Column(options?: ColumnOptions)` 其中 `ColumnOptions.space?: string \| number` 设置子组件垂直间距，默认值0，单位vp | `Column({ space: 5 }) { Text('1'); Text('2') }` | `04_行列与堆叠/02_Column.md` |

## Row
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 水平方向布局容器，可设置子组件间距 | Row | ArkTS内置组件，无需额外导入 | `Row(options?: RowOptions)` 其中 `RowOptions.space?: string \| number` 设置子组件水平间距，默认值0，单位vp | `Row({ space: 5 }) { Text('1'); Text('2') }` | `04_行列与堆叠/03_Row.md` |

## Stack
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 堆叠容器，子组件依次入栈，后一子组件覆盖前一子组件 | Stack | ArkTS内置组件，无需额外导入 | `Stack(options?: StackOptions)` 其中 `StackOptions.alignContent?: Alignment` 设置子组件在容器内对齐方式，默认值 `Alignment.Center` | `Stack({ alignContent: Alignment.Bottom }) { Text('First'); Text('Second') }` | `04_行列与堆叠/04_Stack.md` |

## Flex
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 弹性布局容器，高效排列子元素并分配剩余空间 | Flex | ArkTS内置组件，无需额外导入 | `Flex(value?: FlexOptions)` 可选参数：`direction: FlexDirection`（默认Row）、`wrap: FlexWrap`（默认NoWrap）、`justifyContent: FlexAlign`（默认Start）、`alignItems: ItemAlign`（默认Start）、`space: FlexSpaceOptions12+` | `Flex({ direction: FlexDirection.Row }) { Text('1'); Text('2') }` | `04_行列与堆叠/01_Flex.md` |

## Text
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 显示一段文本的组件 | Text | ArkTS内置组件，无需额外导入 | `Text(content?: string \| Resource, value?: TextOptions)` | `Text('Hello World').fontSize(20).fontColor(0xCCCCCC)` | `10_文本与输入/01_Text.md` |

## Button
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 按钮组件，可快速创建不同样式按钮 | Button | ArkTS内置组件，无需额外导入 | `Button(options: ButtonOptions)` 或 `Button(label: ResourceStr, options?: ButtonOptions)` 或 `Button()` | `Button('OK', { type: ButtonType.Normal }).borderRadius(8).backgroundColor(0x317aff)` | `09_按钮与选择/01_Button.md` |

## Image
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 图片组件，支持png/jpg/svg/webp/gif等格式 | Image | ArkTS内置组件，无需额外导入 | `Image(src: PixelMap \| ResourceStr \| DrawableDescriptor)` | `Image($r('sys.media.ohos_ic_public_voice')).width(16).height(16)` | `11_图片与视频/01_Image.md` |

## Blank
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 空白填充组件，在容器主轴方向自动填充空余部分，仅父组件为Row/Column/Flex时生效 | Blank | ArkTS内置组件，无需额外导入 | `Blank(min?: number \| string)` 最小大小默认值0，单位vp | `Row() { Text('Bluetooth'); Blank(); Toggle({ type: ToggleType.Switch }) }` | `13_空白与分隔/01_Blank.md` |

## Divider
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 分割线组件，分割不同内容块 | Divider | ArkTS内置组件，无需额外导入 | `Divider()` | `Divider().strokeWidth(8).color('#F1F3F5')` | `13_空白与分隔/02_Divider.md` |

## Scroll
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 可滚动的容器组件，子组件尺寸超出父组件时可滚动 | Scroll | ArkTS内置组件，无需额外导入 | `Scroll(scroller?: Scroller)` | `Scroll() { Column() { /* content */ } }.scrollable(ScrollDirection.Vertical)` | `07_滚动与滑动/08_Scroll.md` |

## .width()
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 设置组件自身的宽度，缺省时使用元素自身内容需要的宽度 | .width() | 通用属性，内置支持 | `width(value: Length): T` 单位vp，支持calc计算特性(API 10+) | `Text('Hello').width('90%')` | `02_通用属性/02_布局与边框/01_尺寸设置.md` |

## .height()
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 设置组件自身的高度，缺省时使用元素自身内容需要的高度 | .height() | 通用属性，内置支持 | `height(value: Length): T` 单位vp，支持calc计算特性(API 10+) | `Text('Hello').height(50)` | `02_通用属性/02_布局与边框/01_尺寸设置.md` |

## .padding()
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 设置组件的内边距属性 | .padding() | 通用属性，内置支持 | `padding(value: Padding \| Length \| LocalizedPadding): T` 默认值0，单位vp。百分比以父容器width为基准 | `Text('Hello').padding({ left: 10, right: 10 })` | `02_通用属性/02_布局与边框/01_尺寸设置.md` |

## .margin()
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 设置组件的外边距属性，外边距视为组件大小的一部分影响位置 | .margin() | 通用属性，内置支持 | `margin(value: Margin \| Length \| LocalizedMargin): T` 默认值0，单位vp。百分比以父容器width为基准 | `Text('Hello').margin({ top: 5 })` | `02_通用属性/02_布局与边框/01_尺寸设置.md` |

## .backgroundColor()
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 设置组件背景颜色 | .backgroundColor() | 通用属性，内置支持 | `backgroundColor(value: ResourceColor): T` | `Column().backgroundColor(0xAFEEEE)` | `02_通用属性/01_基础属性/04_背景设置.md` |

## .borderRadius()
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 设置边框的圆角半径，支持百分比，百分比依据组件宽度 | .borderRadius() | 通用属性，内置支持 | `borderRadius(value: Length \| BorderRadiuses \| LocalizedBorderRadiuses): T` | `Button('OK').borderRadius(8)` | `02_通用属性/02_布局与边框/08_边框设置.md` |

## .fontSize()
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 设置字体大小，number类型使用fp单位 | .fontSize() | Text/Button组件通用属性 | `fontSize(value: number \| string \| Resource): T` 默认值16fp | `Text('Hello').fontSize(20)` | `10_文本与输入/01_Text.md` |

## .fontWeight()
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 设置文本的字体粗细，number类型取值[100, 900]，间隔100 | .fontWeight() | Text/Button组件通用属性 | `fontWeight(value: number \| FontWeight \| ResourceStr): T` 默认值FontWeight.Normal(400) | `Text('Hello').fontWeight(FontWeight.Bold)` | `10_文本与输入/01_Text.md` |

## .textAlign()
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 设置文本段落在水平方向的对齐方式 | .textAlign() | Text组件属性 | `textAlign(value: TextAlign): T` 默认值TextAlign.Start | `Text('Hello').textAlign(TextAlign.Center)` | `10_文本与输入/01_Text.md` |

## .id()
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 组件的唯一标识，在整个应用内唯一（API 8+） | .id() | 通用属性，内置支持 | `id(value: string): T` | `Button('Click').id('myButton')` | `02_通用属性/01_基础属性/01_组件标识.md` |

## .alignItems()
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| Column: 设置子组件水平对齐；Row: 设置子组件垂直对齐 | .alignItems() | Column/Row特有属性 | Column: `alignItems(value: HorizontalAlign): T` 默认值HorizontalAlign.Center；Row: `alignItems(value: VerticalAlign): T` 默认值VerticalAlign.Center | `Column().alignItems(HorizontalAlign.Start)` | `04_行列与堆叠/02_Column.md`、`04_行列与堆叠/03_Row.md` |

## .justifyContent()
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| Column: 设置子组件垂直对齐；Row: 设置子组件水平对齐（API 8+） | .justifyContent() | Column/Row特有属性 | `justifyContent(value: FlexAlign): T` 默认值FlexAlign.Start | `Column().justifyContent(FlexAlign.Center)` | `04_行列与堆叠/02_Column.md`、`04_行列与堆叠/03_Row.md` |

## .space()
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| Column/Row的子组件间距（构造参数）；Flex的间距（构造参数支持主轴交叉轴） | .space() | Column/Row/Flex构造参数，非链式方法 | Column/Row: 构造参数`{ space: number }`；Flex: 构造参数`{ space: {main: LengthMetrics, cross: LengthMetrics} }`(12+) | `Column({ space: 5 })`、`Row({ space: 5 })` | `04_行列与堆叠/02_Column.md` |

## .onClick()
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 组件被点击时触发的事件回调 | .onClick() | 通用事件，内置支持 | `onClick(event: (event: ClickEvent) => void): T` | `Button('OK').onClick(() => { console.info('clicked') })` | `01_通用事件/02_交互响应事件/01_点击事件.md` |

## Module Notes

- `space` 在 Column 和 Row 中仅作为构造参数传入（`Column({ space: 5 })`），并非链式属性方法。链式写法 `.space()` 不存在，应使用构造参数配置。
- Flex 的 `space` 参数需导入 `LengthMetrics`（`import {LengthMetrics} from '@kit.ArkUI'`），支持主轴和交叉轴分别设置。
- Column、Row、Flex 的 `justifyContent` 属性从 API 8 开始支持。
- Image 组件使用网络图片时需要申请 `ohos.permission.INTERNET` 权限。
- Column、Row 不在主轴设置大小时默认自适应子组件大小；Flex 主轴不设置大小时默认撑满父容器。
- Scroll 组件通用属性 `clip` 默认值为 `true`。
- Flex 组件在渲染时存在二次布局过程，对性能要求严格时应改用 Column/Row 替代。
