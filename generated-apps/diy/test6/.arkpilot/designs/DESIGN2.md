# 手作·印记 — Visual Design System (Final)

## 1. Visual Theme & Atmosphere

“手作·印记”是面向陶艺、木工、皮具、布艺等手作工作室的会员管理与课程预约工具。视觉以**陶土色 + 手写感**为核心，追求温润、质朴、有手作温度的数字体验。界面像一张被陶轮微微润湿的工作台：有颗粒感的纸浆背景、圆钝的组件边缘、手写字体的点缀，以及取自陶土、草木灰、赭石的自然色彩。

氛围关键词：**温润、质朴、手作、有温度、不模板化、有层次**。

本次最终评审确认：
1. 层次与材质感通过渐变、毛玻璃、多层阴影实现。
2. 配色层次丰富但不杂乱：陶土主色 + 草木灰绿 + 落霞柔粉 + 天青釉点缀。
3. 组件精致度：卡片高光 + 底部双阴影，按钮渐变 + 按压缩放。
4. 情感化空状态与手写体标题形成品牌记忆点。

## 2. Color Palette & Roles

### Primary（陶土窑变色系）
- **窑红陶土** `#9E4F2C`：品牌主色，主按钮、关键图标、积分徽章。
- **赤陶浅褐** `#C98B6C`：次要强调、进度条、选中背景。
- **米浆白** `#F7F3ED`：页面主背景。
- **陶坯灰** `#EDE6DD`：卡片底色、输入框背景。
- **窑变深褐** `#4A3024`：深色标题、深色卡片背景。
- **釉白** `#FDFBF7`：高亮卡片表面、弹窗背景。

### Secondary（自然釉色）
- **草木灰绿** `#7D9472`：签到成功、正向状态、安全库存。
- **枯叶赭石** `#B87D4B`：课程标签、预约中状态。
- **沉泥灰蓝** `#6B7D8E`：次要信息、辅助图标、日期。
- **落霞柔粉** `#D9A89B`：沉睡会员提醒、需关注状态。
- **天青釉** `#8BAAB8`：积分余额大卡渐变辅色。

### Functional
- **白瓷白** `#FFFFFF`
- **墨褐** `#3B2820`
- **浅墨褐** `#6E5D53`
- **淡墨褐** `#9E8E84`
- **坯裂红** `#B85448`

### Gradient Tokens
- **陶土渐变**：`linear-gradient(135deg, #9E4F2C 0%, #C98B6C 100%)`
- **天青陶渐变**：`linear-gradient(135deg, #9E4F2C 0%, #8BAAB8 100%)`
- **沉睡提醒渐变**：`linear-gradient(135deg, #D9A89B 0%, #F0DFD8 100%)`
- **低库存渐变**：`linear-gradient(135deg, #B85448 0%, #D9A89B 100%)`
- **玻璃拟态**：`rgba(255, 255, 255, 0.68)` + `backdrop-filter: blur(22px) saturate(165%)`

### Surfaces & Elevation
- 页面背景：`#F7F3ED`
- 普通卡片：`#FFFFFF`，border `rgba(158, 79, 44, 0.08)`，radius 20px
- 强调卡片：渐变背景 + 内高光 `inset 0 1px 0 rgba(255,255,255,0.40)`
- 卡片阴影：`rgba(74, 48, 36, 0.10) 0px 10px 28px -6px, rgba(74, 48, 36, 0.06) 0px 4px 8px -2px`
- 底部 Tab 栏：玻璃拟态 + border-top `rgba(158, 79, 44, 0.10)`
- 悬浮按钮阴影：`rgba(158, 79, 44, 0.34) 0px 10px 28px -4px`
- 选中态背景：`rgba(201, 139, 108, 0.16)`

## 3. Typography Rules

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

## 4. Component Stylings

### Buttons

**Primary CTA**
- Background: 陶土渐变
- Text: `#FFFFFF`
- Padding: 14px 28px
- Radius: 16px
- Shadow: `rgba(158, 79, 44, 0.34) 0px 10px 28px -4px`
- Active: scale(0.97)

**Secondary Outline**
- Background: transparent
- Border: 1.5px solid `#C98B6C`
- Text: `#9E4F2C`
- Radius: 16px

**Floating Action Button**
- Background: `#9E4F2C`
- Size: 58px，radius 50%
- Shadow: 主按钮阴影
- Position: bottom 102px, right 22px

### Cards
- Background: `#FFFFFF`
- Border: 1px solid `rgba(158, 79, 44, 0.08)`
- Radius: 20px
- Padding: 18px
- Shadow: `rgba(74, 48, 36, 0.10) 0px 10px 28px -6px, rgba(74, 48, 36, 0.06) 0px 4px 8px -2px`
- 列表卡片间距 14px

### Inputs
- Background: `#F7F3ED`
- Border: 1px solid `rgba(158, 79, 44, 0.12)`
- Radius: 14px
- Padding: 15px 17px
- Focus border: `#9E4F2C`

### Tags / Chips
- 工艺标签：bg `#F3EBE3`, text `#4A3024`, radius 12px
- 沉睡标签：bg `#F5DDD6`, text `#A64B3C`
- 低库存标签：bg `#F5DDD6`, text `#B85448`
- 签到成功：bg `#DFE8D6`, text `#4F6644`

### Bottom Tab Bar
- Background: 玻璃拟态
- Border-top: 1px solid `rgba(158, 79, 44, 0.10)`
- Height: 68px + safe-area
- Active: `#9E4F2C` + 顶部 indicator dot
- Inactive: `#9E8E84`

## 5. Layout Principles

- Base spacing: 4px
- 页面水平内边距：22px
- 内容 max-width: 390px 居中
- 固定元素宽度限制与 body 一致

## 6. Imagery & Iconography

- 会员作品图：1:1，radius 14px
- 空状态：陶轮/陶坯线描 SVG，单线 `#9E4F2C`
- 线性 SVG 图标，stroke-width 1.8px
- 所有内联 SVG 第一个子元素为语义化 `<title>`

## 7. Special Page Notes

### Home
- 手写体大标题 + 今日日期
- 沉睡/低库存双提醒卡
- 今日课程紧凑列表
- 右下角 FAB 快速签到

### Members
- 搜索 + 沉睡筛选 pill
- 会员卡片带头像、积分、工艺标签
- 空状态情感化插画

### MemberDetail
- 作品图墙横向滚动
- 信息卡 + 操作行
- 已预约课程列表

### Courses
- 日历/列表切换 pill
- 日期圆点标记
- 课程卡片

### Points
- 积分余额渐变卡
- 签到/补录按钮
- 积分流水

### Inventory
- 低库存横幅
- 库存项进度条
- 低库存变红

## 8. Semantic UI Binding

### Surfaces & Routes
- `home-page` → `pages/Home`, `tab-home`
- `members-page` → `pages/Members`, `tab-members`
- `member-detail-page` → `pages/MemberDetail`
- `member-edit-page` → `pages/MemberEdit`
- `courses-page` → `pages/Courses`, `tab-courses`
- `course-detail-page` → `pages/CourseDetail`
- `course-booking-page` → `pages/CourseBooking`
- `points-page` → `pages/Points`, `tab-points`
- `point-record-page` → `pages/PointRecord`
- `inventory-page` → `pages/Inventory`, `tab-inventory`
- `inventory-edit-page` → `pages/InventoryEdit`
- `inventory-transaction-page` → `pages/InventoryTransaction`

### Key IDs
（与 DESIGN1.md 完全一致，略）

### Events to Preserve
（与 DESIGN1.md 完全一致，略）

### Change Requests
- 无。

## 9. Do's and Don'ts

### Do
- 渐变、毛玻璃、多层阴影
- 手写体标题 + 黑体正文
- SVG 语义化 title
- 390-420vp 居中

### Don't
- 冷灰纯白背景
- 全宽拉伸固定元素
- emoji 替代图标
- 小字号手写体
- 过多杂乱 accent 颜色

---
*Design version: 1.2 — final by ArkPilot autopilot-html-tmux-design-a2ui-pro*
