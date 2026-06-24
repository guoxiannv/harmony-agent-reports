# 01 -- Layout & Navigation

## Tabs
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 页签容器，通过页签切换内容视图 | Tabs | 内置组件，无需导入 | `Tabs(options?: TabsOptions)` | `Tabs({ barPosition: BarPosition.End, index: 0 }) { TabContent() { ... }.tabBar('tab1') }` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/08_导航与切换/05_Tabs.md |

## TabContent
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 仅在Tabs中使用，对应一个切换页签的内容视图 | TabContent | 内置组件，无需导入 | `TabContent()` | `TabContent() { Column() { ... } }.tabBar(BottomTabBarStyle.of($r('sys.media.ohos_app_icon'), 'home'))` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/08_导航与切换/06_TabContent.md |

## Column
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 沿垂直方向布局的容器，可设置子组件间距 | Column | 内置组件，无需导入 | `Column(options?: ColumnOptions \| ColumnOptionsV2)` | `Column({ space: 10 }) { Text('1'); Text('2') }` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/04_行列与堆叠/02_Column.md |

## Row
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 沿水平方向布局的容器，可设置子组件间距 | Row | 内置组件，无需导入 | `Row(options?: RowOptions \| RowOptionsV2)` | `Row({ space: 12 }) { Text('A'); Text('B') }` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/04_行列与堆叠/03_Row.md |

## Stack
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 堆叠容器，子组件依次入栈，后一个覆盖前一个 | Stack | 内置组件，无需导入 | `Stack(options?: StackOptions)` | `Stack({ alignContent: Alignment.TopStart }) { Text('bottom'); Text('top') }` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/04_行列与堆叠/04_Stack.md |

## Flex
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 弹性布局容器，高效排列/对齐子元素并分配剩余空间 | Flex | 内置组件，无需导入 | `Flex(value?: FlexOptions)` | `Flex({ direction: FlexDirection.Column, wrap: FlexWrap.Wrap }) { Text('A'); Text('B') }` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/04_行列与堆叠/01_Flex.md |

## Scroll
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 可滚动的容器组件，内容超过父组件大小时可滚动 | Scroll | 内置组件，无需导入 | `Scroll(scroller?: Scroller)` | `Scroll() { Column() { ... } }.scrollable(ScrollDirection.Vertical)` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/07_滚动与滑动/08_Scroll.md |

## List
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 列表容器，包含一系列相同宽度的列表项，支持懒加载 | List | 内置组件，无需导入 | `List(options?: ListOptions)` | `List({ space: 10, initialIndex: 0 }) { ListItem() { Text('item') } }` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/07_滚动与滑动/01_List.md |

## Grid
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 网格容器，由行列分割的单元格组成 | Grid | 内置组件，无需导入 | `Grid(scroller?: Scroller, layoutOptions?: GridLayoutOptions)` | `Grid(null, { regularSize: [1, 1] }) { GridItem() { Text('item') } }.columnsTemplate('1fr 1fr')` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/07_滚动与滑动/06_Grid.md |

## Navigation
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 路由导航根视图容器，作为Page根容器，支持NavPathStack路由 | Navigation | 内置组件，无需导入 | `Navigation(pathInfos: NavPathStack)` | `Navigation(new NavPathStack()) {}.title('Home').menus([...])` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/08_导航与切换/02_Navigation.md |

## PageTransition
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 页面间转场动画，定义路由切换时的入场和退场动效 | PageTransitionEnter / PageTransitionExit | 通过pageTransition()生命周期钩子使用 | `PageTransitionEnter(value: PageTransitionOptions)` / `PageTransitionExit(value: PageTransitionOptions)` | `pageTransition() { PageTransitionEnter({ duration: 1200 }).slide(SlideEffect.Left); PageTransitionExit({ duration: 1000 }).opacity(0) }` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/18_动画/04_页面间转场 (pageTransition).md |

## Navigator (deprecated)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 路由容器组件，提供路由跳转能力（已停止维护） | Navigator | 内置组件，无需导入 | `Navigator(value?: {target: string, type?: NavigationType})` | `Navigator({ target: 'pages/Detail', type: NavigationType.Push }) { Text('Go') }` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/31_已停止维护的组件与接口/04_Navigator.md |

## @ohos.router (deprecated)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 页面路由API，通过URL访问不同页面（不推荐） | router | `import { router } from '@kit.ArkUI'` | `router.pushUrl(options: RouterOptions): Promise<void>` | `router.pushUrl({ url: 'pages/Detail' }).then(() => { ... })` | 02_应用框架/05_ArkUI（方舟UI框架）/01_ArkTS API/01_UI界面/22_ohos.router (页面路由)(不推荐).md |

## Module Notes

- **Navigator 组件自 API 13 起停止维护** -- 请使用 `Navigation` 组件替代。
- **@ohos.router 自 API 18 起废弃** -- 推荐使用 `Navigation` 组件 + `NavPathStack` 作为统一路由框架。如需继续使用 router API，应通过 `UIContext.getRouter()` 获取 `Router` 实例。
- **PageTransition** 与 `@ohos.router` 或 `UIContext.getRouter()` 的路由跳转配合使用，通过组件生命周期 `pageTransition()` 钩子中调用。官方推荐使用 Navigation 组件及模态转场以获得更好的转场体验。
- **Tabs** 支持 `BottomTabBarStyle` 和 `SubTabBarStyle` 两种 TabBar 样式，底部导航栏建议使用 `BottomTabBarStyle.of(icon, text)`。
- **Flex** 存在二次布局性能开销，对性能敏感场景建议使用 `Column` / `Row` 替代。
- **List** 推荐配合 `LazyForEach` 或带 `virtualScroll` 的 `Repeat` 实现懒加载。
- **Grid** 推荐通过 `GridLayoutOptions` 设置 `regularSize: [1, 1]` 以提高跳转/列数变化场景的性能。
