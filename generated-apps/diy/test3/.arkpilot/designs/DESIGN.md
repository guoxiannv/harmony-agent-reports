# 手作·印记 — 视觉设计系统

## 1. Visual Theme & Atmosphere

「手作·印记」的视觉气质是一座午后阳光里的陶艺工坊：泥土的粗粝、木屑的暖香、指尖沾染釉料的温度。我们不追求工业化的精确，而是让界面像一张被茶渍晕染的手工纸——有瑕疵、有呼吸、有记忆。

陶土色系（terracotta + sand + clay）作为基调，手写感圆体字形贯穿标题与按钮，卡片边缘采用轻微不规则的“手捏”圆角，仿佛泥坯自然风干的痕迹。背景不是冰冷的纯白，而是带着米糠与陶土颗粒感的暖白，关键行动点用窑火橙与青釉蓝点亮，形成温润而不沉闷的节奏。

**Key Characteristics:**
- 陶土暖色基调：砂白、赤陶、赭石、窑火橙
- 手写感圆体标题 + 现代无衬线正文，形成“手作×数字化”的反差
- 卡片使用 16–24px 大圆角 + 轻微阴影，像一块块摆放整齐的泥板
- 背景叠加极淡的纸张纹理与陶土颗粒噪点
- 图标采用描边风，曲线柔和，避免锐利直角
- 空态使用手绘感插画占位，而非默认图标
- 按钮以胶囊形为主，CTA 用窑火橙，次要操作用陶土灰

## 2. Color Palette & Roles

### Primary
- **陶土白** (`#FAF6F1`): 页面主背景，带暖调的米白色，像未上釉的素坯。
- **赤陶橙** (`#C76D4E`): 品牌主色，用于强调标题、标签、选中态。
- **赭石棕** (`#8B5A3C`): 主要文本与深色卡片背景，像烧熟的陶土。
- **窑火橙** (`#E88D4F`): 主 CTA、签到按钮、高亮数值，模拟窑口火光。

### Secondary
- **砂金** (`#E6D5B8`): 次要背景、积分卡片、选中日期背景。
- **青釉蓝** (`#5B8A72`): 成功、已预约、库存充足状态，取自青釉开片。
- **藤黄** (`#D4A843`): 连续签到、勋章、警告轻提示。
- **炭黑** (`#2E2A26`): 最深文本与强调背景。

### Surface
- **泥板灰** (`#EDE6DC`): 卡片背景、输入框背景。
- **浅泥灰** (`#F3EDE6`): 列表项悬停/按下背景。
- **陶土阴影** (`rgba(139, 90, 60, 0.12)`): 卡片阴影色，暖调阴影更自然。
- **磨砂玻璃** (`rgba(250, 246, 241, 0.82)`): 底部 Tab 与顶部导航磨砂背景。

### Text
- **深褐** (`#3D322B`): 正文主色。
- **中褐** (`#6B5A4F`): 次要文本、说明文字。
- **浅褐** (`#A89A8E`): 禁用、占位符、时间戳。
- **陶白** (`#FFFBF6`): 深色背景上的文字。

### State
- **成功** `#5B8A72`（青釉）
- **警告** `#C9A227`（藤黄）
- **错误/库存不足** `#B85C4F`（窑变红）
- **专注环** `2px solid #C76D4E`

## 3. Typography Rules

### Font Family
- **Display / Handwritten**: `Ma Shan Zheng`, `ZCOOL XiaoWei`, or system cursive fallback — 用于大标题、空态文案、积分数字装饰。
- **Body**: `PingFang SC`, `HarmonyOS Sans`, `Noto Sans SC`, sans-serif — 正文与列表。
- **Numeric / Data**: `HarmonyOS Sans Condensed`, `SF Pro Display` fallback — 积分、金额、库存数量。

### Hierarchy

| Role | Font | Size | Weight | Line Height | Letter Spacing | Notes |
|------|------|------|--------|-------------|----------------|-------|
| Page Title | 手写圆体 | 32px | 400 | 1.2 | 1px | 顶部大标题，带 1–2° 轻微旋转 |
| Section Title | 手写圆体 | 22px | 400 | 1.3 | 0.5px | 区块标题 |
| Card Title | 无衬线 | 18px | 600 | 1.4 | 0 | 卡片主标题 |
| Body | 无衬线 | 15px | 400 | 1.55 | 0.2px | 正文 |
| Body Emphasis | 无衬线 | 15px | 600 | 1.5 | 0.2px | 强调正文 |
| Caption | 无衬线 | 13px | 400 | 1.45 | 0.3px | 说明、时间戳 |
| Micro | 无衬线 | 12px | 500 | 1.4 | 0.3px | 标签、徽章 |
| Data Number | 无衬线 | 36px | 700 | 1.1 | -0.5px | 积分余额、连续天数 |
| Button | 无衬线 | 15px | 600 | 1 | 0.5px | 按钮文字 |

### Principles
- 标题使用手写圆体时，避免全大写，保持自然行楷节奏。
- 数字使用紧凑字距，增强“印章”感。
- 正文行高较宽松（1.55），营造阅读舒适感。

## 4. Component Stylings

### Buttons

**Primary CTA（窑火橙）**
- Background: `#E88D4F`
- Text: `#FFFBF6`
- Padding: 14px 28px
- Radius: 999px（胶囊）
- Shadow: `0 4px 12px rgba(232, 141, 79, 0.32)`
- Active: scale(0.97), background `#D67D42`
- Focus: 2px solid `#C76D4E` outline

**Secondary（陶土灰）**
- Background: `#EDE6DC`
- Text: `#8B5A3C`
- Padding: 12px 24px
- Radius: 999px
- Border: 1px solid `#E6D5B8`
- Active: background `#E6D5B8`

**Icon Button（圆形）**
- Background: `#FAF6F1`
- Size: 40px
- Radius: 50%
- Border: 1px solid `#E6D5B8`
- Icon color: `#8B5A3C`

### Cards
- Background: `#FAF6F1` 或 `#EDE6DC`
- Radius: 20px
- Padding: 18px
- Shadow: `0 6px 20px rgba(139, 90, 60, 0.10)`
- 可选：顶部 2px 手绘感装饰线 `#C76D4E`

### Tags / Chips
- Background: `#F3EDE6`
- Text: `#8B5A3C`
- Radius: 999px
- Padding: 6px 14px
- Border: 1px dashed `#D4A843`
- 删除按钮：小圆叉

### Inputs
- Background: `#FAF6F1`
- Border: 1px solid `#E6D5B8`
- Radius: 14px
- Padding: 14px 16px
- Focus: border-color `#C76D4E`, shadow `0 0 0 3px rgba(199, 109, 78, 0.15)`
- Placeholder: `#A89A8E`

### Calendar
- 选中日期：背景 `#C76D4E`，文字 `#FFFBF6`，圆形
- 有课日期：底部小圆点 `#5B8A72`
- 今天：边框 `#E88D4F`
- 非本月：文字 `#A89A8E`

### Bottom Tab Bar
- Background: `rgba(250, 246, 241, 0.92)` + backdrop-filter blur(16px)
- Height: 72px + safe-area
- Active icon/label: `#C76D4E`
- Inactive: `#A89A8E`
- Top border: 1px solid `#EDE6DC`

## 5. Layout Principles

### Spacing System
- Base: 4px
- Scale: 4, 8, 12, 16, 20, 24, 32, 40, 48, 64px
- 卡片间距 16–20px，区块间距 32–40px

### Container
- Content max-width: 420px，居中
- 页面水平内边距：20px
- 首屏核心内容（Header + 核心卡片）必须在顶部 600vp 内

### Elevation
- Level 0: 无阴影，纯背景
- Level 1: `0 4px 12px rgba(139,90,60,0.08)` — 按钮、小卡片
- Level 2: `0 6px 20px rgba(139,90,60,0.10)` — 卡片
- Level 3: `0 12px 32px rgba(139,90,60,0.14)` — 底部导航、模态

## 6. Imagery & Iconography

- 图标使用本地 SVG 描边风，线条圆角，1.5px stroke。
- 作品图使用圆角 16px 网格，比例 1:1，带极淡阴影。
- 空态插画：手绘风格陶轮、陶坯、工具简笔画。
- 头像：圆形 80px，带 3px `#E6D5B8` 边框。

## 7. Responsive & Motion

- 页面切换：轻微 slide-up + fade，duration 250ms，ease-out。
- 签到按钮点击：涟漪扩散 + 数字弹跳。
- 标签添加：chip scale-in。
- 卡片列表：stagger fade-in，间隔 50ms。
- 目标设备 1272×2756vp，内容居中 max-width 420vp，禁止侧边导航。

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
- 无。视觉设计未修改任何语义 ID 或事件名。

## 9. Do's and Don'ts

### Do
- 使用陶土暖色作为背景与卡片底色。
- 用窑火橙作为唯一高饱和 CTA 色，保持行动点清晰。
- 给标题轻微手写感，正文保持可读无衬线。
- 使用大圆角卡片与胶囊按钮，强化“泥坯/手作”意象。
- 为所有 SVG 图标注入语义化 `<title>`。

### Don't
- 不要使用冷灰纯白背景。
- 不要使用直角尖锐的按钮或卡片。
- 不要在一个页面使用超过 3 种高饱和强调色。
- 不要把 Tab 导航放到侧边或顶部占用过高空间。
- 不要省略空态引导与手写感插画。
