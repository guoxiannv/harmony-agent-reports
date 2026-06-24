# 手作·印记 — Visual Design System (Final)

## 1. Visual Theme & Atmosphere

"手作·印记"最终视觉定位是"窑边工作台上的一本活页手账"。界面不是冰冷的管理后台，而是被陶土、釉料与指尖温度浸润过的记录空间。我们保留手工的不规则与温润，同时通过层次分明的陶土色系、细腻渐变、柔和多层阴影与手写体标题，让 App 既有"手作"的质朴，又不失现代移动应用的精致。

整体光线感是"窑炉余温"：暖、低饱和、微微泛红。主色赤陶不是唯一的情绪来源，它与焦糖、米纸、釉青、赭石、钴蓝共同构成窑变釉色。每一张卡片都像一块上釉后的陶片——边缘圆润、表面有细微光泽、底部落在柔软的投影里。

**Key Characteristics:**
- 手写感中文字体作为标题与情绪数字，系统字体作为正文
- 陶土暖色系 + 窑变层次：赤陶、焦糖、米纸、釉青、赭石、钴蓝
- 有机大圆角（16px-28px），胶囊按钮，圆润无锋利感
- 卡片使用渐变 + 双层暖调阴影，模拟釉片微凸于桌面
- 手绘 SVG 图标，每个都带业务语义 `<title>`
- 状态色使用半透明"釉色晕染"而非纯色块
- 页面背景带极淡陶土纹理/噪点，像未上釉的素陶
- 底部 Tab 固定底部，严格居中 390px，不侧放

## 2. Color Palette & Roles

### Primary
- **赤陶 Terracotta** (`#C67B5C`): 主按钮、选中、Tab active、关键强调。
- **焦糖 Caramel** (`#B87D4B`): 积分/统计数字、温暖高亮。
- **陶白 Clay White** (`#FAF6F0`): 页面主背景。
- **米纸 Rice Paper** (`#F5EDE4`): 卡片、输入框、次级背景。
- **深褐 Dark Umber** (`#3D2B1F`): 主文字。

### Secondary
- **釉青 Celadon Mist** (`#A8B5A0`): 签到成功、积分增加、正向状态。
- **钴蓝 Dusty Cobalt** (`#5A6F7C`): 链接、日历选中、信息提示。
- **赭石 Rust** (`#A0522D`): 沉睡提醒、库存低、警告。
- **陶灰 Clay Gray** (`#9E9186`): 次级文字、占位符、禁用。
- **浅褐 Sand** (`#D9CFC2`): 分割线、边框、轻量背景。
- **陶土深 Clay Deep** (`#8B5A45`): 按下态、次级强调。

### Surface & Depth
- **Card Surface** (`#FFFDF9`): 卡片表面暖白。
- **Card Gradient**: `linear-gradient(145deg, #FFFDF9 0%, #F8F1E9 55%, #F0E6DA 100%)`
- **Pressed Clay** (`#EDE5DA`): 按下、聚焦背景。
- **Shadow Near** (`rgba(99, 72, 54, 0.06)`): 贴近卡片轮廓。
- **Shadow Far** (`rgba(99, 72, 54, 0.12)`): 弥散投影。
- **Shadow Deep** (`rgba(61, 43, 31, 0.16)`): 底部导航、Sheet。

### Text
- **Heading** `#3D2B1F`
- **Body** `#5A4A3F`
- **Secondary** `#8C7D70`
- **On Accent** `#FFFFFF`
- **Link** `#5A6F7C`
- **Number Accent** `#B87D4B`

## 3. Typography Rules

### Font Family
- **Display / Headline / Stat**: `"ZCOOL XiaoWei", "Ma Shan Zheng", "STKaiti", "KaiTi", cursive`
- **Body / UI**: `"PingFang SC", "Hiragino Sans GB", "Microsoft YaHei", sans-serif`

### Hierarchy

| Role | Font | Size | Weight | Line Height | Letter Spacing |
|------|------|------|--------|-------------|----------------|
| Display Hero | ZCOOL XiaoWei | 44px | 400 | 1.18 | 0.02em |
| Page Title | ZCOOL XiaoWei | 30px | 400 | 1.22 | 0.015em |
| Section Title | PingFang SC | 20px | 700 | 1.30 | 0 |
| Card Title | PingFang SC | 17px | 700 | 1.35 | 0 |
| Body | PingFang SC | 15px | 400 | 1.60 | 0 |
| Body Emphasis | PingFang SC | 15px | 700 | 1.50 | 0 |
| Caption | PingFang SC | 13px | 400 | 1.45 | 0 |
| Micro | PingFang SC | 12px | 500 | 1.35 | 0.01em |
| Stat Number | ZCOOL XiaoWei | 34px | 400 | 1.10 | 0.02em |
| Tab Label | PingFang SC | 11px | 600 | 1.20 | 0 |

## 4. Component Stylings

### Buttons

**Primary Filled**
- Background: `#C67B5C`
- Text: `#FFFFFF`
- Padding: 14px 28px
- Radius: 999px
- Font: 15px, weight 700
- Shadow: `0 4px 14px rgba(198, 123, 92, 0.32)`
- Active: scale(0.98), background `#B56A4B`

**Secondary Outline**
- Background: transparent
- Border: 1.5px solid `#C67B5C`
- Text: `#C67B5C`
- Padding: 12px 22px
- Radius: 999px
- Active: background `rgba(198, 123, 92, 0.10)`

**Tertiary Text**
- Text: `#5A6F7C`
- Font: 14px, weight 600
- Underline offset 3px on active

**Floating Action Button**
- Background: `#C67B5C`
- Size: 60px
- Radius: 50%
- Shadow: `0 8px 24px rgba(198, 123, 92, 0.36)`

### Cards

**Standard Card**
- Background: `#FFFDF9`
- Border: 1px solid `#F0E6DA`
- Radius: 20px
- Padding: 18px
- Shadow: `0 2px 8px rgba(99, 72, 54, 0.06), 0 10px 28px rgba(99, 72, 54, 0.08)`

**Feature Card**
- Background: `linear-gradient(145deg, #FFFDF9 0%, #F8F1E9 55%, #F0E6DA 100%)`
- Border: 1px solid `#EFE6DA`
- Radius: 24px
- Padding: 22px
- Shadow: `0 4px 12px rgba(99, 72, 54, 0.06), 0 18px 44px rgba(99, 72, 54, 0.10)`

**Alert Card（沉睡/低库存）**
- Background: `rgba(160, 82, 45, 0.08)`
- Border: 1px solid `rgba(160, 82, 45, 0.20)`
- Radius: 18px
- Left accent: 4px solid `#A0522D`

**List Item**
- Background: transparent
- Border-bottom: 1px solid `#EFE6DA`
- Padding: 16px 0

### Input Fields

**Text Input**
- Background: `#F5EDE4`
- Border: 1.5px solid transparent
- Radius: 16px
- Padding: 14px 18px
- Font: 15px
- Placeholder: `#9E9186`
- Focus: border `#C67B5C`, background `#FAF6F0`, ring `0 0 0 4px rgba(198,123,92,0.08)`

**Tag Selector**
- Default: bg `#F5EDE4`, text `#5A4A3F`, radius 999px, padding 8px 16px
- Selected: bg `#C67B5C`, text `#FFFFFF`, shadow `0 2px 6px rgba(198,123,92,0.24)`

**Image Picker**
- Background: `#F5EDE4`, dashed border 2px `#D9CFC2`
- Radius: 18px, aspect 1/1

### Navigation

**Bottom Tab Bar**
- Background: `#FFFDF9` with `backdrop-filter: blur(16px)`
- Border-top: 1px solid `#EFE6DA`
- Height: 68px
- Active icon: `#C67B5C`, active indicator top short line
- Inactive icon: `#9E9186`
- Shadow: `0 -6px 24px rgba(99, 72, 54, 0.08)`

**Top Header**
- Background: `#FAF6F0`
- Height: 60px
- Title: ZCOOL XiaoWei, 30px

## 5. Layout Principles

- Base 4px, scale: 4, 8, 12, 16, 20, 24, 32, 40, 48, 64
- Content max-width: 390px, centered
- Page horizontal padding: 20px
- Section gap: 28px
- Card internal gap: 14px
- Grid gap: 12px

## 6. Depth & Elevation

| Level | Treatment |
|-------|-----------|
| Flat | 无阴影 |
| Subtle Lift | 双层暖阴影 |
| Medium Lift | 双层 + 更大 blur |
| Floating | 强调色投影 |
| Navigation | 顶部阴影，底部固定 |

## 7. Iconography & Imagery

- 手绘 SVG 线条图标，2px 线宽，圆角端点。
- 每个 inline SVG 首子元素为 `<title>`。
- 头像/作品图圆角 16px 或圆形。
- 空状态：陶轮、线团、木屑等手作插画。

## 8. State Styling

### Empty State
- 插画 + 标题 18px weight 700 + 说明 14px `#8C7D70` + 描边按钮

### Loading
- Skeleton: `#F5EDE4` ↔ `#EDE5DA` 脉冲，圆角 12px

### Success / Warning
- 成功：釉青背景透明度 12%，图标 `#A8B5A0`
- 警告：赭石背景透明度 10%，图标 `#A0522D`

## 9. Responsive Behavior

- 390px max-width 居中。
- Tab Bar 宽度限制 390px，居中固定底部。
- 字体不随屏幕放大。

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

- `home-checkin-button`, `home-today-course-list`, `home-dormant-alert-card`, `home-dormant-list-button`, `home-quick-add-member`, `home-quick-book-course`, `home-quick-inventory`
- `members-search-input`, `members-add-button`, `members-filter-button`, `members-list`
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

- `open-checkin-sheet`, `navigate-dormant-members`, `navigate-member-form`, `navigate-calendar`, `navigate-inventory`, `member-checkin`, `navigate-points-history`, `navigate-member-bookings`, `save-member`, `delete-member`, `open-points-rule-sheet`, `open-redeem-sheet`, `calendar-prev`, `calendar-next`, `calendar-today`, `navigate-course-form`, `open-booking-sheet`, `deduct-course-materials`, `save-course`, `open-inventory-form`, `navigate-inventory-log`, `backup-data`, `restore-data`

### ID Gaps / Change Requests

- None.

## 11. Do's and Don'ts

### Do
- 多层陶土色 + 渐变营造窑变层次。
- 标题手写体，正文系统字体。
- SVG 加语义 title，底部 Tab 固定居中。
- 首屏关键内容在 600vp 内。

### Don't
- 不用冷灰塑料感或霓虹色。
- 不用 emoji 图标。
- 不让内容全宽铺满。
- 不把示例数据当功能种子数据。
