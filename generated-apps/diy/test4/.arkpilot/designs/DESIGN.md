# 手作·印记视觉设计系统

## 1. Visual Theme & Atmosphere

“手作·印记”是一家小而温暖的手作工坊数字伴侣。设计摒弃冰冷的数据表格，用陶土、坯体、纸张与手写字迹构建界面情绪。整体像一页摊开的工坊手账：边缘带有轻微毛边感，圆角像指腹压出的弧度，色彩来自窑炉与陶土的自然氧化。留白多但不空，信息被柔和地分组，每一屏都像一张可触摸的卡片。

字体选择上，中文使用圆润柔和的无衬线体（HarmonyOS Sans 或系统默认）作为正文，标题用更粗的同级字体并略微收紧字距；英文/数字使用等宽或几何感字体，营造手工标价签的质朴感。标题偶尔带有“手写倾斜”处理，但不过度。

色彩以陶土暖棕为锚点，米白为底，深褐为墨。所有强调色都来自陶土烧制过程：赤陶、绯红（窑变提醒）、坯体白（高光）。不使用任何高饱和电子色。

**Key Characteristics:**
- 陶土暖棕 (`#C17A53`) 为唯一主色，用于 Tab 选中、关键按钮、积分等级
- 米白坯体 (`#F8F3EE`) 作为页面底色，营造纸张/陶坯质感
- 深褐墨 (`#3D2E26`) 为主要文字，比纯黑更温润
- 手写感标题：字重 600-700，略带紧凑字距，营造手账标题感
- 大圆角容器（16-24px）+ 柔和弥散阴影，模拟陶片/卡片堆叠
- 空状态使用手绘风格插画占位，而非默认图标
- 顶部 Header 采用“陶土条”背景，底部 Tab 为毛玻璃陶土色

## 2. Color Palette & Roles

### Primary
- **陶土暖棕** (`#C17A53`): 主按钮背景、Tab 选中、积分等级、Header 陶土条背景
- **赤陶深棕** (`#A85D3C`): 次级强调、标题文字、选中状态、按钮按下
- **深褐墨** (`#3D2E26`): 主要文字、图标、重要标题
- **坯体米白** (`#F8F3EE`): 页面底色、卡片浅色背景、输入框背景
- **纯白** (`#FFFFFF`): 卡片前景、弹出层、按钮文字

### Interactive
- **陶土蓝灰** (`#8A9A8C`): 次要按钮/链接，用于“查看更多”“取消”
- **提醒绯红** (`#C45A4B`): 沉睡提醒、库存不足、删除/取消操作
- **陶土金** (`#D4A26A`): 高亮标签、积分徽章、签到成功提示
- **坯体阴影** (`#E6D5C7`): 卡片阴影、分割线、边框

### Text
- **深褐墨** (`#3D2E26`): 主要文字
- **陶土灰** (`#7A665B`): 次要说明文字
- **米白** (`#F8F3EE`): 深色背景上的文字
- **提醒绯红** (`#C45A4B`): 警告、沉睡状态
- **陶土灰 60%** (`rgba(61,46,38,0.6)`): 占位、禁用、时间戳

### Surface & Elevation
- **页面底色** (`#F8F3EE`)
- **卡片背景** (`#FFFFFF`)
- **卡片阴影** (`rgba(61,46,38,0.08) 0px 8px 24px 0px`)
- ** elevated 卡片阴影** (`rgba(61,46,38,0.12) 0px 12px 32px 0px`)
- **毛玻璃 Tab 背景** (`rgba(248,243,238,0.86)` with `backdrop-filter: blur(16px)`)
- **陶土条 Header 背景** (`#C17A53`)

### Button States
- **Primary Fill**: bg `#C17A53`, text `#FFFFFF`, radius 16px
- **Primary Pressed**: bg `#A85D3C`
- **Secondary Outline**: border 1.5px `#C17A53`, text `#C17A53`, bg transparent, radius 16px
- **Text Link**: text `#A85D3C`, underline on hover/press
- **Destructive**: bg `#C45A4B`, text `#FFFFFF`, radius 16px
- **Disabled**: bg `#E6D5C7`, text `rgba(61,46,38,0.4)`

### Shadows
- **Card Shadow**: `rgba(61,46,38,0.08) 0px 8px 24px 0px`
- **Elevated Shadow**: `rgba(61,46,38,0.12) 0px 12px 32px 0px`
- **Button Shadow**: `rgba(193,122,83,0.24) 0px 6px 16px 0px`
- **Inset Shadow (input)**: `inset rgba(61,46,38,0.06) 0px 2px 4px 0px`

## 3. Typography Rules

### Font Family
- **Chinese Body**: HarmonyOS Sans / PingFang SC / system sans-serif
- **Numeric/English Accent**: `SF Mono`, `Helvetica Neue`, or system monospace for积分、库存数字
- **Handwriting feel**: 标题使用同级无衬线，通过字重与微倾模拟手写张力，不强制引入真实手写字体

### Hierarchy

| Role | Size | Weight | Line Height | Letter Spacing | Color |
|------|------|--------|-------------|----------------|-------|
| Page Title | 24px | 700 | 1.25 | -0.2px | #3D2E26 |
| Section Title | 18px | 700 | 1.30 | -0.1px | #3D2E26 |
| Card Title | 16px | 700 | 1.35 | 0 | #3D2E26 |
| Body | 14px | 400 | 1.55 | 0 | #3D2E26 |
| Caption | 12px | 400 | 1.45 | 0.2px | #7A665B |
| Micro | 11px | 500 | 1.40 | 0.3px | #7A665B |
| Number Display | 32px | 700 | 1.10 | -0.5px | #C17A53 |
| Tab Label | 12px | 600 | 1.00 | 0 | #7A665B / #C17A53(selected) |

### Principles
- 标题字重偏重（700），营造手账标题的笃定感
- 正文行高宽松（1.55），中文阅读舒适
- 数字使用 tabular-nums，避免库存/积分数字跳动
- 标签/时间戳使用大写字母间距（0.2-0.3px）增加精致感

## 4. Component Stylings

### Header Bar
- 高度 56px
- 背景 `#C17A53`
- 标题居中，米白色 18px weight 700
- 左侧返回按钮为白色 SVG 箭头
- 底部圆角 0 0 24px 24px，形成“陶土条”

### Tab Bar
- 固定底部，高度 64px + 安全区
- 背景 `rgba(248,243,238,0.86)` + `backdrop-filter: blur(16px)`
- 顶部 1px 分割线 `#E6D5C7`
- 4 个 Tab：首页、课程、会员、我的
- 未选中：陶土灰图标 + 文字
- 选中：陶土暖棕图标 + 文字，图标底部带 4px 圆点指示

### Cards
- 背景 `#FFFFFF`
- 圆角 20px
- 内边距 16-20px
- 阴影 `rgba(61,46,38,0.08) 0px 8px 24px 0px`
- 标题区与内容区间用 1px `#F0E8E0` 分隔线

### Buttons
- **Primary Large**: 高度 48px，圆角 16px，bg `#C17A53`，text `#FFFFFF`，font 16px weight 700，shadow `rgba(193,122,83,0.24) 0px 6px 16px 0px`
- **Primary Small**: 高度 36px，圆角 12px，padding 0 16px
- **Secondary**: 高度 40px，圆角 14px，border 1.5px `#C17A53`，text `#C17A53`
- **Icon Button**: 44x44px，圆角 12px，bg `#F8F3EE`，用于加号、更多

### Input Fields
- 高度 48px
- 背景 `#F8F3EE`
- 圆角 12px
- 内边距 0 16px
- 聚焦边框 1.5px `#C17A53`
- placeholder 颜色 `rgba(61,46,38,0.4)`

### Chips / Tags
- 高度 28px，圆角 14px
- 背景 `#F0E8E0`，文字 `#7A665B`
- 选中状态：bg `#C17A53`，text `#FFFFFF`

### Lists
- 行高 72px
- 左侧头像/图标 44x44px 圆角 12px
- 右侧箭头或操作按钮
- 行之间 1px `#F0E8E0` 分隔线或 12px 间距卡片

### Empty State
- 居中插画占位（陶轮/陶罐 SVG）
- 标题 16px weight 700
- 说明 14px #7A665B
- 操作按钮 Secondary 样式

## 5. Layout Principles

### Spacing System
- 基础单位 4px
- 常用间距：4, 8, 12, 16, 20, 24, 32, 48
- 卡片外边距 16px
- 卡片内部元素间距 12px

### Container
- 内容区 max-width 390px，居中
- 页面水平内边距 16px
- Header 与首个卡片间距 16px
- 卡片之间间距 16px
- 底部 Tab 上方预留 80px 滚动空间

### Grid
- 主要以单列卡片流为主
- 作品图库使用 2 列网格，间距 12px
- 会员列表为单列
- 日历为 7 列网格

### Whitespace Philosophy
-  ample 留白营造手账呼吸感
- 卡片之间 16px 间距让信息分组清晰
- 首屏核心内容控制在 600vp 内

## 6. Depth & Elevation

| Level | Treatment | Use |
|-------|-----------|-----|
| Flat | 无阴影，页面底色 | 普通内容背景 |
| Card | `0px 8px 24px rgba(61,46,38,0.08)` | 信息卡片 |
| Elevated | `0px 12px 32px rgba(61,46,38,0.12)` | 底部 Tab、弹窗、重要操作区 |
| Button | `0px 6px 16px rgba(193,122,83,0.24)` | 主按钮悬浮/按下加深 |
| Focus | 2px solid `#C17A53` outline | 可访问性焦点 |

## 7. Do's and Don'ts

### Do
- 使用陶土暖棕 `#C17A53` 作为唯一高饱和主色
- 使用米白 `#F8F3EE` 作为大面积底色，营造纸张感
- 使用大圆角（16-24px）容器和卡片
- 使用柔和弥散阴影，模拟陶片堆叠
- 使用深褐墨 `#3D2E26` 作为主要文字
- 在数字显示区使用 tabular-nums
- 保持底部 Tab 固定，内容区底部预留安全距离

### Don't
- 不使用纯黑背景或高对比电子色
- 不使用直角或小圆角（<12px 用于微小元素除外）
- 不使用多色渐变条或霓虹色
- 不使用细线边框卡片，优先用阴影/间距分组
- 不使用侧边导航
- 不要让内容全宽铺满 PC 浏览器

## 8. Responsive Behavior

### Container
- 设计稿宽度 390px
- 在 390-420px 设备上撑满并居中
- 在大于 420px 屏幕上保持 390px 最大宽度居中

### Touch Targets
- 按钮最小高度 44px
- Tab 图标 + 文字区域 >= 48px
- 列表行高 >= 64px
- 输入框高度 48px

### Typography
- 标题在 360px 以下设备缩至 22px
- 数字显示保持 28-32px

## 9. Semantic UI Binding

### Surfaces / Pages

| pageId | route | tabId | name |
|--------|-------|-------|------|
| home-page | pages/Home | tab-home | 首页 |
| points-page | pages/Points | — | 积分明细 |
| members-page | pages/Members | tab-members | 会员列表 |
| profile-page | pages/Profile | — | 会员档案 |
| calendar-page | pages/Calendar | tab-calendar | 课程日历 |
| booking-page | pages/Booking | — | 课程预约 |
| inventory-page | pages/Inventory | — | 库存管理 |
| dormant-page | pages/Dormant | — | 沉睡提醒 |
| my-page | pages/My | tab-my | 我的 |

### Action Targets (data-ui-id)

| pageId | semantic id | event | visual control |
|--------|-------------|-------|----------------|
| home-page | home-checkin-button | member-checkin | 陶土色主按钮“签到” |
| home-page | home-points-detail-link | navigate-to-points | 积分卡片右侧箭头 |
| home-page | home-book-lesson-button | open-booking | 待上课程卡片底部按钮 |
| home-page | home-dormant-link | navigate-to-dormant | 沉睡提醒入口行 |
| home-page | home-inventory-link | navigate-to-inventory | 库存管理入口行 |
| points-page | points-checkin-button | member-checkin | 顶部签到按钮 |
| points-page | points-filter-all | filter-points-all | 分段控件“全部” |
| points-page | points-filter-income | filter-points-income | 分段控件“收入” |
| points-page | points-filter-expense | filter-points-expense | 分段控件“支出” |
| members-page | members-add-button | open-add-member | 右上角加号 |
| members-page | members-filter-all | filter-members-all | 筛选标签“全部” |
| members-page | members-filter-dormant | filter-members-dormant | 筛选标签“沉睡” |
| profile-page | profile-add-work-button | add-work-photo | “添加作品”按钮 |
| profile-page | profile-edit-button | edit-profile | “编辑档案”按钮 |
| calendar-page | calendar-prev-month | calendar-prev-month | 左箭头 |
| calendar-page | calendar-next-month | calendar-next-month | 右箭头 |
| calendar-page | calendar-book-button | open-booking | 选中日期底部预约按钮 |
| booking-page | booking-submit-button | submit-booking | 提交预约主按钮 |
| inventory-page | inventory-add-button | open-add-material | 右上角加号 |
| dormant-page | dormant-wake-button | wake-member | 单个会员“唤醒”按钮 |
| dormant-page | dormant-wake-all-button | wake-all-members | 顶部“全部唤醒”按钮 |
| my-page | my-settings-button | open-settings | 设置行 |
| my-page | my-about-button | open-about | 关于行 |
| my-page | my-logout-button | logout | 退出登录 |
| shared | tab-home | navigate-home | 底部 Tab 首页 |
| shared | tab-calendar | navigate-calendar | 底部 Tab 课程 |
| shared | tab-members | navigate-members | 底部 Tab 会员 |
| shared | tab-my | navigate-my | 底部 Tab 我的 |
| shared | back-button | navigate-back | 顶部返回 |

### Input Targets

| pageId | semantic id | binding | visual control |
|--------|-------------|---------|----------------|
| members-page | members-search-input | /members/searchQuery | 搜索输入框 |
| booking-page | booking-course-picker | /booking/selectedCourse | 课程选择器 |
| booking-page | booking-date-picker | /booking/selectedDate | 日期选择器 |
| booking-page | booking-time-picker | /booking/selectedTime | 时段选择器 |
| booking-page | booking-member-picker | /booking/selectedMember | 会员选择器 |
| dormant-page | dormant-threshold-input | /dormant/thresholdDays | 沉睡天数阈值输入 |

### Assertion / List Targets

| pageId | semantic id | binding | visual control |
|--------|-------------|---------|----------------|
| home-page | home-header-title | appName | 顶部标题 |
| home-page | home-points-card | /points/balance | 积分余额卡片 |
| home-page | home-upcoming-lesson-card | /lessons/upcoming | 待上课程卡片 |
| home-page | home-dormant-alert-card | /dormant/count | 沉睡提醒卡片 |
| home-page | home-empty-state | /home/empty | 空状态 |
| points-page | points-balance | /points/balance | 余额大数字 |
| points-page | points-list | /points/transactions | 积分流水列表 |
| members-page | members-list | /members | 会员列表 |
| profile-page | profile-avatar | /profile/avatar | 头像 |
| profile-page | profile-name | /profile/name | 姓名 |
| profile-page | profile-craft-tags | /profile/crafts | 擅长工艺标签 |
| profile-page | profile-bio | /profile/bio | 个人简介 |
| profile-page | profile-works-gallery | /profile/works | 作品图库 |
| profile-page | profile-points-level | /profile/level | 积分等级 |
| calendar-page | calendar-month-title | /calendar/monthLabel | 月份标题 |
| calendar-page | calendar-grid | /calendar/days | 日历网格 |
| calendar-page | calendar-selected-day-lessons | /calendar/selectedDayLessons | 选中日期课程 |
| booking-page | booking-stock-warning | /booking/stockWarning | 库存警告 |
| booking-page | booking-error-message | /booking/error | 错误提示 |
| inventory-page | inventory-list | /inventory/items | 库存列表 |
| inventory-page | inventory-low-stock-alert | /inventory/lowStockCount | 低库存提醒 |
| inventory-page | inventory-deduction-log | /inventory/deductions | 扣减记录 |
| dormant-page | dormant-count | /dormant/count | 沉睡数量 |
| dormant-page | dormant-list | /dormant/members | 沉睡会员列表 |
| my-page | my-avatar | /my/avatar | 头像 |
| my-page | my-name | /my/name | 昵称 |

### Change Requests / Gaps
- 无。所有语义目标均已映射到视觉控件。
