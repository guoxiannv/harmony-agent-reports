# 手作·印记 视觉设计系统 v1

## 1. Visual Theme & Atmosphere

“手作·印记”是一个记录手工坊会员成长与创作轨迹的温柔工具。视觉上我们想要一种“被窑火吻过的纸质感”：既有陶土的厚重与温暖，又有手账便签的轻盈与人情味。界面不应像工业软件，而应像店主放在工作台上、随手翻开的一本会员手账。

色彩从素坯、陶土、窑变到火候层层递进；排版微微宽松，让中文字像在纸上呼吸；圆角大而柔，像手捏陶器的边缘；阴影轻而弥散，像陶土在棉麻布上投下的浅影。整体避免高对比的冷色与锐利直角，用色块、肌理、渐变和手绘图标共同营造“温润手作”的氛围。

**Key Characteristics:**
- 手账式分层：顶部氛围区、可滚动内容区、底部固定 Tab 形成明确的书页节奏。
- 陶土色系为主，窑变青灰与火候暖橙作为功能点缀，红陶仅用于预警。
- 大圆角卡片（16–20px）与胶囊按钮，传递手捏有机感。
- 轻量渐变与毛玻璃效果用于顶部和浮层，提升层次但不浮夸。
- 纸纹/细点装饰作为背景肌理，避免纯色平铺的单调。
- 手绘风格 SVG 图标统一使用，每个图标带语义化 `<title>`。
- 内容区严格限制 390px 宽度并居中，底部 Tab 固定，不侧边、不全宽拉伸。

## 2. Color Palette & Roles

### Primary（陶土窑变系）
- **素坯白** (`#F7F4EF`): 页面主背景。带极淡暖黄，像未上釉的瓷坯。
- **陶土褐** (`#B88B6F`): 品牌主色。用于大面积氛围区、选中态、重要图形。
- **赭石焦边** (`#A2593B`): 主交互色。按钮、激活 Tab、关键图标。
- **深褐泥胎** (`#3E2F27`): 主文字与深色卡片背景。
- **窑变青灰** (`#6E8078`): 次级品牌色。用于次要按钮、完成态、 calm 状态标签。

### Functional Accents
- **火候暖橙** (`#E08A52`): 高亮正向操作。签到、积分获得、预约成功、主要徽章。
- **红陶预警** (`#B84A3E`): 沉睡提醒、低库存、删除、取消预约。
- **金缮米金** (`#D9C3A0`): 装饰性点缀。用于空状态插画线、页眉装饰、细边框。

### Text
- **泥胎黑** (`#3E2F27`): 浅色背景主文字。
- **陶土灰** (`#7A6A5C`): 次级说明、占位符、时间戳。
- **素坯白** (`#F7F4EF`): 深色背景与按钮文字。
- **淡褐 60%** (`rgba(62, 47, 39, 0.60)`): 禁用态、辅助文字。

### Surface & Backgrounds
- **素坯白** (`#F7F4EF`): 页面根背景。
- **陶土卡其** (`#EBE2D7`): 卡片、列表项、输入框背景。
- **泥胎褐** (`#5A463A`): 底部 Tab、顶部氛围深色区。
- **毛玻璃白** (`rgba(247, 244, 239, 0.82)`): 滚动后 sticky 头部背景，配 `backdrop-filter: blur(14px)`。
- **窑变青灰 10%** (`rgba(110, 128, 120, 0.10)`): 轻量容器、完成态背景。
- **火候橙 10%** (`rgba(224, 138, 82, 0.10)`): 积分、签到等正向状态轻背景。
- **红陶 8%** (`rgba(184, 74, 62, 0.08)`): 预警横幅背景。

### Gradients
- **顶部氛围渐变**: `linear-gradient(165deg, #CBA58C 0%, #B88B6F 45%, #F7F4EF 100%)` — 首页顶部弧形氛围区。
- **签到按钮渐变**: `linear-gradient(135deg, #E08A52 0%, #D67A3E 100%)` — 饱满有温度。
- **库存充足条**: `linear-gradient(90deg, #6E8078 0%, #7F9189 100%)`。
- **库存预警条**: `linear-gradient(90deg, #E08A52 0%, #D66E3A 100%)`。

### Shadows
- **卡片浮升** (`rgba(62, 47, 39, 0.10) 0px 6px 20px -4px`): 主要卡片阴影。
- **按钮柔和阴影** (`rgba(162, 89, 59, 0.22) 0px 4px 14px 0px`): 主按钮悬浮感。
- ** pressed inset** (`inset rgba(62, 47, 39, 0.12) 0px 2px 6px 0px`).

## 3. Typography Rules

### Font Family
- **Display / Headline**: `"PingFang SC", "Noto Sans SC", "Microsoft YaHei", sans-serif`。
- **Handwritten accent**: `"Kaiti", "STKaiti", cursive` — 小面积装饰，如空状态标题、页眉印章文字。
- **Body**: `"PingFang SC", "Noto Sans SC", "Microsoft YaHei", sans-serif`。

### Hierarchy

| Role | Size | Weight | Line Height | Letter Spacing | Color |
|------|------|--------|-------------|----------------|-------|
| Page Title | 26px | 600 | 1.18 | 0.6px | 泥胎黑 |
| Section Title | 18px | 600 | 1.3 | 0.3px | 泥胎黑 |
| Card Title | 16px | 600 | 1.35 | 0.2px | 泥胎黑 |
| Body | 14px | 400 | 1.6 | 0.2px | 泥胎黑 |
| Body Emphasis | 14px | 600 | 1.5 | 0.2px | 泥胎黑 |
| Caption | 12px | 400 | 1.45 | 0.2px | 陶土灰 |
| Number / Points | 30px | 700 | 1.0 | 0 | 赭石焦边 |
| Button | 15px | 600 | 1.0 | 0.4px | 素坯白 |
| Tab Label | 11px | 500 | 1.2 | 0.2px | 素坯白/陶土褐 |
| Empty Title | 18px | 500 | 1.4 | 0.5px | 陶土灰，手写体 |

### Principles
- 标题适度 letterSpacing，营造手写排版时的自然字距。
- 中文行高 1.5+，保证阅读舒适。
- 数字使用 tabular-num 风格，便于积分、库存快速比对。

## 4. Component Stylings

### Buttons

**Primary CTA（赭石焦边）**
- Background: `#A2593B`
- Text: `#F7F4EF`
- Padding: 13px 28px
- Radius: 999px
- Shadow: `rgba(162, 89, 59, 0.22) 0px 4px 14px 0px`
- Hover/Pressed: background `#86482F`, scale(0.98)

**Secondary CTA（窑变青灰）**
- Background: `#6E8078`
- Text: `#F7F4EF`
- Radius: 999px
- Padding: 11px 22px

**Outline Button**
- Background: transparent
- Border: 1.5px solid `#A2593B`
- Text: `#A2593B`
- Radius: 999px
- Padding: 11px 22px

**Ghost Button**
- Background: `#EBE2D7`
- Text: `#3E2F27`
- Radius: 12px
- Padding: 10px 16px

**Icon Button（圆形）**
- Size: 40px
- Background: `#F7F4EF` 或 `#EBE2D7`
- Border: 1px solid `rgba(162, 89, 59, 0.15)`
- Radius: 50%

### Cards
- Background: `#FFFFFF`（带 60% 不透明度的纸纹叠层可选）
- Border: 1px solid `rgba(162, 89, 59, 0.10)`
- Radius: 18px
- Shadow: `rgba(62, 47, 39, 0.10) 0px 6px 20px -4px`
- Padding: 16px–18px

### Inputs
- Background: `#EBE2D7`
- Border: 1px solid `rgba(162, 89, 59, 0.18)`
- Radius: 12px
- Padding: 12px 14px
- Focus: border `#A2593B`, box-shadow `0 0 0 3px rgba(162, 89, 59, 0.18)`

### Tags / Chips
- Background: `rgba(162, 89, 59, 0.10)`
- Text: `#A2593B`
- Radius: 999px
- Padding: 5px 12px
- Font: 12px weight 500
- Active: background `#A2593B`, text `#F7F4EF`

### Navigation
- 底部 Tab 栏：
  - Background: `#5A463A`
  - 顶部 1px 细线 `rgba(247, 244, 239, 0.12)`
  - 高度 64px + safe-area
  - 未选中图标 `#B88B6F`，文字 `#D9C3A0`
  - 选中图标与文字 `#F7F4EF`
  - 中间“课程”或“签到”可做轻微上浮的陶珠按钮（可选）

### Distinctive Components

**首页顶部氛围区**
- 高度约 260px，背景使用顶部氛围渐变。
- 底部以 24px 大圆角切入内容区。
- 左上角“手作·印记”大标题，右上角设置/通知入口。
- 中部偏下放置圆形签到按钮（84px），像一枚陶土印章。

**签到印章按钮**
- 默认：渐变 `#E08A52 → #D67A3E`，外圈 2px 手绘感虚线圆环 `#F7F4EF` 40% 透明度。
- 已签到：背景 `#6E8078`，文字“已签到”，外圈实线。
- 按下：scale(0.96) + inset 阴影。

**沉睡会员提醒横幅**
- 背景：红陶 8% + 左侧 4px 红陶竖条。
- 图标：手绘月亮/睡眠符号 SVG。
- 文字：“X 位会员许久未见，去唤醒 →”。
- Radius: 16px。

**低库存预警横幅**
- 背景：火候橙 10% + 左侧 4px 火候橙竖条。
- 图标：手绘陶罐/材料 SVG。
- 文字：“X 种耗材库存不足”。

**会员卡片**
- 白色卡片，左侧 52px 圆形头像（陶土色占位）。
- 中部：昵称 16px 加粗，最近互动 12px 陶土灰，工艺标签横向 chip。
- 右侧：积分陶珠（#EBE2D7 背景，#A2593B 数字）。

**作品图画廊**
- 横向滚动，图片 96×96px，radius 12px。
- 空状态：手绘相框图标 + “还没有作品，去添加第一张”手写体提示。

**课程时间轴**
- 左侧时间竖线 2px，圆点 10px。
- 右侧卡片显示课程名、时间、容量。
- 已预约卡片边框 `#A2593B` 1.5px，左侧时间圆点填充 `#A2593B`。

**库存卡片**
- 顶部名称 + 单位 caption。
- 中部圆角进度条，轨道 `#EBE2D7`，填充根据比例变色。
- 右下角“调整”文字按钮。

**积分陶珠徽章**
- 背景 `#EBE2D7`，border 1px `rgba(162,89,59,0.15)`。
- 文字“积分”caption + 数字 16px 加粗 `#A2593B`。

## 5. Layout Principles

### Spacing System
- Base: 4px
- Scale: 4, 8, 12, 16, 20, 24, 32, 40, 48, 64
- 页面水平边距：16px
- 卡片内边距：16–18px
- 模块间距：24–32px

### Container
- 内容区 max-width: 390px，居中。
- 顶部标题栏高度 56px，滚动后变为毛玻璃白 sticky。
- 底部 Tab 栏高度 64px + safe-area。

### Whitespace Philosophy
- 首页首屏 600vp 内必须看到：顶部氛围区、签到按钮、沉睡/低库存横幅（如有）、今日课程模块标题 + 1–2 条课程。
- 使用背景色块（素坯白 ↔ 陶土卡其）划分模块，减少分割线。
- 卡片之间 12–16px，模块之间 24–32px，呼吸感充足。

### Border Radius Scale
- 8px: 小按钮、输入框、小标签
- 12px: 列表项、输入框
- 16–18px: 卡片、横幅
- 20–24px: 顶部氛围区底部大圆角、模态容器
- 999px: 主按钮、Tab、chip
- 50%: 头像、签到按钮、图标按钮

## 6. Depth & Elevation

| Level | Treatment | Use |
|-------|-----------|-----|
| Flat | 无阴影 | 大面积背景 |
| Card Lift | `rgba(62,47,39,0.10) 0px 6px 20px -4px` | 卡片 |
| Button Float | `rgba(162,89,59,0.22) 0px 4px 14px` | 主按钮 |
| Sticky Header | `rgba(247,244,239,0.82)` + blur(14px) | 滚动后顶部 |
| Bottom Tab | `#5A463A` 实色 + 顶部分隔线 | 底部固定导航 |
| Pressed | scale(0.98) + inset shadow | 按钮按下 |
| Focus | `0 0 0 3px rgba(162,89,59,0.18)` | 可聚焦元素 |

### Decorative Depth
- 顶部氛围区渐变自然过渡到素坯白，形成“翻开手账”的柔和顶边。
- 签到按钮外圈虚线圆环轻微旋转动画（可选），像未干的陶轮。
- 卡片细边框与轻阴影共同营造“纸张叠放”感。

## 7. Do's and Don'ts

### Do
- 使用陶土色系 + 窑变青灰 + 火候橙 + 红陶预警的和谐配色。
- 使用大圆角、胶囊按钮、手绘图标。
- 在空状态使用手写体提示与温暖插画。
- 对积分、库存数字使用高对比强调色。
- 保持底部 Tab 固定，内容在其上方滚动。
- 所有 SVG 图标必须带语义化 `<title>`。

### Don't
- 不要使用纯白（#FFFFFF）作为大面积背景（卡片可用，但页面背景用素坯白）。
- 不要使用冷灰、亮蓝、亮绿等偏离陶土色调的颜色。
- 不要使用锐利直角与粗黑分割线。
- 不要让 Tab 导航出现在顶部或侧边。
- 不要在 PC 浏览器全宽拉伸内容。
- 不要使用 emoji 或 Unicode 图标。

## 8. Responsive Behavior

- 目标宽度 390–420vp，内容区 max-width 390px 居中。
- 超过 390px 时两侧留白，不拉伸。
- 按钮与列表项保持 44px 以上触控高度。
- 底部 Tab 宽度与 body 一致，居中固定。

## 9. Agent Prompt Guide

### Quick Color Reference
- 页面背景： `#F7F4EF`
- 主文字： `#3E2F27`
- 次级文字： `#7A6A5C`
- 主 CTA： `#A2593B`
- 次级 CTA： `#6E8078`
- 高亮： `#E08A52`
- 预警： `#B84A3E`
- 装饰金： `#D9C3A0`
- 卡片背景： `#FFFFFF`
- 卡片边框： `rgba(162, 89, 59, 0.10)`
- 卡片阴影： `rgba(62, 47, 39, 0.10) 0px 6px 20px -4px`

### Example Prompts
- “首页顶部氛围区：高度 260px，背景渐变 #CBA58C → #B88B6F → #F7F4EF，底部圆角 0 0 24px 24px；左上角标题‘手作·印记’26px 泥胎黑，右上角 40px 圆形图标按钮；中间偏下 84px 圆形签到印章按钮，渐变 #E08A52 → #D67A3E，外圈 2px 虚线圆环。”
- “沉睡提醒横幅：红陶 8% 背景，左侧 4px 红陶竖条，手绘月亮 SVG 图标，文字‘3 位会员许久未见，去唤醒 →’14px 泥胎黑。”
- “会员卡片：白色背景，18px 圆角，细边框；左侧 52px 圆形头像；昵称 16px 加粗；工艺标签为赭石 chip；右侧积分陶珠 #EBE2D7 背景，数字 #A2593B 16px 加粗。”
- “课程时间轴：左侧 2px 竖线，圆点根据状态变色；右侧白色卡片，16px 圆角；已预约卡片左侧 1.5px 赭石边框。”
- “库存卡片：白色背景，18px 圆角；顶部名称 14px 加粗；中间圆角进度条，轨道 #EBE2D7，填充按库存比例使用青灰/火候橙/红陶渐变；右下角‘调整’文字按钮 #A2593B。”

### Semantic UI Binding

| Surface / Page | Route / Tab | 关键 Semantic Targets | 事件 | 备注 |
|----------------|-------------|----------------------|------|------|
| 首页 home-page | pages/Home, tab-home | home-signin-button, home-search-input, home-sleep-banner, home-low-stock-banner, home-today-course-list | member-signin, search-members, navigate-points, navigate-inventory | 首屏 600vp 内需包含签到、提醒、今日课程 |
| 会员 members-page | pages/Members, tab-members | members-add-button, members-search-input, members-filter-chip, members-list | open-add-member, filter-members, navigate-member-detail | 列表项点击进入详情 |
| 会员详情 member-detail-page | pages/MemberDetail | member-detail-back, member-detail-edit, member-detail-name, member-detail-points, member-detail-tags, member-detail-works-gallery, member-detail-points-history, member-detail-signin-button, member-detail-redeem-points | navigate-back, open-edit-member, open-add-work, open-redeem-points, member-signin | 作品图可横向滚动 |
| 课程 courses-page | pages/Courses, tab-courses | courses-calendar-toggle, courses-date-picker, courses-list, courses-add-button | toggle-calendar-view, select-course-date, navigate-course-booking, open-add-course | 支持列表/日历视图切换 |
| 课程预约 course-booking-page | pages/CourseBooking | course-booking-back, course-booking-member-picker, course-booking-confirm, course-booking-material-warning, course-booking-seats-left | navigate-back, select-member, confirm-booking | 预约时校验库存 |
| 库存 inventory-page | pages/Inventory, tab-inventory | inventory-add-button, inventory-search-input, inventory-list, inventory-item-{id}-adjust, inventory-low-stock-section | open-add-inventory, filter-inventory, open-adjust-stock | 低库存置顶 |
| 我的 profile-page | pages/Profile, tab-profile | profile-studio-name, profile-sleep-threshold, profile-points-rule-signin, profile-points-rule-spend, profile-export-data, profile-about | update-studio-name, update-sleep-threshold, update-signin-points, update-spend-points, export-data, open-about | 设置项使用输入框/开关 |

#### 变更请求
- 无。本设计完全复用 ui-tree.json 中已有的 semantic targets、事件与绑定。
