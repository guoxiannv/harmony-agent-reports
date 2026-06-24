# HarmonyOS API 参考索引 — 小小单词卡

- **规格文件**: `.arkpilot/autopilot/spec.md`
- **文档根目录**: `vendor/harmony-knowledge-base/data/harmonyos_docs/cn/harmonyos-references`
- **总 API 调研数**: 74 个（含组件、属性、装饰器、模块 API）
- **功能模块数**: 5

## API 速查表

| API / 组件 | 用途 | 详细文档 |
|------------|------|----------|
| Column | 垂直布局容器 | [01-layout.md#column](01-layout.md#column) |
| Row | 水平布局容器 | [01-layout.md#row](01-layout.md#row) |
| Stack | 堆叠容器 | [01-layout.md#stack](01-layout.md#stack) |
| Flex | 弹性布局容器 | [01-layout.md#flex](01-layout.md#flex) |
| Text | 文本显示组件 | [01-layout.md#text](01-layout.md#text) |
| Button | 按钮组件 | [01-layout.md#button](01-layout.md#button) |
| Image | 图片组件 | [01-layout.md#image](01-layout.md#image) |
| Blank | 空白填充组件 | [01-layout.md#blank](01-layout.md#blank) |
| Divider | 分割线组件 | [01-layout.md#divider](01-layout.md#divider) |
| Scroll | 可滚动容器 | [01-layout.md#scroll](01-layout.md#scroll) |
| .width() | 设置组件宽度 | [01-layout.md#width](01-layout.md#width) |
| .height() | 设置组件高度 | [01-layout.md#height](01-layout.md#height) |
| .padding() | 设置内边距 | [01-layout.md#padding](01-layout.md#padding) |
| .margin() | 设置外边距 | [01-layout.md#margin](01-layout.md#margin) |
| .backgroundColor() | 设置背景色 | [01-layout.md#backgroundcolor](01-layout.md#backgroundcolor) |
| .borderRadius() | 设置圆角 | [01-layout.md#borderradius](01-layout.md#borderradius) |
| .fontSize() | 设置字体大小 | [01-layout.md#fontsize](01-layout.md#fontsize) |
| .fontWeight() | 设置字重 | [01-layout.md#fontweight](01-layout.md#fontweight) |
| .textAlign() | 设置文本对齐 | [01-layout.md#textalign](01-layout.md#textalign) |
| .id() | 设置组件标识（测试用） | [01-layout.md#id](01-layout.md#id) |
| .alignItems() | 容器交叉轴对齐 | [01-layout.md#alignitems](01-layout.md#alignitems) |
| .justifyContent() | 容器主轴对齐 | [01-layout.md#justifycontent](01-layout.md#justifycontent) |
| .onClick() | 点击事件回调 | [01-layout.md#onclick](01-layout.md#onclick) |
| rotate() | 3D 旋转（含 perspective） | [02-animation.md#rotate](02-animation.md#rotate) |
| .animation() | 属性动画 | [02-animation.md#animation](02-animation.md#animation) |
| animateTo() | 显式动画 | [02-animation.md#animateto](02-animation.md#animateto) |
| transition() | 转场动画 | [02-animation.md#transition](02-animation.md#transition) |
| Curve | 动画插值曲线 | [02-animation.md#curve](02-animation.md#curve) |
| springCurve | 弹簧曲线 | [02-animation.md#curvesspringcurve9](02-animation.md#curvesspringcurve9) |
| .opacity() | 透明度（动画） | [02-animation.md#opacity](02-animation.md#opacity) |
| .scale() | 缩放变换 | [02-animation.md#scale](02-animation.md#scale) |
| .translate() | 平移变换 | [02-animation.md#translate](02-animation.md#translate) |
| @Entry | 页面入口装饰器 | [03-state.md#entry](03-state.md#entry) |
| @Component | 自定义组件装饰器 | [03-state.md#component](03-state.md#component) |
| build() | 组件 UI 描述方法 | [03-state.md#build](03-state.md#build) |
| aboutToAppear() | 组件初始化回调 | [03-state.md#abouttoappear](03-state.md#abouttoappear) |
| aboutToDisappear() | 组件销毁回调 | [03-state.md#abouttodisappear](03-state.md#abouttodisappear) |
| @ForEach | 循环渲染 | [03-state.md#foreach](03-state.md#foreach) |
| LazyForEach | 懒加载循环渲染 | [03-state.md#lazyforeach](03-state.md#lazyforeach) |
| @Watch | 状态变量变化监听 | [03-state.md#watch](03-state.md#watch) |
| AppStorage/LocalStorage | UI 状态存储 | [03-state.md#appstorage](03-state.md#appstorage) |
| wrapBuilder / mutableBuilder | @Builder 封装工具 | [03-state.md#wrapbuilder](03-state.md#wrapbuilder) |
| getContext() | 获取 Ability Context | [04-data.md#getcontext](04-data.md#getcontext) |
| context.resourceManager | 获取资源管理器 | [04-data.md#contextresourcemanager](04-data.md#contextresourcemanager) |
| resourceManager | 资源管理模块 | [04-data.md#ohosresourcemanager-资源管理](04-data.md#ohosresourcemanager-资源管理) |
| getRawFileContent() | 读取 rawfile 内容 | [04-data.md#h2getrawfilecontent9](04-data.md#h2getrawfilecontent9) |
| $rawfile() | 编译期 rawfile 引用 | [04-data.md#rawfile](04-data.md#rawfile) |
| Resource / $r() | 资源引用类型 | [04-data.md#resource](04-data.md#resource) |
| JSON.parse() / stringify() | JSON 解析与序列化 | [04-data.md#jsonparse](04-data.md#jsonparse) |
| Progress | 进度条组件 | [05-progress.md#progress](05-progress.md#progress) |
| ProgressOptions | 进度条构造参数 | [05-progress.md#progressoptions对象说明](05-progress.md#progressoptions对象说明) |
| ProgressType | 进度条类型枚举 | [05-progress.md#progresstype8枚举说明](05-progress.md#progresstype8枚举说明) |
| .style() | 进度条样式配置 | [05-progress.md#style8](05-progress.md#style8) |
| .color() | 进度条前景色 | [05-progress.md#color](05-progress.md#color) |
| .value() | 动态设置进度值 | [05-progress.md#value](05-progress.md#value) |
| Shape / Circle / Rect | 图形绘制组件 | [05-progress.md#shape](05-progress.md#shape) |
| .stroke() / .strokeWidth() | 图形边框属性 | [05-progress.md#stroke](05-progress.md#stroke) |

## 分组概览

| 模块 | 文件名 | API 数 | 关键发现 |
|------|--------|--------|----------|
| 01 — 布局组件 & 基础 UI 元素 | [01-layout.md](01-layout.md) | 23 | `.space()` 是构造参数非链式方法；Flex 有二次布局开销 |
| 02 — 3D 翻卡动画 & 转场 | [02-animation.md](02-animation.md) | 13（9 确认） | `rotate()` 的 `(x,y,z,angle,perspective)` 实现 3D 翻卡；`AnimationOptions` 不存在，改用 `AnimateParam` |
| 03 — 状态管理 & 生命周期 | [03-state.md](03-state.md) | 13（12 确认） | `@State/@Prop/@Link` 等无独立 API 参考页面，仅在 developer guides 中详述；V2 状态管理与 V1 不混用 |
| 04 — 数据 & 资源加载 | [04-data.md](04-data.md) | 12 | `getContext()` 从 API 18 废弃，推荐 `getUIContext().getHostContext()`；`$m()` 未找到文档 |
| 05 — 进度指示 & 统计展示 | [05-progress.md](05-progress.md) | 13（11 确认） | 环形进度条用 `ProgressType.Ring` 或 `ScaleRing`；`ProgressStyle` 已废弃 |

## 重要注意事项

1. **3D 翻卡核心**: `rotate({ x: 0, y: 1, z: 0, angle: 180, perspective: 1000 })` — 无需独立的 `rotate3d()` 或 `perspective()` 方法。
2. **数据加载路径**: `resourceManager.getRawFileContent('words.json')` 读取 rawfile，`JSON.parse()` 解析为 WordItem 数组。
3. **状态管理**: 使用 `@State` 管理 `reviewQueue` 和 `correctCount`，`aboutToAppear()` 中加载数据初始化。
4. **测试标识**: 所有交互元素使用 `.id('xxx')` 设置 `data-ui-id` 对应值。
5. **触控区域**: 所有按钮通过 `.height(44).width(44)` 保证最小触控域。

Implement agents 应先读本 `INDEX.md`，再按需加载单个模块文件。

*输出: ArkPilot harmonyos-spec-to-api skill*
