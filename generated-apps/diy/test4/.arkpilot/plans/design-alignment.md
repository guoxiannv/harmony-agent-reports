# 手作·印记设计对齐计划

## 1. Visual Inputs

| 文件 | 路径 |
|------|------|
| 产品规格 | `.arkpilot/autopilot/spec.md` |
| 语义 UI 协议 | `.arkpilot/designs/ui-tree.json` |
| 最终视觉设计 | `.arkpilot/designs/DESIGN2.md` |
| HTML 设计稿 | `.arkpilot/designs/page-home-page.html` |
| HTML 设计稿 | `.arkpilot/designs/page-points-page.html` |
| HTML 设计稿 | `.arkpilot/designs/page-members-page.html` |
| HTML 设计稿 | `.arkpilot/designs/page-profile-page.html` |
| HTML 设计稿 | `.arkpilot/designs/page-calendar-page.html` |
| HTML 设计稿 | `.arkpilot/designs/page-booking-page.html` |
| HTML 设计稿 | `.arkpilot/designs/page-inventory-page.html` |
| HTML 设计稿 | `.arkpilot/designs/page-dormant-page.html` |
| HTML 设计稿 | `.arkpilot/designs/page-my-page.html` |

### Route-worthy 页面清单

| pageId | route | tabId | HTML 文件 |
|--------|-------|-------|-----------|
| home-page | pages/Home | tab-home | `page-home-page.html` |
| points-page | pages/Points | — | `page-points-page.html` |
| members-page | pages/Members | tab-members | `page-members-page.html` |
| profile-page | pages/Profile | — | `page-profile-page.html` |
| calendar-page | pages/Calendar | tab-calendar | `page-calendar-page.html` |
| booking-page | pages/Booking | — | `page-booking-page.html` |
| inventory-page | pages/Inventory | — | `page-inventory-page.html` |
| dormant-page | pages/Dormant | — | `page-dormant-page.html` |
| my-page | pages/My | tab-my | `page-my-page.html` |

## 2. Semantic UI Binding

### 页面 / Surface

实现时必须保留每个 `pageId`、`route`、`tabId` 不变。顶部 `data-page-id` 和 `data-tab-id` 由 HTML 映射到 ArkTS 页面根容器。

### Action / Input / Assertion IDs

| pageId | data-ui-id | role | 映射说明 |
|--------|------------|------|----------|
| home-page | home-header-title | assertion | Header 标题 |
| home-page | home-checkin-button | action | 签到主按钮，触发 `member-checkin` |
| home-page | home-points-card | assertion | 积分余额卡片 |
| home-page | home-points-detail-link | action | 积分卡片右侧箭头，触发 `navigate-to-points` |
| home-page | home-upcoming-lesson-card | assertion | 待上课程卡片 |
| home-page | home-book-lesson-button | action | 预约课程按钮，触发 `open-booking` |
| home-page | home-dormant-alert-card | assertion | 沉睡提醒入口卡片 |
| home-page | home-dormant-link | action | 沉睡提醒入口行，触发 `navigate-to-dormant` |
| home-page | home-inventory-link | action | 库存管理入口行，触发 `navigate-to-inventory` |
| home-page | home-empty-state | assertion | 首页空状态 |
| points-page | points-balance | assertion | 大数字积分余额 |
| points-page | points-checkin-button | action | 顶部签到按钮，触发 `member-checkin` |
| points-page | points-filter-all | action | 分段控件“全部” |
| points-page | points-filter-income | action | 分段控件“收入” |
| points-page | points-filter-expense | action | 分段控件“支出” |
| points-page | points-list | list | 积分流水列表，子项按 `points-item-{id}` |
| points-page | points-empty-state | assertion | 积分空状态 |
| members-page | members-search-input | input | 搜索框，绑定 `/members/searchQuery` |
| members-page | members-add-button | action | 右上角加号，触发 `open-add-member` |
| members-page | members-filter-all | action | 筛选“全部” |
| members-page | members-filter-dormant | action | 筛选“沉睡” |
| members-page | members-list | list | 会员列表，子项按 `member-item-{id}` |
| members-page | members-empty-state | assertion | 会员空状态 |
| profile-page | profile-avatar | assertion | 头像 |
| profile-page | profile-name | assertion | 会员姓名 |
| profile-page | profile-craft-tags | list | 擅长工艺标签，子项按 `profile-craft-{id}` |
| profile-page | profile-bio | assertion | 个人简介 |
| profile-page | profile-works-gallery | list | 作品图库，子项按 `profile-work-{id}` |
| profile-page | profile-add-work-button | action | 添加作品按钮，触发 `add-work-photo` |
| profile-page | profile-edit-button | action | 编辑档案按钮，触发 `edit-profile` |
| profile-page | profile-points-level | assertion | 积分等级 |
| profile-page | profile-craft-empty | assertion | 工艺标签空状态 |
| profile-page | profile-works-empty | assertion | 作品图集空状态 |
| calendar-page | calendar-month-title | assertion | 月份标题 |
| calendar-page | calendar-prev-month | action | 日历上月 |
| calendar-page | calendar-next-month | action | 日历下月 |
| calendar-page | calendar-grid | list | 日历网格，日期单元格按 `calendar-day-{date}` |
| calendar-page | calendar-book-button | action | 选中日期预约按钮，触发 `open-booking` |
| calendar-page | calendar-selected-day-lessons | list | 选中日期课程，子项按 `calendar-lesson-{id}` |
| calendar-page | calendar-empty-state | assertion | 日历空状态 |
| calendar-page | calendar-day-empty | assertion | 选中日期无课程 |
| booking-page | booking-course-picker | input | 课程选择 |
| booking-page | booking-date-picker | input | 日期选择 |
| booking-page | booking-time-picker | input | 时段选择 |
| booking-page | booking-member-picker | input | 会员选择 |
| booking-page | booking-submit-button | action | 提交预约，触发 `submit-booking` |
| booking-page | booking-stock-warning | assertion | 库存不足警告 |
| booking-page | booking-error-message | assertion | 错误提示 |
| inventory-page | inventory-list | list | 物料列表，子项按 `inventory-item-{id}` |
| inventory-page | inventory-add-button | action | 新增物料，触发 `open-add-material` |
| inventory-page | inventory-low-stock-alert | assertion | 低库存预警 |
| inventory-page | inventory-deduction-log | list | 扣减记录，子项按 `inventory-deduction-{id}` |
| inventory-page | inventory-empty-state | assertion | 物料空状态 |
| inventory-page | inventory-deductions-empty | assertion | 扣减记录空状态 |
| dormant-page | dormant-count | assertion | 沉睡会员数量 |
| dormant-page | dormant-threshold-input | input | 沉睡天数阈值 |
| dormant-page | dormant-list | list | 沉睡会员列表，子项按 `dormant-item-{id}` |
| dormant-page | dormant-wake-button | action | 单个唤醒按钮，触发 `wake-member` |
| dormant-page | dormant-wake-all-button | action | 全部唤醒按钮，触发 `wake-all-members` |
| dormant-page | dormant-empty-state | assertion | 沉睡空状态 |
| my-page | my-avatar | assertion | 头像 |
| my-page | my-name | assertion | 昵称 |
| my-page | my-settings-button | action | 设置，触发 `open-settings` |
| my-page | my-about-button | action | 关于，触发 `open-about` |
| my-page | my-logout-button | action | 退出登录，触发 `logout` |
| shared | tab-home | action | 底部 Tab 首页 |
| shared | tab-calendar | action | 底部 Tab 课程 |
| shared | tab-members | action | 底部 Tab 会员 |
| shared | tab-my | action | 底部 Tab 我的 |
| shared | back-button | action | 顶部返回 |

### Events

所有事件名必须严格保留：

- `member-checkin`
- `navigate-to-points`
- `open-booking`
- `navigate-to-dormant`
- `navigate-to-inventory`
- `filter-points-all`
- `filter-points-income`
- `filter-points-expense`
- `open-add-member`
- `filter-members-all`
- `filter-members-dormant`
- `add-work-photo`
- `edit-profile`
- `calendar-prev-month`
- `calendar-next-month`
- `submit-booking`
- `open-add-material`
- `wake-member`
- `wake-all-members`
- `open-settings`
- `open-about`
- `logout`
- `navigate-home`
- `navigate-calendar`
- `navigate-members`
- `navigate-my`
- `navigate-back`

### Repeated Item Strategies

| list id | itemIdPattern | 说明 |
|---------|---------------|------|
| points-list | points-item-{id} | 积分流水行 |
| members-list | member-item-{id} | 会员行 |
| profile-craft-tags | profile-craft-{id} | 工艺标签 |
| profile-works-gallery | profile-work-{id} | 作品图 |
| calendar-grid | calendar-day-{date} | 日历日期单元格 |
| calendar-selected-day-lessons | calendar-lesson-{id} | 日期课程 |
| inventory-list | inventory-item-{id} | 物料行 |
| inventory-deduction-log | inventory-deduction-{id} | 扣减记录行 |
| dormant-list | dormant-item-{id} | 沉睡会员行 |

## 3. Visual Requirements

### 设计 Tokens

- 主色：`#C17A53`（陶土暖棕）
- 次级：`#A85D3C`（赤陶深棕）
- 底色：`#F8F3EE`（坯体米白）
- 文字：`#3D2E26`（深褐墨）
- 次要文字：`#7A665B`（陶土灰）
- 警告/提醒：`#C45A4B`（窑变绯红）
- 强调金：`#D4A26A`
- 辅助灰绿：`#8A9A8C`
- 阴影色：`#3D2E26` 低透明度

### Typography

- 页面标题：24px/700，Header 内 18px/700 米白色
- 区块标题：18px/700
- 卡片标题：16px/700
- 正文：14px/400，行高 1.60
- 说明：12px/500，色 #7A665B
- 数字显示：32-36px/700，tabular-nums

### Spacing

- 页面边距：16px
- 卡片内边距：20px
- 卡片间距：16px
- 卡片圆角：24px
- 按钮圆角：14-18px
- 输入框圆角：14px
- 标签圆角：14px

### Elevation

- 卡片阴影：`rgba(61,46,38,0.08) 0px 10px 28px 0px`
- 主按钮阴影：`rgba(193,122,83,0.28) 0px 8px 20px 0px`
- 底部 Tab：毛玻璃 `rgba(248,243,238,0.90)` + blur(20px)
- Header：陶土渐变 `linear-gradient(180deg, #C17A53, #A85D3C)`，底部圆角 28px

### Icons / Imagery

- 全部使用内联 SVG，每个 SVG 首子元素为 `<title>`，描述业务语义。
- 不使用 emoji 或 Unicode 图标。
- 头像用首字母 + 渐变背景。
- 作品图空状态用陶罐/陶轮占位 SVG。

### State Styling

- 空状态：居中插画 + 标题 + 说明 + 可选操作按钮。
- 加载状态：骨架屏或 spinner，颜色使用 `#C17A53`。
- 错误状态：绯红色提示条。
- 按钮按下：渐变加深、阴影缩小。
- Tab 选中：陶土暖棕 + 底部圆点指示。

### Responsive / Target Device

- 设计稿基准宽度 390px。
- 内容区 max-width 390px 居中，禁止全宽铺满。
- 底部 Tab 固定，宽度限制与 body 一致（max-width 390px，左右 0，margin auto）。
- 2756px 高度设备滚动充足，首屏 Header + 核心卡片控制在 600vp 内。

## 4. Per-page Polish Notes

### 首页 (home-page)
- 顶部陶土渐变卡片“今日到店 + 签到按钮”作为首屏焦点。
- 积分卡片右侧箭头可点击跳转积分明细。
- 沉睡提醒入口带红色徽章。

### 积分明细 (points-page)
- 顶部大数字余额 + 签到按钮。
- 分段控件筛选全部/收入/支出。
- 列表区分正负积分颜色。

### 会员列表 (members-page)
- 搜索框 + 筛选标签。
- 列表展示头像、姓名、擅长工艺、积分。
- 沉睡会员行显示红色“沉睡 N 天”标签。

### 会员档案 (profile-page)
- 顶部渐变卡片展示头像、姓名、等级。
- 统计行展示积分、作品数、课程数。
- 作品图库使用 2 列网格，最后一个是“添加”占位。

### 课程日历 (calendar-page)
- 7 列日历网格，有课程的日期带小圆点。
- 今日高亮，选中日期带描边。
- 下方展示选中日期课程安排。

### 课程预约 (booking-page)
- 课程选项卡片，选中带描边。
- 会员/日期/时段选择器。
- 库存扣减摘要 + 库存不足警告。

### 库存管理 (inventory-page)
- 顶部低库存预警 banner。
- 物料列表展示图标、名称、规格、数量。
- 扣减记录单独卡片。

### 沉睡提醒 (dormant-page)
- 沉睡会员数 + 阈值天数统计。
- 阈值可编辑输入。
- 一键唤醒全部 + 单个唤醒按钮。

### 我的 (my-page)
- 顶部渐变卡片展示工坊/用户头像和名称。
- 设置、关于入口行。
- 底部退出登录按钮。

## 5. HTML-to-ArkUI Mapping Notes

- `.app-shell` → ArkTS 页面根 `Column`/`Stack`，设置 `data-page-id` 对应 `.id()` 或页面级标识。
- `.card` → `Column` + 圆角 + 阴影；避免用 `Card` 组件默认样式，手动对齐设计 tokens。
- `.header` → 顶部 `Row` 或自定义 `Navigation`，背景用渐变 `LinearGradient`。
- `.tab-bar` → 底部 `Tabs` 或自定义 `Row` + `position({ bottom:0 })`，宽度限制 390vp 居中。
- 列表项 → `List` + `ListItem`，子项 ID 使用 `.id(itemIdPattern.replace('{id}', id))`。
- 按钮 → `Button` 自定义样式，主按钮使用渐变背景。
- 输入框 → `TextInput`，背景 `#F8F3EE`，聚焦边框 `#C17A53`。
- 日历网格 → `Grid` 7 列，`GridItem` 表示每一天。
- 作品图库 → `Grid` 2 列。

## 6. Non-Negotiable Constraints

- **不要修改语义 ID、page ID、route、tab ID、事件名**。
- HTML 设计稿是最终视觉参考，ArkTS 实现需忠实还原颜色、圆角、阴影、排版。
- `ui-tree.json` 是语义绑定协议，不是布局树；允许重新组织视觉层级和容器。
- 所有内联 SVG 必须包含业务语义的 `<title>` 作为首子元素。
- 不使用 emoji 作为 UI 图标。
- 内容区必须限制在 390-420vp 内居中，底部 Tab 固定在底部，不可放到侧边。
- 首次启动使用真实空状态，不要预设演示数据。
- 不要在此阶段实现 HarmonyOS 源码或写实现计划。

## 7. Change Requests

- 无。
