# 手作·印记 — 视觉设计系统 v1

## 1. Visual Theme & Atmosphere

「手作·印记」不是一份冰冷的会员台账，而是一本可以随身携带的“电子手账”。打开 App，就像推开一间洒满午后阳光的陶艺工坊：空气中飘着木屑与釉料的气息，工作台上有未完成的泥坯，墙上挂着学员的作品。

我们以**陶土色**为基底，加入**窑火橙**与**青釉绿**两枚 accent，营造“温润、有呼吸、有记忆”的手作氛围。界面中大量使用**纸张纹理、手绘感标题、不规则圆角、暖调阴影**，让数字世界也能触碰到泥土的粗粝与温度。

**Key Characteristics:**
- 基底：砂陶白、泥板灰、赤陶棕
- 强调：窑火橙（CTA）、青釉绿（成功/已约）、藤黄（签到/勋章）
- 标题：手写感圆体/行楷，营造“手作”温度
- 卡片：16–24px 大圆角、暖调阴影、顶部手绘装饰线
- 图标：圆角描边风，拒绝锐利直角
- 空态：手绘陶轮/泥坯插画 + 温柔引导文案
- 动效：轻弹、涟漪、交错淡入，像手指拂过陶坯

## 2. Color Palette & Roles

### Primary
- **素坯白** `#FAF6F1`：页面主背景，像未上釉的素坯。
- **赤陶棕** `#A65D48`：品牌主色，用于标题、标签、选中态。
- **赭石褐** `#6F453B`：深色文本与深色卡片背景。
- **窑火橙** `#E57A39`：主 CTA、签到按钮、高亮数值。

### Secondary
- **砂金米** `#EBDBC2`：积分卡片、选中日期、次要背景。
- **青釉绿** `#4D8A72`：成功、已预约、库存充足。
- **藤金黄** `#C99E3A`：连续签到、勋章、轻警告。
- **窑变红** `#B84A3D`：库存不足、错误、取消操作。

### Surface
- **泥板灰** `#EDE6DC`：卡片、输入框背景。
- **浅泥灰** `#F5EDE4`：列表项悬停/按下态。
- **陶土阴影** `rgba(111, 69, 59, 0.12)`：卡片阴影。
- **磨砂玻璃** `rgba(250, 246, 241, 0.88)`：底部导航、顶部栏。

### Text
- **深褐** `#3A2E29`：正文主色。
- **中褐** `#6B5A4F`：次要文本、说明。
- **浅褐** `#A89A8E`：禁用、占位符、时间戳。
- **陶白** `#FFFBF6`：深色背景上的文字。

### State
- 成功 `#4D8A72`
- 警告 `#C99E3A`
- 错误 `#B84A3D`
- 专注环 `2px solid #A65D48`

## 3. Typography Rules

### Font Family
- **Display / Handwritten**: `Ma Shan Zheng`, `ZCOOL XiaoWei`, cursive fallback
- **Body**: `PingFang SC`, `HarmonyOS Sans SC`, `Noto Sans SC`, sans-serif
- **Numeric**: `HarmonyOS Sans Condensed`, `SF Pro Display`, sans-serif

### Hierarchy

| Role | Font | Size | Weight | Line Height | Letter Spacing |
|------|------|------|--------|-------------|----------------|
| Page Title | 手写体 | 34px | 400 | 1.18 | 1px |
| Section Title | 手写体 | 24px | 400 | 1.28 | 0.5px |
| Card Title | 无衬线 | 18px | 600 | 1.4 | 0 |
| Body | 无衬线 | 15px | 400 | 1.55 | 0.2px |
| Body Emphasis | 无衬线 | 15px | 600 | 1.5 | 0.2px |
| Caption | 无衬线 | 13px | 400 | 1.45 | 0.3px |
| Micro | 无衬线 | 12px | 500 | 1.4 | 0.3px |
| Data Number | 无衬线 | 38px | 700 | 1.08 | -0.5px |
| Button | 无衬线 | 15px | 600 | 1 | 0.5px |

### Principles
- 手写标题避免全大写，保持自然节奏。
- 数字紧凑、粗重，像印章上的刻字。
- 正文行高宽松，提升阅读呼吸感。

## 4. Component Stylings

### Buttons

**Primary CTA（窑火橙）**
- Background: `#E57A39`
- Text: `#FFFBF6`
- Padding: 14px 28px
- Radius: 999px
- Shadow: `0 4px 14px rgba(229, 122, 57, 0.34)`
- Active: scale(0.97), bg `#D06A2E`
- Focus: 2px solid `#A65D48`

**Secondary（陶土灰）**
- Background: `#EDE6DC`
- Text: `#6F453B`
- Padding: 12px 24px
- Radius: 999px
- Border: 1px solid `#DCC8B0`
- Active: bg `#E3D5C4`

**Danger（窑变红）**
- Background: `#B84A3D`
- Text: `#FFFBF6`
- Radius: 999px
- Shadow: `0 4px 12px rgba(184, 74, 61, 0.28)`

**Icon Button**
- 40×40px，圆形
- Background: `#FAF6F1`
- Border: 1px solid `#DCC8B0`
- Icon color: `#6F453B`

### Cards
- Background: `#FAF6F1` 或 `#EDE6DC`
- Radius: 22px
- Padding: 20px
- Shadow: `0 8px 24px rgba(111, 69, 59, 0.10)`
- 顶部可选 2px 手绘装饰线 `#A65D48`

### Tags / Chips
- Background: `#F5EDE4`
- Text: `#6F453B`
- Radius: 999px
- Padding: 6px 14px
- Border: 1px dashed `#C99E3A`
- Remove: 小圆叉 `#A65D48`

### Inputs
- Background: `#FAF6F1`
- Border: 1px solid `#DCC8B0`
- Radius: 16px
- Padding: 14px 16px
- Focus: border `#A65D48`, shadow `0 0 0 3px rgba(166, 93, 72, 0.12)`
- Placeholder: `#A89A8E`

### Calendar
- 选中日期：bg `#A65D48`, text `#FFFBF6`, 圆形
- 有课日期：底部小圆点 `#4D8A72`
- 今天：边框 `#E57A39`
- 非本月：text `#A89A8E`

### Bottom Tab Bar
- Background: `rgba(250, 246, 241, 0.92)` + blur(18px)
- Height: 76px + safe-area
- Active: `#A65D48`
- Inactive: `#A89A8E`
- Top border: 1px solid `#E3D5C4`

## 5. Layout Principles

### Spacing System
- Base: 4px
- Scale: 4, 8, 12, 16, 20, 24, 32, 40, 48, 64px
- 卡片间距 16–20px，区块间距 32–48px

### Container
- Content max-width: 420px，居中
- 页面水平内边距：20px
- 首屏核心内容必须在顶部 600vp 内

### Elevation
- Level 0: 无阴影
- Level 1: `0 4px 12px rgba(111,69,59,0.08)`
- Level 2: `0 8px 24px rgba(111,69,59,0.10)`
- Level 3: `0 12px 32px rgba(111,69,59,0.14)`

## 6. Imagery & Iconography

- SVG 描边风，stroke 1.5px，round cap/join。
- 作品图：1:1 圆角 16px，极淡阴影。
- 头像：80px 圆形，3px `#DCC8B0` 边框。
- 空态：手绘陶轮、泥坯、工具简笔画。

## 7. Responsive & Motion

- 页面切换：slide-up 250ms ease-out。
- 签到：涟漪 + 数字弹跳。
- 标签添加：scale-in 180ms。
- 列表：stagger fade-in 50ms。
- 目标设备 1272×2756vp，内容居中 max-width 420vp，底部 Tab。

## 8. Semantic UI Binding

### Surfaces / Routes / Tabs
- `home-page` → `pages/Home`, tab `tab-home`
- `classes-page` → `pages/Classes`, tab `tab-classes`
- `points-page` → `pages/Points`, tab `tab-points`
- `profile-page` → `pages/Profile`, tab `tab-profile`
- `class-detail-page` → `pages/ClassDetail`
- `profile-edit-page` → `pages/ProfileEdit`
- `dormant-page` → `pages/Dormant`
- `inventory-page` → `pages/Inventory`

### Important Semantic Targets
- Action: `home-checkin-button`, `classes-slot-{id}-book`, `classes-slot-{id}-cancel`, `class-detail-book`, `profile-edit-save`, `dormant-member-{id}-wake`, `inventory-item-{id}-restock`, `profile-edit-add-work`
- Input: `classes-calendar`, `profile-edit-name-input`, `profile-edit-craft-input`, `dormant-threshold-input`, `points-segment`
- Assertion: `home-points-balance`, `home-streak-days`, `points-balance`, `profile-name`, `profile-level`, `class-detail-capacity`, `dormant-count`, `inventory-item-{id}-quantity`
- List: `home-recent-list`, `classes-slot-list`, `points-history-list`, `profile-gallery`, `dormant-list`, `inventory-list`
- Empty states: `home-empty-state`, `classes-empty-state`, `points-history-empty`, `profile-gallery-empty`, `dormant-empty-state`, `inventory-empty-state`

### Events
- `member-checkin`, `navigate-dormant`, `navigate-inventory`, `navigate-profile-edit`, `select-class-date`, `book-class-slot`, `cancel-class-slot`, `book-class`, `cancel-booking`, `switch-points-tab`, `update-name`, `add-craft`, `remove-craft`, `add-work-image`, `remove-work-image`, `save-profile`, `wake-member`, `update-threshold`, `restock-item`, `link-class-material`

### Change Requests
- 无。

## 9. Do's and Don'ts

### Do
- 使用陶土暖色背景与卡片。
- 用窑火橙作为高饱和 CTA，青釉绿作为成功/已约态。
- 手写标题 + 无衬线正文，保持温度与可读性平衡。
- 使用大圆角与胶囊按钮。
- 为所有 SVG 注入语义化 `<title>`。

### Don't
- 不要用冷灰纯白背景。
- 不要使用直角尖锐组件。
- 不要单页超过 3 种高饱和强调色。
- 不要把 Tab 放到侧边或顶部占高空间。
- 不要省略空态引导。
