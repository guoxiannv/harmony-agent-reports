# 01 — 布局与导航 Layout Navigation

## Column
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 垂直方向线性布局容器 | Column | 内置组件，无需导入 | Column(options?: ColumnOptions) | `Column({ space: 10 }) { Text('item1'); Text('item2') }` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/04_行列与堆叠/02_Column.md` |

## Row
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 水平方向线性布局容器 | Row | 内置组件，无需导入 | Row(options?: RowOptions) | `Row({ space: 12 }) { Text('left'); Text('right') }` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/04_行列与堆叠/03_Row.md` |

## Stack
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 堆叠容器，后子组件覆盖前子组件 | Stack | 内置组件，无需导入 | Stack(options?: StackOptions) | `Stack({ alignContent: Alignment.TopStart }) { Circle().width(50); Text('overlay') }` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/04_行列与堆叠/04_Stack.md` |

## Blank
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 空白填充组件，自动填充容器空余部分 | Blank | 内置组件，无需导入 | Blank(min?: number \| string) | `Row() { Text('left'); Blank(); Text('right') }` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/13_空白与分隔/01_Blank.md` |

## Divider
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 分割线组件，分割不同内容块 | Divider | 内置组件，无需导入 | Divider() | `Column() { Text('A'); Divider(); Text('B') }` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/13_空白与分隔/02_Divider.md` |

## List
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 列表容器，连续多行呈现同类数据 | List | 内置组件，无需导入 | List(options?: ListOptions) | `List({ space: 10 }) { ForEach(items, item => { ListItem() { Text(item) } }) }` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/07_滚动与滑动/01_List.md` |

## ListItem
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 列表具体条目，必须配合List使用 | ListItem | 内置组件，无需导入 | ListItem(value?: ListItemOptions) | `ListItem() { Text('item content') }` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/07_滚动与滑动/02_ListItem.md` |

## Scroll
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 可滚动容器，子组件尺寸超出父组件时滚动 | Scroll | 内置组件，无需导入 | Scroll(scroller?: Scroller) | `Scroll() { Column() { Text('content'); Text('more content') } }` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/07_滚动与滑动/08_Scroll.md` |

## Grid
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 网格容器，行列分割单元格布局 | Grid | 内置组件，无需导入 | Grid(scroller?: Scroller, layoutOptions?: GridLayoutOptions) | `Grid() { GridItem() { Text('1') }; GridItem() { Text('2') } }` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/07_滚动与滑动/06_Grid.md` |

## GridItem
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 网格容器中单项内容容器 | GridItem | 内置组件，无需导入 | GridItem(value?: GridItemOptions) | `GridItem() { Text('cell') }` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/07_滚动与滑动/07_GridItem.md` |

## Swiper
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 滑块视图容器，子组件滑动轮播 | Swiper | 内置组件，无需导入 | Swiper(controller?: SwiperController) | `Swiper() { Text('page1'); Text('page2'); Text('page3') }` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/07_滚动与滑动/09_Swiper.md` |

## Tabs
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 页签切换内容视图的容器 | Tabs | 内置组件，无需导入 | Tabs(options?: TabsOptions) | `Tabs() { TabContent().tabBar('Tab1') { Text('content1') }; TabContent().tabBar('Tab2') { Text('content2') } }` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/08_导航与切换/05_Tabs.md` |

## TabContent
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| Tabs中对应切换页签的内容视图 | TabContent | 内置组件，无需导入 | TabContent() | `TabContent().tabBar('首页') { Text('home') }` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/08_导航与切换/06_TabContent.md` |

## Navigation
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 路由导航根视图容器，含标题栏/内容区/工具栏 | Navigation | 内置组件，无需导入 | Navigation() / Navigation(pathInfos: NavPathStack) | `Navigation(new NavPathStack()) { Text('首页') }.title('主页')` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/08_导航与切换/02_Navigation.md` |

## NavDestination
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| Navigation子页面的根容器 | NavDestination | 内置组件，无需导入 | NavDestination() | `NavDestination() { Text('detail') }.title('详情')` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/08_导航与切换/03_NavDestination.md` |

## NavRouter (deprecated)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 导航组件，提供点击响应跳转（API13起废弃） | NavRouter | 内置组件，无需导入 | NavRouter() / NavRouter(value: RouteInfo) | `NavRouter() { Text('跳转'); NavDestination() { Text('目标页') } }` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/31_已停止维护的组件与接口/03_NavRouter.md` |

## Router (deprecated)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 页面路由，通过URL访问不同页面（API18起废弃） | router | import { router } from '@kit.ArkUI' | router.pushUrl(options: RouterOptions): Promise<void> | `router.pushUrl({ url: 'pages/page2', params: { id: 1 } })` | `02_应用框架/05_ArkUI（方舟UI框架）/01_ArkTS API/01_UI界面/22_ohos.router (页面路由)(不推荐).md` |

## Badge
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 信息标记组件，附加在组件上作信息提醒 | Badge | 内置组件，无需导入 | Badge(value: BadgeParamWithNumber \| BadgeParamWithString) | `Badge({ count: 5, position: BadgePosition.RightTop, style: { fontSize: 10, badgeSize: 16 } }) { Text('消息') }` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/12_信息展示/03_Badge.md` |

## 模块备注

- **NavRouter** (API9-13) 和 **Router** (`@ohos.router`, API18起废弃) 均为已废弃API。新开发应统一使用 **Navigation + NavPathStack + NavDestination** 作为路由方案。
- 所有布局/导航组件除 **Router** 外均为 ArkUI 内置声明式组件，无需额外导入，可直接在 `.ets` 文件中使用。
- **Badge** 非布局类组件，归类于"信息展示"，在此模块中作为附加标记提及；其核心用途是附着在其他UI组件上显示红点/计数角标。
