# 07 — Lifecycle & Resources

## UIAbility
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 带界面的应用组件，管理 Ability 生命周期 | `UIAbility` | `import { UIAbility } from '@kit.AbilityKit'` | `class UIAbility extends Ability { context: UIAbilityContext; launchWant: Want; lastRequestWant: Want; callee: Callee }` | `export default class EntryAbility extends UIAbility { onCreate(want, launchParam) { ... } }` | `02_应用框架/01_Ability Kit/01_ArkTS API/01_Stage模型能力的接口/36_ohos.app.ability.UIAbility (带界面的应用组件).md` |

## AbilityStage
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| Module 级别的组件管理器，用于资源预加载、线程创建等初始化 | `AbilityStage` | `import { AbilityStage } from '@kit.AbilityKit'` | `class AbilityStage { context: AbilityStageContext; onCreate(): void; onAcceptWant(want: Want): string; onConfigurationUpdate(newConfig: Configuration): void; onMemoryLevel(level: AbilityConstant.MemoryLevel): void }` | `export default class MyAbilityStage extends AbilityStage { onCreate() { console.info('onCreate'); } }` | `02_应用框架/01_Ability Kit/01_ArkTS API/01_Stage模型能力的接口/04_ohos.app.ability.AbilityStage (AbilityStage组件管理器).md` |

## Context
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| Stage 模型上下文基类，访问应用资源、沙箱路径等 | `Context` | `import { common } from '@kit.AbilityKit'` | `class Context { resourceManager: ResourceManager; cacheDir: string; filesDir: string; tempDir: string; databaseDir: string; preferencesDir: string; bundleCodeDir: string; distributedFilesDir: string; eventHub: EventHub; area: AreaMode; getApplicationContext(): ApplicationContext }` | `let context = this.context; let resMgr = context.resourceManager;` | `02_应用框架/01_Ability Kit/01_ArkTS API/04_接口依赖的元素及定义/02_application/15_Context (Stage模型的上下文基类).md` |

## @ohos.window (WindowStage)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 窗口管理器，管理主窗、子窗口创建与页面加载 | `window.WindowStage` | `import { window } from '@kit.ArkUI'` | `interface WindowStage { getMainWindow(): Promise<Window>; createSubWindow(name: string): Promise<Window>; loadContent(path: string, storage?: LocalStorage): Promise<void>; loadContentByName(name: string, storage?: LocalStorage): Promise<void>; on(eventType, callback): void; off(eventType, callback?): void }` | `onWindowStageCreate(windowStage: window.WindowStage) { windowStage.loadContent('pages/Index', (err) => {}); }` | `02_应用框架/05_ArkUI/01_ArkTS API/02_窗口管理/03_ohos.window (窗口)/04_Interface (WindowStage).md` |

## aboutToAppear
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 自定义组件创建后、build 前调用的初始化回调 | `aboutToAppear` | 无（自定义组件生命周期回调） | `aboutToAppear?(): void` | `aboutToAppear() { this.message = 'init'; }` | `02_应用框架/05_ArkUI/02_ArkTS组件/25_自定义组件/01_自定义组件的生命周期.md` |

## aboutToDisappear
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 自定义组件析构销毁时执行的回调 | `aboutToDisappear` | 无（自定义组件生命周期回调） | `aboutToDisappear?(): void` | `aboutToDisappear() { console.info('bye'); }` | `02_应用框架/05_ArkUI/02_ArkTS组件/25_自定义组件/01_自定义组件的生命周期.md` |

## onPageShow
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| @Entry 路由页面每次显示时触发（含路由跳转、应用进前台） | `onPageShow` | 无（@Entry 组件生命周期回调） | `onPageShow?(): void` | `onPageShow() { this.textColor = Color.Blue; }` | `02_应用框架/05_ArkUI/02_ArkTS组件/25_自定义组件/01_自定义组件的生命周期.md` |

## onPageHide
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| @Entry 路由页面每次隐藏时触发（含路由跳转、应用进后台） | `onPageHide` | 无（@Entry 组件生命周期回调） | `onPageHide?(): void` | `onPageHide() { this.textColor = Color.Transparent; }` | `02_应用框架/05_ArkUI/02_ArkTS组件/25_自定义组件/01_自定义组件的生命周期.md` |

## @ohos.resourceManager
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 应用资源管理，获取字符串、图片、颜色等资源 | `resourceManager` | `import { resourceManager } from '@kit.LocalizationKit'` 或通过 `context.resourceManager` 获取 | `class ResourceManager { getStringByName(name: string, callback): void; getDrawableByName(name: string, callback): void; }` | `let resMgr = this.context.resourceManager;` | `02_应用框架/14_Localization Kit/01_ArkTS API/03_ohos.resourceManager (资源管理).md` |

## @ohos.hilog
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 应用日志打印，支持 DEBUG/INFO/WARN/ERROR/FATAL 级别 | `hilog` | `import { hilog } from '@kit.PerformanceAnalysisKit'` | `hilog.debug(domain: number, tag: string, format: string, ...args): void; hilog.info(domain, tag, format, ...args): void; hilog.error(domain, tag, format, ...args): void` | `hilog.info(0x0000, 'testTag', '%{public}s World %{private}d', 'hello', 3);` | `03_系统/05_调测调优/01_Performance Analysis Kit/01_ArkTS API/03_ohos.hilog (HiLog日志打印).md` |

## 模块说明

- `aboutToAppear`、`aboutToDisappear` 是 **所有自定义组件** 的生命周期回调，而 `onPageShow`、`onPageHide` 仅对 `@Entry` 装饰的路由页面生效。
- Stage 模型中 `Context` 提供 `resourceManager` 属性直接访问资源，无需额外导入 `@ohos.resourceManager` 模块。
- `hilog` 的格式字符串使用 `%{public}s` / `%{private}d` 标记隐私级别，缺省为 `private`。
- `WindowStage` 是 UIAbility 窗口管理的核心入口，通过 `onWindowStageCreate` 回调获得实例，用于加载页面内容。
