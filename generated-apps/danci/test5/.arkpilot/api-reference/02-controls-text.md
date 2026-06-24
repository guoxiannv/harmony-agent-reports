# 02 — Controls & Text

## Button
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 按钮组件，可创建不同样式的按钮 | Button | 无需额外导入（ArkUI内置组件） | `Button(options: ButtonOptions)` / `Button(label: ResourceStr, options?: ButtonOptions)` / `Button()` | `Button('OK', { type: ButtonType.Normal, stateEffect: true }).borderRadius(8).backgroundColor(0x317aff).width(90)` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/09_按钮与选择/01_Button.md` |

## Text
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 显示一段文本的组件 | Text | 无需额外导入（ArkUI内置组件） | `Text(content?: string \| Resource, value?: TextOptions)` | `Text('Hello World').fontSize(16).textAlign(TextAlign.Center)` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/10_文本与输入/01_Text.md` |

## Image
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 图片组件，用于在应用中显示图片 | Image | 无需额外导入（ArkUI内置组件） | `Image(src: PixelMap \| ResourceStr \| DrawableDescriptor)` | `Image($r('app.media.startIcon')).width(50).height(50).objectFit(ImageFit.Fill)` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/11_图片与视频/01_Image.md` |

## onClick
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 组件被点击时触发的事件回调 | onClick | 无需额外导入（组件通用事件） | `onClick(event: (event: ClickEvent) => void): T` | `Button('OK').onClick(() => { console.info('clicked') })` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/01_通用事件/02_交互响应事件/01_点击事件.md` |

## gesture
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 为组件绑定手势识别的方法 | gesture | 无需额外导入（组件通用方法） | `gesture(gesture: GestureType, mask?: GestureMask): T` | `Button().gesture(TapGesture({ count: 1 }).onAction((event: GestureEvent) => { console.info('tap') }))` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/03_手势处理/01_绑定手势/01_绑定手势事件.md` |

## GestureEvent
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 手势事件信息对象，包含手势触发时的数据（偏移量、速度、手指列表等） | GestureEvent | 无需额外导入（手势回调入参） | 对象说明：`{ repeat, offsetX, offsetY, angle, scale, speed, fingerList, velocity }`，继承自 BaseEvent | `TapGesture().onAction((event: GestureEvent) => { console.info('x:' + event.fingerList[0].localX) })` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/03_手势处理/05_手势公共接口.md` |

## Gesture
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 手势类型联合定义，用于绑定到组件的手势对象类型 | GestureType | 无需额外导入（关联手势对象） | `type GestureType = TapGesture \| LongPressGesture \| PanGesture \| PinchGesture \| SwipeGesture \| RotationGesture \| GestureGroup` | `Button().gesture(TapGesture().onAction(() => {}))` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/03_手势处理/05_手势公共接口.md` |

## HitTestBehavior
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 设置组件的触摸测试类型（属性） | hitTestBehavior | 无需额外导入（通用属性） | `hitTestBehavior(value: HitTestMode): T` | `Stack().hitTestBehavior(HitTestMode.Block)` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/02_通用属性/04_交互属性/07_触摸交互控制/02_触摸测试控制.md` |

## TextAlign
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 文本段落在水平方向的对齐方式枚举 | TextAlign | 无需额外导入（ArkUI内置枚举） | 枚举值：Start(0), Center(1), End(2), JUSTIFY(3), LEFT(4), RIGHT(5) | `Text('Hello').textAlign(TextAlign.Center)` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/30_公共定义/03_枚举说明.md` |

## Module Notes

- `Gesture` (GestureType) is a union type, not a standalone API. It combines TapGesture, LongPressGesture, PanGesture, PinchGesture, SwipeGesture, RotationGesture, and GestureGroup. Use it as the first argument to the `gesture()` method.
- `GestureEvent` is an object passed to gesture action callbacks (e.g., `onAction((event: GestureEvent) => {})`), not a constructable class.
- `HitTestBehavior` in the api_list refers to the `hitTestBehavior` attribute; the `HitTestMode` enum (Default, Block, Transparent, None, BLOCK_HIERARCHY, BLOCK_DESCENDANTS) provides the allowed values.
- `onClick` is available on all ArkUI components as a universal event (API 7+); API 12+ adds a `distanceThreshold` overload.
