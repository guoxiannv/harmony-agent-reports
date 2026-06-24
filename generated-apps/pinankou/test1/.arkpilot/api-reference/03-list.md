# 03 — List, Scroll & Data Display

## List
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 列表容器，连续多行呈现同类数据（图片和文本） | List | 内置组件，无需额外导入 | `List(options?: ListOptions)` — `ListOptions` 包含 `initialIndex`, `space`, `scroller` | `List({ space: 20, initialIndex: 0 }) { LazyForEach(this.arr, (item: number) => { ListItem() { Text('' + item) } }, (item: number) => item.toString()) }.listDirection(Axis.Vertical).scrollBar(BarState.Off).divider({ strokeWidth: 2, color: 0xFFFFFF })` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/07_滚动与滑动/01_List.md |

## ListItem
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 列表具体项，必须配合 List 使用 | ListItem | 内置组件，无需额外导入 | `ListItem(value?: ListItemOptions)` — `ListItemOptions` 包含 `style: ListItemStyle` 枚举（默认 `ListItemStyle.NONE`） | `ListItem() { Text('' + item).width('100%').height(100).fontSize(16).textAlign(TextAlign.Center) }` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/07_滚动与滑动/02_ListItem.md |

## Scroll
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 可滚动的容器组件，子组件布局尺寸超过父组件时内容可滚动 | Scroll | 内置组件，无需额外导入 | `Scroll(scroller?: Scroller)` — 支持 `Scroller` 控制器绑定 | `Scroll(this.scroller) { Column() { Text('content').height(1000) } }.scrollable(ScrollDirection.Vertical).scrollBar(BarState.Auto)` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/07_滚动与滑动/08_Scroll.md |

## ForEach
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 基于数组数据进行循环渲染，与容器组件配合使用 | ForEach | 内置渲染控制，无需额外导入 | `ForEach(arr: Array<any>, itemGenerator: (item: any, index: number) => void, keyGenerator?: (item: any, index: number) => string)` | `ForEach(this.arr, (item: number) => { Text(item.toString()) }, (item: number) => item.toString())` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/28_状态管理与渲染控制/05_ForEach.md |

## LazyForEach
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 按需迭代数据并创建组件，滑出可视区域时销毁回收以降低内存占用 | LazyForEach | 内置渲染控制，无需额外导入 | `LazyForEach(dataSource: IDataSource, itemGenerator: (item: any, index: number) => void, keyGenerator?: (item: any, index: number) => string)` — `IDataSource` 须实现 `totalCount()`, `getData(index)`, `registerDataChangeListener()` | `LazyForEach(this.arr, (item: number) => { ListItem() { Text('' + item) } }, (item: number) => item.toString())` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/28_状态管理与渲染控制/06_LazyForEach.md |

## Badge
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 信息标记组件，附加在单个组件上用于信息提醒 | Badge | 内置组件，无需额外导入 | `Badge(value: BadgeParamWithNumber | BadgeParamWithString)` — `BadgeParamWithNumber` 含 `count`, `maxCount`, `position`, `style`；`BadgeParamWithString` 含 `value`, `position`, `style` | `Badge({ count: 1, position: BadgePosition.RightTop, style: { badgeSize: 6, badgeColor: Color.Red } }) { Image($r('app.media.icon')) }` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/12_信息展示/03_Badge.md |

## Swiper
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 滑块视图容器，提供子组件滑动轮播显示的能力 | Swiper | 内置组件，无需额外导入 | `Swiper(controller?: SwiperController)` — 支持 `index`, `autoPlay`, `indicator`, `loop`, `disableSwipe` 等属性 | `Swiper(this.controller) { Image($r('app.media.img1')); Image($r('app.media.img2')) }.index(0).autoPlay(true).indicator(true).loop(true)` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/07_滚动与滑动/09_Swiper.md |

## Image
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 图片组件，用于在应用中显示图片，支持 png/jpg/svg/webp/gif/heif/tiff 等格式 | Image | 内置组件，无需额外导入 | `Image(src: PixelMap | ResourceStr | DrawableDescriptor)` — `ResourceStr` 含 `$r('app.media.xxx')` 本地资源或网络 URL。网络图片需 `ohos.permission.INTERNET` | `Image($r('app.media.ic_camera_master_ai_leaf')).width(110).height(110).objectFit(ImageFit.Cover)` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/11_图片与视频/01_Image.md |

## Text
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 显示一段文本的组件，支持 Span/ImageSpan/SymbolSpan 子组件实现图文混排 | Text | 内置组件，无需额外导入 | `Text(content?: string | Resource, value?: TextOptions)` — 支持 `textAlign`, `fontSize`, `fontColor`, `fontWeight`, `lineHeight`, `textOverflow`, `maxLines` 等属性 | `Text('Hello HarmonyOS').fontSize(16).fontColor(Color.Black).textAlign(TextAlign.Center).lineHeight(20)` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/10_文本与输入/01_Text.md |

## Counter
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 计数器组件，提供增加/减少的计数操作 | Counter | 内置组件，无需额外导入 | `Counter()` — 支持 `enableInc(boolean)`、`enableDec(boolean)` 属性；`onInc(event)`、`onDec(event)` 事件 | `Counter() { Text(this.value.toString()) }.onInc(() => { this.value++ }).onDec(() => { this.value-- }).enableInc(true).enableDec(false)` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/12_信息展示/04_Counter.md |

## 模块说明

- 所有列举的组件均为 ArkUI 内置组件/渲染控制语句，**无需 import 导入**，在 `@Component` 中直接使用。
- 使用网络图片时，需要申请权限 `ohos.permission.INTERNET`。
- **LazyForEach 优于 ForEach**：在大量数据场景（如长列表）下，LazyForEach 按需创建/销毁组件，推荐在 List、Swiper 等容器中使用以优化性能。ForEach 会一次性加载所有数据并创建全部子组件。
- Scroll 嵌套 List 且滚动方向相同时，若 List 不设宽高会导致懒加载失效，建议指定 List 的宽高或使用 ListItemGroup。
