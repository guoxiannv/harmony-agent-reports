# 02 — 组件截图

## componentSnapshot.getSync (静态)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通过组件 ID 同步获取已加载组件的 PixelMap 截图 | componentSnapshot.getSync | `import { componentSnapshot } from '@kit.ArkUI'` | `getSync(id: string, options?: SnapshotOptions): image.PixelMap` | `let pixelmap = componentSnapshot.getSync("root", { scale: 2, waitUntilRenderFinished: true })` | `02_应用框架/05_ArkUI（方舟UI框架）/01_ArkTS API/01_UI界面/02_ohos.arkui.componentSnapshot (组件截图).md` |

## ComponentSnapshot.get (实例方法)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通过 UIContext 实例异步获取已加载组件截图（callback） | ComponentSnapshot.get | `import { UIContext } from '@kit.ArkUI'` | `get(id: string, callback: AsyncCallback<image.PixelMap>, options?: componentSnapshot.SnapshotOptions): void` | `this.uiContext.getComponentSnapshot().get("root", (err, pixmap) => { this.pixmap = pixmap })` | `02_应用框架/05_ArkUI（方舟UI框架）/01_ArkTS API/01_UI界面/12_ohos.arkui.UIContext (UIContext)/02_Class (ComponentSnapshot).md` |
| 通过 UIContext 实例异步获取已加载组件截图（Promise） | ComponentSnapshot.get | `import { UIContext } from '@kit.ArkUI'` | `get(id: string, options?: componentSnapshot.SnapshotOptions): Promise<image.PixelMap>` | `this.uiContext.getComponentSnapshot().get("root", { scale: 2 }).then(pixmap => this.pixmap = pixmap)` | 同上 |

## ComponentSnapshot.createFromBuilder (实例方法)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 离屏构建 CustomBuilder 并截图（callback） | ComponentSnapshot.createFromBuilder | `import { UIContext } from '@kit.ArkUI'` | `createFromBuilder(builder: CustomBuilder, callback: AsyncCallback<image.PixelMap>, delay?: number, checkImageStatus?: boolean, options?: componentSnapshot.SnapshotOptions): void` | `this.uiContext.getComponentSnapshot().createFromBuilder(() => { this.RandomBuilder() }, (err, pixmap) => { }, 320, true, { scale: 2 })` | 同上 |
| 离屏构建 CustomBuilder 并截图（Promise） | ComponentSnapshot.createFromBuilder | `import { UIContext } from '@kit.ArkUI'` | `createFromBuilder(builder: CustomBuilder, delay?: number, checkImageStatus?: boolean, options?: componentSnapshot.SnapshotOptions): Promise<image.PixelMap>` | `this.uiContext.getComponentSnapshot().createFromBuilder(() => { this.RandomBuilder() }, 320, true, { scale: 2 }).then(pixmap => { })` | 同上 |

## ComponentSnapshot.getSync (实例方法)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 同步等待截图完成，会阻塞主线程（最大 3s 超时） | ComponentSnapshot.getSync | `import { UIContext } from '@kit.ArkUI'` | `getSync(id: string, options?: componentSnapshot.SnapshotOptions): image.PixelMap` | `let pixmap = this.getUIContext().getComponentSnapshot().getSync("root", { scale: 2 })` | 同上 |

## ComponentSnapshot.getWithUniqueId / getSyncWithUniqueId
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通过 FrameNode uniqueId 异步截图 | ComponentSnapshot.getWithUniqueId | `import { UIContext } from '@kit.ArkUI'` | `getWithUniqueId(uniqueId: number, options?: componentSnapshot.SnapshotOptions): Promise<image.PixelMap>` | `this.getUIContext().getComponentSnapshot().getWithUniqueId(node.getUniqueId(), { scale: 2 }).then(pixmap => { })` | 同上 |
| 通过 FrameNode uniqueId 同步截图 | ComponentSnapshot.getSyncWithUniqueId | `import { UIContext } from '@kit.ArkUI'` | `getSyncWithUniqueId(uniqueId: number, options?: componentSnapshot.SnapshotOptions): image.PixelMap` | `let pixmap = this.getUIContext().getComponentSnapshot().getSyncWithUniqueId(node.getUniqueId(), { scale: 2 })` | 同上 |

## ComponentSnapshot.createFromComponent
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 将 ComponentContent 对象截图（API 18+） | ComponentSnapshot.createFromComponent | `import { UIContext, ComponentContent } from '@kit.ArkUI'` | `createFromComponent<T extends Object>(content: ComponentContent<T>, delay?: number, checkImageStatus?: boolean, options?: componentSnapshot.SnapshotOptions): Promise<image.PixelMap>` | `let contentNode = new ComponentContent(uiContext, wrapBuilder(buildText), new Params("hello")); this.uiContext.getComponentSnapshot().createFromComponent(contentNode, 320, true, { scale: 2 })` | 同上 |

## SnapshotOptions
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 截图自定义参数：缩放比例、等待渲染、区域、色彩空间、动态范围 | SnapshotOptions | `import { componentSnapshot } from '@kit.ArkUI'` | `{ scale?: number; waitUntilRenderFinished?: boolean; region?: SnapshotRegionType; colorMode?: ColorModeOptions; dynamicRangeMode?: DynamicRangeModeOptions }` | `{ scale: 2, waitUntilRenderFinished: true, colorMode: { colorSpace: ColorSpace.DISPLAY_P3, isAuto: false } }` | `02_ohos.arkui.componentSnapshot (组件截图).md` |

## 模块备注

- **导入路径**: `import { componentSnapshot } from '@kit.ArkUI'`
- **推荐使用方式**: 获取 UIContext 实例后调用 `getComponentSnapshot()`，不要直接使用 `componentSnapshot` 静态方法（避免 UI 上下文不明确的问题）。
- **API 版本**：API 10 起支持（部分静态 API 从 API 18 起废弃），UIContext 实例方法从 API 12 起支持。离屏截图回调有 500ms 以内延迟。`getSync` 系列方法会阻塞主线程，最大等待 3s。
- **XComponent 场景**不适用，建议使用 `createPixelMapFromSurface`。
- **系统能力**: `SystemCapability.ArkUI.ArkUI.Full`
- **Stage 模型要求**: 所有接口仅可在 Stage 模型下使用。
- **错误码**: `401` 参数错误，`100001` ID/Builder 无效，`160001` 图片未就绪，`160002` 超时，`160003` 色彩空间/动态范围不支持，`160004` 离屏不支持 isAuto(true)。
- **图像变换属性**只对被截图组件的子组件生效，对目标组件本身不生效。
