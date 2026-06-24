# 手作·印记 — ArkTS API 参考索引

- **规格文件**: `spec.md`
- **文档仓库**: `vendor/harmony-knowledge-base/data/harmonyos_docs/cn/harmonyos-references`
- **总计调研 API**: **62**
- **覆盖模块**: **6 个**

---

## API 总表

| API / 组件 | 用途 | 详细文档 |
|-----------|------|----------|
| **01 — Layout & Navigation** | **(11 APIs)** | [01-layout-navigation.md](01-layout-navigation.md) |
| Tabs / TabContent | 底栏 Tab 导航容器 | [Tabs](01-layout-navigation.md#tabs) |
| Column | 垂直线性布局 | [Column](01-layout-navigation.md#column) |
| Row | 水平线性布局 | [Row](01-layout-navigation.md#row) |
| Stack | 堆叠布局（层叠组件） | [Stack](01-layout-navigation.md#stack) |
| Flex | Flexbox 弹性布局 | [Flex](01-layout-navigation.md#flex) |
| Scroll | 可滚动容器 | [Scroll](01-layout-navigation.md#scroll) |
| List | 列表容器（支持懒加载） | [List](01-layout-navigation.md#list) |
| Grid | 网格布局容器 | [Grid](01-layout-navigation.md#grid) |
| Navigation | 根导航视图（NavPathStack 路由） | [Navigation](01-layout-navigation.md#navigation) |
| PageTransition | 页面入场/退场转场动画 | [PageTransition](01-layout-navigation.md#pagetransition) |
| **02 — State Management** | **(15 APIs)** | [02-state-management.md](02-state-management.md) |
| @State | 组件内本地响应式状态 | [@State](02-state-management.md#state-v1-内置装饰器) |
| @Prop | 父→子单向绑定 | [@Prop](02-state-management.md#prop-v1-内置装饰器) |
| @Link | 父子双向绑定 | [@Link](02-state-management.md#link-v1-内置装饰器) |
| @Watch | 状态变化监听回调 | [@Watch](02-state-management.md#watch-api-7) |
| @Monitor | V2 多变量变化监听 | [@Monitor](02-state-management.md#monitor-api-12-v2) |
| @Provide / @Consume | 跨层级状态共享 | [@Provide/@Consume](02-state-management.md#provide--consume-v1-内置装饰器) |
| @StorageProp / @StorageLink | AppStorage 响应式绑定 | [@StorageProp/@StorageLink](02-state-management.md#storageprop--storagelink) |
| @LocalStorageProp / @LocalStorageLink | LocalStorage 响应式绑定 | [@LocalStorageProp](02-state-management.md#localstorageprop--localstoragelink) |
| @ObjectLink + @Observed | 嵌套对象双向绑定 | [@ObjectLink+@Observed](02-state-management.md#objectlink--observed-v1-内置装饰器) |
| @Builder / @BuilderParam | 可复用 UI 构建函数 | [@Builder](02-state-management.md#builder--builderparam-v1-内置装饰器) |
| @Computed | V2 计算属性（派生值） | [@Computed](02-state-management.md#computed-v2-api-12) |
| @Env | 环境变量注入 | [@Env](02-state-management.md#env-api-7) |
| AppStorage | 应用级共享状态 | [AppStorage](02-state-management.md#appstorage-api-10) |
| LocalStorage | 页面级隔离状态 | [LocalStorage](02-state-management.md#localstorage-api-9) |
| PersistentStorage | 跨会话持久化 | [PersistentStorage](02-state-management.md#persistentstorage-api-9) |
| **03 — Data Persistence** | **(6 APIs)** | [03-data-persistence.md](03-data-persistence.md) |
| PersistentStorage | 跨会话持久化 KV 存储 | [PersistentStorage](03-data-persistence.md#persistentstorage) |
| AppStorage | 应用级响应式共享状态 | [AppStorage](03-data-persistence.md#appstorage) |
| dataPreferences | 用户首选项 KV 存储 | [dataPreferences](03-data-persistence.md#ohosdatapreferences-用户首选项) |
| relationalStore | SQL 关系型数据库 | [relationalStore](03-data-persistence.md#模块描述) |
| @ohos.resourceManager | 读取 HAP 内资源文件 | [resourceManager](03-data-persistence.md#ohosresourcemanager-资源管理) |
| LocalStorage | 页面级作用域状态 | [LocalStorage](03-data-persistence.md#localstorage9) |
| **04 — Controls, Dialogs & Input** | **(12 APIs)** | [04-controls-dialogs.md](04-controls-dialogs.md) |
| Button | 按钮组件（签到/预约/确认） | [Button](04-controls-dialogs.md#button) |
| Text | 文本展示（积分数值/标题） | [Text](04-controls-dialogs.md#text) |
| Span | 行内文本子组件 | [Span](04-controls-dialogs.md#span) |
| TextInput | 单行文本输入（姓名/搜索） | [TextInput](04-controls-dialogs.md#textinput) |
| TextArea | 多行文本输入（备注/描述） | [TextArea](04-controls-dialogs.md#textarea) |
| DatePicker | 日期滑动选择 | [DatePicker](04-controls-dialogs.md#datepicker) |
| TimePicker | 时间滑动选择 | [TimePicker](04-controls-dialogs.md#timepicker) |
| AlertDialog | 警告弹窗（确认取消） | [AlertDialog](04-controls-dialogs.md#警告弹窗-alertdialog) |
| CustomDialog | 自定义弹窗（作品上传/唤醒） | [CustomDialog](04-controls-dialogs.md#自定义弹窗-customdialog) |
| Menu / MenuItem | 垂直菜单（工艺标签选择） | [Menu](04-controls-dialogs.md#menu) |
| Select | 下拉选择器 | [Select](04-controls-dialogs.md#select) |
| **05 — Image & File** | **(7 APIs)** | [05-image-file.md](05-image-file.md) |
| Image | 图片显示（头像/作品/课程） | [Image](05-image-file.md#image) |
| ImageAnimator | 逐帧动画（签到成功动效） | [ImageAnimator](05-image-file.md#imageanimator) |
| PhotoViewPicker | 从图库选择照片 | [PhotoViewPicker](05-image-file.md#ohosfilepicker-photoviewpicker) |
| photoAccessHelper | 相册管理模块 | [photoAccessHelper](05-image-file.md#photoaccesshelper) |
| @ohos.file.fs (fileIo) | 文件读写/复制/目录管理 | [fileIo](05-image-file.md#ohosfilefs-fileio) |
| SaveButton | 安全保存控件 | [SaveButton](05-image-file.md#savebutton) |
| file:// URI 模式 | 沙箱文件 URI 处理 | [URI](05-image-file.md#uri-file-uri-模式) |
| **06 — Animation & Gesture** | **(11 APIs)** | [06-animation-gesture.md](06-animation-gesture.md) |
| animateTo | 显式动画（按钮缩放/转场） | [animateTo](06-animation-gesture.md#animateto) |
| transition | 组件插入/删除过渡 | [transition](06-animation-gesture.md#transition) |
| animation | 属性动画（渐变过渡） | [animation](06-animation-gesture.md#animation-属性动画) |
| keyframeAnimateTo | 关键帧动画 | [keyframeAnimateTo](06-animation-gesture.md#keyframeanimateto) |
| TapGesture | 点击手势 | [TapGesture](06-animation-gesture.md#tapgesture) |
| LongPressGesture | 长按手势 | [LongPressGesture](06-animation-gesture.md#longpressgesture) |
| PanGesture | 滑动手势 | [PanGesture](06-animation-gesture.md#pangesture) |
| PinchGesture | 捏合手势 | [PinchGesture](06-animation-gesture.md#pinchgesture) |
| GestureGroup | 手势组合（顺序/并发/互斥） | [GestureGroup](06-animation-gesture.md#gesturegroup) |
| onClick | 点击事件回调 | [onClick](06-animation-gesture.md#onclick) |
| onTouch | 触摸事件回调 | [onTouch](06-animation-gesture.md#ontouch) |

---

## 重要发现

| 编号 | 发现 | 模块 |
|------|------|------|
| 1 | Navigator (组件) 从 API 13 起废弃，推荐使用 Navigation + NavPathStack | 01-layout |
| 2 | @ohos.router 从 API 18 起废弃，推荐使用 Navigation 或 UIContext.getRouter() | 01-layout |
| 3 | BottomTabBarStyle 是标准底栏样式（无下划线，默认 48vp 高度，API 12+） | 01-layout |
| 4 | 所有 V1 装饰器（@State/@Prop/@Link 等）是编译器内置特性，无需 import | 02-state |
| 5 | @Computed 是 V2 专属（API 12+），需配合 @ObservedV2/@Trace | 02-state |
| 6 | dataPreferences 不保证进程并发安全，避免多进程使用 | 03-persistence |
| 7 | relationalStore 单行 < 2MB，大量查询用 TaskPool | 03-persistence |
| 8 | AlertDialog.show() 从 API 18 废弃，推荐 getUIContext().showAlertDialog() | 04-controls |
| 9 | Button 默认 type 从 API 18 起由 Capsule 变为 ROUNDED_RECTANGLE | 04-controls |
| 10 | PhotoViewPicker 和 DocumentViewPicker 分属不同 Kit | 05-image |
| 11 | SaveButton 需用户点击授权（API 19: 10s, API 20+: 1min） | 05-image |
| 12 | animateTo (全局) 从 API 18 废弃，使用 this.getUIContext()?.animateTo() | 06-animation |
| 13 | TransitionOptions 从 API 10 废弃，使用 TransitionEffect | 06-animation |

---

> **Implement agents：先读此 INDEX.md，再按需加载对应模块文件。**
