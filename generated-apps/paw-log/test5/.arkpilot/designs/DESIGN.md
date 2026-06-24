# PawLog 宠迹 — Visual Design System

## 1. Visual Theme & Atmosphere
PawLog 宠迹的视觉主题是“清晨薄荷园里的治愈陪伴”。界面以薄荷绿（Mint）和肉垫粉（Paw Pink）为双主色，搭配奶油白与暖灰，营造柔和、清新、无攻击性的宠物健康记录体验。设计语言强调圆润（大圆角、胶囊按钮）、轻盈（半透明毛玻璃、柔和阴影）、可爱（ paw 印记、柔和渐变）与清晰（充足留白、可读字体）。整体氛围应像给宠物轻轻梳理毛发一样安心。

**Key Characteristics:**
- 双主色渐变：薄荷绿 #7ED7C2 + 肉垫粉 #FFB8C9 用于顶部装饰、按钮、选中态
- 奶油白 `#FFFBF6` 作为页面底色，温暖不刺眼
- 大圆角体系：卡片 20px、按钮 16-24px、头像 50%、输入框 14px
- 柔和弥散阴影：卡片使用 `0 8px 24px rgba(126,215,194,0.18)` 等彩色阴影
- 毛玻璃效果：顶部导航、底部 Tab 使用半透明背景 + backdrop blur
- 圆润图标：所有图标使用圆角 SVG，禁用尖锐线条和 emoji
- 信息层级通过色块、圆角卡片、柔和阴影建立，而非厚重边框

## 2. Color Palette & Roles

### Primary
- **薄荷绿 Mint** (`#7ED7C2`): 主品牌色，用于顶部装饰、主要按钮、选中态、图表主色
- **深薄荷 Deep Mint** (`#4CB5A0`): 按钮按下态、强调图标、次要强调
- **肉垫粉 Paw Pink** (`#FFB8C9`): 次品牌色，用于提醒、空状态插画、爱心/关怀相关元素、图表辅色
- **深肉垫粉 Deep Pink** (`#F48FB1`): 提醒高亮、重要操作背景

### Neutrals
- **奶油白 Cream** (`#FFFBF6`): 页面主背景
- **暖白 Warm White** (`#FFF8F0`): 卡片底色、输入框背景
- **浅灰灰 Gray 100** (`#F2F0EB`): 分割线、禁用背景
- **灰 Gray 300** (`#C4BEB4`): 占位文字、禁用文字
- **深灰 Gray 700** (`#5C5750`): 次要文字
- **炭灰 Charcoal** (`#3A3630`): 主文字

### Semantic
- **成功绿 Success** (`#8FD9A8`): 已完成、正常状态
- **警告黄 Warning** (`#F5D485`): 即将到期、注意
- **危险红 Danger** (`#E88C8C`): 已过期、删除、错误
- **信息蓝 Info** (`#8AC4E6`): 提示、链接（仅在信息场景少量使用，不抢主色）

### Surfaces
- **Card Background**: `#FFFFFF` 或 `#FFF8F0`
- **Glass Background**: `rgba(255,255,255,0.72)` + `backdrop-filter: blur(20px) saturate(180%)`
- **Input Background**: `#FFF8F0`
- **Pressed Surface**: `#F2F0EB`
- **Overlay Scrim**: `rgba(58,54,48,0.35)`

### Shadows
- **Card Shadow**: `0 8px 24px rgba(126, 215, 194, 0.18)`
- **Card Shadow Pink**: `0 8px 24px rgba(255, 184, 201, 0.18)`
- **Button Shadow**: `0 4px 12px rgba(126, 215, 194, 0.28)`
- **Float Shadow**: `0 12px 32px rgba(58, 54, 48, 0.12)`

## 3. Typography Rules

### Font Family
- **Display / Headings**: `PingFang SC`, `SF Pro Display`, `Helvetica Neue`, sans-serif
- **Body**: `PingFang SC`, `SF Pro Text`, `Helvetica Neue`, sans-serif
- 中文场景优先使用 PingFang SC，保证中文圆角感与可读性

### Hierarchy
| Role | Size | Weight | Line Height | Letter Spacing | Color |
|------|------|--------|-------------|----------------|-------|
| Display Hero | 32px | 700 | 1.2 | 0.5px | Charcoal |
| Section Heading | 22px | 700 | 1.3 | 0.3px | Charcoal |
| Card Title | 18px | 700 | 1.35 | 0.2px | Charcoal |
| Body Emphasis | 16px | 600 | 1.45 | 0 | Charcoal |
| Body | 15px | 400 | 1.55 | 0 | Charcoal |
| Caption | 13px | 400 | 1.45 | 0 | Gray 700 |
| Micro | 11px | 500 | 1.35 | 0.2px | Gray 300 / White |
| Tab Label | 11px | 600 | 1.2 | 0.1px | Gray 300 / Mint |

## 4. Component Stylings

### Buttons
**Primary Mint CTA**
- Background: linear-gradient(135deg, #7ED7C2 0%, #4CB5A0 100%)
- Text: white
- Padding: 14px 24px
- Border radius: 20px
- Font: 16px weight 700
- Shadow: `0 4px 12px rgba(126,215,194,0.28)`
- Pressed: 亮度降低 8%，scale 0.98

**Secondary Pink CTA**
- Background: linear-gradient(135deg, #FFB8C9 0%, #F48FB1 100%)
- Text: white
- Padding: 14px 24px
- Border radius: 20px
- Shadow: `0 4px 12px rgba(255,184,201,0.28)`

**Ghost Button**
- Background: `rgba(126,215,194,0.10)`
- Text: Deep Mint
- Border radius: 16px
- Padding: 10px 16px

**Icon Quick Action Button**
- Size: 64px × 64px
- Background: white
- Border radius: 20px
- Shadow: `0 6px 18px rgba(126,215,194,0.16)`
- Icon color: Mint / Pink / Gray 700

### Cards
- Background: white
- Border radius: 20px
- Padding: 16px
- Shadow: `0 8px 24px rgba(126,215,194,0.18)`
- 无 border
- Hover/Press: 轻微上浮 + 阴影加深

### Input Fields
- Background: `#FFF8F0`
- Border radius: 14px
- Padding: 14px 16px
- Border: 1px solid transparent，focus 时变为 Mint
- Placeholder: Gray 300

### Avatars
- Pet Avatar: 48-64px，圆形，带 2px 白色边框 + 柔和阴影
- User Avatar: 40px，圆形
- Placeholder: 使用 paw print SVG 图标

### Navigation
**Bottom Tab Bar**
- Height: 72px（含安全区）
- Background: Glass White `rgba(255,255,255,0.88)` + blur
- Border radius: 28px 28px 0 0（顶部大圆角）
- 5 个等宽 Tab，图标 24px + 标签 11px
- Active: Mint 图标 + Mint 文字，带小圆点指示器
- Inactive: Gray 300

**Top Header**
- Height: 64px
- Background: transparent 或 Glass White（滚动后）
- Title: Section Heading 22px weight 700
- 左侧宠物切换为胶囊形状按钮

### Badges & Tags
- 提醒 badge: 深肉垫粉背景 + 白色文字，胶囊形状
- 类别 tag: 薄荷绿浅背景 + 深薄荷文字，圆角 12px
- 状态标签：成功绿/警告黄/危险红 浅背景 + 对应深色文字

### Charts
- 折线/柱状图主色：Mint
- 辅助色：Paw Pink
- 网格线：Gray 100
- 数据点：白色描边 + Mint 填充，选中状态放大
- 空状态：展示 paw print 插画 + 粉色提示

## 5. Layout Principles

### Spacing System
- Base: 4px
- Scale: 4, 8, 12, 16, 20, 24, 32, 40, 48, 64

### Container
- 内容区最大宽度：390px（移动端设计稿），居中
- 水平边距：16px
- 卡片间距：12-16px
- Section 间距：24px

### Page Structure
- 页面顶部 16px 安全区 + Header 64px
- 首屏核心内容（Header + 今日卡片 + 快捷操作）控制在 600vp 内
- 底部 Tab Bar 高度 72px，页面内容需预留底部 padding

## 6. Depth & Elevation

| Level | Treatment |
|-------|-----------|
| Level 0 | 页面背景 Cream，无阴影 |
| Level 1 | 卡片白色背景 + 8px/24px Mint 阴影 |
| Level 2 | 按钮/浮动元素 + 4px/12px Mint 阴影 |
| Level 3 | 底部 Tab Bar / 顶部 Header 毛玻璃 |
| Level 4 | 模态/全页覆盖层 + scrim |

## 7. Do's and Don'ts
### Do
- 使用 Mint + Pink 双主色渐变，增加温暖感
- 使用大圆角（14-24px）和圆形头像
- 使用柔和彩色阴影提升层次
- 使用毛玻璃处理顶部/底部导航
- 使用 SVG 图标并注入语义 title
- 保持首屏核心内容在 600vp 内

### Don't
- 不要使用 emoji 或 Unicode 图标
- 不要使用直角/小圆角（<12px 的卡片按钮）
- 不要让 TabBar 出现在侧边
- 不要使用厚重边框分割内容
- 不要让内容全宽铺满桌面浏览器

## 8. Responsive Behavior
- 设计稿宽度 390px，在更大屏幕上居中，最大宽度 420px
- 底部 TabBar 宽度与内容区一致，固定在底部
- 文本与图标保持固定大小，不随宽度缩放
- 图表区域宽度自适应容器，高度固定 220px

## 9. Semantic UI Binding
This section maps semantic IDs from `ui-tree.json` to visual controls.

### Surfaces / Routes
| Surface ID | Page ID | Tab ID | Visual Role |
|------------|---------|--------|-------------|
| home | home-page | tab-home | 首页主视图 |
| records | records-page | tab-records | 记录列表 |
| trends | trends-page | tab-trends | 趋势图表 |
| health | health-page | tab-health | 健康中心 |
| profile | profile-page | tab-profile | 我的/设置 |
| pet-editor | pet-editor-page | — | 宠物编辑全页 |
| record-editor | record-editor-page | — | 记录编辑全页 |
| vaccine-editor | vaccine-editor-page | — | 疫苗/驱虫编辑全页 |
| medical-record-editor | medical-record-editor-page | — | 病历编辑全页 |
| medical-record-detail | medical-record-detail-page | — | 病历详情全页 |
| member-invite | member-invite-page | — | 家庭成员邀请全页 |
| reminder-list | reminder-list-page | — | 全部提醒列表全页 |

### Important Semantic Targets
| Semantic ID | Visual Control |
|-------------|----------------|
| home-pet-switcher | 顶部宠物切换胶囊按钮 |
| home-current-pet-name | Header 宠物昵称文本 |
| home-current-pet-avatar | Header 宠物圆形头像 |
| home-add-reminder-banner | 提醒横幅卡片，点击跳转提醒列表 |
| home-reminder-count | 提醒横幅上的 badge 数字 |
| home-quick-food / toilet / weight / medicine | 四个圆形/圆角快捷记录按钮 |
| home-recent-records-list | 最近记录卡片列表 |
| home-today-summary | 今日概览统计卡片 |
| records-filter-pet / category | 顶部筛选下拉/胶囊 |
| records-add-button | 右下角 FAB 或顶部添加按钮 |
| records-list | 记录时间线列表 |
| trends-pet-switcher | 趋势页宠物选择器 |
| trends-metric-selector | 指标切换胶囊 |
| trends-time-range | 时间范围切换 |
| trends-chart | 图表区域 |
| health-pet-switcher | 健康页宠物选择器 |
| health-add-vaccine / deworm | 疫苗/驱虫添加按钮 |
| health-vaccine-history / deworm-history | 历史记录列表 |
| health-medical-records | 就医病历卡片列表 |
| health-add-medical | 添加病历按钮 |
| profile-pet-list | 宠物档案行列表 |
| profile-add-pet | 添加宠物入口 |
| profile-family-members | 家庭成员列表 |
| profile-invite-member | 邀请成员按钮 |

### Events to Preserve
所有 `ui-tree.json` 中定义的事件名称必须在对应视觉控件上触发，不可重命名。

### ID Gaps / Change Requests
- 无变更请求。所有语义 ID 已映射到视觉控件。
