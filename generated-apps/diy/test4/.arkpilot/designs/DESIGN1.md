# 手作·印记视觉设计系统 v1

## 1. Visual Theme & Atmosphere

“手作·印记”的界面像一间阳光斜照的陶艺工作室：陶轮、木架、未上釉的坯体、墙角的干草。设计以陶土的暖棕为锚点，米白坯体为纸，深褐墨迹为字。我们不追求极简，而是追求“有温度的克制”——像手工器物上留存的指纹。

界面元素带有手作痕迹：圆角不是完美的机械弧线，而是稍大的、指腹压出的柔软弧度；卡片像一张张裁剪过的厚纸，堆叠在桌面上，用柔和的弥散阴影区分层次；标题使用偏重的字重，营造手账标题的笃定感；数字则用更紧凑的字距，像工坊门口手写的价格牌。

**Key Characteristics:**
- 陶土暖棕 `#C17A53` 是唯一高饱和主色，用于关键行动点
- 米白坯体 `#F8F3EE` 作为页面底色，像未上釉的陶坯
- 深褐墨 `#3D2E26` 为主要文字，比纯黑更温润
- 窑变绯红 `#C45A4B` 仅用于提醒、沉睡、库存不足等需要警觉的场景
- 大圆角（20-28px）容器，模拟陶片/厚纸边缘
- 多层柔和阴影 + 少量陶土色渐变，营造高级手工感
- 顶部 Header 为陶土色“陶土条”，底部 Tab 为毛玻璃坯体色
- 图标使用 SVG，避免 emoji，风格为圆润线型

## 2. Color Palette & Roles

### Primary
- **陶土暖棕** (`#C17A53`): 主按钮、Tab 选中、积分等级、Header 陶土条、关键徽章
- **赤陶深棕** (`#A85D3C`): 次级强调、标题、按钮按下、进度条填充
- **深褐墨** (`#3D2E26`): 主要文字、图标、重要标题
- **坯体米白** (`#F8F3EE`): 页面底色、卡片浅色背景、输入框背景
- **纯白** (`#FFFFFF`): 卡片前景、弹出层、按钮文字

### Secondary / Accent
- **窑变绯红** (`#C45A4B`): 沉睡提醒、库存不足、删除/取消、徽章
- **陶土金** (`#D4A26A`): 积分徽章、签到成功、高亮标签
- **坯体蓝灰** (`#8A9A8C`): 次要按钮、链接、已完成/辅助信息
- **陶土阴影** (`#E6D5C7`): 卡片阴影、分割线、边框、占位背景

### Text
- **深褐墨** (`#3D2E26`): 主要文字
- **陶土灰** (`#7A665B`): 次要说明文字、标签
- **米白** (`#F8F3EE`): 深色背景上的文字
- **提醒绯红** (`#C45A4B`): 警告、沉睡状态
- **陶土灰 60%** (`rgba(61,46,38,0.6)`): 占位、禁用、时间戳

### Surface & Elevation
- **页面底色** (`#F8F3EE`)
- **卡片背景** (`#FFFFFF`)
- **陶土渐变 Header**: `linear-gradient(180deg, #C17A53 0%, #A85D3C 100%)`
- **陶土渐变主按钮**: `linear-gradient(180deg, #D48C65 0%, #C17A53 100%)`
- **卡片阴影**: `rgba(61,46,38,0.08) 0px 10px 28px 0px`
- **Elevated 阴影**: `rgba(61,46,38,0.14) 0px 14px 36px 0px`
- **毛玻璃 Tab 背景**: `rgba(248,243,238,0.88)` with `backdrop-filter: blur(20px)`

### Button States
- **Primary Large**: height 48px, radius 18px, bg gradient, text `#FFFFFF`, font 16px weight 700, shadow `rgba(193,122,83,0.28) 0px 8px 20px 0px`
- **Primary Pressed**: gradient 加深，shadow 缩小
- **Secondary Outline**: height 40px, radius 14px, border 2px `#C17A53`, text `#C17A53`, bg `#FFFFFF`
- **Text Link**: text `#A85D3C`, underline on press
- **Destructive**: bg `#C45A4B`, text `#FFFFFF`, radius 14px
- **Disabled**: bg `#E6D5C7`, text `rgba(61,46,38,0.4)`

### Shadows
- **Card Shadow**: `rgba(61,46,38,0.08) 0px 10px 28px 0px`
- **Elevated Shadow**: `rgba(61,46,38,0.14) 0px 14px 36px 0px`
- **Button Shadow**: `rgba(193,122,83,0.28) 0px 8px 20px 0px`
- **Inset Shadow (input)**: `inset rgba(61,46,38,0.06) 0px 2px 6px 0px`

## 3. Typography Rules

### Font Family
- **Chinese**: HarmonyOS Sans / PingFang SC / system sans-serif
- **Numeric/English Accent**: `SF Mono`, `Helvetica Neue`, or system monospace for 积分、库存、日期
- 标题通过字重 700 + 微倾（0-1deg）模拟手写张力

### Hierarchy

| Role | Size | Weight | Line Height | Letter Spacing | Color |
|------|------|--------|-------------|----------------|-------|
| Page Title | 24px | 700 | 1.22 | -0.2px | #FFFFFF / #3D2E26 |
| Section Title | 18px | 700 | 1.30 | -0.1px | #3D2E26 |
| Card Title | 16px | 700 | 1.35 | 0 | #3D2E26 |
| Body | 14px | 400 | 1.60 | 0 | #3D2E26 |
| Caption | 12px | 500 | 1.45 | 0.2px | #7A665B |
| Micro | 11px | 500 | 1.40 | 0.3px | #7A665B |
| Number Display | 36px | 700 | 1.05 | -1px | #C17A53 |
| Tab Label | 12px | 600 | 1.00 | 0 | #7A665B / #C17A53(selected) |

## 4. Component Stylings

### Header Bar
- 高度 56px
- 背景 `linear-gradient(180deg, #C17A53 0%, #A85D3C 100%)`
- 标题居中，米白色 18px weight 700
- 左侧返回按钮为白色 SVG 箭头
- 底部圆角 0 0 28px 28px

### Tab Bar
- 固定底部，高度 68px + 安全区
- 背景 `rgba(248,243,238,0.88)` + `backdrop-filter: blur(20px)`
- 顶部 1px 分割线 `#E6D5C7`
- 4 个 Tab：首页、课程、会员、我的
- 未选中：陶土灰图标 + 文字
- 选中：陶土暖棕图标 + 文字，图标底部带 4px 圆点指示，颜色 `#C17A53`

### Cards
- 背景 `#FFFFFF`
- 圆角 24px
- 内边距 20px
- 阴影 `rgba(61,46,38,0.08) 0px 10px 28px 0px`
- 标题区与内容区间用 1px `#F0E8E0` 分隔线或 12px 间距

### Buttons
- **Primary Large**: 高度 48px，圆角 18px，渐变背景，白色文字，16px weight 700，底部阴影
- **Primary Small**: 高度 36px，圆角 12px
- **Secondary**: 高度 40px，圆角 14px，2px 陶土色边框
- **Destructive Small**: 高度 32px，圆角 10px，bg `#C45A4B`
- **Icon Button**: 44x44px，圆角 14px，bg `#F0E8E0`

### Input Fields
- 高度 48px
- 背景 `#F8F3EE`
- 圆角 14px
- 内边距 0 16px
- 聚焦边框 2px `#C17A53`
- placeholder `rgba(61,46,38,0.4)`

### Chips / Tags
- 高度 28px，圆角 14px
- 背景 `#F0E8E0`，文字 `#7A665B`
- 选中：bg `#C17A53`，text `#FFFFFF`

### Lists
- 行高 72px
- 左侧头像/图标 44x44px 圆角 12px
- 右侧箭头或操作按钮
- 行之间 12px 间距或 1px `#F0E8E0` 分隔线

### Empty State
- 居中陶轮/陶罐 SVG 占位
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
- 设计稿宽度 390px
- 内容区 max-width 390px，居中
- 页面水平内边距 16px
- Header 与首个卡片间距 16px
- 卡片之间间距 16px
- 底部 Tab 上方预留 88px 滚动空间

### Grid
- 主内容单列卡片流
- 作品图库 2 列网格，间距 12px
- 日历 7 列网格

## 6. Depth & Elevation

| Level | Treatment | Use |
|-------|-----------|-----|
| Flat | 无阴影，页面底色 | 普通内容背景 |
| Card | `0px 10px 28px rgba(61,46,38,0.08)` | 信息卡片 |
| Elevated | `0px 14px 36px rgba(61,46,38,0.14)` | 底部 Tab、弹窗 |
| Button | `0px 8px 20px rgba(193,122,83,0.28)` | 主按钮 |
| Focus | 2px solid `#C17A53` outline | 焦点 |

## 7. Do's and Don'ts

### Do
- 使用陶土暖棕 `#C17A53` 作为唯一高饱和主色
- 使用米白 `#F8F3EE` 作为大面积底色
- 使用大圆角（20-28px）容器
- 使用柔和弥散阴影 + 少量陶土渐变提升高级感
- 使用窑变绯红 `#C45A4B` 仅用于提醒/警告
- 数字使用 tabular-nums
- 底部 Tab 固定，内容区底部预留安全距离

### Don't
- 不使用纯黑背景或高对比电子色
- 不使用直角卡片
- 不使用多色霓虹渐变
- 不使用 emoji 作为图标
- 不使用侧边导航
- 不让内容全宽铺满 PC 浏览器

## 8. Responsive Behavior

- 设计稿宽度 390px
- 390-420px 设备上撑满并居中
- 大于 420px 保持 390px 最大宽度居中
- 按钮最小高度 44px，列表行高 >= 64px
- 标题在 360px 以下缩至 22px

## 9. Semantic UI Binding

（与 DESIGN.md 一致，此处略去详细表格，确保实现时保留所有 semantic IDs、routes、tabIds、events 不变。）

### Key Mappings
- `home-checkin-button` → 陶土渐变主按钮“签到”
- `points-checkin-button` → 顶部陶土渐变主按钮“签到”
- `home-points-card` / `points-balance` → 大号积分数字展示
- `calendar-grid` → 7 列日历网格，日期单元格 data-ui-id 按 `calendar-day-{date}`
- `members-list` / `dormant-list` / `inventory-list` → 卡片式列表
- `profile-works-gallery` → 2 列作品图网格
- `bottom-tab-bar` 保留 `tab-home`、`tab-calendar`、`tab-members`、`tab-my`

### Change Requests
- 无。
