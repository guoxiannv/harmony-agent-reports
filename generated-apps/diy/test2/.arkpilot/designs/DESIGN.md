# 手作·印记 — 视觉设计规范

## 1. Visual Theme & Atmosphere

“手作·印记”的视觉语言是一场对陶土温润质感和手写温度的转译。我们不追求工业化的精确，而是让界面带有“手捏出来”的呼吸感：边缘略带不规则的圆角、类似陶土釉面的渐变、仿佛炭笔手写的标题，以及低饱和的陶土暖色系。整体氛围安静、亲切、有温度，像一个阳光斜照的陶艺工作台。

**关键词**：陶土色、手写感、温润、自然、手作风、呼吸感、低饱和。

## 2. Color Palette & Roles

### Primary（陶土主色）
- **陶土白** (`#F8F4F0`)：页面主背景，像未上釉的素陶。
- **陶土米** (`#EDE6DE`)：卡片、分块背景，营造层叠的泥坯质感。
- **陶土褐** (`#A67B5B`)：主强调色，用于按钮、选中态、重要图标，像烧制成的陶罐边缘。
- **深陶** (`#5D4037`)：主标题、深色文字，像陶土中的铁锈色。

### Secondary（自然辅色）
- **苔绿** (`#7A8B6E`)：成功、库存充足、完成态，像工作台边的绿植。
- **赭石** (`#C67D5F`)：提醒、沉睡会员、预警标签，像未干的陶土。
- **黛蓝** (`#4A6C7C`)：信息、链接、课程相关，像青花釉下的一抹冷静。
- **暖灰** (`#9E9590`)：次要文字、占位、禁用态。

### Surface & Background
- **背景渐变 1**：`linear-gradient(180deg, #F8F4F0 0%, #EDE6DE 100%)` 用于首页顶部。
- **卡片背景**：`rgba(255, 252, 249, 0.92)` 带 `backdrop-filter: blur(12px)`，营造釉面的微透光感。
- **深色卡片**：`#5D4037` 用于沉睡会员、重要提醒模块。
- **手绘边框**：`rgba(93, 64, 55, 0.12)` 1.5px，略带毛边（使用 dashed 或 SVG 边框）。

### Text
- **深陶文字**：`#5D4037` 用于标题与正文。
- **浅陶文字**：`#8D7B72` 用于次要说明。
- **白字**：`#FFFFFF` 用于深色卡片上的文字。
- **反白陶土**：`#F8F4F0` 用于深色背景上的次要文字。

### State
- **主按钮按下**：`#8B5E3C`。
- **禁用态**：背景 `rgba(166, 123, 91, 0.35)`，文字 `rgba(255,255,255,0.7)`。
- **Focus**：`2px solid #C67D5F` 手描边效果。
- **错误/库存不足**：背景 `#F5E0D8`，文字 `#A6503A`，边框 `#C67D5F`。

## 3. Typography Rules

### Font Family
- **手写标题**：`'Caveat', 'Ma Shan Zheng', cursive`（ fallback 到系统手写体）。
- **正文字体**：`'Noto Sans SC', 'PingFang SC', 'Microsoft YaHei', sans-serif`。
- **数字/标签**：`'DM Mono', monospace` 用于积分、库存数量，增加工坊记账感。

### Hierarchy

| Role | Font | Size | Weight | Line Height | Notes |
|------|------|------|--------|-------------|-------|
| Page Title | Caveat / 手写体 | 36px | 700 | 1.15 | 首页大标题，倾斜 1° 营造手写感 |
| Section Title | Noto Sans SC | 20px | 700 | 1.3 | 模块标题 |
| Card Title | Noto Sans SC | 17px | 600 | 1.35 | 卡片内标题 |
| Body | Noto Sans SC | 15px | 400 | 1.55 | 正文 |
| Caption | Noto Sans SC | 13px | 400 | 1.45 | 辅助说明 |
| Tag | DM Mono | 12px | 500 | 1 | 积分、库存数字 |
| Tab Label | Noto Sans SC | 12px | 500 | 1 | 底部导航文字 |

### Principles
- 标题允许轻微倾斜（`transform: rotate(-1deg)`），但正文保持水平以保证可读性。
- 中文行高适度放松（1.45-1.55），避免拥挤。
- 数字使用等宽字体，积分余额突出显示。

## 4. Component Stylings

### Buttons

**Primary CTA（陶土按钮）**
- Background: `#A67B5B`
- Text: `#FFFFFF`
- Padding: 14px 24px
- Border-radius: 14px（不规则圆角，右上略大）
- Font: 16px weight 600
- Shadow: `0 4px 12px rgba(166, 123, 91, 0.28)`
- Active: background `#8B5E3C`，scale(0.98)

**Secondary Button（米陶描边）**
- Background: transparent
- Border: 1.5px solid `#A67B5B`
- Text: `#A67B5B`
- Border-radius: 12px
- Active: background `rgba(166, 123, 91, 0.1)`

**Floating Action Button（快捷签到）**
- Background: `#5D4037`
- Icon: 白色，陶土圆形
- Shadow: `0 6px 20px rgba(93, 64, 55, 0.35)`
- Position: 首页右下角，距边 20px

### Cards

**Standard Card**
- Background: `rgba(255, 252, 249, 0.92)`
- Border-radius: 20px（不规则：左上 20px / 右下 24px）
- Padding: 16px
- Shadow: `0 8px 24px rgba(93, 64, 55, 0.08)`
- 可选手绘边框：`border: 1.5px dashed rgba(93, 64, 55, 0.1)`

**Dark Card（沉睡提醒）**
- Background: `#5D4037`
- Text: `#F8F4F0`
- Border-radius: 20px
- 装饰：右上角半透明陶土圆斑

**Image Card（作品图）**
- Border-radius: 16px
- Aspect-ratio: 1 / 1
- Object-fit: cover
- 轻微旋转：nth-child(odd) `rotate(-1deg)`，偶数 `rotate(1deg)`，模拟随手摆放的照片。

### Tags / Chips

**工艺标签**
- Background: `rgba(166, 123, 91, 0.12)`
- Text: `#5D4037`
- Border-radius: 999px
- Padding: 4px 10px
- Font: 12px weight 500

**沉睡标签**
- Background: `#C67D5F`
- Text: white
- Border-radius: 8px

**库存预警标签**
- Background: `#F5E0D8`
- Text: `#A6503A`
- Border-radius: 6px

### Inputs

**Text Input**
- Background: `#FFFFFF`
- Border: 1.5px solid `rgba(93, 64, 55, 0.15)`
- Border-radius: 12px
- Padding: 12px 14px
- Focus border: `#A67B5B`
- Placeholder color: `#BDB0A8`

### Tab Navigation

- Background: `rgba(248, 244, 240, 0.92)` + `backdrop-filter: blur(16px)`
- Height: 64px
- 选中项：图标 `#A67B5B`，文字 `#5D4037`，上方小圆点指示器。
- 未选中：图标 `#9E9590`，文字 `#9E9590`。
- 顶部细线：`1px solid rgba(93, 64, 55, 0.08)`
- Position: fixed bottom，宽度限制与 body 一致。

## 5. Layout Principles

### Spacing System
- Base: 4px
- Scale: 4, 8, 12, 16, 20, 24, 32, 40, 48, 64

### Container
- Max-width: 390px，居中。
- 水平 Padding: 16px。
- 底部为 Tab 导航预留 80px 安全区。

### Page Structure
- 顶部：手写大标题 + 副标题/日期问候（顶部 600vp 内）。
- 中部：可滚动卡片流，卡片间 16px 间距。
- 底部：固定 Tab 导航。

### Grid
- 会员/课程卡片：单列为主，作品集/库存网格可 2 列。
- 首页快捷入口：2 列网格。

## 6. Depth & Elevation

| Level | Treatment | Use |
|-------|-----------|-----|
| Flat | 无阴影，背景色区分 | 普通文字区域 |
| Card Lift | `0 8px 24px rgba(93,64,55,0.08)` | 卡片 |
| Button Lift | `0 4px 12px rgba(166,123,91,0.28)` | 主按钮 |
| FAB | `0 6px 20px rgba(93,64,55,0.35)` | 首页快捷签到 |
| Glass | `backdrop-filter: blur(12px)` + 半透明背景 | Tab 栏、顶部浮层 |
| Focus | `2px solid #C67D5F` | 可聚焦元素 |

## 7. Imagery & Icons

- **图片风格**：自然光下手作场景、陶土、木屑、植物，低饱和暖调。
- **图标风格**：线性手绘风 SVG，描边 1.5-2px，端点圆角，不使用 emoji。
- **SVG 标题**：每个内联 SVG 必须包含语义化 `<title>`，反映业务用途。

## 8. Responsive Behavior

- 内容区最大 390px，居中。
- 在更宽屏幕上保持居中，不拉伸。
- Tab 栏宽度与 body 一致（max-width 390px），居中固定底部。
- 长屏幕充分利用垂直滚动，避免内容过度压缩。

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

- `home-quick-check-in-button` → 首页快捷签到入口
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

- 设计阶段无新增语义目标；所有 ID 已在 ui-tree.json 中覆盖。
- 建议在实现时为“签到/消费”页面增加 `check-in-material-picker` 以支持库存扣减，但当前未写入 ui-tree，视为实现侧可选增强。

## 10. Do's and Don'ts

### Do
- 使用陶土暖色系和低饱和配色。
- 标题使用手写风格字体，正文保持清晰可读。
- 使用不规则圆角、轻微旋转、虚线边框等手作细节。
- 使用 SVG 图标并加 `<title>`。
- 限制内容最大宽度 390px 并居中。
- 底部 Tab 导航固定且限制宽度。

### Don't
- 不要使用高饱和霓虹色或冷峻科技感配色。
- 不要使用 emoji 作为 UI 图标。
- 不要全宽拉伸页面或在侧边放置导航。
- 不要让卡片边缘过于机械锐利。
- 不要在首屏 600vp 之外才展示关键内容。
