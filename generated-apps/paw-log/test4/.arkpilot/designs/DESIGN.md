# 宠迹 · PawLog 视觉设计系统

## 1. Visual Theme & Atmosphere

PawLog 希望营造“治愈系数字宠物房”的氛围：柔和、圆润、清新，像把宠物的小窝捧在手里。整体以薄荷绿（Mint）和肉垫粉（Paw Pink）为主旋律，搭配奶油白与浅灰，制造轻盈的空气感；深青绿与暖玫瑰用于强调与状态区分。界面元素大量使用大圆角、胶囊形按钮、柔和弥散阴影与轻量渐变，避免尖锐直线带来的机械感。

**关键词**：圆润、治愈、清新、轻盈、宠物友好。

## 2. Color Palette & Roles

### Brand Foundation
- **薄荷绿 500** (`#7FDEB8`): 主品牌色，用于头部、导航选中、主按钮背景、关键图表曲线。
- **薄荷绿 50** (`#EEFCF6`): 页面背景、卡片浅色底、柔和渐变起点。
- **薄荷绿 100** (`#D5F7E9`): 输入框背景、选中态浅色背景、hover 填充。
- **薄荷绿 700** (`#4BBF9A`): 深色强调、图标描边、进度条完成态、选中态边框。
- **肉垫粉 400** (`#FFB8C1`): 次品牌色，用于标签、提醒到期、爱心/提醒图标、体重曲线。
- **肉垫粉 50** (`#FFF0F2`): 提醒卡片背景、温暖空状态渐变起点。
- **肉垫粉 600** (`#E88694`): 深色强调、危险/删除操作、驱虫提醒主题色。

### Neutrals
- **奶油白** (`#FFFBF7`): 主页面背景，比纯白更温暖。
- **浅灰 50** (`#F7F5F3`): 次级卡片背景、时间线分隔。
- **浅灰 100** (`#EDE9E5`): 边框、分隔线、禁用态背景。
- **深灰 700** (`#5C5856`): 正文、标签文字。
- **深灰 900** (`#2E2B29`): 标题、强对比文字。

### Status
- **成功绿** (`#3BC582`): 已驱虫/已疫苗、健康状态良好。
- **警示黄** (`#F5C646`): 即将到期（7 天内）。
- **紧急粉** (`#F27A8A`): 已逾期提醒。
- **信息蓝** (`#5DB9F0`): 用药/就医主题色（与薄荷绿区分）。

### Gradients
- **Hero 渐变**：`linear-gradient(180deg, #EEFCF6 0%, #FFFBF7 100%)`
- **主按钮渐变**：`linear-gradient(135deg, #7FDEB8 0%, #5DD3A8 100%)`
- **提醒卡片渐变**：`linear-gradient(135deg, #FFF0F2 0%, #FFE4E8 100%)`
- **图表背景渐变**：`linear-gradient(180deg, rgba(127,222,184,0.20) 0%, rgba(127,222,184,0.00) 100%)`

### Shadows
- **Card Shadow**：`0 8px 24px rgba(46,43,41,0.08)`
- **Floating Button Shadow**：`0 6px 20px rgba(75,191,154,0.40)`
- **Bottom Tab Shadow**：`0 -4px 16px rgba(46,43,41,0.06)`
- **Input Focus Shadow**：`0 0 0 3px rgba(127,222,184,0.30)`

## 3. Typography Rules

### Font Family
- **Display / Heading**：`HarmonyOS Sans SC`, `PingFang SC`, `Microsoft YaHei`, `sans-serif`
- **Body**：`HarmonyOS Sans SC`, `PingFang SC`, `Microsoft YaHei`, `sans-serif`
- 所有中文使用系统默认无衬线字体；字号以 rem 适配。

### Hierarchy

| Role | Size | Weight | Line Height | Letter Spacing | Color |
|---|---|---|---|---|---|
| Hero Title | 28px | 700 | 1.25 | 0 | #2E2B29 |
| Page Title | 22px | 700 | 1.30 | 0 | #2E2B29 |
| Section Title | 18px | 700 | 1.35 | 0 | #2E2B29 |
| Card Title | 16px | 700 | 1.40 | 0 | #2E2B29 |
| Body | 15px | 400 | 1.55 | 0.02em | #5C5856 |
| Body Emphasis | 15px | 600 | 1.50 | 0.01em | #2E2B29 |
| Caption | 13px | 400 | 1.45 | 0.01em | #8C8682 |
| Caption Bold | 13px | 600 | 1.45 | 0 | #5C5856 |
| Micro | 11px | 500 | 1.40 | 0.02em | #8C8682 |
| Button | 15px | 600 | 1.00 | 0.01em | varies |

## 4. Component Stylings

### Buttons

**Primary Button (CTA)**
- Background: `linear-gradient(135deg, #7FDEB8 0%, #5DD3A8 100%)`
- Text: `#FFFFFF`, weight 600
- Padding: 14px 24px
- Border-radius: 24px (pill)
- Shadow: `0 6px 20px rgba(75,191,154,0.35)`
- Active: scale 0.98, 亮度降低 5%

**Secondary Button**
- Background: `#FFFBF7`
- Text: `#4BBF9A`, weight 600
- Border: 1.5px solid `#7FDEB8`
- Border-radius: 24px
- Padding: 12px 20px

**Record Type Button**
- Size: 64px × 64px circle
- Background: `#EEFCF6`
- Icon color: `#4BBF9A`
- Selected: background `#7FDEB8`, icon white, ring `#4BBF9A` 2px
- Shadow: `0 4px 12px rgba(127,222,184,0.25)`

**Floating Action Button**
- Size: 56px × 56px circle
- Background: `linear-gradient(135deg, #7FDEB8 0%, #4BBF9A 100%)`
- Icon: 白色加号
- Shadow: `0 6px 20px rgba(75,191,154,0.40)`
- Position: 底部 Tab 中央上方，bottom 28px

### Cards

**Metric Card**
- Background: `#FFFFFF`
- Border-radius: 20px
- Padding: 16px
- Shadow: `0 8px 24px rgba(46,43,41,0.08)`
- Icon area: 40px circle, background `#EEFCF6`
- Value: 22px bold, `#2E2B29`
- Label: 12px medium, `#8C8682`

**Reminder Card**
- Background: `linear-gradient(135deg, #FFF0F2 0%, #FFE4E8 100%)`
- Border-radius: 18px
- Left accent: 4px `#FFB8C1` rounded bar
- Padding: 14px 16px
- Shadow: `0 6px 18px rgba(242,122,138,0.12)`
- Overdue: left accent `#F27A8A`

**Timeline Item**
- Left dot: 10px circle, color by type (food/waste/weight/medicine)
- Connector: 2px dashed `#EDE9E5`
- Content card: `#FFFBF7`, radius 14px, padding 12px 14px
- Time: 12px caption, `#8C8682`

**Medical Card**
- Background: `#FFFFFF`
- Border-radius: 18px
- Shadow: `0 6px 18px rgba(46,43,41,0.07)`
- Top strip: `#5DB9F0` 4px
- Padding: 16px

### Navigation

**Bottom Tab Bar**
- Background: `#FFFFFF` with `backdrop-filter: blur(20px)`
- Shadow: `0 -4px 16px rgba(46,43,41,0.06)`
- Height: 72px + safe area
- Border-radius: top 28px
- 5 Tabs: 首页、爱宠、记录、健康、家人
- Active icon/text: `#4BBF9A`
- Inactive: `#B8B2AE`
- Central: 圆形悬浮记录按钮，跨出 Tab Bar 上沿

**Top Header**
- Transparent or `#FFFBF7`
- Left: 页面标题
- Right: 头像/设置图标
- Padding: 16px horizontal, 12px top

### Forms

**Input Field**
- Background: `#F7F5F3`
- Border: 1px solid `#EDE9E5`
- Border-radius: 14px
- Padding: 14px 16px
- Focus: border `#7FDEB8`, shadow `0 0 0 3px rgba(127,222,184,0.30)`
- Placeholder: `#B8B2AE`

**Selector / Chip**
- Background: `#F7F5F3`
- Border-radius: 16px
- Padding: 10px 16px
- Selected: background `#EEFCF6`, border 1.5px `#7FDEB8`, text `#4BBF9A`

**Date Picker**
- 使用 HarmonyOS 系统 DatePicker，主题色 `#7FDEB8`

## 5. Layout Principles

### Spacing System
- Base unit: 4px
- Scale: 4, 8, 12, 16, 20, 24, 28, 32, 40, 48, 64

### Container
- Content max-width: 390px
- Horizontal padding: 16px
- All内容居中，禁止全宽拉伸。

### Page Shell
- Background: `#FFFBF7` 或页面级渐变
- Status bar 区域留白
- Header 高度约 56px
- Scrollable content padding-bottom: 120px（为 Tab Bar 与 FAB 留空）

### Grid
- 卡片通常 2 列网格，间距 12px
- 列表项单列，间距 12px
- 时间线左侧 32px 轨道 + 内容区

## 6. Depth & Elevation

| Level | Treatment | Use |
|---|---|---|
| Flat | 无阴影，纯色背景 | 页面底层、分隔区域 |
| Subtle Lift | `0 4px 12px rgba(46,43,41,0.06)` | 小按钮、chip |
| Card Lift | `0 8px 24px rgba(46,43,41,0.08)` | 卡片、悬浮面板 |
| Floating | `0 6px 20px rgba(75,191,154,0.40)` | FAB、CTA |
| Focus Ring | `0 0 0 3px rgba(127,222,184,0.30)` | 输入框焦点 |

## 7. Iconography

- 使用圆润描边风格图标，线宽 2px，端点圆角。
- 图标颜色跟随父级：主色 `#4BBF9A`、粉色 `#E88694`、信息蓝 `#5DB9F0`、中性 `#8C8682`。
- 首页四类记录图标：
  - 饮食：碗/骨头图标
  - 排泄：便便/猫砂盆图标
  - 体重：体重秤图标
  - 用药：药丸/胶囊图标
- 导航图标：首页（小屋）、爱宠（爪印）、记录（日历/清单）、健康（爱心/十字）、家人（双人）。

## 8. Responsive Behavior

- 设计稿按 390px 宽度输出；在 360-420px 范围保持单列居中。
- 375px 以下：卡片内边距与字号减 1 级；Tab 图标 20px。
- 420px 以上：内容保持 390px 居中，不放大到全屏。
- 竖屏优先；横屏不做专门适配。

## 9. Semantic UI Binding

### Surfaces

| Surface ID | Page ID | Route | Tab ID |
|---|---|---|---|
| home | home-page | pages/Home | tab-home |
| pets | pets-page | pages/Pets | tab-pets |
| pet-detail | pet-detail-page | pages/PetDetail | — |
| records | records-page | pages/Records | tab-records |
| trends | trends-page | pages/Trends | tab-trends |
| health | health-page | pages/Health | tab-health |
| family | family-page | pages/Family | tab-family |
| add-record | add-record-page | pages/AddRecord | — |
| add-pet | add-pet-page | pages/AddPet | — |
| add-reminder | add-reminder-page | pages/AddReminder | — |
| add-medical | add-medical-page | pages/AddMedical | — |

### Important Semantic Targets

- `home-pet-switcher`, `home-add-pet-button`, `home-quick-record-*`, `home-today-*-count`, `home-reminder-list`, `home-recent-record-list`, `home-floating-record-button`, `home-empty-add-pet`
- `pets-add-button`, `pets-list`
- `pet-detail-back`, `pet-detail-edit`, `pet-detail-delete`, `pet-detail-name`, `pet-detail-avatar`, `pet-detail-info-*`, `pet-detail-add-record`, `pet-detail-record-list`
- `records-filter-pet`, `records-filter-type`, `records-list`, `records-add-button`
- `trends-pet-selector`, `trends-metric-selector`, `trends-period-7d/30d/90d`, `trends-chart`, `trends-summary-value`
- `health-add-reminder`, `health-add-medical`, `health-reminder-list`, `health-reminder-{id}-toggle`, `health-medical-list`
- `family-invite-button`, `family-share-toggle`, `family-member-list`
- `add-record-*`, `add-pet-*`, `add-reminder-*`, `add-medical-*`

### Events to Preserve

`open-pet-switcher`, `navigate-add-pet`, `quick-record-*`, `navigate-pet-detail`, `delete-pet`, `open-add-record`, `filter-by-pet`, `filter-by-type`, `select-pet-for-trend`, `select-metric`, `select-period-*`, `navigate-add-reminder`, `navigate-add-medical`, `toggle-reminder`, `invite-family-member`, `toggle-family-share`, `save-*`, `cancel-*`, `input-*`

### Change Requests

- 无：现有语义协议已覆盖全部关键行为与断言点。
