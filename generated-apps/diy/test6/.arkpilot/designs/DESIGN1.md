# 手作·印记 — Visual Design System (Refined)

## 1. Visual Theme & Atmosphere

“手作·印记”是面向陶艺、木工、皮具、布艺等手作工作室的会员管理与课程预约工具。视觉以**陶土色 + 手写感**为核心，追求温润、质朴、有手作温度的数字体验。整体界面应像一张被陶轮微微润湿的工作台：有颗粒感的纸浆背景、圆钝的组件边缘、手写字体的点缀，以及取自陶土、草木灰、赭石的自然色彩。

氛围关键词：**温润、质朴、手作、有温度、不模板化**。

本次评审重点优化：
1. 增强层次感与材质感——通过渐变、毛玻璃、多层阴影避免页面单调。
2. 丰富配色层次——在陶土主色基础上引入窑变、釉色、草木灰等自然色阶。
3. 提升组件精致度——卡片加入顶部高光与底部阴影，按钮加入渐变与点击涟漪效果。
4. 空状态与插画更有情感化——使用手写体与陶轮、陶坯线描 SVG。

## 2. Color Palette & Roles

### Primary（陶土窑变色系）
- **窑红陶土** `#9E4F2C`：品牌主色，用于主按钮、选中态、关键图标。比初版更沉稳。
- **赤陶浅褐** `#C98B6C`：次要强调、进度条、选中背景。温暖柔和。
- **米浆白** `#F7F3ED`：页面主背景，像润湿陶泥表面。
- **陶坯灰** `#EDE6DD`：卡片底色、输入框背景。
- **窑变深褐** `#4A3024`：深色标题、深色卡片背景。像烧透的陶土断面。
- **釉白** `#FDFBF7`：高亮卡片表面、弹窗背景。

### Secondary（自然釉色）
- **草木灰绿** `#7D9472`：签到成功、正向状态、安全库存。
- **枯叶赭石** `#B87D4B`：课程标签、预约中状态。
- **沉泥灰蓝** `#6B7D8E`：次要信息、辅助图标、日期。
- **落霞柔粉** `#D9A89B`：沉睡会员提醒、需关注状态。
- **天青釉** `#8BAAB8`：积分余额大卡渐变辅色，带来一点瓷器釉色感。

### Functional
- **白瓷白** `#FFFFFF`：卡片高光面、输入框前景。
- **墨褐** `#3B2820`：主标题、正文。
- **浅墨褐** `#6E5D53`：次要文字。
- **淡墨褐** `#9E8E84`：占位符、禁用态、时间戳。
- **坯裂红** `#B85448`：删除、错误、库存预警。

### Gradient Tokens
- **陶土渐变**：`linear-gradient(135deg, #9E4F2C 0%, #C98B6C 100%)` — 用于主按钮、积分余额卡。
- **天青陶渐变**：`linear-gradient(135deg, #9E4F2C 0%, #8BAAB8 100%)` — 用于积分余额卡背景变体。
- **沉睡提醒渐变**：`linear-gradient(135deg, #D9A89B 0%, #F0DFD8 100%)` — 沉睡会员提醒卡片。
- **低库存渐变**：`linear-gradient(135deg, #B85448 0%, #D9A89B 100%)` — 低库存预警卡片。
- **玻璃拟态**：`rgba(255, 255, 255, 0.65)` + `backdrop-filter: blur(20px) saturate(160%)`

### Surfaces & Elevation
- 页面背景：`#F7F3ED`
- 普通卡片：`#FFFFFF`，border 1px solid `rgba(158, 79, 44, 0.08)`，radius 20px
- 强调卡片：渐变背景 + 内阴影高光 `inset 0 1px 0 rgba(255,255,255,0.35)`
- 卡片阴影：`rgba(74, 48, 36, 0.10) 0px 8px 24px -4px, rgba(74, 48, 36, 0.06) 0px 2px 6px -1px`
- 底部 Tab 栏背景：`rgba(247, 243, 237, 0.88)` + `backdrop-filter: blur(22px) saturate(150%)` + `border-top: 1px solid rgba(158, 79, 44, 0.10)`
- 悬浮按钮阴影：`rgba(158, 79, 44, 0.32) 0px 8px 24px -2px`
- 选中态背景：`rgba(201, 139, 108, 0.14)`

## 3. Typography Rules

### Font Family
- **Display / Handwritten Accent**：`'Zhi Mang Xing', 'Ma Shan Zheng', cursive`
- **UI / Body**：`'PingFang SC', 'Noto Sans SC', 'Hiragino Sans GB', 'Microsoft YaHei', sans-serif`
- 英文/数字：`SF Pro Text, Helvetica Neue, Arial, sans-serif`

### Hierarchy

| Role | Font | Size | Weight | Line Height | Color |
|------|------|------|--------|-------------|-------|
| Page Hero Title | 手写体 | 44px | 400 | 1.12 | `#3B2820` |
| Section Title | 黑体 | 20px | 700 | 1.30 | `#3B2820` |
| Card Title | 黑体 | 17px | 600 | 1.35 | `#3B2820` |
| Body | 黑体 | 15px | 400 | 1.55 | `#6E5D53` |
| Body Emphasis | 黑体 | 15px | 600 | 1.40 | `#3B2820` |
| Caption | 黑体 | 13px | 400 | 1.45 | `#9E8E84` |
| Micro | 黑体 | 12px | 500 | 1.35 | `#9E8E84` |
| Button | 黑体 | 16px | 600 | 1.00 | `#FFFFFF` / `#9E4F2C` |
| Nav Label | 黑体 | 11px | 500 | 1.20 | `#9E8E84` / `#9E4F2C` active |

### Principles
- 手写体仅用于标题与空状态 slogan。
- 正文行高 1.55，保证长文本舒适。
- 数字使用 tabular-nums 或等宽效果，积分/库存清晰。

## 4. Component Stylings

### Buttons

**Primary CTA（陶土渐变填充）**
- Background: `linear-gradient(135deg, #9E4F2C 0%, #C98B6C 100%)`
- Text: `#FFFFFF`
- Padding: 14px 28px
- Radius: 16px
- Shadow: `rgba(158, 79, 44, 0.32) 0px 8px 24px -2px`
- Active: scale(0.97), 背景加深

**Secondary Outline（陶土描边）**
- Background: transparent
- Border: 1.5px solid `#C98B6C`
- Text: `#9E4F2C`
- Radius: 16px
- Active: background `rgba(201, 139, 108, 0.14)`

**Ghost Action**
- Text: `#9E4F2C`
- Font weight: 500
- Active: underline

**Floating Action Button**
- Background: `#9E4F2C`
- Icon: `#FFFFFF`
- Size: 58px
- Radius: 50%
- Shadow: 主按钮阴影
- Position: bottom 102px, right 22px

### Cards
- Background: `#FFFFFF`
- Border: 1px solid `rgba(158, 79, 44, 0.08)`
- Radius: 20px
- Padding: 18px
- Shadow: `rgba(74, 48, 36, 0.10) 0px 8px 24px -4px, rgba(74, 48, 36, 0.06) 0px 2px 6px -1px`
- 列表卡片间距 14px
- 强调卡片额外添加顶部内高光

### Inputs
- Background: `#F7F3ED`
- Border: 1px solid `rgba(158, 79, 44, 0.12)`
- Radius: 14px
- Padding: 15px 17px
- Focus border: `#9E4F2C`
- Placeholder: `#9E8E84`

### Tags / Chips
- 工艺标签：bg `#F3EBE3`, text `#4A3024`, radius 12px, padding 7px 12px
- 沉睡标签：bg `#F5DDD6`, text `#A64B3C`
- 低库存标签：bg `#F5DDD6`, text `#B85448`
- 签到成功：bg `#DFE8D6`, text `#4F6644`

### Bottom Tab Bar
- Background: `rgba(247, 243, 237, 0.88)` + `backdrop-filter: blur(22px) saturate(150%)`
- Border-top: 1px solid `rgba(158, 79, 44, 0.10)`
- Height: 68px + safe-area
- 图标 24px，标签 11px
- Active: icon/text `#9E4F2C`，顶部 2px indicator dot
- Inactive: `#9E8E84`

### Navigation Bar
- Background: transparent 或 `#F7F3ED`
- Title: 黑体 18px weight 600, `#3B2820`
- 返回按钮为圆角陶土色图标按钮

## 5. Layout Principles

### Spacing System
- Base: 4px
- Scale: 4, 8, 12, 16, 20, 24, 28, 32, 40, 48, 64
- 卡片内边距：18px
- 页面水平内边距：22px
- 模块之间：28-36px

### Container
- 内容区 max-width: 390px，居中
- 固定元素（Tab 栏、FAB）宽度限制与 body 一致
- 禁止全宽拉伸

### Page Rhythm
- Header：0-130vp
- 核心提醒卡：130-290vp
- 今日课程/积分动态：290-600vp
- 列表内容：下方滚动

## 6. Imagery & Iconography

### Images
- 会员作品图：1:1，radius 14px
- 空状态插画：陶轮、陶坯、手工具线描 SVG，单线 `#9E4F2C`
- 背景纹理：极淡宣纸噪点，opacity ≤0.04

### Icons
- 线性 SVG，stroke-width 1.8px
- 所有内联 SVG 第一个子元素为语义化 `<title>`
- 图标颜色与文字一致，active 使用陶土色

## 7. Special Page Notes

### Home
- 顶部手写体标题 + 今日日期
- 两列提醒卡片：沉睡会员（落霞渐变）、低库存（坯裂红渐变）
- 今日课程紧凑卡片列表
- 右下角 FAB 快速签到

### Members
- 搜索框 + 沉睡筛选 pill
- 会员卡片带头像（首字母）、积分、工艺标签
- 空状态：陶轮线描 + 手写体 slogan

### MemberDetail
- 顶部作品图墙横向滚动
- 信息卡 + 操作行（签到/编辑/删除）
- 已预约课程列表

### Courses
- 日历/列表切换 pill
- 日历日期圆点标记有课日期
- 课程卡片展示时间、名额、地点

### Points
- 积分余额大卡（陶土渐变 + 玻璃高光）
- 签到按钮 + 补录按钮
- 积分流水列表

### Inventory
- 顶部低库存横幅（渐变）
- 库存项：名称、规格、当前/安全库存、进度条
- 低库存进度条变红

## 8. Semantic UI Binding

### Surfaces & Routes
- `home-page` → `pages/Home`, tab `tab-home`
- `members-page` → `pages/Members`, tab `tab-members`
- `member-detail-page` → `pages/MemberDetail`
- `member-edit-page` → `pages/MemberEdit`
- `courses-page` → `pages/Courses`, tab `tab-courses`
- `course-detail-page` → `pages/CourseDetail`
- `course-booking-page` → `pages/CourseBooking`
- `points-page` → `pages/Points`, tab `tab-points`
- `point-record-page` → `pages/PointRecord`
- `inventory-page` → `pages/Inventory`, tab `tab-inventory`
- `inventory-edit-page` → `pages/InventoryEdit`
- `inventory-transaction-page` → `pages/InventoryTransaction`

### Key IDs
- `home-sleeping-count`, `home-low-stock-count`, `home-today-course-list`, `home-recent-point-list`, `home-checkin-button`, `home-add-member-button`
- `members-search-input`, `members-filter-sleeping`, `members-list`, `members-add-button`
- `member-detail-name`, `member-detail-points`, `member-detail-crafts`, `member-detail-works-grid`, `member-detail-course-list`, `member-detail-edit-button`, `member-detail-checkin-button`, `member-detail-delete-button`
- `member-edit-name-input`, `member-edit-phone-input`, `member-edit-crafts-picker`, `member-edit-works-uploader`, `member-edit-save-button`
- `courses-view-toggle`, `courses-calendar`, `courses-list`, `courses-add-button`
- `course-detail-title`, `course-detail-capacity`, `course-detail-booking-list`, `course-detail-book-button`
- `course-booking-member-picker`, `course-booking-submit-button`
- `points-total-balance`, `points-checkin-button`, `points-transaction-list`, `points-add-record-button`
- `point-record-member-picker`, `point-record-type-picker`, `point-record-amount-input`, `point-record-save-button`
- `inventory-low-stock-count`, `inventory-list`, `inventory-add-button`, `inventory-transaction-button`
- `inventory-edit-name-input`, `inventory-edit-stock-input`, `inventory-edit-safe-stock-input`, `inventory-edit-save-button`
- `inventory-transaction-material-picker`, `inventory-transaction-type-picker`, `inventory-transaction-quantity-input`, `inventory-transaction-save-button`

### Events to Preserve
- `open-sleeping-members`, `open-low-stock`, `open-checkin`, `navigate-member-edit`, `search-members`, `toggle-sleeping-filter`, `member-checkin`, `delete-member`, `upload-work-image`, `save-member`, `cancel-edit`, `toggle-calendar-list`, `filter-courses-by-date`, `navigate-course-edit`, `navigate-course-booking`, `cancel-course`, `select-booking-member`, `submit-course-booking`, `cancel-booking-form`, `daily-checkin`, `navigate-point-record`, `filter-point-type`, `select-point-member`, `select-point-type`, `save-point-record`, `cancel-point-record`, `navigate-inventory-edit`, `navigate-inventory-transaction`, `save-inventory`, `cancel-inventory-edit`, `select-transaction-material`, `select-transaction-type`, `save-inventory-transaction`, `cancel-inventory-transaction`

### Change Requests
- 无。语义协议完整，视觉设计不引入新语义目标。

## 9. Do's and Don'ts

### Do
- 使用陶土渐变、玻璃拟态、柔和多层阴影
- 标题与空状态使用手写体
- 所有 SVG 加语义化 title
- 限制内容宽度 390-420vp 居中

### Don't
- 不要使用冷灰纯白背景
- 不要全宽拉伸固定元素
- 不要使用 emoji 替代图标
- 不要在小字号使用手写体
- 不要引入过多破坏统一性的 accent 颜色

---
*Design version: 1.1 — refined by ArkPilot autopilot-html-tmux-design-a2ui-pro*
