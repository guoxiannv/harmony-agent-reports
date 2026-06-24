# 手作·印记 — Visual Design System

## 1. Visual Theme & Atmosphere

"手作·印记"的视觉气质是一本摊开的陶土手账本：温暖、质朴、有触感。我们不追求工业级的冷峻精确，而是让每一处圆角、每一道阴影、每一笔画线都像手指在陶土上留下的痕迹。整体色调取法赤陶、素陶、窑变釉与未上釉的粗陶肌理，辅以手写感字体与手绘风格的点缀，营造出"工坊工作台上的一本记录册"的沉浸感。

色彩以低饱和的陶土暖色为底，焦糖色与赤褐色作为情绪 accent，米白与陶白作为阅读背景，深褐作为文字主色。界面元素多用圆润的有机形态，避免锋利的直角；卡片边缘带有轻微的"手捏"不规则感，通过 subtle 的投影与纸质纹理暗示可触性。

**Key Characteristics:**
- 手写感中文字体栈（ZCOOL XiaoWei / 站酷小薇体）作为标题与装饰，系统字体作为正文，保证可读性
- 陶土暖色体系：赤陶 `#C67B5C`、焦糖 `#B87D4B`、陶白 `#FAF6F0`、米纸 `#F5EDE4`、深褐 `#3D2B1F`
- 有机圆角：基础圆角 12px-20px，关键卡片 24px，按钮为饱满的胶囊形（pill）
- 纸质/陶土纹理背景：使用极淡的噪点或水彩晕染作为页面底纹
- 手绘风格图标：线条略带不规则，端点圆钝
- 阴影柔和且带暖调：模拟陶土在午后阳光下的投影
- 留白宽裕但不疏离：段落之间像手账本中的分页

## 2. Color Palette & Roles

### Primary（陶土本色）
- **赤陶 Terracotta** (`#C67B5C`): 主品牌色，用于主要按钮、选中状态、关键强调。
- **焦糖 Caramel** (`#B87D4B`): 次级强调，用于高亮标签、积分数字、Badge。
- **陶白 Clay White** (`#FAF6F0`): 页面主背景，温润的米白色。
- **米纸 Rice Paper** (`#F5EDE4`): 卡片、输入框、次级背景。
- **深褐 Dark Umber** (`#3D2B1F`): 主文字颜色，温暖而不冷峻。

### Secondary（窑变与层次）
- **釉青 Celadon Mist** (`#A8B5A0`): 成功、签到、正向状态（如积分增加）。
- **钴蓝 Dusty Cobalt** (`#5A6F7C`): 信息提示、链接、日历选中。
- **赭石 Rust** (`#A0522D`): 警告、库存低、沉睡提醒。
- **陶灰 Clay Gray** (`#9E9186`): 次级文字、占位符、禁用状态。
- **浅褐 Sand** (`#D9CFC2`): 分割线、边框、轻量背景。

### Surface & Depth
- **Card Surface** (`#FFFDF9`): 卡片表面，比背景稍暖白。
- **Pressed Clay** (`#EDE5DA`): 按钮按下、输入框聚焦背景。
- **Shadow Warm** (`rgba(99, 72, 54, 0.12)`): 卡片与浮动元素的柔和暖调投影。
- **Shadow Deep** (`rgba(61, 43, 31, 0.18)`): 底部导航、模态、Sheet 的稍重投影。

### Text
- **Heading** (`#3D2B1F`): 标题与重要文字。
- **Body** (`#5A4A3F`): 正文，比标题稍浅。
- **Secondary** (`#8C7D70`): 辅助说明、时间戳、占位符。
- **On Accent** (`#FFFFFF`): 强调色按钮上的文字。
- **Link** (`#5A6F7C`): 文字链接，釉青灰蓝。

## 3. Typography Rules

### Font Family
- **Display / Headline**: `"ZCOOL XiaoWei", "Ma Shan Zheng", "STKaiti", "KaiTi", cursive` — 手写感，用于页面标题、大数字、欢迎语。
- **Body / UI**: `"PingFang SC", "Hiragino Sans GB", "Microsoft YaHei", sans-serif` — 保证中文可读性。
- **Fallback**: 若无法加载手写体，回退到楷体/行书，最后无衬线。

### Hierarchy

| Role | Font | Size | Weight | Line Height | Letter Spacing | Notes |
|------|------|------|--------|-------------|----------------|-------|
| Display Hero | ZCOOL XiaoWei | 40px | 400 | 1.20 | 0.02em | 首页欢迎标题，手作感最重 |
| Page Title | ZCOOL XiaoWei | 28px | 400 | 1.25 | 0.01em | 页面顶部标题 |
| Section Title | PingFang SC | 20px | 600 | 1.30 | 0 | 区块标题 |
| Card Title | PingFang SC | 17px | 600 | 1.35 | 0 | 卡片主标题 |
| Body | PingFang SC | 15px | 400 | 1.55 | 0 | 正文 |
| Body Emphasis | PingFang SC | 15px | 600 | 1.45 | 0 | 强调正文 |
| Caption | PingFang SC | 13px | 400 | 1.40 | 0 | 辅助说明 |
| Micro | PingFang SC | 12px | 400 | 1.35 | 0.01em | 标签、时间戳 |
| Tab Label | PingFang SC | 11px | 500 | 1.20 | 0 | 底部 Tab 文字 |

### Principles
- 标题使用手写体时避免过小（最小 20px），保证笔画清晰。
- 正文始终保持系统字体，不牺牲可读性。
- 数字（积分、库存、价格）使用等宽或 tabular figures，避免抖动。
- 行高偏宽松（1.45-1.55），营造手账的阅读节奏。

## 4. Component Stylings

### Buttons

**Primary Filled（赤陶按钮）**
- Background: `#C67B5C`
- Text: `#FFFFFF`
- Padding: 14px 24px
- Radius: 999px（饱满胶囊）
- Font: PingFang SC, 15px, weight 600
- Shadow: `0 4px 14px rgba(198, 123, 92, 0.28)`
- Active: scale(0.98), background `#B56A4B`
- Use: 保存、确认预约、签到

**Secondary Outline（米纸描边）**
- Background: transparent
- Border: 1.5px solid `#C67B5C`
- Text: `#C67B5C`
- Padding: 12px 20px
- Radius: 999px
- Font: PingFang SC, 14px, weight 500
- Active: background `rgba(198, 123, 92, 0.08)`
- Use: 编辑、次要操作、取消

**Tertiary Text（文字按钮）**
- Background: transparent
- Text: `#5A6F7C`
- Font: PingFang SC, 14px, weight 500
- Underline on active
- Use: 查看更多、链接

**Floating Action Button（陶土圆钮）**
- Background: `#C67B5C`
- Size: 56px
- Radius: 50%
- Shadow: `0 6px 20px rgba(198, 123, 92, 0.32)`
- Icon: 白色 SVG，居中
- Use: 会员列表/课程日历/库存的快捷新增

### Cards

**Standard Card（手账卡片）**
- Background: `#FFFDF9`
- Border: 1px solid `#F0E6DA`
- Radius: 20px
- Padding: 16px
- Shadow: `0 4px 16px rgba(99, 72, 54, 0.08)`
- Use: 会员卡片、课程卡片、库存项

**Feature Card（强调卡片）**
- Background: gradient `linear-gradient(135deg, #FFFDF9 0%, #F5EDE4 100%)`
- Border: none
- Radius: 24px
- Padding: 20px
- Shadow: `0 8px 24px rgba(99, 72, 54, 0.10)`
- Use: 首页概览、沉睡会员提醒、积分总览

**List Item（轻量列表项）**
- Background: transparent
- Border-bottom: 1px solid `#EFE6DA`
- Padding: 14px 0
- Use: 积分流水、库存记录

### Input Fields

**Text Input（陶土输入框）**
- Background: `#F5EDE4`
- Border: 1.5px solid transparent
- Radius: 14px
- Padding: 14px 16px
- Font: 15px
- Placeholder color: `#9E9186`
- Focus border: `#C67B5C`
- Focus background: `#FAF6F0`

**Tag Selector（工艺标签）**
- Default: background `#F5EDE4`, text `#5A4A3F`, radius 999px
- Selected: background `#C67B5C`, text `#FFFFFF`
- Padding: 8px 16px
- Margin: 4px

**Image Picker（作品图选择）**
- Background: `#F5EDE4` with dashed border 2px `#D9CFC2`
- Radius: 16px
- Aspect ratio: 1/1
- Placeholder icon: 相机 SVG
- Use: 会员表单作品图、头像上传

### Navigation

**Bottom Tab Bar（陶土底栏）**
- Background: `#FFFDF9` with `backdrop-filter: blur(12px)`
- Border-top: 1px solid `#EFE6DA`
- Height: 64px + safe-area-inset-bottom
- Active icon: `#C67B5C`
- Inactive icon: `#9E9186`
- Active text: `#C67B5C`, weight 600
- Inactive text: `#9E9186`
- Shadow: `0 -4px 20px rgba(99, 72, 54, 0.06)`

**Top Header（工坊标题栏）**
- Background: transparent or `#FAF6F0`
- Height: 56px
- Title: ZCOOL XiaoWei, 28px, `#3D2B1F`
- Right action: 文字按钮或图标按钮

## 5. Layout Principles

### Spacing System
- Base unit: 4px
- Scale: 4, 8, 12, 16, 20, 24, 32, 40, 48, 64
- Card internal padding: 16px-20px
- Section vertical gap: 24px-32px
- Page horizontal padding: 20px

### Grid & Container
- Content max-width: 390px, centered
- Single column layout为主，卡片内部可 2 列网格（如作品图、快速入口）
- 日历视图支持横向日期选择条 + 纵向时间轴

### Whitespace Philosophy
- 顶部欢迎区留白较大，让标题"呼吸"。
- 卡片之间保持 16px 间距，避免拥挤。
- 底部预留 safe-area，避免被 Tab Bar 遮挡。

### Border Radius Scale
- Small: 8px（小标签、徽章）
- Standard: 12px-14px（输入框、小按钮）
- Large: 16px-20px（卡片）
- XL: 24px（特色卡片、Sheet）
- Pill: 999px（按钮、标签）

## 6. Depth & Elevation

| Level | Treatment | Use |
|-------|-----------|-----|
| Flat | 无阴影，纯色背景 | 页面背景、分割线 |
| Subtle Lift | `0 4px 16px rgba(99, 72, 54, 0.08)` | 标准卡片 |
| Medium Lift | `0 8px 24px rgba(99, 72, 54, 0.10)` | 特色卡片、首页概览 |
| Floating | `0 6px 20px rgba(198, 123, 92, 0.32)` | FAB |
| Navigation | `0 -4px 20px rgba(99, 72, 54, 0.06)` | 底部 Tab Bar |

### Decorative Depth
- 首页背景使用极淡的水彩/陶土纹理（SVG 或 CSS 渐变）。
- 卡片左上角或右下角可有轻微"手撕纸"装饰边缘（CSS clip-path）。

## 7. Iconography & Imagery

- 使用手绘风格的 SVG 线条图标，线条粗细 2px，端点圆角。
- 图标颜色默认 `#9E9186`，active `#C67B5C`。
- 每个 inline SVG 必须包含 `<title>` 标签，描述其在当前界面的业务含义。
- 图片：
  - 会员头像与作品图使用圆角 16px 或正圆形。
  - 占位图使用陶土色渐变或相机图标。
  - 空状态使用手作主题插画（陶轮、线团、木屑等）。

## 8. State Styling

### Empty State
- Centered illustration（SVG，如空陶轮）
- Title: 18px, weight 600, `#3D2B1F`
- Subtitle: 14px, `#8C7D70`
- Action: Secondary Outline button

### Loading
- Skeleton 使用 `#F5EDE4` 脉冲动画，圆角 12px。

### Error / Warning
- 沉睡会员提醒：背景使用浅赭石 `rgba(160, 82, 45, 0.08)`，边框 `#A0522D`，图标赭石色。
- 库存低：Badge 使用赭石背景 `#A0522D`，白色文字。

### Success
- 签到成功：背景釉青 `rgba(168, 181, 160, 0.16)`，图标 `#A8B5A0`。
- 积分增加：数字使用焦糖色 `#B87D4B`。

## 9. Responsive Behavior

- 设计以 390px 宽度为基准，内容居中。
- 在更宽屏幕上保持 390px max-width，背景延续 `#FAF6F0`。
- 底部 Tab Bar 宽度限制在 390px 内居中。
- 字体大小在更大屏幕上保持不变，避免破坏手作感。

## 10. Semantic UI Binding

### Surfaces / Routes

| pageId | route | tabId | name |
|--------|-------|-------|------|
| home-page | pages/Home | tab-home | 首页 |
| members-page | pages/Members | tab-members | 会员 |
| member-detail-page | pages/MemberDetail | - | 会员详情 |
| member-form-page | pages/MemberForm | - | 会员表单 |
| points-page | pages/Points | tab-points | 积分 |
| calendar-page | pages/Calendar | tab-calendar | 课程日历 |
| course-detail-page | pages/CourseDetail | - | 课程详情 |
| course-form-page | pages/CourseForm | - | 课程表单 |
| inventory-page | pages/Inventory | tab-inventory | 库存 |
| inventory-log-page | pages/InventoryLog | - | 库存记录 |
| settings-page | pages/Settings | - | 设置 |

### Action / Input / Assertion IDs to Preserve

- `home-checkin-button`
- `home-today-course-list` (list, itemIdPattern `home-today-course-{id}`, emptyStateId `home-today-empty`)
- `home-dormant-alert-card`
- `home-dormant-list-button`
- `home-quick-add-member`, `home-quick-book-course`, `home-quick-inventory`
- `members-search-input`
- `members-add-button`, `members-filter-button`
- `members-list` (itemIdPattern `members-item-{id}`, emptyStateId `members-empty-state`)
- `member-detail-edit-button`, `member-detail-checkin-button`, `member-detail-points-balance`, `member-detail-works-grid`, `member-detail-crafts-tags`, `member-detail-points-history-button`, `member-detail-bookings-button`
- `member-form-name-input`, `member-form-phone-input`, `member-form-crafts-selector`, `member-form-avatar-picker`, `member-form-works-picker`, `member-form-save-button`, `member-form-delete-button`
- `points-total-issued`, `points-total-redeemed`, `points-rule-setting-button`, `points-redeem-button`, `points-record-list`
- `calendar-view-switch`, `calendar-prev-button`, `calendar-next-button`, `calendar-today-button`, `calendar-add-course-button`, `calendar-course-list`
- `course-detail-edit-button`, `course-detail-book-button`, `course-detail-student-list`, `course-detail-material-list`, `course-detail-deduct-button`
- `course-form-title-input`, `course-form-teacher-input`, `course-form-time-picker`, `course-form-capacity-input`, `course-form-material-selector`, `course-form-save-button`
- `inventory-add-button`, `inventory-low-stock-alert`, `inventory-list`, `inventory-log-button`
- `inventory-log-filter-type`, `inventory-log-list`
- `settings-dormant-threshold-input`, `settings-points-ratio-input`, `settings-backup-button`, `settings-restore-button`

### Events to Preserve

- `open-checkin-sheet`, `navigate-dormant-members`, `navigate-member-form`, `navigate-calendar`, `navigate-inventory`
- `member-checkin`, `navigate-points-history`, `navigate-member-bookings`
- `save-member`, `delete-member`
- `open-points-rule-sheet`, `open-redeem-sheet`
- `calendar-prev`, `calendar-next`, `calendar-today`, `navigate-course-form`
- `open-booking-sheet`, `deduct-course-materials`, `save-course`
- `open-inventory-form`, `navigate-inventory-log`
- `backup-data`, `restore-data`

### ID Gaps / Change Requests

- None at this stage. All semantic targets are covered by the visual design.

## 11. Do's and Don'ts

### Do
- 使用陶土暖色系，避免冷灰塑料感。
- 标题使用手写感字体，正文保持清晰可读。
- 所有 SVG 图标加 `<title>`，说明业务含义。
- 卡片使用柔和暖调阴影，模拟陶土自然投影。
- 底部 Tab 固定在底部，宽度限制 390px 居中。
- 首屏关键内容（Header + 概览卡片）控制在顶部 600vp 内。

### Don't
- 不要使用高饱和霓虹色或科技蓝。
- 不要使用锋利直角或 2px 以下的小圆角作为主要元素。
- 不要使用 emoji 或 Unicode 图标替代 SVG。
- 不要让内容全宽铺满 PC 浏览器。
- 不要在侧边放置导航栏。
- 不要在 HTML 中把示例数据当作功能种子数据。
