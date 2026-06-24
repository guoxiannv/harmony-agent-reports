# 01 — Layout & Navigation

## Flex
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 弹性布局容器，高效排列对齐子元素并分配剩余空间 | Flex | 系统内置组件 | `Flex(value?: FlexOptions)` | `Flex({ direction: FlexDirection.Row }) { Text('1').width('20%').height(50) }` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/04_行列与堆叠/01_Flex.md` |

## Column
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 沿垂直方向布局的容器，可设置子组件间距 | Column | 系统内置组件 | `Column(options?: ColumnOptions)` | `Column({ space: 5 }) { Text('content') }` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/04_行列与堆叠/02_Column.md` |

## Row
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 沿水平方向布局的容器，可设置子组件间距 | Row | 系统内置组件 | `Row(options?: RowOptions)` | `Row({ space: 5 }) { Text('1') }` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/04_行列与堆叠/03_Row.md` |

## Stack
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 堆叠容器，子组件按顺序依次入栈，后一个覆盖前一个 | Stack | 系统内置组件 | `Stack(options?: StackOptions)` | `Stack({ alignContent: Alignment.Bottom }) { Text('first') }` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/04_行列与堆叠/04_Stack.md` |

## Tabs
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通过页签进行内容视图切换的容器组件，仅支持TabContent子组件 | Tabs | 系统内置组件 | `Tabs(options?: TabsOptions)` | `Tabs() { TabContent() { Column() }.tabBar('tab1') }` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/08_导航与切换/05_Tabs.md` |

## TabContent
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 仅在Tabs中使用，对应一个切换页签的内容视图 | TabContent | 系统内置组件 | `TabContent()` | `TabContent() { Column().width('100%') }.tabBar('text')` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/08_导航与切换/06_TabContent.md` |

## Navigation
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 路由导航的根视图容器，作为Page页面的根容器使用，支持NavPathStack路由 | Navigation | 系统内置组件 | `Navigation()` / `Navigation(pathInfos: NavPathStack)` | `Navigation(this.pageInfos) { Column() { Button('push') } }.title('NavIndex')` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/08_导航与切换/02_Navigation.md` |

## NavRouter
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 导航组件，默认提供点击响应处理。从API version 13开始不再维护，推荐使用NavPathStack替代 | NavRouter | 系统内置组件 | `NavRouter()` / `NavRouter(value: RouteInfo)` | `NavRouter() { Row() { Text('WLAN') }; NavDestination() {}.title('WLAN') }` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/31_已停止维护的组件与接口/03_NavRouter.md` |

## Blank
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 空白填充组件，在容器主轴方向上自动填充容器空余部分，仅父组件为Row/Column/Flex时生效 | Blank | 系统内置组件 | `Blank(min?: number \| string)` | `Row() { Text('Bluetooth'); Blank(); Toggle({ type: ToggleType.Switch }) }` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/13_空白与分隔/01_Blank.md` |

## Divider
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 提供分割线组件，分割不同内容块/内容元素 | Divider | 系统内置组件 | `Divider()` | `Divider().strokeWidth(8).color('#F1F3F5')` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/13_空白与分隔/02_Divider.md` |

## 模块说明

- NavRouter 从 API version 13 开始已停止维护，推荐使用 `NavPathStack` 配合 `navDestination` 属性进行页面路由。
- Flex、Column、Row 在没有子节点且不设置宽高时，默认宽高为-1。
- Blank 仅在父组件为 Row/Column/Flex 且父容器设置了主轴大小时才会自动拉伸填充。
- Tabs 仅支持 TabContent 作为直接子组件（以及 if/else 和 ForEach 渲染控制下的 TabContent）。
