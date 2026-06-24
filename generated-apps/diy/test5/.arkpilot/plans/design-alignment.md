# 手作·印记 设计对齐计划

## 1. 视觉输入

| 产物 | 路径 |
|------|------|
| 产品规格 | `.arkpilot/autopilot/spec.md` |
| 语义 UI 协议 | `.arkpilot/designs/ui-tree.json` |
| 最终视觉设计 | `.arkpilot/designs/DESIGN1.md`（DESIGN.md 为初稿，DESIGN1.md 为复核后最终版） |
| HTML 设计稿 | `.arkpilot/designs/page-home-page.html`、`.arkpilot/designs/page-members-page.html`、`.arkpilot/designs/page-member-detail-page.html`、`.arkpilot/designs/page-courses-page.html`、`.arkpilot/designs/page-course-booking-page.html`、`.arkpilot/designs/page-inventory-page.html`、`.arkpilot/designs/page-profile-page.html` |

### Route-worthy 页面与对应 HTML

| pageId | 页面名 | HTML 文件 | route | tabId |
|--------|--------|-----------|-------|-------|
| home-page | 首页 | `page-home-page.html` | `pages/Home` | `tab-home` |
| members-page | 会员 | `page-members-page.html` | `pages/Members` | `tab-members` |
| member-detail-page | 会员详情 | `page-member-detail-page.html` | `pages/MemberDetail` | — |
| courses-page | 课程 | `page-courses-page.html` | `pages/Courses` | `tab-courses` |
| course-booking-page | 课程预约 | `page-course-booking-page.html` | `pages/CourseBooking` | — |
| inventory-page | 库存 | `page-inventory-page.html` | `pages/Inventory` | `tab-inventory` |
| profile-page | 我的 | `page-profile-page.html` | `pages/Profile` | `tab-profile` |

## 2. Semantic UI Binding

### 2.1 Surface / Page 路由与 Tab

- 首页、会员、课程、库存、我的为底部 Tab 一级页面。
- 会员详情、课程预约为次级页面，通过 router/NavPathStack 跳转，无 Tab。
- 每个页面根节点必须设置 `data-page-id="<pageId>"`；Tab 页面额外设置 `data-tab-id="<tabId>"`。

### 2.2 必须保留的 Semantic IDs

#### 首页 `home-page`
- `home-signin-button`：圆形签到印章按钮，事件 `member-signin`。
- `home-search-input`：顶部搜索框（可选，首页快捷搜索会员）。
- `home-sleep-banner`：沉睡会员提醒横幅。
- `home-sleep-count`：沉睡会员数量文字。
- `home-low-stock-banner`：低库存预警横幅。
- `home-today-course-list`：今日课程列表容器，子项 `home-today-course-{id}`。
- `home-quick-points`：快捷入口“积分明细”。
- `home-quick-inventory`：快捷入口“库存管理”。
- `home-bottom-tab-bar`：底部 Tab 栏容器。

#### 会员 `members-page`
- `members-add-button`：右下角 FAB 添加会员，事件 `open-add-member`。
- `members-search-input`：会员搜索框，事件 `filter-members`。
- `members-filter-chip`：工艺标签筛选行，事件 `toggle-craft-filter`。
- `members-list`：会员列表容器，子项 `members-item-{id}`，子项内点击区域 `members-item-{id}-detail`，事件 `navigate-member-detail`。

#### 会员详情 `member-detail-page`
- `member-detail-back`：返回按钮，事件 `navigate-back`。
- `member-detail-edit`：编辑会员按钮，事件 `open-edit-member`。
- `member-detail-avatar`：会员头像断言。
- `member-detail-name`：会员姓名断言。
- `member-detail-points`：积分余额断言。
- `member-detail-tags`：工艺标签列表，子项 `member-detail-tag-{index}`。
- `member-detail-works-gallery`：作品图横向列表，子项 `member-detail-work-{id}`，空状态 `member-detail-works-empty`。
- `member-detail-add-work`：添加作品按钮，事件 `open-add-work`。
- `member-detail-points-history`：积分流水列表，子项 `member-detail-points-record-{id}`，空状态 `member-detail-points-empty`。
- `member-detail-signin-button`：签到按钮，事件 `member-signin`。
- `member-detail-redeem-points`：积分兑换按钮，事件 `open-redeem-points`。

#### 课程 `courses-page`
- `courses-calendar-toggle`：列表/日历视图切换，事件 `toggle-calendar-view`。
- `courses-date-picker`：日期选择条，事件 `select-course-date`。
- `courses-list`：课程列表容器，子项 `courses-item-{id}`。
- `courses-item-{id}-book`：课程预约/查看按钮，事件 `navigate-course-booking`。
- `courses-add-button`：新增课程 FAB，事件 `open-add-course`。

#### 课程预约 `course-booking-page`
- `course-booking-back`：返回按钮，事件 `navigate-back`。
- `course-booking-member-picker`：会员选择列表，事件 `select-member`。
- `course-booking-confirm`：确认预约按钮，事件 `confirm-booking`。
- `course-booking-material-warning`：耗材不足警告断言。
- `course-booking-seats-left`：剩余席位断言。

#### 库存 `inventory-page`
- `inventory-add-button`：新增库存 FAB，事件 `open-add-inventory`。
- `inventory-search-input`：库存搜索框，事件 `filter-inventory`。
- `inventory-list`：库存列表容器，子项 `inventory-item-{id}`。
- `inventory-item-{id}-adjust`：库存调整按钮，事件 `open-adjust-stock`。
- `inventory-low-stock-section`：低库存预警区容器，子项 `inventory-low-item-{id}`，空状态 `inventory-no-low-stock`。

#### 我的 `profile-page`
- `profile-studio-name`：工作室名称输入，事件 `update-studio-name`。
- `profile-sleep-threshold`：沉睡阈值输入，事件 `update-sleep-threshold`。
- `profile-points-rule-signin`：签到积分输入，事件 `update-signin-points`。
- `profile-points-rule-spend`：消费积分输入，事件 `update-spend-points`。
- `profile-export-data`：导出数据卡片，事件 `export-data`。
- `profile-about`：关于卡片，事件 `open-about`。

### 2.3 必须保留的事件名

`member-signin`、`search-members`、`filter-members`、`open-add-member`、`navigate-member-detail`、`open-edit-member`、`open-add-work`、`open-redeem-points`、`toggle-calendar-view`、`select-course-date`、`open-add-course`、`navigate-course-booking`、`select-member`、`confirm-booking`、`open-add-inventory`、`filter-inventory`、`open-adjust-stock`、`update-sleep-threshold`、`update-signin-points`、`update-spend-points`、`export-data`、`open-about`、`navigate-points`、`navigate-inventory`、`navigate-back`。

### 2.4 重复项 ID 策略

- 列表项：`{surface}-{role}-{id}`，例如 `home-today-course-c1`、`members-item-m1`、`inventory-item-i1`。
- 标签/记录：`{surface}-{role}-{index}`，例如 `member-detail-tag-0`、`member-detail-points-record-r1`。
- 空状态：`{surface}-{role}-empty` 或 ui-tree 中定义的 `emptyStateId`。

## 3. 视觉要求

### 3.1 设计系统

- **主色调**：陶土系
  - 背景：素坯白 `#F7F4EF`
  - 主文字：泥胎黑 `#3E2F27`
  - 次级文字：陶土灰 `#7A6A5C`
  - 主品牌/强调：陶土褐 `#B88B6F`、赭石焦边 `#A2593B`
  - 次级交互：窑变青灰 `#6E8078`
  - 高亮/正向：火候暖橙 `#E08A52`
  - 预警/删除：红陶 `#B84A3E`
  - 装饰：金缮米金 `#D9C3A0`
- **渐变**：顶部氛围区 `linear-gradient(165deg, #CBA58C 0%, #B88B6F 45%, #F7F4EF 100%)`；签到按钮 `linear-gradient(135deg, #E08A52 0%, #D67A3E 100%)`。
- **阴影**：卡片 `rgba(62,47,39,0.10) 0px 6px 20px -4px`；主按钮 `rgba(162,89,59,0.22) 0px 4px 14px`。
- **卡片**：白色背景，18px 圆角，细陶土色边框，16px padding。
- **按钮**：主按钮为 999px 胶囊，背景 `#A2593B`，文字 `#F7F4EF`；次按钮/ghost 按场景使用青灰或陶土卡其。
- **输入框**：背景 `#EBE2D7`，12px 圆角，聚焦时 `#A2593B` border + 柔和外发光。
- **底部 Tab**：固定底部，背景 `#5A463A`，选中文字 `#F7F4EF`，未选中 `#D9C3A0` / `#B88B6F`。宽度限制与 body 一致（max-width 390px，居中）。

### 3.2 页面级视觉注意

#### 首页
- 顶部氛围区高度约 260px，底部大圆角 24px 切入内容。
- 签到按钮为 84px 圆形印章，外圈虚线装饰，位于首屏中部。
- 沉睡/低库存横幅在提醒存在时显示；不存在时隐藏，避免占位白块。
- 首屏 600vp 内需可见：标题、签到、横幅、今日课程模块标题 + 至少一条课程。

#### 会员
- 头像使用圆形，背景渐变可因人而异。
- 工艺标签为赭石 chip，积分陶珠在右侧。
- 列表项点击整行进入详情。

#### 会员详情
- 顶部为陶土渐变氛围区，头像居中，姓名、积分、操作按钮依次排列。
- 作品图为横向滚动画廊；空状态使用手写体提示。
- 积分流水用时间线/列表混合展示。

#### 课程
- 日期选择条在顶部 sticky header 下方，7 天横向选择。
- 课程卡片使用时间轴布局，左侧竖线 + 圆点指示状态。
- 已预约课程卡片带赭石色边框，左侧圆点填充。

#### 课程预约
- 顶部展示课程名、时间、剩余席位。
- 耗材不足时显示红色警告横幅，确认按钮可禁用。
- 底部固定确认栏显示积分扣除汇总。

#### 库存
- 低库存区置顶，使用红陶色调警示。
- 库存卡片使用圆角进度条，按余量比例变色（充足青灰、偏低火候橙、不足红陶）。
- 每个卡片右下角“调整”文字按钮。

#### 我的
- 设置项使用统一卡片行，左侧标签 + 描述，右侧输入框/开关。
- 数据管理使用双列操作卡片（导出数据、关于）。
- 页面底部显示版本号。

### 3.3 图标规范

- 所有图标使用 SVG，禁止 emoji/Unicode 图标。
- 每个 inline `<svg>` 第一个子元素必须是 `<title>`，内容描述该图标在当前 UI 中的业务语义（例如“进入库存管理”、“确认预约”）。
- 图标风格：线性、1.6–2px 描边、圆角端点，保持手绘温润感。

## 4. HTML-to-ArkUI 映射说明

| HTML 元素/结构 | ArkUI 建议映射 |
|----------------|----------------|
| 页面根 `.page-root` | `@Entry @Component` Page，根 `Column` + `Scroll` |
| 顶部氛围区 `.hero` | `Column` + 渐变背景 `linearGradient`，底部 `borderRadius` |
| sticky header | `Stack` 或 `Column` 内 `Row`，滚动后改背景色/毛玻璃效果 |
| 卡片 `.card` | `Column` 或 `Stack`，背景色、border、shadow、borderRadius |
| 列表项 | `List` + `ListItem`；整行点击绑定 `onClick` |
| 底部 Tab `.bottom-tab` | 自定义 `BottomTabBar` component，固定 `position` + 安全区 |
| FAB | `Button` 圆形，fixed 定位或 Stack 层叠 |
| 进度条 | `Progress` 自定义样式，或 `Stack` + `Row` 实现 |
| 横向画廊 | `List` + `ListItem` + `listDirection(Axis.Horizontal)` |
| 输入框 | `TextInput`，背景/边框/聚焦态通过 `.backgroundColor`、`.border` 实现 |
| 胶囊按钮 | `Button` + `borderRadius(999)` |
| 圆形签到印章 | `Button` + `borderRadius(50%)` + 装饰 `Circle` 边框 |

## 5. 非协商约束

1. **禁止更改 semantic IDs、page IDs、routes、tab IDs、事件名**；实现时通过 `.id(...)` 或等效 testID 绑定。
2. **HTML 文件为最终视觉参考**，颜色、圆角、阴影、间距、布局应忠实还原。
3. `ui-tree.json` 是语义绑定协议，不是布局树；实现时可视需要增减布局容器，但语义目标必须存在。
4. 内容区宽度必须限制在 390–420vp 并居中；底部 Tab 固定底部，不得置于侧边或顶部。
5. 所有 SVG 必须带 `<title>` 语义；实现中对应的图标组件应保留可访问性标签或注释。
6. 不要在本阶段添加未在产品 spec 中定义的功能或数据模型假设。
7. 设计稿中的示例数据仅用于视觉展示，应用初始状态应为空。

## 6. 语义变更请求

- 无。现有 semantic targets、事件与绑定已覆盖全部设计需求。
