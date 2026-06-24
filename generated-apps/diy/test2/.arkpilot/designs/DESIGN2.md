# 手作·印记 — 视觉设计规范（迭代版 2 / 终版）

## 1. Visual Theme & Atmosphere

“手作·印记”最终视觉围绕“一双手、一块泥、一次烧制”展开。界面像被手掌轻抚过的陶土：不锐利、不冰冷，色彩从素坯白过渡到窑变褐，再点缀青釉与苔绿。标题像用蘸了陶土的毛笔随手写就，正文则是工坊里整齐却不过于刻板的账本字体。卡片边缘模仿手捏陶片的不对称圆角，阴影柔和得像自然光从窗户斜射进来。整体氛围安静、可信、有温度，让用户每次打开都像是推开工坊的门。

**关键词**：手捏陶片、窑变、毛笔标记、工坊账本、温润、自然光、低饱和、呼吸感。

## 2. Color Palette & Roles

### Primary（陶土核心色阶）
- **素坯白** (`#FBF8F5`)：页面主背景，未上釉的纯净陶坯。
- **麻布米** (`#F0EBE5`)：分块背景、列表底色，像铺在桌下的粗麻布。
- **陶土褐** (`#B88363`)：主强调色，主要按钮、选中态、活跃图标，烧制后的胎色。
- **窑变赭** (`#C87E5D`)：提醒、沉睡、唤醒按钮，窑口边缘自然流露的赭色。
- **深陶炭** (`#3A2D28`)：最深文字与深色卡片背景，陶土中的铁锈与炭灰。

### Secondary（釉色与点缀）
- **青釉蓝** (`#5E8A96`)：信息、课程、链接，薄青釉的冷静。
- **苔绿** (`#7E9273`)：成功、库存充足、完成态，窗边青苔。
- **藤黄** (`#D9A96D`)：高亮、积分、标签点缀，陶土上的浅釉反光。
- **烟灰陶** (`#9B9189`)：次要文字、禁用态、占位符。

### Surface & Background
- **页面背景**：`linear-gradient(180deg, #FBF8F5 0%, #F0EBE5 55%, #E9E3DA 100%)`。
- **玻璃卡片**：`rgba(255, 253, 250, 0.9)` + `backdrop-filter: blur(16px)` + `border: 1px solid rgba(195, 170, 150, 0.18)`。
- **陶片卡片**：`#FFFDFA` 带顶部内高光 `inset 0 1px 0 rgba(255,255,255,0.85)`。
- **深色陶片**：`#3A2D28` 用于沉睡会员、积分中心头部、重要提醒；文字 `#FBF8F5`。

### Text
- **深陶炭**：`#3A2D28` 标题与正文。
- **陶土褐**：`#B88363` 次级标题、链接、强调数字。
- **烟灰陶**：`#9B9189` 说明文字。
- **素坯白**：`#FBF8F5` 深色背景上的文字。
- **浅陶白**：`rgba(251, 248, 245, 0.7)` 深色背景上的次要文字。

### State
- **主按钮 Active**：`#9C6B4F`。
- **禁用态**：`rgba(184, 131, 99, 0.34)` 背景，`rgba(255,255,255,0.72)` 文字。
- **Focus**：`2px solid #C87E5D`，`outline-offset: 2px`。
- **错误/库存不足**：`#F5E1D6` 背景，`#A2573E` 文字，`#C87E5D` 边框。
- **选中态**：`rgba(184, 131, 99, 0.12)` 背景 + `#B88363` 边框。

## 3. Typography Rules

### Font Family
- **手写标题**：`'Caveat', 'Ma Shan Zheng', cursive`。
- **正文字体**：`'Noto Sans SC', 'PingFang SC', 'Microsoft YaHei', sans-serif`。
- **数字/标签**：`'DM Mono', monospace`。

### Hierarchy

| Role | Font | Size | Weight | Line Height | Notes |
|------|------|------|--------|-------------|-------|
| Hero Title | Caveat | 44px | 700 | 1.08 | 首页标题，rotate(-1deg) |
| Page Title | Noto Sans SC | 22px | 700 | 1.22 | 二级页标题 |
| Section Title | Noto Sans SC | 18px | 700 | 1.28 | 模块标题，左侧陶点 |
| Card Title | Noto Sans SC | 16px | 600 | 1.32 | 卡片标题 |
| Body | Noto Sans SC | 14px | 400 | 1.6 | 正文 |
| Caption | Noto Sans SC | 12px | 400 | 1.42 | 辅助说明 |
| Number/Tag | DM Mono | 13px | 500 | 1 | 积分、库存 |
| Tab Label | Noto Sans SC | 11px | 500 | 1 | 底部导航 |

### Principles
- 手写标题可轻旋 -1°；正文绝对水平。
- 中文行高 1.5+。
- 积分大数字使用 32px DM Mono + 单位小字 Caveat。

## 4. Component Stylings

### Buttons

**Primary CTA（陶土按钮）**
- Background: `#B88363`
- Text: `#FBF8F5`
- Padding: 14px 26px
- Border-radius: 16px（不规则：左上 18px / 右下 12px）
- Font: 15px weight 600
- Shadow: `0 6px 18px rgba(184, 131, 99, 0.32)`
- Active: `#9C6B4F` + scale(0.98)

**Secondary Button（描边按钮）**
- Background: transparent
- Border: 1.5px solid `#B88363`
- Text: `#B88363`
- Border-radius: 14px
- Active: `rgba(184, 131, 99, 0.12)`

**Soft Button（麻布按钮）**
- Background: `#F0EBE5`
- Text: `#3A2D28`
- Border-radius: 12px
- 用于筛选、次级操作。

**Floating Action Button（深陶签到）**
- Background: `#3A2D28`
- Icon: `#FBF8F5`
- Size: 56px 圆形
- Shadow: `0 8px 24px rgba(58, 45, 40, 0.36)`
- Position: 首页右下 20px

### Cards

**陶片卡片**
- Background: `#FFFDFA`
- Border-radius: 22px（不对称：20/24/18/22）
- Padding: 18px
- Shadow: `0 10px 28px rgba(58, 45, 40, 0.08)`
- 顶部内高光
- 可选底边虚线 `border-bottom: 1.5px dashed rgba(195, 170, 150, 0.22)`

**深色陶片**
- Background: `#3A2D28`
- Text: `#FBF8F5`
- Border-radius: 22px
- 装饰：右上角青釉半透明圆斑 `rgba(94, 138, 150, 0.12)`

**作品照片卡片**
- Border-radius: 18px
- Aspect-ratio: 1 / 1
- 奇数 rotate(-1.5deg)，偶数 rotate(1.5deg)
- Shadow: `0 6px 16px rgba(58, 45, 40, 0.1)`
- 2px 白边模拟拍立得

### Tags / Chips

**工艺标签**
- Background: `rgba(184, 131, 99, 0.12)`
- Text: `#5D4237`
- Border-radius: 999px
- Padding: 5px 11px
- Font: 12px weight 500

**沉睡标签**
- Background: `#C87E5D`
- Text: `#FBF8F5`
- Border-radius: 8px

**库存预警标签**
- Background: `#F5E1D6`
- Text: `#A2573E`
- Border-radius: 6px

**积分标签**
- Background: `rgba(217, 169, 109, 0.18)`
- Text: `#8F6A3A`
- Border-radius: 999px

### Inputs

**Text Input**
- Background: `#FFFDFA`
- Border: 1.5px solid `rgba(195, 170, 150, 0.25)`
- Border-radius: 14px
- Padding: 13px 15px
- Focus border: `#B88363`
- Placeholder: `#C8BBAF`

### Tab Navigation

- Background: `rgba(251, 248, 245, 0.92)` + `backdrop-filter: blur(18px)`
- Height: 68px
- 顶部 1px `rgba(195, 170, 150, 0.12)` 细线
- 选中：图标 `#B88363`，文字 `#3A2D28`，上方 4px 陶点指示器。
- 未选中：图标 `#B9AEA4`，文字 `#9B9189`。
- Position: fixed bottom，宽度与 body 一致（max-width 390px，居中）。

## 5. Layout Principles

### Spacing System
- Base: 4px
- Scale: 4, 8, 12, 16, 20, 24, 32, 40, 48, 64

### Container
- Max-width: 390px，居中。
- Horizontal padding: 16px。
- 底部 Tab 安全区：80px。

### Page Structure
- 顶部：Hero 区或返回标题栏（首屏 600vp 内完成）。
- 中部：卡片流，间距 16px。
- 底部：固定 Tab 导航。

### Grid
- 首页快捷入口：2 列。
- 会员/课程/库存：单列卡片列表。
- 作品集：2 列 masonry。

## 6. Depth & Elevation

| Level | Treatment | Use |
|-------|-----------|-----|
| Flat | 无阴影 | 普通文字区 |
| Card Lift | `0 10px 28px rgba(58,45,40,0.08)` | 陶片卡片 |
| Button Lift | `0 6px 18px rgba(184,131,99,0.32)` | 主按钮 |
| FAB | `0 8px 24px rgba(58,45,40,0.36)` | 快捷签到 |
| Glass | `backdrop-filter: blur(16px)` | Tab 栏、浮层 |
| Focus | `2px solid #C87E5D` | 可聚焦元素 |

## 7. Imagery & Icons

- **图片风格**：自然光、粗陶、木屑、绿植、亚麻，低饱和暖调。
- **图标风格**：手绘线性 SVG，1.5-2px 描边，圆角端点；选中态填充陶土色。
- **SVG 标题**：每个内联 SVG 必须包含语义化 `<title>`。

## 8. Responsive Behavior

- 内容最大宽度 390px，PC 浏览器居中。
- Tab 栏宽度与 body 一致（max-width 390px）。
- 长屏充分利用垂直滚动，首屏关键信息在 600vp 内。

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

- `home-quick-check-in-button` → 首页右下 FAB
- `home-today-classes-count`, `home-today-reservations-count`, `home-sleeping-count`
- `home-points-activity-list` / `home-points-empty`
- `members-search-input`, `members-filter-button`, `members-add-button`, `members-list` / `members-empty-state`
- `member-detail-*` 系列：名称、积分、工艺标签、作品集、积分历史、沉睡徽章
- `points-balance`, `points-history-list`, `points-redeem-button`
- `courses-date-picker`, `courses-add-button`, `courses-list`
- `course-detail-*` 系列
- `inventory-list`, `inventory-low-stock-badge`, `inventory-add-button`
- `sleeping-members-list`, `sleeping-members-wake-button`, `sleeping-members-select-all-button`
- `check-in-member-picker`, `check-in-type-toggle`, `check-in-amount-input`, `check-in-points-input`, `check-in-course-picker`, `check-in-submit-button`
- `profile-*` 设置项

### Events to Preserve

`open-check-in`, `open-sleeping-members`, `open-filter-sheet`, `open-add-member`, `navigate-back`, `open-edit-member`, `open-redeem-sheet`, `open-add-course`, `open-book-course`, `cancel-course-booking`, `open-add-material`, `select-all-sleeping`, `wake-selected-members`, `submit-check-in`.

### Change Requests / Gaps

- 语义协议已覆盖全部核心页面与操作。
- 签到/消费页的“关联材料扣减”选择器未在 ui-tree 强制要求，可作为实现增强项。

## 10. Do's and Don'ts

### Do
- 使用陶土核心色阶与自然釉色点缀。
- 手写标题 + 清晰正文 + 等宽数字。
- 使用不对称圆角、轻微旋转、虚线边框、内高光。
- 所有 SVG 加语义 `<title>`。
- 390px 内容区居中，底部 Tab 固定并限制宽度。

### Don't
- 不要使用冷峻科技风或高饱和霓虹色。
- 不要使用 emoji 作为图标。
- 不要全宽拉伸或侧边导航。
- 不要让卡片边缘过于机械锐利。
- 不要把首屏关键内容推到 600vp 之外。
