# 手作·印记 视觉设计系统

## 1. Visual Theme & Atmosphere

“手作·印记”的视觉气质源自陶土、素坯与手写的温度。它不是工业化的精确，而是带着指纹与温度的自然感：色彩像窑变后的陶土，边缘略带手捏的不规则，排版像是用毛笔在素纸上轻轻写下。整体界面要传达“被时间包浆过的温润”——低饱和、暖调、有肌理，但不杂乱。

排版上参考手写便签与匠人笔记本的气质。中文标题使用圆润、略带手写感的无衬线风格（在 HTML 中以系统手写/圆体字体栈模拟），正文则保持清晰易读。标题字重偏轻或中等，避免过粗带来的机械感；行高比常规略宽松，让文字像在纸上呼吸。

色彩故事以陶土色系为主轴：米白素坯、浅褐陶土、赭石焦边、深褐泥胎。点缀色取自窑变中的青灰与暖橙，用于交互与状态提示。背景不是纯白，而是带一点点暖黄的“素坯白”，让长时间查看也不刺眼。卡片与容器使用更深的“陶土褐”或带暖灰的“泥胎色”，通过色块而非强烈阴影来区分层次。

**Key Characteristics:**
- 手写感圆体标题 + 清晰正文的无衬线组合
- 陶土色系：素坯白、陶土褐、赭石焦边、深褐泥胎
- 低饱和暖调背景，替代冷白与纯黑
- 圆角与柔和边缘为主，模拟手捏陶器的有机形态
- 极少使用硬阴影，更多依靠色块分隔与细线纹理
- 装饰性细线、点状纹理、毛笔笔触作为氛围元素
- 图标采用线性手绘风格 SVG，避免几何感过强的锐利转角
- 内容区宽度限制在 390–420vp，底部固定 Tab 导航

## 2. Color Palette & Roles

### Primary（陶土色系）
- **素坯白** (`#F8F5F1`): 页面主背景。温暖、微黄，像未上釉的素坯。
- **陶土褐** (`#C89F83`): 主品牌色。用于重要标题、品牌图形、选中态背景。
- **赭石焦边** (`#A86A4B`): 强调色。用于按钮、激活态、重要图标、积分数字。
- **深褐泥胎** (`#4A3B32`): 主文字色。像烧制的陶胎，沉稳可读。

### Interactive
- **窑变青灰** (`#7A8B82`): 次级交互色。用于次级按钮、标签、选中 Tab 的 inactive 状态。
- **暖橙火候** (`#E29B65`): 高亮交互色。用于签到按钮、成功态、积分增加、关键 CTA。
- **焦茶 Pressed** (`#8C543B`): 按钮按下状态。

### Text
- **泥胎黑** (`#4A3B32`): 浅色背景上的主文字。
- **陶土灰** (`#7D6B5D`): 次级文字、说明、占位符。
- **素坯白** (`#F8F5F1`): 深色背景或按钮上的文字。
- **淡褐 64%** (`rgba(74, 59, 50, 0.64)`): 禁用态、辅助说明。

### Surface & Backgrounds
- **素坯白** (`#F8F5F1`): 页面根背景。
- **陶土卡其** (`#EDE4DA`): 卡片背景、列表项悬停/按下背景。
- **泥胎褐** (`#5C4A3E`): 深色卡片、底部 Tab 栏、顶部氛围区背景。
- **窑变青灰 12%** (`rgba(122, 139, 130, 0.12)`): 轻量容器背景、输入框背景。
- **赭石 8%** (`rgba(168, 106, 75, 0.08)`): 积分、签到等正向状态轻背景。

### Status
- **火候橙** (`#E29B65`): 正向状态、积分增加、签到成功。
- **预警红陶** (`#C45B4A`): 低库存、沉睡提醒、删除、取消预约。
- **青灰完成** (`#7A8B82`): 已完成、已签到、已预约。

### Shadows
- **Soft Clay Shadow** (`rgba(74, 59, 50, 0.10) 0px 4px 16px 0px`): 卡片与浮层的柔和投影，像陶土在纸上的浅浅影子。
- **Pressed Shadow** (`inset rgba(74, 59, 50, 0.08) 0px 2px 4px 0px`): 按钮按下时的内嵌感。

## 3. Typography Rules

### Font Family
- **Display / Headline**: `"PingFang SC", "Noto Sans SC", "STHeiti", "Microsoft YaHei", sans-serif` — 在 HTML 中通过字重与圆角处理营造手写感；ArkTS 中可使用系统默认无衬线并加大 letterSpacing 模拟。
- **Handwritten accent**: `"Kaiti", "STKaiti", "KaiTi", cursive` — 仅用于小面积氛围文字（如空状态插画文字、页眉装饰）。
- **Body**: `"PingFang SC", "Noto Sans SC", "Microsoft YaHei", sans-serif`。

### Hierarchy

| Role | Font | Size | Weight | Line Height | Letter Spacing | Notes |
|------|------|------|--------|-------------|----------------|-------|
| Page Title | 系统无衬线 | 24px (1.5rem) | 600 | 1.2 | 0.5px | 顶部页面标题，泥胎黑 |
| Section Title | 系统无衬线 | 18px (1.125rem) | 600 | 1.3 | 0.3px | 模块标题，如“今日课程” |
| Card Title | 系统无衬线 | 16px (1rem) | 600 | 1.35 | 0.2px | 卡片主标题 |
| Body | 系统无衬线 | 14px (0.875rem) | 400 | 1.55 | 0.2px | 正文与说明 |
| Body Emphasis | 系统无衬线 | 14px (0.875rem) | 600 | 1.45 | 0.2px | 强调正文 |
| Caption | 系统无衬线 | 12px (0.75rem) | 400 | 1.45 | 0.2px | 辅助信息、时间戳 |
| Number / Points | 系统无衬线 | 28px (1.75rem) | 700 | 1.1 | 0 | 积分、库存数量等数字 |
| Button | 系统无衬线 | 15px (0.94rem) | 600 | 1.0 | 0.3px | 按钮文字 |
| Tab Label | 系统无衬线 | 11px (0.69rem) | 500 | 1.2 | 0.2px | 底部 Tab 文字 |

### Principles
- 中文环境下不使用极细字重（<400），保证可读性。
- 标题适度增加 letterSpacing，模拟手写时字与字之间的自然间隙。
- 行高比 Apple 模板更宽松，让中文阅读更舒适。
- 数字使用等宽或 tabular 感，便于积分、库存等数据快速扫读。

## 4. Component Stylings

### Buttons

**Primary CTA（赭石焦边）**
- Background: `#A86A4B`
- Text: `#F8F5F1`
- Padding: 12px 24px
- Radius: 999px（饱满胶囊，像手捏陶珠）
- Border: 1px solid transparent
- Font: 15px, weight 600
- Hover / Pressed: background `#8C543B`，轻微 scale(0.98)
- Use: 签到、确认预约、保存会员

**Secondary（窑变青灰）**
- Background: `#7A8B82`
- Text: `#F8F5F1`
- Padding: 10px 20px
- Radius: 999px
- Use: 次要操作，如“取消”、“返回”

**Outline（陶土褐描边）**
- Background: transparent
- Text: `#A86A4B`
- Border: 1.5px solid `#A86A4B`
- Radius: 999px
- Padding: 10px 20px
- Use: 编辑、添加作品、查看更多

**Ghost（陶土卡其底）**
- Background: `#EDE4DA`
- Text: `#4A3B32`
- Radius: 12px
- Padding: 10px 16px
- Use: 列表项、筛选标签

### Cards & Containers
- Background: `#FFFFFF` 或 `#EDE4DA`
- Border: 1px solid `rgba(168, 106, 75, 0.12)`
- Radius: 16px（大圆角，温润感）
- Shadow: `rgba(74, 59, 50, 0.10) 0px 4px 16px 0px`
- Padding: 16px
- Use: 首页概览卡片、会员卡片、课程卡片、库存卡片

### Inputs
- Background: `#F8F5F1`
- Border: 1px solid `rgba(168, 106, 75, 0.20)`
- Radius: 12px
- Padding: 12px 14px
- Focus: border `#A86A4B`, 2px 柔和外发光 `rgba(168, 106, 75, 0.20)`
- Placeholder: `#7D6B5D` 64%

### Tags / Chips
- Background: `rgba(168, 106, 75, 0.10)`
- Text: `#A86A4B`
- Radius: 999px
- Padding: 4px 10px
- Font: 12px, weight 500
- Use: 工艺标签、课程状态

### Navigation
- **底部 Tab 栏**：
  - Background: `#5C4A3E`
  - Height: 64px + safe-area
  - 图标 + 文字，未选中 `#C89F83`，选中 `#F8F5F1`
  - 顶部细线装饰：`rgba(248, 245, 241, 0.10)` 1px
  - 固定在底部，宽度限制与 body 一致（max-width 390px，居中）

### Distinctive Components

**签到印章按钮**
- 圆形或圆角矩形，背景 `#E29B65`，带手绘圆环装饰
- 文字“今日签到”，已签到变灰“已签到”
- 按下时有轻微压印感（内阴影）

**沉睡会员提醒横幅**
- 背景 `#C45B4A` 8% 透明叠层
- 左侧手绘“ZZZ”或月亮图标
- 文字说明“X 位会员许久未见”，右侧箭头进入

**积分陶珠**
- 小圆点或胶囊，显示积分余额
- 背景 `#EDE4DA`，文字 `#A86A4B`，数字加粗

**课程时间轴卡片**
- 左侧竖线时间指示器（不同状态不同色）
- 右侧课程信息卡片
- 已预约高亮边框

**库存进度条**
- 圆角轨道 `#EDE4DA`
- 填充色根据库存比例变化：充足 `#7A8B82`，偏低 `#E29B65`，不足 `#C45B4A`

## 5. Layout Principles

### Spacing System
- Base unit: 4px
- Scale: 4, 8, 12, 16, 20, 24, 32, 40, 48, 64
- 卡片内部 padding 16px，卡片间距 12–16px
- 页面水平边距 16px

### Grid & Container
- 内容区最大宽度 390px（移动端优先），居中。
- 页面顶部保留 56px 状态栏/标题区。
- 底部预留 64px + safe-area Tab 栏空间。
- 卡片、列表、表单均处于 16px 水平边距内。

### Whitespace Philosophy
- 首页首屏在 600vp 内展示：标题、签到入口、沉睡/低库存提醒、今日课程。
- 模块之间用 24–32px 垂直间距分隔，避免拥挤。
- 背景色块变化（素坯白 ↔ 陶土卡其）自然划分模块，减少分割线。

### Border Radius Scale
- Micro (8px): 小按钮、输入框、小标签
- Standard (12px): 卡片、列表项
- Large (16px): 大卡片、模态容器
- Full Pill (999px): 主按钮、Tab 标签、筛选 chip
- Circle (50%): 头像、签到按钮、徽章

## 6. Depth & Elevation

| Level | Treatment | Use |
|-------|-----------|-----|
| Flat (Level 0) | 无阴影，纯背景色 | 页面底层、大面积背景 |
| Card Lift | `rgba(74,59,50,0.10) 0px 4px 16px` | 卡片、浮层按钮 |
| Sticky Header | 背景 `rgba(248,245,241,0.92)` + `backdrop-filter: blur(12px)` | 顶部标题栏滚动后 |
| Bottom Tab | 背景 `#5C4A3E` + 顶部 1px 分隔线 | 底部固定导航 |
| Pressed | `inset rgba(74,59,50,0.08) 0px 2px 4px` + scale(0.98) | 按钮按下 |
| Focus Ring | `0 0 0 3px rgba(168,106,75,0.25)` | 输入框、按钮聚焦 |

### Decorative Depth
- 顶部氛围区可使用陶土褐渐变（`linear-gradient(180deg, #C89F83 0%, #F8F5F1 100%)`）作为首页欢迎背景，但仅占首屏顶部约 240vp。
- 卡片边缘可用极细 `rgba(168,106,75,0.08)` 边框模拟纸张厚度。

## 7. Do's and Don'ts

### Do
- 使用陶土色系作为全部色彩基础。
- 使用大圆角（12–16px）卡片与胶囊按钮。
- 使用手绘风格 SVG 图标，并始终加 `<title>`。
- 在空状态使用温润插画 + 手写感提示文字。
- 保持底部 Tab 固定，内容在其上方滚动。
- 对积分、库存等数字使用高对比强调色。

### Don't
- 不要使用冷白（#FFFFFF）作为大面积背景。
- 不要使用锐利直角、细黑线分割。
- 不要使用高饱和红/绿作为状态色（使用陶土色系的变体）。
- 不要让 Tab 导航出现在侧边或顶部（底部固定）。
- 不要在 PC 浏览器中全宽拉伸内容。
- 不要使用 emoji 作为图标。

## 8. Responsive Behavior

### Breakpoints
- 本设计以 390–420vp 手机为唯一目标。
- HTML 设计稿以 390px 宽度渲染，body 居中，max-width: 390px。
- 超过 390px 时，内容区保持居中，两侧留白。

### Touch Targets
- 底部 Tab 图标区域最小 48×40px。
- 按钮高度最低 44px。
- 列表项最小点击高度 56px。

### Scaling Strategy
- 字体使用 rem，根字号 16px。
- 间距使用固定 px，保证 HarmonyOS vp 映射一致。
- 图片使用 object-fit: cover，固定宽高比。

## 9. Agent Prompt Guide

### Quick Color Reference
- 页面背景： `#F8F5F1`
- 主文字： `#4A3B32`
- 次要文字： `#7D6B5D`
- 主 CTA 背景： `#A86A4B`
- 主 CTA 文字： `#F8F5F1`
- 次级交互： `#7A8B82`
- 高亮/签到： `#E29B65`
- 预警/删除： `#C45B4A`
- 卡片背景： `#FFFFFF` 或 `#EDE4DA`
- 卡片阴影： `rgba(74, 59, 50, 0.10) 0px 4px 16px 0px`
- 边框： `rgba(168, 106, 75, 0.12)`

### Example Component Prompts
- “首页顶部氛围区：陶土褐到素坯白的渐变背景，高度约 220px，圆角 0 0 24px 24px；左侧大标题‘手作·印记’24px 泥胎黑，副标题‘今日工作室’14px 陶土灰；右侧圆形签到按钮 72px，背景 #E29B65，带手绘圆环装饰，文字‘签到’15px 素坯白。”
- “会员卡片：白色背景，16px 圆角，细陶土色边框；左侧 48px 圆形头像，右侧昵称 16px 加粗，下方工艺标签横向排列，最右侧显示积分陶珠。”
- “课程时间轴卡片：左侧 12px 竖线时间指示器（已预约 #A86A4B，未预约 #7A8B82），右侧白色卡片；标题 16px 加粗，时间 12px 陶土灰，右下角胶囊按钮‘预约’#A86A4B。”
- “库存卡片：白色背景，16px 圆角；顶部名称与单位，中间横向进度条（充足青灰/偏低火候橙/不足红陶），右下角‘调整’文字按钮。”
- “沉睡会员横幅：陶土红 8% 背景，左侧月亮 SVG 图标，中间文字‘3 位会员许久未见’，右侧箭头，整体 12px 圆角。”

### Semantic UI Binding

| Surface / Page | Route / Tab | 关键 Semantic Targets | 事件 | 备注 |
|----------------|-------------|----------------------|------|------|
| 首页 home-page | pages/Home, tab-home | home-signin-button, home-search-input, home-sleep-banner, home-low-stock-banner, home-today-course-list | member-signin, search-members, navigate-points, navigate-inventory | 首屏 600vp 内需包含签到、提醒、今日课程 |
| 会员 members-page | pages/Members, tab-members | members-add-button, members-search-input, members-filter-chip, members-list | open-add-member, filter-members, navigate-member-detail | 列表项点击进入详情 |
| 会员详情 member-detail-page | pages/MemberDetail | member-detail-back, member-detail-edit, member-detail-name, member-detail-points, member-detail-tags, member-detail-works-gallery, member-detail-points-history, member-detail-signin-button, member-detail-redeem-points | navigate-back, open-edit-member, open-add-work, open-redeem-points, member-signin | 作品图可横向滚动 |
| 课程 courses-page | pages/Courses, tab-courses | courses-calendar-toggle, courses-date-picker, courses-list, courses-add-button | toggle-calendar-view, select-course-date, navigate-course-booking, open-add-course | 支持列表/日历视图切换 |
| 课程预约 course-booking-page | pages/CourseBooking | course-booking-back, course-booking-member-picker, course-booking-confirm, course-booking-material-warning, course-booking-seats-left | navigate-back, select-member, confirm-booking | 预约时校验库存 |
| 库存 inventory-page | pages/Inventory, tab-inventory | inventory-add-button, inventory-search-input, inventory-list, inventory-item-{id}-adjust, inventory-low-stock-section | open-add-inventory, filter-inventory, open-adjust-stock | 低库存置顶 |
| 我的 profile-page | pages/Profile, tab-profile | profile-studio-name, profile-sleep-threshold, profile-points-rule-signin, profile-points-rule-spend, profile-export-data, profile-about | update-studio-name, update-sleep-threshold, update-signin-points, update-spend-points, export-data, open-about | 设置项使用开关/滑块/输入框 |

#### ID / Event 映射说明
- 所有 `itemIdPattern` 中的 `{id}` 在实现时替换为实体 ID，`{index}` 替换为数组下标。
- `home-signin-button` 在未签到时显示“今日签到”，已签到后变为“已签到”并禁用。
- `members-list` 列表项需同时支持点击整行（`members-item-{id}-detail`）与避免内部按钮冲突。
- `member-detail-works-gallery` 为空时显示 `member-detail-works-empty` 提示。
- `course-booking-material-warning` 在库存不足时显示，否则隐藏。
- `inventory-low-stock-section` 为空时显示 `inventory-no-low-stock` 提示。

#### 发现的 ID 缺口/变更请求
- 无。现有 semantic targets 已覆盖本设计所需的所有交互与断言目标。
