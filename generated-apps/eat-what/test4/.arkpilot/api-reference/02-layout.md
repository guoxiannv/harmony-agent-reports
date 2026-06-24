# 02 — Layout & Scroll Containers

## Column
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 沿垂直方向布局的容器 | Column | 无额外导入 | `Column(options?: ColumnOptions)` | `Column({ space: 5 }) { Text('item') }` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/04_行列与堆叠/02_Column.md |

Column 未设宽高时在主轴/交叉轴方向自适应子组件大小。支持 `alignItems(HorizontalAlign)`、`justifyContent(FlexAlign)`、`reverse(boolean)`（API 12+）。

## Row
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 沿水平方向布局的容器 | Row | 无额外导入 | `Row(options?: RowOptions)` | `Row({ space: 5 }) { Text('item') }` | 04_行列与堆叠/03_Row.md |

Row 未设宽高时自适应子组件大小。支持 `alignItems(VerticalAlign)`、`justifyContent(FlexAlign)`、`reverse(boolean)`（API 12+）。

## Stack
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 堆叠容器，后一子组件覆盖前一子组件 | Stack | 无额外导入 | `Stack(options?: StackOptions)` | `Stack({ alignContent: Alignment.TopStart }) { Text('a'); Text('b') }` | 04_行列与堆叠/04_Stack.md |

Stack 支持 `alignContent(Alignment)` 属性与构造入参设置对齐方式。API 26+ 新增 `syncLoad(boolean)`。

## Flex
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 弹性布局容器 | Flex | 无额外导入 | `Flex(value?: FlexOptions)` | `Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.Center }) { Text('1') }` | 04_行列与堆叠/01_Flex.md |

Flex 支持 `direction`、`wrap`、`justifyContent`、`alignItems`、`alignContent`、`space`（API 12+，`FlexSpaceOptions` 含 `main`/`cross`）。性能敏感场景建议使用 Column/Row 替代。

## Scroll
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 可滚动的容器组件 | Scroll | `scroller: Scroller = new Scroller()` | `Scroll(scroller?: Scroller)` | `Scroll(this.scroller) { Column() { ... } }.scrollable(ScrollDirection.Vertical)` | 07_滚动与滑动/08_Scroll.md |

支持 `scrollable`、`scrollBar`、`edgeEffect`、`nestedScroll`、`friction`、`enablePaging`、`scrollSnap` 等属性。API 20+ 支持自由滚动与手势缩放（`FREE` 模式 + `minZoomScale`/`maxZoomScale`）。

## List
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 列表容器，包含一系列相同宽度的列表项 | List | `listScroller: ListScroller = new ListScroller()` | `List(options?: ListOptions)` | `List({ space: 20, initialIndex: 0 }) { LazyForEach(...) { ListItem() { ... } } }` | 07_滚动与滑动/01_List.md |

支持懒加载（LazyForEach/Repeat+virtualScroll）。关键属性：`listDirection`、`divider`、`cachedCount`、`edgeEffect`、`lanes`、`alignListItem`、`sticky`、`scrollSnapAlign`、`nestedScroll`、`childrenMainSize`、`maintainVisibleContentPosition`。

## ListItem
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 列表具体 item，必须配合 List 使用 | ListItem | 无额外导入 | `ListItem(value?: ListItemOptions)` | `ListItem() { Text('item') }.swipeAction({ end: { ... } })` | 07_滚动与滑动/02_ListItem.md |

父组件只能是 List 或 ListItemGroup。属性：`selectable`、`selected`、`swipeAction`（含 start/end 划出组件）、`sticky`(deprecated)。API 21+ 支持 `ListItemSwipeActionManager` 编程控制划出菜单。

## Swiper
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 滑块视图容器，子组件滑动轮播 | Swiper | `controller: SwiperController = new SwiperController()` | `Swiper(controller?: SwiperController)` | `Swiper(this.swiperController) { Text('page1'); Text('page2') }.loop(true).autoPlay(true)` | 07_滚动与滑动/09_Swiper.md |

关键属性：`index`、`autoPlay`、`indicator`(DotIndicator/DigitIndicator)、`loop`、`interval`、`duration`、`curve`、`vertical`、`itemSpace`、`cachedCount`、`displayCount`、`displayArrow`、`prevMargin`/`nextMargin`、`disableSwipe`。

## width / height
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 设置组件自身的宽/高 | width / height | 通用属性（所有组件可用） | `width(value: Length): T` / `height(value: Length): T` | `.width('90%').height(100)` | 02_通用属性/02_布局与边框/01_尺寸设置.md |

缺省时使用元素自身内容大小。单位 vp。API 10+ 支持 calc 计算。API 15+ 支持 `LayoutPolicy`（`matchParent`/`wrapContent`/`fixAtIdealSize`）。

## maxWidth (via constraintSize)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 组件最大宽度约束 | constraintSize | 通用属性 | `constraintSize(value: ConstraintSizeOptions)` | `.constraintSize({ maxWidth: 200 })` | 02_通用属性/02_布局与边框/01_尺寸设置.md |

`constraintSize` 包含 `minWidth`/`maxWidth`/`minHeight`/`maxHeight`。优先级高于 `width`/`height`。`maxWidth` 取值参考 `width = MAX(minWidth, MIN(maxWidth, width))`。

## padding
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 设置组件内边距 | padding | 通用属性 | `padding(value: Padding | Length | LocalizedPadding): T` | `.padding({ top: 5, left: 10, bottom: 15, right: 20 })` | 02_通用属性/02_布局与边框/01_尺寸设置.md |

参数为 Length 时四方向同时生效。单位 vp。百分比以父容器 width 为基准。API 12+ 支持 `LocalizedPadding`。

## margin
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 设置组件外边距 | margin | 通用属性 | `margin(value: Margin | Length | LocalizedMargin): T` | `.margin(20)` | 02_通用属性/02_布局与边框/01_尺寸设置.md |

外边距视为组件大小的一部分影响位置。单位 vp。百分比以父容器 width 为基准。API 12+ 支持 `LocalizedMargin`。

## layoutWeight
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 设置布局权重，在父容器主轴方向按权重分配尺寸 | layoutWeight | 通用属性 | `layoutWeight(value: number | string): T` | `.layoutWeight(1)` | 02_通用属性/02_布局与边框/01_尺寸设置.md |

仅在 Row/Column/Flex 中生效。未设 layoutWeight 或值为 0 的元素优先占位，剩余空间按权重分配。设 layoutWeight 后忽略 flexShrink/flexGrow。

## constraintSize
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 设置约束尺寸限制组件尺寸范围 | constraintSize | 通用属性 | `constraintSize(value: ConstraintSizeOptions): T` | `.constraintSize({ maxWidth: 200, maxHeight: 300 })` | 02_通用属性/02_布局与边框/01_尺寸设置.md |

默认值：`{ minWidth: 0, maxWidth: Infinity, minHeight: 0, maxHeight: Infinity }`。优先级高于 width/height。支持 calc 计算（API 10+）。

## vp units
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 屏幕密度相关像素单位，默认单位 | vp | 无导入，数值默认单位 | `vp` 是单位而非函数；`vp2px(value: number): number`（API 18 前） | `.width(220)` 或 `.width('220vp')` | 30_公共定义/02_像素单位.md |

vp 与 px 比例与屏幕密度相关。fp 为字体像素（随系统字体变化），lpx 为视窗逻辑像素（基于 designWidth）。API 18+ 推荐使用 `getUIContext().vp2px()` 替代全局 `vp2px`。

## Module Notes

- Column / Row / Flex 同属线性布局容器族。Column 与 Row 性能优于 Flex（Flex 存在二次布局）。
- `layoutWeight` 仅在 Row / Column / Flex 父容器下生效，会覆盖 flexShrink/flexGrow 行为。
- `constraintSize` 优先级高于 `width`/`height`，可用于实现 `maxWidth` 约束（此属性为 constraintSize 的一部分，无独立 `maxWidth` 属性）。
- `maxWidth` is not a standalone attribute; it is provided via `constraintSize({ maxWidth: value })`.
