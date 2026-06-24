# 01 -- Layout & Navigation

## Column
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 垂直方向线性布局容器 | Column | 内置组件，无需导入 | Column(options?: ColumnOptions) | `Column({ space: 5 }) { Text('A'); Text('B') }` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/04_行列与堆叠/02_Column.md |

## Row
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 水平方向线性布局容器 | Row | 内置组件，无需导入 | Row(options?: RowOptions) | `Row({ space: 5 }) { Text('A'); Text('B') }` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/04_行列与堆叠/03_Row.md |

## Stack
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 堆叠容器，后一个子组件覆盖前一个 | Stack | 内置组件，无需导入 | Stack(options?: StackOptions) | `Stack({ alignContent: Alignment.Bottom }) { Text('...') }` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/04_行列与堆叠/04_Stack.md |

## Flex
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 弹性布局容器，高效排列、对齐子元素并分配剩余空间 | Flex | 内置组件，无需导入 | Flex(value?: FlexOptions) | `Flex({ direction: FlexDirection.Row }) { Text('1'); Text('2') }` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/04_行列与堆叠/01_Flex.md |

## Scroll
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 可滚动的容器组件，子组件布局超尺寸时滚动 | Scroll | 内置组件，无需导入 | Scroll(scroller?: Scroller) | `Scroll(this.scroller) { Column() { ... } }` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/07_滚动与滑动/08_Scroll.md |

## List
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 列表容器，连续多行呈现同类数据，支持懒加载 | List | 内置组件，无需导入 | List(options?: ListOptions) | `List({ space: 20 }) { ListItem() { Text('...') } }` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/07_滚动与滑动/01_List.md |

## Grid
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 网格容器，由行和列分割的单元格组成 | Grid | 内置组件，无需导入 | Grid(scroller?: Scroller, layoutOptions?: GridLayoutOptions) | `Grid() { GridItem() { Text('...') } }.columnsTemplate('1fr 1fr')` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/07_滚动与滑动/06_Grid.md |

## Tabs
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通过页签切换内容视图的容器组件 | Tabs | 内置组件，无需导入 | Tabs(options?: TabsOptions) | `Tabs() { TabContent().tabBar('Tab1'); TabContent().tabBar('Tab2') }` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/08_导航与切换/05_Tabs.md |

## TabContent
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| Tabs对应的一个切换页签内容视图 | TabContent | 内置组件，无需导入 | TabContent() | `TabContent() { Column().backgroundColor(Color.Pink) }.tabBar('Pink')` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/08_导航与切换/06_TabContent.md |

## Navigation
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 路由导航根视图容器，含标题栏、内容区和工具栏 | Navigation | 内置组件，无需导入；控制器需导入 | Navigation(pathInfos: NavPathStack) | `Navigation(this.pageInfos) { Column() { ... } }.title('NavIndex')` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/08_导航与切换/02_Navigation.md |

## Divider
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 分割线组件，分隔不同内容块 | Divider | 内置组件，无需导入 | Divider() | `Divider().strokeWidth(8).color('#F1F3F5')` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/13_空白与分隔/02_Divider.md |

## Blank
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 空白填充组件，自动填充容器空余部分 | Blank | 内置组件，无需导入 | Blank(min?: number \| string) | `Row() { Text('Bluetooth'); Blank(); Toggle({ type: ToggleType.Switch }) }` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/13_空白与分隔/01_Blank.md |

## @ohos.router
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 页面路由（不推荐，建议用Navigation组件替代） | router | `import { router } from '@kit.ArkUI'` | router.pushUrl(options: RouterOptions): Promise\<void\> | `router.pushUrl({ url: 'pages/routerpage2', params: new RouterParams('message', [123, 456, 789]) })` | 02_应用框架/05_ArkUI（方舟UI框架）/01_ArkTS API/01_UI界面/22_ohos.router (页面路由)(不推荐).md |

## Module Notes

- Column/Row 未设置主轴大小时默认自适应子组件大小；Flex 主轴不设长度时默认撑满父容器（有 position 子组件时例外）。
- Scroll 支持单个子组件；List 仅支持 ListItem/ListItemGroup 子组件；Grid 仅支持 GridItem 子组件；Tabs 仅支持 TabContent 子组件。
- Navigation 推荐使用 `NavPathStack` 控制路由栈（API 10+），`@ohos.router` 从 API 18 开始已废弃，建议迁移至 Navigation 组件。
- Blank 仅在父组件为 Row/Column/Flex 时生效。
- TabContent 的 `tabBar()` 支持 SubTabBarStyle（子页签/带下划线）和 BottomTabBarStyle（底部页签/图标+文字）两种内置样式。
