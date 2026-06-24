# API Reference Index

> **Spec**: 孩子定制化记单词 App (Flashcard-based word review for children)
> **Docs root**: `vendor/harmony-knowledge-base/data/harmonyos_docs/cn/harmonyos-references`
> **Total APIs researched**: 66 (found in local docs)
> **Modules**: 6
> **All APIs found**: ✓ (0 missing)

## API Quick Reference

| API / 组件 | 用途 | 详细文档 |
|-------------|------|----------|
| Column | 垂直方向线性布局容器 | [01-layout.md#column](01-layout.md#column) |
| Row | 水平方向线性布局容器 | [01-layout.md#row](01-layout.md#row) |
| Stack | 堆叠容器 | [01-layout.md#stack](01-layout.md#stack) |
| Flex | 弹性布局 | [01-layout.md#flex](01-layout.md#flex) |
| Text | 文本显示组件 | [01-layout.md#text](01-layout.md#text) |
| Button | 按钮组件 | [01-layout.md#button](01-layout.md#button) |
| Blank | 空白填充组件 | [01-layout.md#blank](01-layout.md#blank) |
| Divider | 分割线组件 | [01-layout.md#divider](01-layout.md#divider) |
| Image | 图片组件 | [01-layout.md#image](01-layout.md#image) |
| Scroll | 可滚动容器 | [01-layout.md#scroll](01-layout.md#scroll) |
| @State | 组件内状态声明装饰器 | [02-state.md#state](02-state.md#state) |
| @Prop | 组件间单向数据传递装饰器 | [02-state.md#prop](02-state.md#prop) |
| @Link | 父-子组件双向数据同步装饰器 | [02-state.md#link](02-state.md#link) |
| @Builder/@BuilderParam | 自定义构建函数装饰器 | [02-state.md#builder-builderparam](02-state.md#builder-builderparam) |
| @Watch | 状态变化监听装饰器 | [02-state.md#watch](02-state.md#watch) |
| ForEach | 循环渲染控制组件 | [02-state.md#foreach](02-state.md#foreach) |
| 条件渲染（if/else） | 条件渲染语法 | [02-state.md#条件渲染（ifelse）](02-state.md#条件渲染（ifelse）) |
| @Extend | 扩展组件能力的装饰器 | [02-state.md#extend](02-state.md#extend) |
| @Styles | 定义可复用样式方法 | [02-state.md#styles](02-state.md#styles) |
| AppStorage | 应用全局 UI 状态存储 | [02-state.md#appstorage](02-state.md#appstorage) |
| @Provide/@Consume | 跨层级数据传递装饰器 | [02-state.md#provide-consume](02-state.md#provide-consume) |
| animateTo | 显式动画（状态变化过渡） | [03-animation.md#animateto](03-animation.md#animateto) |
| animation 属性 | 属性动画（渐变过渡） | [03-animation.md#animation](03-animation.md#animation) |
| transition | 组件插入/删除过渡动效 | [03-animation.md#transition](03-animation.md#transition) |
| rotate 变换 | 绕轴3D旋转 | [03-animation.md#rotate](03-animation.md#rotate) |
| opacity 变换 | 透明度设置 | [03-animation.md#opacity](03-animation.md#opacity) |
| scale 变换 | 缩放比例设置 | [03-animation.md#scale](03-animation.md#scale) |
| transform | 二维变换矩阵 | [03-animation.md#transform](03-animation.md#transform) |
| @ohos.data.preferences | Key-Value 轻量持久化 | [04-persistence.md#ohosdatapreferences](04-persistence.md#ohosdatapreferences) |
| @ohos.data.relationalStore | 关系型数据库 | [04-persistence.md#ohosdatarelationalstore](04-persistence.md#ohosdatarelationalstore) |
| @ohos.file.fs | 文件读写操作 | [04-persistence.md#ohosfilefs](04-persistence.md#ohosfilefs) |
| resourceManager | 应用资源管理 | [04-persistence.md#ohosresourcemanager](04-persistence.md#ohosresourcemanager) |
| JSON.parse/stringify | JSON 序列化/反序列化 | [04-persistence.md#ohosutiljson](04-persistence.md#ohosutiljson) |
| AppStorage（持久化） | 全局 UI 状态持久化 | [04-persistence.md#应用级变量的状态管理](04-persistence.md#应用级变量的状态管理) |
| PersistentStorage | 属性级持久化 | [04-persistence.md#应用级变量的状态管理](04-persistence.md#应用级变量的状态管理) |
| TapGesture | 单击/双击手势识别 | [05-gesture.md#tapgesture](05-gesture.md#tapgesture) |
| gesture 修饰符 | 手势绑定（gesture/priorityGesture/parallelGesture） | [05-gesture.md#gesture](05-gesture.md#gesture) |
| GestureGroup | 组合手势（Sequence/Parallel/Exclusive） | [05-gesture.md#gesturegroup](05-gesture.md#gesturegroup) |
| onTouch | 触摸事件（Down/Move/Up/Cancel） | [05-gesture.md#ontouch](05-gesture.md#ontouch) |
| gestureMask | 子组件手势屏蔽控制 | [05-gesture.md#gesturemask枚举说明](05-gesture.md#gesturemask枚举说明) |
| onClick | 点击事件 | [05-gesture.md#onclick](05-gesture.md#onclick) |
| @Entry | 页面入口装饰器 | [06-lifecycle.md#entry](06-lifecycle.md#entry) |
| @Component | 自定义组件装饰器 | [06-lifecycle.md#component](06-lifecycle.md#component) |
| aboutToAppear/aboutToDisappear | 组件创建/销毁生命周期 | [06-lifecycle.md#abouttoappear--abouttodisappear](06-lifecycle.md#abouttoappear--abouttodisappear) |
| onPageShow/onPageHide | 页面显示/隐藏回调 | [06-lifecycle.md#onpageshow--onpagehide](06-lifecycle.md#onpageshow--onpagehide) |
| UIAbility.onCreate/onDestroy | 应用级生命周期 | [06-lifecycle.md#uiabilityoncreate--ondestroy](06-lifecycle.md#uiabilityoncreate--ondestroy) |
| window.getLastWindow | 窗口获取 API | [06-lifecycle.md#windowgetlastwindow](06-lifecycle.md#windowgetlastwindow) |

## Key Findings

- **3D 翻转卡核心动画**: 使用 `rotate` 变换 + `animateTo` 显式动画实现（`animateTo` 自 API 18 起推荐改用 `getUIContext().animateTo()`）
- **本地单词库持久化**: 推荐使用 `@ohos.data.preferences`（Key-Value 轻量）+ `@ohos.file.fs`（JSON 文件读写）组合
- **状态管理链**: `AppStorage` 全局存储学习阶段 → `@State` 管理卡片队列 → `@Prop`/`@Link` 传递子组件
- **儿童交互优化**: `Button` 支持 `ROUNDED_RECTANGLE` 圆角样式，`TapGesture` 支持 `distanceThreshold` 容错距离（API 12+）
- **生命周期**: `aboutToAppear` 初始化卡片数据，`onPageShow` 每次页面可见时刷新进度
- **API 版本提醒**: animateTo 已废弃（API 18+），transform 是 2D 和 `transform3D` 是 3D（API 20+）
