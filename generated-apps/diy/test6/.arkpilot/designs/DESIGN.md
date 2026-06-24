# 手作·印记 — Visual Design System

## 1. Visual Theme & Atmosphere

“手作·印记”是一款面向陶艺、木工、皮具、布艺等手作工作室的会员管理与课程预约工具。视觉以**陶土色 + 手写感**为核心，追求温润、质朴、有手作温度的数字体验。界面应像一张被陶轮微微润湿的工作台：不冰冷、不工业，有颗粒感的纸浆背景、圆钝的组件边缘、手写字体的点缀，以及取自陶土、草木灰、赭石的自然色彩。

整体氛围关键词：**温润、质朴、手作、有温度、不模板化**。

## 2. Color Palette & Roles

### Primary（陶土色系）
- **陶土原色** `#A0522D`：品牌主色，用于关键按钮、强调图标、积分徽章。温暖而有力。
- **赤陶浅褐** `#C38D6E`：次要强调、选中态、进度条填充。比主色更柔和。
- **米浆白** `#F7F3ED`：页面主背景。带有极淡的暖黄，像宣纸或陶泥表面。
- **陶坯灰** `#E8E0D6`：卡片背景、分隔、输入框底色。比背景深一度，营造层次。
- **窑变深褐** `#5C3A2A`：深色文字、标题、强调性深色表面。像烧透的陶土断面。

### Secondary（草木与自然）
- **草木灰绿** `#8A9A7B`：签到成功、正向状态、低库存安全。自然克制。
- **枯叶赭石** `#B87D4B`：课程标签、预约中状态、温暖提示。
- **沉泥灰蓝** `#6B7B8C`：次要信息、辅助图标、日期文字。
- **落霞柔粉** `#D8A89A`：沉睡会员提醒、需关注状态。低饱和，不刺眼。

### Functional
- **白瓷白** `#FFFFFF`：卡片高光面、输入框前景、按钮文字。
- **墨褐** `#3E2C23`：主标题、正文。比纯黑更温润。
- **浅墨褐** `#6B5B52`：次要文字、说明文字。
- **淡墨褐** `#9E8E84`：占位符、禁用态、时间戳。
- **坯裂红** `#C45A4A`：删除、错误、库存预警。像陶器开片的自然裂纹色。

### Surfaces & Elevation
- 页面背景：`#F7F3ED`（米浆白）
- 卡片背景：`#FFFFFF` 或 `#F0EBE3`
- 卡片阴影：`rgba(92, 58, 42, 0.08) 0px 4px 16px 0px`（温暖方向的柔和投影）
- 底部 Tab 栏背景：`rgba(247, 243, 237, 0.92)` + `backdrop-filter: blur(18px)`
- 悬浮按钮阴影：`rgba(160, 82, 45, 0.28) 0px 6px 20px 0px`
- 选中态背景：`rgba(195, 141, 110, 0.12)`

## 3. Typography Rules

### Font Family
- **Display / Handwritten Accent**：`'Zhi Mang Xing', 'Ma Shan Zheng', cursive`（中文手写体，用于大标题、空状态 slogan、页面情感化文案）
- **UI / Body**：`'PingFang SC', 'Noto Sans SC', 'Hiragino Sans GB', 'Microsoft YaHei', sans-serif`（系统黑体，保证可读性）
- 英文/数字：`SF Pro Text, Helvetica Neue, Arial, sans-serif`

### Hierarchy

| Role | Font | Size | Weight | Line Height | Color |
|------|------|------|--------|-------------|-------|
| Page Hero Title | 手写体 | 42px | 400 | 1.15 | `#3E2C23` |
| Section Title | 黑体 | 20px | 700 | 1.30 | `#3E2C23` |
| Card Title | 黑体 | 17px | 600 | 1.35 | `#3E2C23` |
| Body | 黑体 | 15px | 400 | 1.50 | `#6B5B52` |
| Body Emphasis | 黑体 | 15px | 600 | 1.40 | `#3E2C23` |
| Caption | 黑体 | 13px | 400 | 1.40 | `#9E8E84` |
| Micro | 黑体 | 12px | 500 | 1.35 | `#9E8E84` |
| Button | 黑体 | 16px | 600 | 1.00 | `#FFFFFF` / `#A0522D` |
| Nav Label | 黑体 | 11px | 500 | 1.20 | `#9E8E84` / `#A0522D` active |

### Principles
- 手写体仅用于标题与情感化空状态，避免小字号使用。
- 正文保持充足行高（1.5），便于长时间阅读会员备注与课程说明。
- 数字使用等宽或紧凑比例字体，积分余额、库存数量需清晰。

## 4. Component Stylings

### Buttons

**Primary CTA（陶土填充）**
- Background: `#A0522D`
- Text: `#FFFFFF`
- Padding: 14px 24px
- Radius: 14px（圆钝）
- Shadow: `rgba(160, 82, 45, 0.28) 0px 6px 20px 0px`
- Active: scale(0.98), background `#8B4513`

**Secondary Outline（陶土描边）**
- Background: transparent
- Border: 1.5px solid `#C38D6E`
- Text: `#A0522D`
- Radius: 14px
- Active: background `rgba(195, 141, 110, 0.12)`

**Ghost Action（文字按钮）**
- Text: `#A0522D`
- Font weight: 500
- Underline on active

**Floating Action Button**
- Background: `#A0522D`
- Icon: `#FFFFFF`
- Size: 56px
- Radius: 50%
- Shadow: 主按钮阴影
- Position: bottom 96px, right 20px（避免遮挡 Tab）

### Cards
- Background: `#FFFFFF`
- Border: 1px solid `rgba(160, 82, 45, 0.08)`
- Radius: 18px
- Padding: 16px
- Shadow: `rgba(92, 58, 42, 0.08) 0px 4px 16px 0px`
- 列表卡片之间 12px 间距

### Inputs
- Background: `#F7F3ED`
- Border: 1px solid `rgba(160, 82, 45, 0.12)`
- Radius: 12px
- Padding: 14px 16px
- Focus border: `#A0522D`
- Placeholder: `#9E8E84`

### Tags / Chips
- 工艺标签：background `#F0EBE3`, text `#5C3A2A`, radius 10px, padding 6px 10px
- 沉睡标签：background `#F4DCD5`, text `#A64B3C`
- 低库存标签：background `#F4DCD5`, text `#C45A4A`
- 签到成功标签：background `#E4EBDC`, text `#5A7248`

### Bottom Tab Bar
- Background: `rgba(247, 243, 237, 0.92)` + `backdrop-filter: blur(18px)`
- Border-top: 1px solid `rgba(160, 82, 45, 0.08)`
- Height: 64px + safe-area
- 图标 24px，标签 11px
- Active: icon/text `#A0522D`，inactive `#9E8E84`
- 居中图标上方带轻微陶土色 indicator（2px 圆点）

### Navigation Bar
- Background: 透明或米浆白
- Title: 黑体 18px weight 600, `#3E2C23`
- 左侧返回按钮为圆角陶土色图标按钮

## 5. Layout Principles

### Spacing System
- Base: 4px
- Scale: 4, 8, 12, 16, 20, 24, 32, 40, 48, 64
- 卡片内边距：16px
- 页面水平内边距：20px
- 模块之间：24-32px

### Container
- 内容区 max-width: 390px，居中
- 所有固定定位元素（Tab 栏、FAB）宽度限制与 body 一致
- 禁止全宽拉伸，PC 预览保持移动画布比例

### Page Rhythm
- Header 区域（顶部标题 + 日期）：首屏顶部 0-120vp
- 核心提醒卡片（沉睡/低库存）：120-260vp
- 今日课程/积分动态：260-560vp
- 列表内容：下方滚动区

## 6. Imagery & Iconography

### Images
- 会员作品图：1:1 或 4:5 比例，圆角 12px，object-fit cover
- 空状态插画：陶轮、陶坯、手工具线描 SVG，单线陶土色
- 背景纹理：可选极淡宣纸纹理（SVG 或 CSS noise，透明度 ≤0.03）

### Icons
- 使用线性 SVG 图标，stroke-width 1.8-2px
- 图标颜色与相邻文字一致，active 态使用陶土色
- 所有内联 SVG 必须包含上下文 `<title>` 作为第一个子元素

## 7. Special Page Notes

### Home
- 顶部手写体大标题“手作·印记” + 今日日期
- 两列提醒卡片：沉睡会员（落霞柔粉背景）、低库存物料（坯裂红淡底）
- 今日课程横向滚动或紧凑列表
- 右下角悬浮按钮：快速签到

### Members
- 顶部搜索框 + 沉睡筛选开关
- 会员卡片：左侧头像（陶土色首字母），右侧姓名、积分、最近到店、工艺标签
- 空状态：陶轮线描 + 手写体“还没遇到第一位匠人”

### MemberDetail
- 顶部大图/作品图墙（横向滚动）
- 会员信息卡：姓名、积分、擅长工艺、备注
- 操作行：签到、编辑、删除
- 已预约课程列表

### Courses
- 顶部日历/列表切换
- 日历日期圆点标记有课日期
- 课程卡片展示时间、名额、地点、状态

### Points
- 顶部积分余额大卡（陶土渐变背景）
- 签到按钮 + 补录按钮
- 积分流水列表：类型图标、说明、数值、时间

### Inventory
- 顶部低库存横幅
- 库存项展示：名称、规格、当前库存/安全库存、进度条
- 进度条低于安全线变红

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

### Key Action / Input / Assertion IDs
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
- 无：语义协议覆盖了全部关键交互目标，视觉设计不引入新的语义目标。

## 9. Do's and Don'ts

### Do
- 使用陶土色系，保持温暖自然的视觉调性
- 在标题与空状态使用手写体，增加手作感
- 使用圆角、柔和阴影、半透明毛玻璃 Tab 栏
- 保持图标与文字颜色一致，active 态使用陶土色
- 所有 SVG 图标添加语义化 `<title>`
- 限制内容宽度在 390-420vp 内居中

### Don't
- 不要使用冷灰、纯白医院感背景
- 不要使用方正尖锐的大直角按钮
- 不要使用emoji替代图标
- 不要全宽拉伸 Tab 栏或固定元素
- 不要在小字号使用手写体
- 不要使用过多 accent 颜色破坏陶土色系统一

---
*Design version: 1.0 — generated by ArkPilot autopilot-html-tmux-design-a2ui-pro*
