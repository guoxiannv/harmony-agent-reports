# 手作·印记 — 设计对齐计划

## 1. Visual Inputs

- **Semantic UI protocol**: `.arkpilot/designs/ui-tree.json`
- **Final DESIGN artifact**: `.arkpilot/designs/DESIGN2.md`
- **HTML artifacts**:
  - `.arkpilot/designs/page-home.html`
  - `.arkpilot/designs/page-members.html`
  - `.arkpilot/designs/page-member-detail.html`
  - `.arkpilot/designs/page-points.html`
  - `.arkpilot/designs/page-courses.html`
  - `.arkpilot/designs/page-course-detail.html`
  - `.arkpilot/designs/page-inventory.html`
  - `.arkpilot/designs/page-sleeping-members.html`
  - `.arkpilot/designs/page-check-in.html`
  - `.arkpilot/designs/page-profile.html`

## 2. Semantic UI Binding

### Surfaces / Routes / Tabs

| Page ID | Route | Tab ID | HTML Artifact |
|---------|-------|--------|---------------|
| home | pages/Home | tab-home | page-home.html |
| members | pages/Members | tab-members | page-members.html |
| member-detail | pages/MemberDetail | — | page-member-detail.html |
| points | pages/Points | — | page-points.html |
| courses | pages/Courses | tab-courses | page-courses.html |
| course-detail | pages/CourseDetail | — | page-course-detail.html |
| inventory | pages/Inventory | tab-inventory | page-inventory.html |
| sleeping-members | pages/SleepingMembers | — | page-sleeping-members.html |
| check-in | pages/CheckIn | — | page-check-in.html |
| profile | pages/Profile | tab-profile | page-profile.html |

### Action / Input / Assertion IDs to Preserve in ArkTS `.id(...)`

#### Home
- `home-quick-check-in-button` (action) → FAB，触发 `open-check-in`
- `home-today-classes-count` (assertion) → 今日课程数字
- `home-today-reservations-count` (assertion) → 待处理预约数字
- `home-points-activity-list` (list) → 积分动态列表容器
- `home-points-item-{id}` (list item) → 单条积分动态
- `home-points-empty` (assertion) → 积分动态空状态
- `home-sleeping-reminder-card` (action) → 沉睡提醒卡片，触发 `open-sleeping-members`
- `home-sleeping-count` (assertion) → 沉睡会员数量

#### Members
- `members-search-input` (input) → 搜索框
- `members-filter-button` (action) → 筛选按钮，触发 `open-filter-sheet`
- `members-add-button` (action) → 新增会员，触发 `open-add-member`
- `members-list` (list) → 会员列表容器
- `member-card-{id}` (list item) → 单个会员卡片
- `members-empty-state` (assertion) → 空状态

#### Member Detail
- `member-detail-back-button` (action) → 返回，触发 `navigate-back`
- `member-detail-edit-button` (action) → 编辑，触发 `open-edit-member`
- `member-detail-name` (assertion) → 会员姓名
- `member-detail-points` (assertion) → 积分余额
- `member-detail-craft-tags` (assertion) → 工艺标签组
- `member-detail-gallery-list` (list) → 作品网格
- `member-gallery-{id}` (list item) → 单张作品
- `member-gallery-empty` (assertion) → 作品集空状态
- `member-detail-points-history-list` (list) → 积分历史
- `member-points-item-{id}` (list item) → 单条积分历史
- `member-points-empty` (assertion) → 积分历史空状态
- `member-detail-sleeping-badge` (assertion) → 沉睡标签

#### Points
- `points-back-button` (action) → 返回，触发 `navigate-back`
- `points-balance` (assertion) → 积分余额大数字
- `points-rule-check-in` (assertion) → 签到规则
- `points-rule-spend-ratio` (assertion) → 消费比例
- `points-history-list` (list) → 积分明细列表
- `points-history-{id}` (list item) → 单条明细
- `points-history-empty` (assertion) → 空状态
- `points-redeem-button` (action) → 兑换权益，触发 `open-redeem-sheet`

#### Courses
- `courses-date-picker` (input) → 日历选择区
- `courses-add-button` (action) → 新增课程，触发 `open-add-course`
- `courses-list` (list) → 课程列表
- `course-card-{id}` (list item) → 单个课程卡片
- `courses-empty-state` (assertion) → 空状态

#### Course Detail
- `course-detail-back-button` (action) → 返回，触发 `navigate-back`
- `course-detail-title` (assertion) → 课程标题
- `course-detail-time` (assertion) → 课程时间
- `course-detail-capacity` (assertion) → 容量信息
- `course-detail-material-list` (list) → 关联材料列表
- `course-material-{id}` (list item) → 单个材料
- `course-materials-empty` (assertion) → 材料空状态
- `course-detail-reservations-list` (list) → 已预约会员
- `course-reservation-{id}` (list item) → 单个预约
- `course-reservations-empty` (assertion) → 预约空状态
- `course-detail-book-button` (action) → 预约会员，触发 `open-book-course`
- `course-detail-cancel-booking-button` (action) → 取消预约，触发 `cancel-course-booking`

#### Inventory
- `inventory-add-button` (action) → 新增材料，触发 `open-add-material`
- `inventory-search-input` (input) → 搜索框
- `inventory-list` (list) → 库存列表
- `inventory-item-{id}` (list item) → 单个材料卡片
- `inventory-empty-state` (assertion) → 空状态
- `inventory-low-stock-badge` (assertion) → 库存预警数量

#### Sleeping Members
- `sleeping-members-back-button` (action) → 返回，触发 `navigate-back`
- `sleeping-members-threshold` (assertion) → 沉睡阈值天数
- `sleeping-members-list` (list) → 沉睡会员列表
- `sleeping-member-{id}` (list item) → 单个沉睡会员卡片
- `sleeping-members-empty` (assertion) → 空状态
- `sleeping-members-select-all-button` (action) → 全选，触发 `select-all-sleeping`
- `sleeping-members-wake-button` (action) → 批量唤醒，触发 `wake-selected-members`

#### Check-In
- `check-in-back-button` (action) → 返回，触发 `navigate-back`
- `check-in-member-picker` (input) → 会员选择
- `check-in-type-toggle` (input) → 签到/消费切换
- `check-in-amount-input` (input) → 消费金额
- `check-in-points-input` (input) → 积分变动
- `check-in-course-picker` (input) → 关联课程
- `check-in-submit-button` (action) → 提交，触发 `submit-check-in`

#### Profile
- `profile-avatar` (assertion) → 头像
- `profile-name` (assertion) → 主理人姓名
- `profile-check-in-points-setting` (input) → 签到积分设置
- `profile-spend-ratio-setting` (input) → 消费比例设置
- `profile-sleeping-threshold-setting` (input) → 沉睡阈值设置
- `profile-notification-toggle` (input) → 通知开关

### Events to Preserve

`open-check-in`, `open-sleeping-members`, `open-filter-sheet`, `open-add-member`, `navigate-back`, `open-edit-member`, `open-redeem-sheet`, `open-add-course`, `open-book-course`, `cancel-course-booking`, `open-add-material`, `select-all-sleeping`, `wake-selected-members`, `submit-check-in`.

## 3. Visual Requirements

### Color Tokens
- 页面背景：`linear-gradient(180deg, #FBF8F5 0%, #F0EBE5 55%, #E9E3DA 100%)`
- 陶片卡片背景：`#FFFDFA`
- 深色卡片背景：`#3A2D28`
- 主按钮：`#B88363` / 文字 `#FBF8F5`
- 次级强调/提醒：`#C87E5D`
- 成功/充足：`#7E9273`
- 库存预警背景：`#F5E1D6` / 文字 `#A2573E`
- 次要文字：`#9B9189`

### Typography
- 手写标题：`Caveat` / `Ma Shan Zheng`，首页 44px，可 rotate(-1deg)
- 正文：`Noto Sans SC` / `PingFang SC`，14-16px
- 数字：`DM Mono`，用于积分、库存、天数

### Spacing & Layout
- 内容区 max-width: 390px，水平 padding 16px
- 卡片间距 12-16px
- 底部 Tab 安全区 80px
- 首屏关键内容（标题 + 今日数据卡片）位于 600vp 内

### Elevation
- 陶片卡片：`0 10px 28px rgba(58, 45, 40, 0.08)`
- 主按钮：`0 6px 18px rgba(184, 131, 99, 0.32)`
- FAB：`0 8px 24px rgba(58, 45, 40, 0.36)`
- Tab 栏：毛玻璃 `backdrop-filter: blur(18px)` + `rgba(251, 248, 245, 0.92)`

### Component Notes
- 首页沉睡提醒卡片使用深色陶片，右上角青釉圆斑装饰。
- 会员详情作品集照片使用不对称旋转 + 拍立得白边。
- 课程详情容量条使用进度条可视化。
- 签到/消费页使用类型切换（分段选择器）。
- 我的页面设置项使用输入框 + 单位标签组合。

### Responsive Constraints
- 禁止全宽拉伸。
- Tab 栏必须固定在底部，宽度与 body 一致（`max-width: 390px; left:0; right:0; margin: 0 auto`）。
- 侧边导航严禁出现。

## 4. HTML-to-ArkUI Mapping Notes

- HTML 中的 `.page` 对应 ArkUI 顶层 `Column` 滚动容器。
- HTML 卡片对应 ArkUI `Column` + 圆角 + 阴影样式。
- HTML `.tabbar` 对应 ArkUI 底部 `Tabs` 或自定义 `Row` + `position`。
- HTML 中的 `data-ui-id` 必须映射到 ArkUI 组件的 `.id(...)`。
- 内联 SVG 在 ArkUI 中可替换为本地 SVG 资源或 `SymbolGlyph`/`Shape`。
- 手写体效果在 ArkUI 中使用 `fontFamily('Caveat')` 或系统手写体 fallback。

## 5. Non-Negotiable Constraints

1. 不得静默修改语义 ID、page ID、route、tab ID 或事件名。
2. HTML  artifacts 是最终视觉参考，执行阶段必须忠实还原其布局、色彩、阴影、圆角、图标风格。
3. `ui-tree.json` 是语义绑定协议，不是最终布局树；允许视觉层自由调整 wrapper 和装饰元素，但语义目标必须可触达。
4. 禁止把 HTML 中的示例数据作为默认应用种子数据。
5. 每个 SVG 图标必须保留业务语义的 `title` 等价描述（ArkUI 中使用 accessibilityText 或资源命名）。
6. 禁止在 ArkUI 中使用 emoji 作为图标。
7. 首屏关键内容必须在 600vp 内可见，底部 Tab 固定于底部。
