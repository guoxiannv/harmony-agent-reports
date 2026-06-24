# 02 — State Management

## @Entry
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 页面入口装饰器 | @Entry | 内置装饰器，无需导入 | `@Entry: PropertyDecorator` | `@Entry @Component struct Index { build() { Text('Test') } }` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/25_自定义组件/06_组件扩展装饰器/02_Entry：页面入口.md |

## @Watch
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 状态变量变化监听 | @Watch | 内置装饰器，无需导入 | `Watch: (value: string) => PropertyDecorator` | `@State @Watch('onChange') num: number = 0; onChange() { console.info(\`num change to \${this.num}\`); }` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/28_状态管理与渲染控制/03_状态变量变化监听.md |

## @Env
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 环境变量装饰器 | @Env | `import { uiObserver } from '@kit.ArkUI'` | `Env: EnvDecorator` | `@Env(SystemProperties.BREAK_POINT) breakpoint: uiObserver.WindowSizeLayoutBreakpointInfo` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/29_响应式环境变量/01_Env：环境变量.md |

## AppStorage
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 应用全局UI状态存储 | AppStorage | 内置全局对象，无需导入 | `AppStorage.link<T>(propName: string): SubscribedAbstractProperty<T>` | `AppStorage.setOrCreate('PropA', 47); let link = AppStorage.link('PropA');` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/28_状态管理与渲染控制/01_应用级变量的状态管理.md |

## LocalStorage
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 页面级UI状态存储 | LocalStorage | 内置类，无需导入 | `constructor(initializingProperties?: Object)` | `let storage: LocalStorage = new LocalStorage({ 'PropA': 47 });` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/28_状态管理与渲染控制/01_应用级变量的状态管理.md |

## PersistentStorage
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 持久化存储UI状态 | PersistentStorage | 内置全局对象，无需导入 | `PersistentStorage.persistProp<T>(key: string, defaultValue: T): void` | `PersistentStorage.persistProp('highScore', '0');` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/28_状态管理与渲染控制/01_应用级变量的状态管理.md |

## Environment
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 设备环境查询 | Environment | 内置全局对象，无需导入 | `Environment.envProp<S>(key: string, value: S): boolean` | `Environment.envProp('accessibilityEnabled', 'default');` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/28_状态管理与渲染控制/01_应用级变量的状态管理.md |

## ForEach
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 基于数组循环渲染 | ForEach | 内置接口，无需导入 | `ForEach(arr: Array<any>, itemGenerator: (item: any, index: number) => void, keyGenerator?: (item: any, index: number) => string)` | `ForEach(this.arr, (item: string) => { Text(item) }, (item: string) => item)` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/28_状态管理与渲染控制/05_ForEach.md |

## Repeat
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 基于数组循环渲染（API 12+） | Repeat | 内置接口，无需导入 | `Repeat: <T>(arr: Array<T>)` | `Repeat<string>(this.arr).each((obj: RepeatItem<string>) => { Text(obj.item) })` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/28_状态管理与渲染控制/07_Repeat.md |

## ProvideOptions
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| @Provide装饰器参数 | ProvideOptions | 内置类型，无需导入 | `{ allowOverride?: string }` | `@Provide({ allowOverride: 'xxx' }) count: number = 0;` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/28_状态管理与渲染控制/02_状态管理V1装饰器参数.md |

## Module Notes

- Decorators `@State`, `@Prop`, `@Link`, `@Provide`, `@Consume`, `@Builder`, `@ObjectLink`, and `@StorageLink` have no standalone API reference doc files in this docs repository. They are documented only in the HarmonyOS developer guides (not in the API reference directory). Their usage is referenced within the AppStorage/LocalStorage doc and the V1 decorator parameters doc, but no formal API signatures or import paths are available in the reference docs.
- The `@ohos.arkui.StateManagement` module (imported from `@kit.ArkUI`) provides `AppStorageV2`, `PersistenceV2`, and `UIUtils` for state management V2, which is separate from the V1 decorator system.
- `@StorageLink` is referenced as a decorator for AppStorage integration but has no dedicated reference file.
- `Environment` APIs are for device environment query and should be distinguished from the `@Env` decorator (API 22+) which reads system properties directly.
