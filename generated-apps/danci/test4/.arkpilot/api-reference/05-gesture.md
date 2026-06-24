# 05 — Gesture & Touch Events

## TapGesture

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 点击手势识别：单击、双击、多次点击 | TapGesture | 内置（无需 import） | `TapGesture(value?: TapGestureParameters)` | `TapGesture({ count: 2 }).onAction((event: GestureEvent) => { ... })` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/03_手势处理/02_基础手势/01_TapGesture.md` |

## gesture 修饰符

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 为组件绑定普通手势 | gesture | 内置（无需 import） | `gesture(gesture: GestureType, mask?: GestureMask): T` | `.gesture(TapGesture().onAction(() => {}))` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/03_手势处理/01_绑定手势/01_绑定手势事件.md` |
| 为组件绑定优先识别手势 | priorityGesture | 内置（无需 import） | `priorityGesture(gesture: GestureType, mask?: GestureMask): T` | `.priorityGesture(TapGesture().onAction(() => {}), GestureMask.IgnoreInternal)` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/03_手势处理/01_绑定手势/01_绑定手势事件.md` |
| 为组件绑定并行手势（父子同时触发） | parallelGesture | 内置（无需 import） | `parallelGesture(gesture: GestureType, mask?: GestureMask): T` | `.parallelGesture(TapGesture().onAction(() => {}), GestureMask.Normal)` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/03_手势处理/01_绑定手势/01_绑定手势事件.md` |

## GestureGroup

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 组合手势识别：顺序、并发、互斥三种模式 | GestureGroup | 内置（无需 import） | `GestureGroup(mode: GestureMode, ...gesture: GestureType[])` | `GestureGroup(GestureMode.Sequence, LongPressGesture({ repeat: true }), PanGesture()).onCancel(() => {})` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/03_手势处理/03_GestureGroup.md` |

## onTouch

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 触摸事件回调：Down、Move、Up、Cancel | onTouch | 内置（无需 import） | `onTouch(event: (event: TouchEvent) => void): T` | `.onTouch((event: TouchEvent) => { if (event.type === TouchType.Down) { ... } })` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/01_通用事件/01_基础输入事件/01_触摸事件.md` |

## gestureMask

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 定义是否屏蔽子组件手势 | GestureMask | 内置（无需 import） | `enum GestureMask { Normal, IgnoreInternal }` | `.gesture(TapGesture(), GestureMask.IgnoreInternal)` — Normal 不屏蔽子组件手势；IgnoreInternal 屏蔽子组件手势（含系统内置手势） | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/03_手势处理/05_手势公共接口.md` |

## 点击事件（onClick）

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 点击动作回调（onClick 无距离阈值限制） | onClick | 内置（无需 import） | `onClick(event: (event: ClickEvent) => void): T` | `.onClick((event: ClickEvent) => { /* 获取 event.x, event.y 等 */ })` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/01_通用事件/02_交互响应事件/01_点击事件.md` |
| 点击动作回调（onClick 12+ 带移动阈值限制） | onClick | 内置（无需 import） | `onClick(event: Callback<ClickEvent>, distanceThreshold: number): T` | `.onClick((event: ClickEvent) => { ... }, 20)` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/01_通用事件/02_交互响应事件/01_点击事件.md` |

## 模块说明

- 所有手势 API（TapGesture、GestureGroup、gesture/priorityGesture/parallelGesture 修饰符、GestureMask）均从 API version 7 开始支持，元服务从 API version 11 开始支持。
- `onTouch` 和 `onClick` 是通用事件，触摸事件默认冒泡，可通过 `TouchEvent.stopPropagation()` 阻止冒泡。
- `onClick` 从 API version 12 开始支持带 `distanceThreshold` 参数的重载，限制点击时手指移动范围。
- 当组件同时绑定双击和单击手势（且双击先绑定时），单击手势有 300ms 延时。
- GestureGroup 支持三种模式：Sequence（顺序识别）、Parallel（并发识别）、Exclusive（互斥识别）。
