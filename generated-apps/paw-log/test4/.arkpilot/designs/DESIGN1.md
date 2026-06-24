# 宠迹 · PawLog 视觉设计系统（Review 版 DESIGN1）

## 1. Visual Theme & Atmosphere

PawLog 的视觉叙事是“清晨阳光洒进宠物房”：空气里有薄荷草的清凉，也有肉垫粉的温柔。我们不追求极简的冷感，而是用低饱和双主色、软糯的圆角、浅景深阴影和玻璃质感，让界面像宠物本身一样有弹性、有温度。背景在奶油白与薄荷雾之间过渡，避免单一底色带来的平板感；卡片用细微的冷暖双色区分功能模块，让每一屏都有色彩呼吸。

**关键词**：薄荷清凉、肉垫柔软、晨光奶油、圆润弹感、层次呼吸。

## 2. Color Palette & Roles

### Brand Foundation
- **薄荷绿 500** (`#7FDEB8`): 主品牌色，主按钮、导航选中、关键曲线、激活态。
- **薄荷绿 400** (`#9BE8CA`): 次亮薄荷，用于hover/轻量高亮、渐变中段。
- **薄荷绿 50** (`#EEFCF6`): 页面背景、卡片浅色底、柔和渐变起点。
- **薄荷绿 100** (`#D5F7E9`): 输入框背景、选中态浅色背景。
- **薄荷绿 700** (`#4BBF9A`): 深色强调、图标描边、进度完成态、选中边框。
- **薄荷绿 900** (`#2A8C70`): 极少数深色文字，如标题描边或对比强调。

- **肉垫粉 400** (`#FFB8C1`): 次品牌色，提醒卡片、爱心图标、体重曲线、柔和标签。
- **肉垫粉 50** (`#FFF0F2`): 提醒卡片背景、温暖空状态渐变起点。
- **肉垫粉 100** (`#FFE4E8`): 提醒卡片渐变终点、悬停浅粉。
- **肉垫粉 600** (`#E88694`): 深色强调、删除/危险操作、驱虫提醒主题。
- **玫瑰焦糖 500** (`#D97A87`): 逾期/删除 pressed 状态。

### Neutrals
- **奶油白** (`#FFFBF7`): 主页面背景，温暖不刺眼。
- **雾灰 50** (`#F7F5F3`): 次级卡片背景、时间线底色。
- **雾灰 100** (`#EDE9E5`): 边框、分隔线、禁用态。
- **暖灰 400** (`#A8A29C`): 占位符、禁用文字。
- **深灰 700** (`#5C5856`): 正文、标签。
- **深灰 900** (`#2E2B29`): 标题、强对比文字。

### Status
- **成功绿** (`#3BC582`): 已完成驱虫/疫苗、健康良好。
- **晨曦黄** (`#F5C646`): 7 天内即将到期。
- **晚霞粉** (`#F27A8A`): 已逾期提醒、删除操作。
- **晴空蓝** (`#5DB9F0`): 用药/就医主题色、信息提示。
- **薰衣草紫** (`#B8A9E8`): 家庭成员/共享主题色，与主色形成柔和区分。

### Gradients
- **Hero 渐变**：`linear-gradient(180deg, #EEFCF6 0%, #FFFBF7 60%, #FFF0F2 100%)`
- **主按钮渐变**：`linear-gradient(135deg, #9BE8CA 0%, #7FDEB8 50%, #5DD3A8 100%)`
- **悬浮按钮渐变**：`linear-gradient(135deg, #7FDEB8 0%, #4BBF9A 100%)`
- **提醒卡片渐变**：`linear-gradient(135deg, #FFF0F2 0%, #FFE4E8 50%, #FDD6DC 100%)`
- **就医卡片渐变**：`linear-gradient(135deg, #F0F9FF 0%, #E6F4FD 100%)`
- **图表背景渐变**：`linear-gradient(180deg, rgba(127,222,184,0.22) 0%, rgba(127,222,184,0.00) 70%)`
- **家庭卡片渐变**：`linear-gradient(135deg, #F6F3FF 0%, #EDE8FC 100%)`

### Shadows
- **Card Shadow Soft**：`0 8px 24px rgba(46,43,41,0.07)`
- **Card Shadow Lifted**：`0 12px 32px rgba(46,43,41,0.10)`
- **FAB Shadow**：`0 8px 24px rgba(75,191,154,0.42)`
- **Bottom Tab Shadow**：`0 -6px 20px rgba(46,43,41,0.05)`
- **Input Focus Shadow**：`0 0 0 4px rgba(127,222,184,0.28)`
- **Chip Shadow**：`0 2px 8px rgba(46,43,41,0.05)`

## 3. Typography Rules

### Font Family
- **Display / Heading / Body**：`HarmonyOS Sans SC`, `PingFang SC`, `Microsoft YaHei`, `sans-serif`
- 中文优先使用系统默认无衬线字体。

### Hierarchy

| Role | Size | Weight | Line Height | Letter Spacing | Color |
|---|---|---|---|---|---|
| Hero Title | 30px | 800 | 1.22 | -0.02em | #2E2B29 |
| Page Title | 24px | 800 | 1.28 | -0.01em | #2E2B29 |
| Section Title | 18px | 700 | 1.35 | 0 | #2E2B29 |
| Card Title | 16px | 700 | 1.40 | 0 | #2E2B29 |
| Body | 15px | 400 | 1.60 | 0.02em | #5C5856 |
| Body Emphasis | 15px | 600 | 1.50 | 0.01em | #2E2B29 |
| Caption | 13px | 500 | 1.45 | 0.01em | #8C8682 |
| Caption Bold | 13px | 700 | 1.45 | 0 | #5C5856 |
| Micro | 11px | 600 | 1.40 | 0.02em | #A8A29C |
| Button | 15px | 700 | 1.00 | 0.01em | varies |
| Stat Number | 26px | 800 | 1.10 | -0.02em | #2E2B29 |

## 4. Component Stylings

### Buttons

**Primary Button (CTA)**
- Background: `linear-gradient(135deg, #9BE8CA 0%, #7FDEB8 50%, #5DD3A8 100%)`
- Text: `#FFFFFF`, weight 700, text-shadow `0 1px 2px rgba(0,0,0,0.08)`
- Padding: 14px 28px
- Border-radius: 26px (pill)
- Shadow: `0 8px 22px rgba(75,191,154,0.38)`
- Active: scale 0.97, filter brightness(0.96)

**Secondary Button**
- Background: `#FFFBF7`
- Text: `#4BBF9A`, weight 700
- Border: 2px solid `#7FDEB8`
- Border-radius: 26px
- Padding: 12px 22px
- Hover/Active: background `#EEFCF6`

**Record Type Button**
- Size: 68px × 68px circle
- Background: `#EEFCF6`
- Icon color: `#4BBF9A`
- Label: 12px weight 600, `#4BBF9A`
- Selected: background `linear-gradient(135deg, #7FDEB8 0%, #5DD3A8 100%)`, icon white, outer ring 3px `#EEFCF6` + 2px `#7FDEB8`
- Shadow: `0 6px 16px rgba(127,222,184,0.28)`
- Active: scale 0.93

**Floating Action Button (FAB)**
- Size: 60px × 60px circle
- Background: `linear-gradient(135deg, #7FDEB8 0%, #4BBF9A 100%)`
- Icon: 白色加号，28px
- Shadow: `0 8px 24px rgba(75,191,154,0.42)`
- Position: 底部 Tab 中央上方，bottom 30px
- Active: scale 0.93, rotate 45deg on open (可选)

**Destructive Button**
- Background: `linear-gradient(135deg, #FFB8C1 0%, #E88694 100%)`
- Text: white
- Border-radius: 26px
- Shadow: `0 6px 18px rgba(242,122,138,0.30)`

### Cards

**Metric Card**
- Background: `#FFFFFF`
- Border-radius: 22px
- Padding: 18px
- Shadow: `0 8px 24px rgba(46,43,41,0.07)`
- Icon area: 44px circle, background `#EEFCF6`, icon 24px `#4BBF9A`
- Value: 26px extra-bold, `#2E2B29`
- Label: 12px semi-bold, `#8C8682`
- Trend pill (optional): 8px radius, background `#EEFCF6`, text `#4BBF9A`

**Reminder Card**
- Background: `linear-gradient(135deg, #FFF0F2 0%, #FFE4E8 50%, #FDD6DC 100%)`
- Border-radius: 20px
- Left accent: 5px rounded bar, `#FFB8C1`
- Padding: 16px 18px
- Shadow: `0 8px 22px rgba(242,122,138,0.14)`
- Overdue: left accent `#F27A8A`, 标题色 `#D97A87`
- Due-soon: left accent `#F5C646`

**Timeline Item**
- Left dot: 12px circle, color by type
  - food: `#7FDEB8`
  - waste: `#E88694`
  - weight: `#5DB9F0`
  - medicine: `#B8A9E8`
- Connector: 2px dashed `#EDE9E5`
- Content card: `#FFFBF7`, border 1px `#F7F5F3`, radius 16px, padding 14px 16px
- Time: 12px caption, `#A8A29C`
- Type badge: 10px radius pill, background by type 15% opacity, text by type 700

**Medical Card**
- Background: `linear-gradient(135deg, #F0F9FF 0%, #E6F4FD 100%)`
- Border-radius: 20px
- Top strip: `#5DB9F0` 5px rounded-top
- Padding: 16px 18px
- Shadow: `0 8px 22px rgba(93,185,240,0.12)`

**Family Member Card**
- Background: `linear-gradient(135deg, #F6F3FF 0%, #EDE8FC 100%)`
- Border-radius: 18px
- Padding: 14px 16px
- Shadow: `0 6px 18px rgba(184,169,232,0.12)`
- Owner badge: 10px radius pill, background `#B8A9E8`, text white

### Navigation

**Bottom Tab Bar**
- Background: `rgba(255,255,255,0.92)` with `backdrop-filter: blur(24px) saturate(180%)`
- Shadow: `0 -6px 20px rgba(46,43,41,0.05)`
- Height: 76px + safe area
- Border-radius: top 30px
- 5 Tabs：首页、爱宠、记录、健康、家人
- Active icon/text: `#4BBF9A`
- Inactive: `#B8B2AE`
- Icon size: 24px, label 11px weight 600
- Central record button: 60px 圆形，跨出 Tab Bar 上沿 30px

**Top Header**
- Background: transparent（在渐变背景上）或 `#FFFBF7`
- Left: 页面标题 24px bold
- Right: 当前宠物头像 + 设置/通知图标
- Padding: 16px horizontal, 14px top

### Forms

**Input Field**
- Background: `#F7F5F3`
- Border: 1.5px solid `#EDE9E5`
- Border-radius: 16px
- Padding: 15px 17px
- Focus: border `#7FDEB8`, shadow `0 0 0 4px rgba(127,222,184,0.28)`
- Placeholder: `#A8A29C`
- Label: 13px weight 700, `#5C5856`, margin-bottom 6px

**Selector / Chip**
- Background: `#F7F5F3`
- Border-radius: 18px
- Padding: 11px 18px
- Selected: background `#EEFCF6`, border 2px `#7FDEB8`, text `#4BBF9A` weight 700
- Shadow: `0 2px 8px rgba(46,43,41,0.05)`

**Avatar Upload**
- 88px 圆形占位
- Background: `#EEFCF6`
- 默认图标：爪印 `#7FDEB8`
- 上传后图片 cover
- 底部小相机徽章：24px 圆，背景 `#7FDEB8`，白色相机图标

**Date Picker**
- 使用 HarmonyOS DatePicker，主题色 `#7FDEB8`，selected text `#2E2B29`

## 5. Layout Principles

### Spacing System
- Base unit: 4px
- Scale: 4, 8, 12, 16, 20, 24, 28, 32, 40, 48, 64

### Container
- Content max-width: 390px
- Horizontal padding: 16px
- 所有内容居中，禁止全宽拉伸。

### Page Shell
- Background: `#FFFBF7` 或页面级渐变
- Status bar 区域留白
- Header 高度约 60px
- Scrollable content padding-bottom: 130px（为 Tab Bar 与 FAB 留空）

### Grid
- 统计卡片 2 列网格，间距 12px
- 快捷记录按钮 4 列等宽，间距 12px
- 列表项单列，间距 12px
- 时间线左侧 36px 轨道 + 内容区

## 6. Depth & Elevation

| Level | Treatment | Use |
|---|---|---|
| Flat | 无阴影，纯色/渐变背景 | 页面底层 |
| Subtle Lift | `0 4px 12px rgba(46,43,41,0.05)` | chip、小按钮 |
| Card Lift | `0 8px 24px rgba(46,43,41,0.07)` | 常规卡片 |
| Elevated Card | `0 12px 32px rgba(46,43,41,0.10)` | 模态/底部卡片 |
| Floating | `0 8px 24px rgba(75,191,154,0.42)` | FAB |
| Focus Ring | `0 0 0 4px rgba(127,222,184,0.28)` | 输入框焦点 |

## 7. Iconography

- 圆润描边风格，线宽 2px，端点圆角。
- 颜色规范：
  - 主操作：#4BBF9A
  - 提醒/爱心：#E88694
  - 就医/信息：#5DB9F0
  - 成员/共享：#B8A9E8
  - 中性：#8C8682
- 首页四类记录图标：
  - 饮食：碗图标
  - 排泄：猫砂盆图标
  - 体重：体重秤图标
  - 用药：药丸图标
- 导航图标：首页（小屋）、爱宠（爪印）、记录（清单）、健康（爱心+十字）、家人（双人+爱心）。

## 8. Responsive Behavior

- 设计稿按 390px 宽度输出；360-420px 保持单列居中。
- 375px 以下：卡片内边距减 2px，字号减 1px，统计 2 列不变但间距 10px。
- 420px 以上：内容保持 390px 居中。
- 竖屏优先；横屏不专门适配。

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

- `home-pet-switcher`, `home-add-pet-button`, `home-quick-record-food`, `home-quick-record-waste`, `home-quick-record-weight`, `home-quick-record-medicine`, `home-today-food-count`, `home-today-waste-count`, `home-latest-weight`, `home-today-medicine-count`, `home-reminder-list`, `home-recent-record-list`, `home-floating-record-button`, `home-empty-add-pet`
- `pets-add-button`, `pets-list`
- `pet-detail-back`, `pet-detail-edit`, `pet-detail-delete`, `pet-detail-name`, `pet-detail-avatar`, `pet-detail-info-breed`, `pet-detail-info-age`, `pet-detail-info-weight`, `pet-detail-add-record`, `pet-detail-record-list`
- `records-filter-pet`, `records-filter-type`, `records-list`, `records-add-button`
- `trends-pet-selector`, `trends-metric-selector`, `trends-period-7d`, `trends-period-30d`, `trends-period-90d`, `trends-chart`, `trends-summary-value`
- `health-add-reminder`, `health-add-medical`, `health-reminder-list`, `health-reminder-{id}-toggle`, `health-medical-list`
- `family-invite-button`, `family-share-toggle`, `family-member-list`
- `add-record-back`, `add-record-pet-picker`, `add-record-type-*`, `add-record-value`, `add-record-datetime`, `add-record-note`, `add-record-save`, `add-record-cancel`
- `add-pet-back`, `add-pet-avatar`, `add-pet-name`, `add-pet-breed`, `add-pet-birthday`, `add-pet-gender`, `add-pet-weight`, `add-pet-save`, `add-pet-cancel`
- `add-reminder-back`, `add-reminder-pet-picker`, `add-reminder-type-vaccine`, `add-reminder-type-deworm`, `add-reminder-name`, `add-reminder-date`, `add-reminder-repeat`, `add-reminder-save`, `add-reminder-cancel`
- `add-medical-back`, `add-medical-pet-picker`, `add-medical-date`, `add-medical-hospital`, `add-medical-diagnosis`, `add-medical-prescription`, `add-medical-attachment`, `add-medical-save`, `add-medical-cancel`

### Events to Preserve

`open-pet-switcher`, `navigate-add-pet`, `quick-record-food`, `quick-record-waste`, `quick-record-weight`, `quick-record-medicine`, `navigate-pet-detail`, `delete-pet`, `open-add-record`, `filter-by-pet`, `filter-by-type`, `select-pet-for-trend`, `select-metric`, `select-period-7d`, `select-period-30d`, `select-period-90d`, `navigate-add-reminder`, `navigate-add-medical`, `toggle-reminder`, `open-medical-detail`, `invite-family-member`, `toggle-family-share`, `remove-family-member`, `navigate-back`, `select-pet`, `select-record-type-food`, `select-record-type-waste`, `select-record-type-weight`, `select-record-type-medicine`, `input-record-value`, `input-record-datetime`, `input-record-note`, `save-record`, `cancel-record`, `select-avatar`, `input-pet-name`, `input-pet-breed`, `input-pet-birthday`, `select-pet-gender`, `input-pet-weight`, `save-pet`, `cancel-pet`, `select-reminder-type-vaccine`, `select-reminder-type-deworm`, `input-reminder-name`, `input-reminder-date`, `select-reminder-repeat`, `save-reminder`, `cancel-reminder`, `input-medical-date`, `input-medical-hospital`, `input-medical-diagnosis`, `input-medical-prescription`, `add-medical-attachment`, `save-medical`, `cancel-medical`

### Change Requests

- 无。
