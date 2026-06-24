# 手作·印记视觉设计系统 v2

## 1. Visual Theme & Atmosphere

“手作·印记”不是工具，而是一本工坊手账。界面以陶土的暖棕为底色情绪，以坯体的米白为纸张，以窑变的绯红作为偶尔的需要警觉的墨迹。我们追求“有温度的克制”——像手工器物上留存的指纹，像木架上摆着的未上釉陶坯。

设计细节：
- 圆角大而柔软（20-28px），像指腹压出的弧度。
- 卡片像厚纸，用柔和弥散阴影营造堆叠感。
- 标题字重偏重，营造手账标题的笃定；数字紧凑，像工坊手写价签。
- 顶部 Header 是陶土渐变的“陶土条”，底部 Tab 是毛玻璃坯体色。
- 图标统一使用圆润线型 SVG，避免 emoji 与尖锐几何。
- 少量使用陶土色渐变（Header、主按钮、积分卡片）提升层次，但绝不花哨。

**Key Characteristics:**
- 主色：陶土暖棕 `#C17A53`
- 底色：坯体米白 `#F8F3EE`
- 墨：深褐 `#3D2E26`
- 警觉色：窑变绯红 `#C45A4B`（仅提醒/库存不足/沉睡）
- 辅助金：陶土金 `#D4A26A`（积分、徽章）
- 大圆角容器、柔和弥散阴影、陶土渐变点缀
- 内容区最大 390px 居中，底部 Tab 固定

## 2. Color Palette & Roles

### Primary
- **陶土暖棕** (`#C17A53`): 主按钮、Tab 选中、积分等级、Header 陶土条
- **赤陶深棕** (`#A85D3C`): 次级强调、标题、按钮按下、进度条
- **深褐墨** (`#3D2E26`): 主要文字、图标
- **坯体米白** (`#F8F3EE`): 页面底色、输入框背景
- **纯白** (`#FFFFFF`): 卡片前景、按钮文字

### Secondary / Accent
- **窑变绯红** (`#C45A4B`): 沉睡提醒、库存不足、删除
- **陶土金** (`#D4A26A`): 积分徽章、签到成功、高亮标签
- **坯体蓝灰** (`#8A9A8C`): 次要按钮、辅助信息
- **陶土阴影** (`#E6D5C7`): 阴影、分割线、边框、占位

### Text
- **深褐墨** (`#3D2E26`): 主要文字
- **陶土灰** (`#7A665B`): 次要说明
- **米白** (`#F8F3EE`): 深色背景文字
- **提醒绯红** (`#C45A4B`): 警告
- **陶土灰 60%** (`rgba(61,46,38,0.6)`): 占位、禁用

### Surface & Elevation
- **页面底色** (`#F8F3EE`)
- **卡片背景** (`#FFFFFF`)
- **陶土渐变 Header**: `linear-gradient(180deg, #C17A53 0%, #A85D3C 100%)`
- **陶土渐变主按钮**: `linear-gradient(180deg, #D48C65 0%, #C17A53 100%)`
- **积分卡片渐变**: `linear-gradient(135deg, #C17A53 0%, #A85D3C 100%)`
- **卡片阴影**: `rgba(61,46,38,0.08) 0px 10px 28px 0px`
- **Elevated 阴影**: `rgba(61,46,38,0.14) 0px 14px 36px 0px`
- **毛玻璃 Tab 背景**: `rgba(248,243,238,0.90)` + `backdrop-filter: blur(20px)`

### Button States
- **Primary Large**: 48px 高，18px 圆角，渐变背景，白色文字，16px/700，阴影 `rgba(193,122,83,0.28) 0px 8px 20px`
- **Primary Pressed**: 渐变加深，阴影缩小
- **Secondary Outline**: 40px 高，14px 圆角，2px `#C17A53` 边框
- **Text Link**: `#A85D3C`，按下下划线
- **Destructive**: `#C45A4B` 背景，白色文字
- **Disabled**: `#E6D5C7` 背景，`rgba(61,46,38,0.4)` 文字

### Shadows
- **Card Shadow**: `rgba(61,46,38,0.08) 0px 10px 28px 0px`
- **Elevated Shadow**: `rgba(61,46,38,0.14) 0px 14px 36px 0px`
- **Button Shadow**: `rgba(193,122,83,0.28) 0px 8px 20px 0px`
- **Inset Shadow (input)**: `inset rgba(61,46,38,0.06) 0px 2px 6px 0px`

## 3. Typography Rules

### Font Family
- **Chinese**: HarmonyOS Sans / PingFang SC / system sans-serif
- **Numeric/English Accent**: SF Mono / Helvetica Neue / system monospace

### Hierarchy

| Role | Size | Weight | Line Height | Letter Spacing | Color |
|------|------|--------|-------------|----------------|-------|
| Page Title | 24px | 700 | 1.22 | -0.2px | #FFFFFF / #3D2E26 |
| Section Title | 18px | 700 | 1.30 | -0.1px | #3D2E26 |
| Card Title | 16px | 700 | 1.35 | 0 | #3D2E26 |
| Body | 14px | 400 | 1.60 | 0 | #3D2E26 |
| Caption | 12px | 500 | 1.45 | 0.2px | #7A665B |
| Micro | 11px | 500 | 1.40 | 0.3px | #7A665B |
| Number Display | 36px | 700 | 1.05 | -1px | #FFFFFF / #C17A53 |
| Tab Label | 12px | 600 | 1.00 | 0 | #7A665B / #C17A53 |

## 4. Component Stylings

### Header Bar
- 高度 56px
- 背景 `linear-gradient(180deg, #C17A53 0%, #A85D3C 100%)`
- 标题居中，米白色 18px/700
- 左侧返回按钮白色 SVG
- 底部圆角 0 0 28px 28px

### Tab Bar
- 固定底部，高度 68px + 安全区
- 背景 `rgba(248,243,238,0.90)` + `backdrop-filter: blur(20px)`
- 顶部 1px 分割线 `#E6D5C7`
- 4 Tab：首页、课程、会员、我的
- 未选中：陶土灰
- 选中：陶土暖棕 + 底部 4px 圆点指示

### Cards
- 背景 `#FFFFFF`
- 圆角 24px
- 内边距 20px
- 阴影 `rgba(61,46,38,0.08) 0px 10px 28px 0px`

### Buttons
- **Primary Large**: 48px 高，18px 圆角，渐变，白色文字
- **Primary Small**: 36px 高，12px 圆角
- **Secondary**: 40px 高，14px 圆角，2px 陶土边框
- **Destructive Small**: 32px 高，10px 圆角
- **Icon Button**: 44x44px，14px 圆角，bg `#F0E8E0`

### Input Fields
- 高度 48px
- 背景 `#F8F3EE`
- 圆角 14px
- 内边距 0 16px
- 聚焦 2px `#C17A53`
- placeholder `rgba(61,46,38,0.4)`

### Chips / Tags
- 28px 高，14px 圆角
- 背景 `#F0E8E0`，文字 `#7A665B`
- 选中：bg `#C17A53`，text `#FFFFFF`

### Lists
- 行高 72px
- 左侧头像/图标 44x44px 圆角 12px
- 右侧箭头或操作按钮
- 行之间 12px 间距

### Empty State
- 居中陶轮/陶罐 SVG 占位
- 标题 16px/700
- 说明 14px #7A665B
- 操作按钮 Secondary

## 5. Layout Principles

### Spacing System
- 基础单位 4px
- 常用：4, 8, 12, 16, 20, 24, 32, 48
- 卡片外边距 16px
- 卡片内部间距 12px

### Container
- max-width 390px，居中
- 页面水平内边距 16px
- Header 与首个卡片间距 16px
- 卡片之间 16px
- 底部 Tab 上方预留 88px

### Grid
- 主内容单列
- 作品图库 2 列，间距 12px
- 日历 7 列

## 6. Depth & Elevation

| Level | Treatment | Use |
|-------|-----------|-----|
| Flat | 无阴影，页面底色 | 普通背景 |
| Card | `0px 10px 28px rgba(61,46,38,0.08)` | 信息卡片 |
| Elevated | `0px 14px 36px rgba(61,46,38,0.14)` | Tab、弹窗 |
| Button | `0px 8px 20px rgba(193,122,83,0.28)` | 主按钮 |
| Focus | 2px solid `#C17A53` outline | 焦点 |

## 7. Do's and Don'ts

### Do
- 使用陶土暖棕 `#C17A53` 作为唯一高饱和主色
- 使用米白 `#F8F3EE` 作为大面积底色
- 使用大圆角容器与柔和阴影
- 使用陶土渐变点缀 Header 与主按钮
- 使用绯红 `#C45A4B` 仅用于提醒/警告
- 数字使用 tabular-nums
- 底部 Tab 固定

### Don't
- 不使用纯黑背景或高对比电子色
- 不使用直角卡片
- 不使用霓虹渐变
- 不使用 emoji 图标
- 不使用侧边导航
- 不让内容全宽铺满

## 8. Responsive Behavior

- 设计稿 390px
- 390-420px 撑满居中
- >420px 保持 390px 居中
- 按钮 >=44px，列表行 >=64px
- 小屏标题缩至 22px

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

### Action Targets

| pageId | semantic id | event | visual control |
|--------|-------------|-------|----------------|
| home-page | home-checkin-button | member-checkin | 主按钮“签到” |
| home-page | home-points-detail-link | navigate-to-points | 积分卡片箭头 |
| home-page | home-book-lesson-button | open-booking | 待上课程按钮 |
| home-page | home-dormant-link | navigate-to-dormant | 沉睡提醒入口 |
| home-page | home-inventory-link | navigate-to-inventory | 库存管理入口 |
| points-page | points-checkin-button | member-checkin | 顶部签到按钮 |
| points-page | points-filter-all | filter-points-all | 分段“全部” |
| points-page | points-filter-income | filter-points-income | 分段“收入” |
| points-page | points-filter-expense | filter-points-expense | 分段“支出” |
| members-page | members-add-button | open-add-member | 右上角加号 |
| members-page | members-filter-all | filter-members-all | 标签“全部” |
| members-page | members-filter-dormant | filter-members-dormant | 标签“沉睡” |
| profile-page | profile-add-work-button | add-work-photo | “添加作品” |
| profile-page | profile-edit-button | edit-profile | “编辑档案” |
| calendar-page | calendar-prev-month | calendar-prev-month | 左箭头 |
| calendar-page | calendar-next-month | calendar-next-month | 右箭头 |
| calendar-page | calendar-book-button | open-booking | 预约按钮 |
| booking-page | booking-submit-button | submit-booking | 提交预约 |
| inventory-page | inventory-add-button | open-add-material | 右上角加号 |
| dormant-page | dormant-wake-button | wake-member | “唤醒”按钮 |
| dormant-page | dormant-wake-all-button | wake-all-members | “全部唤醒” |
| my-page | my-settings-button | open-settings | 设置行 |
| my-page | my-about-button | open-about | 关于行 |
| my-page | my-logout-button | logout | 退出登录 |
| shared | tab-home | navigate-home | 首页 Tab |
| shared | tab-calendar | navigate-calendar | 课程 Tab |
| shared | tab-members | navigate-members | 会员 Tab |
| shared | tab-my | navigate-my | 我的 Tab |
| shared | back-button | navigate-back | 返回 |

### Input Targets

| pageId | semantic id | binding |
|--------|-------------|---------|
| members-page | members-search-input | /members/searchQuery |
| booking-page | booking-course-picker | /booking/selectedCourse |
| booking-page | booking-date-picker | /booking/selectedDate |
| booking-page | booking-time-picker | /booking/selectedTime |
| booking-page | booking-member-picker | /booking/selectedMember |
| dormant-page | dormant-threshold-input | /dormant/thresholdDays |

### Assertion / List Targets

| pageId | semantic id | binding |
|--------|-------------|---------|
| home-page | home-header-title | appName |
| home-page | home-points-card | /points/balance |
| home-page | home-upcoming-lesson-card | /lessons/upcoming |
| home-page | home-dormant-alert-card | /dormant/count |
| home-page | home-empty-state | /home/empty |
| points-page | points-balance | /points/balance |
| points-page | points-list | /points/transactions |
| members-page | members-list | /members |
| profile-page | profile-avatar | /profile/avatar |
| profile-page | profile-name | /profile/name |
| profile-page | profile-craft-tags | /profile/crafts |
| profile-page | profile-bio | /profile/bio |
| profile-page | profile-works-gallery | /profile/works |
| profile-page | profile-points-level | /profile/level |
| calendar-page | calendar-month-title | /calendar/monthLabel |
| calendar-page | calendar-grid | /calendar/days |
| calendar-page | calendar-selected-day-lessons | /calendar/selectedDayLessons |
| booking-page | booking-stock-warning | /booking/stockWarning |
| booking-page | booking-error-message | /booking/error |
| inventory-page | inventory-list | /inventory/items |
| inventory-page | inventory-low-stock-alert | /inventory/lowStockCount |
| inventory-page | inventory-deduction-log | /inventory/deductions |
| dormant-page | dormant-count | /dormant/count |
| dormant-page | dormant-list | /dormant/members |
| my-page | my-avatar | /my/avatar |
| my-page | my-name | /my/name |

### Change Requests
- 无。
