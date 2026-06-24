# 手作·印记 — 视觉设计规范（迭代版 1）

## 1. Visual Theme & Atmosphere

“手作·印记”的视觉核心是“窑变”——陶土在烧制过程中自然形成的色彩流动与不可复制的肌理。界面像一张铺在陶轮旁的粗麻布，卡片像刚从窑里取出的陶片，边缘带着手捏的拙朴；标题像用毛笔在素坯上随手写下的标记，正文则是工整的工坊账本。整体氛围温暖、安静、有手作人的呼吸与停顿。

**关键词**：窑变、粗麻、陶片、手写标记、温润、呼吸感、低饱和、自然肌理。

## 2. Color Palette & Roles

### Primary（窑变陶土色阶）
- **素坯白** (`#FAF7F4`)：页面主背景，像未烧的陶坯表面。
- **麻布灰** (`#EFEBE6`)：分块背景、列表底色，像工作台下的粗麻布。
- **陶土褐** (`#B07D5E`)：主强调色，用于主要按钮、选中态、活跃图标，像烧制后的陶胎。
- **窑变赭** (`#C57B5B`)：次级强调，用于提醒、沉睡、唤醒按钮，像窑变边缘的赭色。
- **深陶黑** (`#3E2F2A`)：最深文字与深色卡片背景，像陶土里的铁锈与炭灰。

### Secondary（自然釉色）
- **青釉蓝** (`#5F8A96`)：信息、课程、链接，像一层薄青釉带来的冷静。
- **苔绿** (`#7D9172`)：成功、库存充足、完成态，像工作台边青苔的绿。
- **藤黄** (`#D4A26A`)：轻量高亮、积分、标签点缀，像陶土上的浅釉反光。
- **烟灰** (`#9A9089`)：次要文字、禁用态、占位符。

### Surface & Background
- **页面背景**：`linear-gradient(180deg, #FAF7F4 0%, #EFEBE6 60%, #E8E2DA 100%)`，模拟从工作台到地面的柔和过渡。
- **玻璃卡片**：`rgba(255, 252, 249, 0.88)` + `backdrop-filter: blur(14px)` + `border: 1px solid rgba(190, 160, 140, 0.18)`。
- **陶片卡片**：`#FFFFFF` 或 `#FAF7F4`，带轻微顶部高光 `inset 0 1px 0 rgba(255,255,255,0.8)`。
- **深色陶片**：`#3E2F2A` 用于沉睡会员、积分中心头部、重要提醒，文字用 `#FAF7F4`。

### Text
- **深陶黑**：`#3E2F2A` 标题与正文。
- **陶土褐**：`#B07D5E` 次级标题、链接、强调数字。
- **烟灰**：`#9A9089` 说明文字。
- **素坯白**：`#FAF7F4` 深色背景上的文字。
- **浅陶白**：`rgba(250, 247, 244, 0.72)` 深色背景上的次要文字。

### State
- **主按钮 Hover/Active**：`#96684D`。
- **禁用态**：`rgba(176, 125, 94, 0.35)` 背景，`rgba(255,255,255,0.7)` 文字。
- **Focus**：`2px solid #C57B5B`，带 2px 偏移。
- **错误/库存不足**：`#F3DED4` 背景，`#A0523D` 文字，`#C57B5B` 边框。
- **选中态**：`rgba(176, 125, 94, 0.12)` 背景 + `#B07D5E` 边框。

## 3. Typography Rules

### Font Family
- **手写标题**：`'Caveat', 'Ma Shan Zheng', cursive`。用于大标题、欢迎语、积分大数字旁的小字。
- **正文字体**：`'Noto Sans SC', 'PingFang SC', 'Microsoft YaHei', sans-serif`。
- **数字/标签**：`'DM Mono', monospace` 用于积分、库存、价格，营造工坊记账本质感。

### Hierarchy

| Role | Font | Size | Weight | Line Height | Notes |
|------|------|------|--------|-------------|-------|
| Hero Title | Caveat | 42px | 700 | 1.1 | 首页标题，可倾斜 -1° |
| Page Title | Noto Sans SC | 22px | 700 | 1.25 | 非首页页面标题 |
| Section Title | Noto Sans SC | 18px | 700 | 1.3 | 模块标题，左侧带小陶点装饰 |
| Card Title | Noto Sans SC | 16px | 600 | 1.35 | 卡片标题 |
| Body | Noto Sans SC | 14px | 400 | 1.6 | 正文 |
| Caption | Noto Sans SC | 12px | 400 | 1.45 | 辅助说明 |
| Number/Tag | DM Mono | 13px | 500 | 1 | 积分、库存 |
| Tab Label | Noto Sans SC | 11px | 500 | 1 | 底部导航 |

### Principles
- 手写标题可轻微倾斜（-1°~1°），正文绝对水平。
- 中文行高 1.5+，避免拥挤。
- 大数字使用等宽字体，积分余额使用 36px 手写数字 + DM Mono 组合。

## 4. Component Stylings

### Buttons

**Primary CTA（窑变褐按钮）**
- Background: `#B07D5E`
- Text: `#FAF7F4`
- Padding: 14px 26px
- Border-radius: 16px（不规则：左上 18px / 右下 12px）
- Font: 15px weight 600
- Shadow: `0 6px 18px rgba(176, 125, 94, 0.32)`
- Active: `#96684D` + scale(0.98)

**Secondary Button（陶土描边）**
- Background: transparent
- Border: 1.5px solid `#B07D5E`
- Text: `#B07D5E`
- Border-radius: 14px
- Active: `rgba(176, 125, 94, 0.12)`

**Soft Button（麻布按钮）**
- Background: `#EFEBE6`
- Text: `#3E2F2A`
- Border-radius: 12px
- 用于筛选、次级操作。

**Floating Action Button（窑变黑陶）**
- Background: `#3E2F2A`
- Icon: `#FAF7F4`
- Size: 56px 圆形
- Shadow: `0 8px 24px rgba(62, 47, 42, 0.35)`
- Position: 首页右下角 20px

### Cards

**陶片卡片**
- Background: `#FFFFFF`
- Border-radius: 22px（不规则）
- Padding: 18px
- Shadow: `0 10px 28px rgba(62, 47, 42, 0.08)`
- 顶部 1px 内高光
- 可选底部手绘虚线 `border-bottom: 1.5px dashed rgba(190, 160, 140, 0.2)`

**深色陶片**
- Background: `#3E2F2A`
- Text: `#FAF7F4`
- Border-radius: 22px
- 装饰：右上角青釉半透明圆斑 `rgba(95, 138, 150, 0.12)`

**作品照片卡片**
- Border-radius: 18px
- Aspect-ratio: 1 / 1
- 轻微旋转：奇数 -1.5°，偶数 1.5°
- Shadow: `0 6px 16px rgba(62, 47, 42, 0.1)`
- 边缘 2px 白边模拟拍立得

### Tags / Chips

**工艺标签**
- Background: `rgba(176, 125, 94, 0.12)`
- Text: `#5A4237`
- Border-radius: 999px
- Padding: 5px 11px
- Font: 12px weight 500

**沉睡标签**
- Background: `#C57B5B`
- Text: `#FAF7F4`
- Border-radius: 8px
- 带小月牙 SVG 图标

**库存预警标签**
- Background: `#F3DED4`
- Text: `#A0523D`
- Border-radius: 6px

**积分标签**
- Background: `rgba(212, 162, 106, 0.18)`
- Text: `#8C663A`
- Border-radius: 999px

### Inputs

**Text Input**
- Background: `#FFFFFF`
- Border: 1.5px solid `rgba(190, 160, 140, 0.25)`
- Border-radius: 14px
- Padding: 13px 15px
- Focus border: `#B07D5E`
- Placeholder: `#C4B8AE`

### Tab Navigation

- Background: `rgba(250, 247, 244, 0.92)` + `backdrop-filter: blur(18px)`
- Height: 68px
- 顶部 1px `rgba(190, 160, 140, 0.12)` 细线
- 选中：图标 `#B07D5E`，文字 `#3E2F2A`，上方 4px 小陶点指示器。
- 未选中：图标 `#B8ADA4`，文字 `#9A9089`。
- 位置：fixed bottom，宽度与 body 一致（max-width 390px，居中）。

## 5. Layout Principles

### Spacing System
- Base: 4px
- Scale: 4, 8, 12, 16, 20, 24, 32, 40, 48, 64

### Container
- Max-width: 390px，居中。
- Horizontal padding: 16px。
- 底部 Tab 安全区：80px。

### Page Structure
- 顶部：Hero 标题区（首页）或 返回+标题栏（二级页）。
- 中部：卡片流，间距 16px。
- 底部：固定 Tab 导航。

### Grid
- 首页快捷入口：2 列。
- 会员/课程：单列卡片。
- 作品集：2 列 masonry 风格。
- 库存：列表或 2 列网格。

## 6. Depth & Elevation

| Level | Treatment | Use |
|-------|-----------|-----|
| Flat | 无阴影，背景渐变区分 | 普通文字区 |
| Card Lift | `0 10px 28px rgba(62,47,42,0.08)` | 陶片卡片 |
| Button Lift | `0 6px 18px rgba(176,125,94,0.32)` | 主按钮 |
| FAB | `0 8px 24px rgba(62,47,42,0.35)` | 快捷签到 |
| Glass | `backdrop-filter: blur(14px)` + 半透明 | Tab 栏、顶部浮层 |
| Focus | `2px solid #C57B5B` | 可聚焦元素 |

## 7. Imagery & Icons

- **图片风格**：自然光、粗陶、木屑、绿植、亚麻布，低饱和暖调，避免过度修饰。
- **图标风格**：手绘线性 SVG，1.5-2px 描边，圆角端点；关键图标填充陶土色。
- **SVG 标题**：每个内联 SVG 必须包含语义化 `<title>`，反映交互用途。

## 8. Responsive Behavior

- 内容最大宽度 390px，PC 浏览器居中不拉伸。
- Tab 栏宽度与 body 一致（max-width 390px）。
- 长屏利用垂直滚动，首屏关键信息在 600vp 内。

## 9. Semantic UI Binding

### Surfaces / Routes / Tabs

| Page ID | Route | Tab ID |
|---------|-------|--------|
| home | pages/Home | tab-home |
| members | pages/Members | tab-members |
| member-detail | pages/MemberDetail | — |
| points | pages/Points | — |
| courses | pages/Courses | tab-courses |
| course-detail | pages/CourseDetail | — |
| inventory | pages/Inventory | tab-inventory |
| sleeping-members | pages/SleepingMembers | — |
| check-in | pages/CheckIn | — |
| profile | pages/Profile | tab-profile |

### Important Semantic Targets to Preserve

- `home-quick-check-in-button` → 首页右下 FAB 签到入口
- `home-today-classes-count`, `home-today-reservations-count`, `home-sleeping-count` → 今日数据断言
- `home-points-activity-list` / `home-points-empty` → 积分动态列表
- `members-search-input`, `members-filter-button`, `members-add-button`, `members-list` / `members-empty-state`
- `member-detail-*` 系列：名称、积分、工艺标签、作品集、积分历史、沉睡徽章
- `points-balance`, `points-history-list`, `points-redeem-button`
- `courses-date-picker`, `courses-add-button`, `courses-list`
- `course-detail-*` 系列：标题、时间、容量、材料、预约列表、预约/取消按钮
- `inventory-list`, `inventory-low-stock-badge`, `inventory-add-button`
- `sleeping-members-list`, `sleeping-members-wake-button`, `sleeping-members-select-all-button`
- `check-in-member-picker`, `check-in-type-toggle`, `check-in-amount-input`, `check-in-points-input`, `check-in-course-picker`, `check-in-submit-button`
- `profile-*` 设置项

### Events to Preserve

`open-check-in`, `open-sleeping-members`, `open-filter-sheet`, `open-add-member`, `navigate-back`, `open-edit-member`, `open-redeem-sheet`, `open-add-course`, `open-book-course`, `cancel-course-booking`, `open-add-material`, `select-all-sleeping`, `wake-selected-members`, `submit-check-in`.

### Change Requests / Gaps

- 当前语义协议已覆盖全部核心页面与操作。
- 设计侧建议在“签到/消费”页面增加“关联材料扣减”选择器，但不在当前 ui-tree 强制要求内，可作为实现增强项。

## 10. Do's and Don'ts

### Do
- 使用窑变陶土色阶和低饱和自然釉色。
- 标题用手写体，正文用清晰无衬线。
- 使用不规则圆角、轻微旋转、虚线边框、内高光等手作细节。
- 所有 SVG 加语义 `<title>`。
- 限制内容最大宽度 390px 并居中。
- 底部 Tab 固定且限制宽度。

### Don't
- 不要使用冷峻科技风或高饱和霓虹色。
- 不要使用 emoji 作为图标。
- 不要全宽拉伸或侧边导航。
- 不要让卡片边缘过于机械。
- 不要把关键首屏内容推到 600vp 之外。
