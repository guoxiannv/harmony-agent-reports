# 08 — Ability生命周期与上下文 (Lifecycle & Context)

## UIAbility
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 带界面的应用组件，提供组件创建、销毁、前后台切换等生命周期回调，具备后台通信能力 | UIAbility | `import { UIAbility } from '@kit.AbilityKit';` | class UIAbility extends Ability | `export default class MyUIAbility extends UIAbility { onCreate(want, launchParam) { … } }` | 02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/01_Stage模型能力的接口/36_ohos.app.ability.UIAbility (带界面的应用组件).md |

## UIAbility.onCreate
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| UIAbility实例冷启动时触发，执行初始化逻辑 | onCreate | `import { UIAbility, AbilityConstant, Want } from '@kit.AbilityKit';` | `onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void` 同步接口 | `onCreate(want, launchParam) { hilog.info(0x0000, 'testTag', \`onCreate, want: ${want.abilityName}\`); }` | 同上 |

## UIAbility.onForeground
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 应用首次启动到前台或从后台转入前台时触发，申请系统资源 | onForeground | `import { UIAbility } from '@kit.AbilityKit';` | `onForeground(): void` 同步接口 | `onForeground() { hilog.info(0x0000, 'testTag', \`onForeground\`); }` | 同上 |

## UIAbility.onBackground
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 应用从前台转入后台时触发，释放UI不可见时的资源 | onBackground | `import { UIAbility } from '@kit.AbilityKit';` | `onBackground(): void` 同步接口 | `onBackground() { hilog.info(0x0000, 'testTag', \`onBackground\`); }` | 同上 |

## UIAbility.onDestroy
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| UIAbility被销毁时触发，执行资源清理、数据保存 | onDestroy | `import { UIAbility } from '@kit.AbilityKit';` | `onDestroy(): void \| Promise<void>` 同步或Promise异步 | `async onDestroy() { hilog.info(0x0000, 'testTag', \`onDestroy\`); }` | 同上 |

## AbilityStage
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| Module级别的组件管理器，进行资源预加载、线程创建等初始化，维护Module下的应用状态 | AbilityStage | `import { AbilityStage } from '@kit.AbilityKit';` | class AbilityStage | `export default class MyAbilityStage extends AbilityStage { onCreate() { … } }` | 02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/01_Stage模型能力的接口/04_ohos.app.ability.AbilityStage (AbilityStage组件管理器).md |

## BaseContext
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 所有Context类型的父类，表示Stage或FA模型 | BaseContext | `import { common } from '@kit.AbilityKit';` | 属性: `stageMode: boolean` | `console.info(\`isStageMode: ${this.context.stageMode}\`);` | 02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/04_接口依赖的元素及定义/02_application/14_BaseContext.md |

## Context (Stage模型的上下文基类)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| Stage模型的上下文基类，访问应用资源、执行应用级操作 | Context | `import { common } from '@kit.AbilityKit';` | 属性: resourceManager, applicationInfo, cacheDir, filesDir, eventHub, area等 方法: getApplicationContext(), createModuleContext(), getGroupDir(), createAreaModeContext() | `let appCtx: common.Context = this.context.getApplicationContext();` | 02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/04_接口依赖的元素及定义/02_application/15_Context (Stage模型的上下文基类).md |

## Want
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 对象间信息传递的载体，用于应用组件间的信息传递 | Want | `import { Want } from '@kit.AbilityKit';` | 属性: deviceId, bundleName, moduleName, abilityName, action, entities, uri, type, parameters, flags | `let want: Want = { bundleName: 'com.example.myapp', abilityName: 'FuncAbility', parameters: { key: 'value' } };` | 02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/03_通用能力的接口(推荐)/13_ohos.app.ability.Want (Want).md |

## common.UIAbilityContext
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| UIAbility组件上下文类型别名，继承自Context，提供启动/销毁Ability、连接服务等能力 | UIAbilityContext | `import { common } from '@kit.AbilityKit';` | `type UIAbilityContext = _UIAbilityContext.default` 属性: abilityInfo, currentHapModuleInfo, config, windowStage 方法: startAbility(), terminateSelf(), startAbilityForResult() 等 | `let context: common.UIAbilityContext;` | 02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/01_Stage模型能力的接口/16_ohos.app.ability.common (Ability公共模块).md |

## common.Context
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| Stage模型上下文基类类型别名 | Context | `import { common } from '@kit.AbilityKit';` | `type Context = _Context.default` | `let ctx: common.Context = this.context.getApplicationContext();` | 同上 |

## AbilityConstant
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| Ability相关枚举常量，包括启动原因、退出原因、迁移结果、内存级别等 | AbilityConstant | `import { AbilityConstant } from '@kit.AbilityKit';` | 枚举: LaunchReason, LastExitReason, OnContinueResult, MemoryLevel, WindowMode, StateType 等 | `if (launchParam.launchReason === AbilityConstant.LaunchReason.START_ABILITY) { … }` | 02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/01_Stage模型能力的接口/02_ohos.app.ability.AbilityConstant (Ability相关常量).md |

## AbilityConstant.LaunchReason
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| Ability启动原因枚举 | LaunchReason | `import { AbilityConstant } from '@kit.AbilityKit';` | 枚举值: UNKNOWN=0, START_ABILITY=1, CALL=2, CONTINUATION=3, APP_RECOVERY=4, SHARE=5, AUTO_STARTUP=8, INSIGHT_INTENT=9, PREPARE_CONTINUATION=10, PRELOAD=11 | `launchParam.launchReason === AbilityConstant.LaunchReason.START_ABILITY` | 同上 |

## StartOptions
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 启动UIAbility的可选参数，指定窗口模式、屏幕、窗口位置/大小等 | StartOptions | `import { StartOptions } from '@kit.AbilityKit';` | 属性: windowMode, displayId, withAnimation, windowLeft, windowTop, windowWidth, windowHeight, processMode, startupVisibility 等 | `let options: StartOptions = { displayId: 0, windowMode: AbilityConstant.WindowMode.WINDOW_MODE_FULLSCREEN };` | 02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/01_Stage模型能力的接口/34_ohos.app.ability.StartOptions (startAbility的可选参数).md |

## 模块说明
- UIAbility 的 `context` 属性类型为 `UIAbilityContext`，通过 `this.context` 访问。
- UIAbility 属性 `launchWant` 取值为 `onCreate` 接收到的 Want 参数。
- `onDestroy` 支持同步回调或 Promise 异步回调；推荐异步回调避免应用退出时异步函数未能执行。
- `onForeground` / `onBackground` 均为同步接口，不支持异步回调。
- AbilityStage 与 Module 一一对应，一个 Module 拥有一个 AbilityStage，在首个 Ability 实例前创建。
- `BaseContext.stageMode` 可用于区分 Stage/FA 模型。
- `Want.parameters` 支持的数据类型: String, Number, Boolean, Object, Array, FD；Value 不支持 function。
- API version 23+ 起 Want 传递最大数据为 200KB。
- `common` 模块导出的是纯类型定义，通过 `import { common } from '@kit.AbilityKit';` 导入。
- `@ohos.app.ability.UIAbility` 对应导入名 `UIAbility`，`@ohos.app.ability.common` 对应导入命名空间 `common`。
