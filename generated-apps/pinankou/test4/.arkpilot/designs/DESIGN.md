# 平安扣 Pinankou 视觉设计规范

## 1. 设计语言与氛围

「平安扣」整体视觉以「安全感」与「清晰可控」为核心。采用蓝绿色（Teal/Cyan）作为品牌主色，象征安全、信任、洁净与生命力；搭配深海蓝与薄荷绿形成渐变韵律，传递「隐患被及时发现、风险被稳妥化解」的心理暗示。界面追求信息层级清晰、操作路径简短，通过大圆角卡片、柔和阴影、玻璃拟态（frosted glass）与细微渐变营造现代、温润、不冰冷的工具感。

整体视觉避免廉价的高饱和度纯色块，强调：
- 同色系深浅分层，避免多色杂糅；
- 关键数据使用渐变背景卡片突出；
- 列表项使用 subtle 阴影与悬停/按压状态；
- 空状态使用插画感 SVG，避免空白页焦虑。

## 2. 色彩系统

### 2.1 品牌色

| Token | 色值 | 用途 |
|-------|------|------|
| `--brand-primary` | `#0D9488` | 主按钮、重要强调、选中 Tab、进度完成色 |
| `--brand-light` | `#5EEAD4` | 高亮、图标、次要按钮、渐变高光 |
| `--brand-dark` | `#0F766E` | 按钮按下、链接按下、深色强调 |
| `--brand-bg` | `#F0FDFA` | 页面背景、卡片浅色背景、空状态背景 |

### 2.2 功能色

| Token | 色值 | 用途 |
|-------|------|------|
| `--safe` | `#10B981` | 低风险、已完成、正常状态 |
| `--warning` | `#F59E0B` | 中风险、处理中、待验收 |
| `--danger` | `#EF4444` | 高风险、重大、逾期、异常 |
| `--info` | `#3B82F6` | 信息提示、链接、图表辅助色 |
| `--neutral` | `#64748B` | 次要文本、禁用、占位符 |

### 2.3 风险等级色

| 等级 | 色值 | 背景 |
|------|------|------|
| 低 | `#10B981` | `#D1FAE5` |
| 中 | `#F59E0B` | `#FEF3C7` |
| 高 | `#EF4444` | `#FEE2E2` |
| 重大 | `#7F1D1D` | `#FECACA` |

### 2.4 中性色

| Token | 色值 | 用途 |
|-------|------|------|
| `--text-primary` | `#0F172A` | 主标题、正文 |
| `--text-secondary` | `#475569` | 副标题、描述 |
| `--text-tertiary` | `#94A3B8` | 占位符、时间戳、弱化信息 |
| `--surface-primary` | `#FFFFFF` | 卡片、浮层、输入框背景 |
| `--surface-secondary` | `#F1F5F9` | 列表悬停、次级卡片 |
| `--surface-tertiary` | `#E2E8F0` | 分割线、边框 |
| `--page-bg` | `#F0FDFA` | 页面底色 |
| `--glass-bg` | `rgba(255,255,255,0.82)` | 玻璃导航、毛玻璃 Header |

### 2.5 阴影与光晕

| Token | 值 | 用途 |
|-------|------|------|
| `--shadow-sm` | `0 1px 2px 0 rgba(15,23,42,0.06)` | 小标签、徽章 |
| `--shadow-md` | `0 4px 12px -2px rgba(13,148,136,0.12)` | 卡片、按钮 |
| `--shadow-lg` | `0 12px 24px -6px rgba(13,148,136,0.18)` | 浮层、底部导航、模态 |
| `--glow-brand` | `0 0 16px rgba(94,234,212,0.45)` | 选中 Tab、完成态光晕 |

## 3. 字体系统

使用 HarmonyOS Sans 与系统字体回退，中文显示优先：

```css
font-family: 'HarmonyOS Sans SC', 'PingFang SC', 'Microsoft YaHei', sans-serif;
```

### 字号层级

| 层级 | 字号 | 字重 | 行高 | 字间距 | 用途 |
|------|------|------|------|--------|------|
| H1 | 24px / 1.5rem | 700 | 1.25 | -0.3px | 页面大标题 |
| H2 | 20px / 1.25rem | 600 | 1.3 | -0.2px | 区块标题 |
| H3 | 17px / 1.0625rem | 600 | 1.35 | -0.1px | 卡片标题、列表主文本 |
| Body | 15px / 0.9375rem | 400 | 1.5 | 0 | 正文、描述 |
| Caption | 13px / 0.8125rem | 400 | 1.4 | 0 | 辅助说明、时间 |
| Micro | 11px / 0.6875rem | 500 | 1.3 | 0.2px | 标签、徽章 |

## 4. 间距系统

基础单位为 4px，常用倍率：

| Token | 值 |
|-------|------|
| `--space-1` | 4px |
| `--space-2` | 8px |
| `--space-3` | 12px |
| `--space-4` | 16px |
| `--space-5` | 20px |
| `--space-6` | 24px |
| `--space-8` | 32px |
| `--space-10` | 40px |

页面水平内边距统一 16px；卡片内边距 16px；列表项间距 12px；底部 Tab 导航高度 64px（含安全区）。

## 5. 圆角系统

| Token | 值 | 用途 |
|-------|------|------|
| `--radius-sm` | 8px | 小按钮、输入框、徽章 |
| `--radius-md` | 12px | 卡片、图片、列表项 |
| `--radius-lg` | 16px | 大卡片、底部弹窗 |
| `--radius-xl` | 24px | 首页 KPI 卡片、统计图卡片 |
| `--radius-full` | 9999px | Pill 按钮、Tab 图标背景 |

## 6. 组件规范

### 6.1 按钮

**主按钮（Primary）**
- 背景：线性渐变 `linear-gradient(135deg, #0D9488, #14B8A6)`
- 文字：白色，15px，weight 600
- 圆角：9999px（Pill）
- 阴影：`--shadow-md`
- 高度：48px，水平内边距 24px
- 按下：亮度降低 8%，缩放 0.98

**次按钮（Secondary）**
- 背景：`rgba(13,148,136,0.08)`
- 文字：`--brand-primary`，15px，weight 600
- 圆角：9999px
- 高度：40px

**幽灵按钮（Ghost）**
- 背景：透明
- 文字：`--text-secondary`
- 用于文字链接、图标按钮

### 6.2 卡片

- 背景：`--surface-primary`
- 圆角：`--radius-md`（12px）或 `--radius-lg`（16px）
- 阴影：`--shadow-md`
- 内边距：16px
- 边框：无，必要时使用 1px `--surface-tertiary` 分隔

**KPI 卡片（首页/统计）**
- 圆角：`--radius-xl`（24px）
- 背景：品牌渐变或白色
- 内边距：20px
- 标题 Caption 13px，数值 H1 24px weight 700

### 6.3 列表项

- 背景：白色
- 圆角：12px
- 左侧彩色状态条（4px 宽）表示风险等级或状态
- 内边距：16px
- 间距：12px
- 按下背景变浅灰 `--surface-secondary`

### 6.4 输入框

- 背景：`--surface-secondary`（#F1F5F9）
- 圆角：10px
- 高度：48px
- 内边距：12px 16px
- 占位符：`--text-tertiary`
- 聚焦：1px solid `--brand-primary`，内发光

### 6.5 Tab 导航

- 位置：底部固定
- 背景：`--glass-bg` + `backdrop-filter: blur(20px) saturate(180%)`
- 高度：64px
- 阴影：`--shadow-lg`
- 选中图标：圆形品牌渐变背景 + 白色图标
- 未选中图标：`--text-tertiary`
- 标签字号：11px

### 6.6 徽章

- 圆角：9999px
- 内边距：4px 10px
- 字号：11px，weight 600
- 风险等级使用对应功能色背景与深色文字

### 6.7 空状态

- 居中插画 SVG（带 contextual title）
- 标题：H3，颜色 `--text-primary`
- 描述：Body，颜色 `--text-secondary`
- 操作按钮：Secondary 按钮

## 7. 页面特定视觉

### 7.1 首页（Home）

- 顶部毛玻璃 Header，包含应用名称与通知图标。
- 首屏顶部 600vp 内展示：
  - 欢迎语与今日日期；
  - 一排 3 个 KPI 小卡片（巡检进度、待处理隐患、本周已整改）；
  - 快捷操作区（上报隐患、开始巡检、应急联系）三个 Pill 按钮。
- 下方「最近动态」列表，每项展示隐患标题、状态徽章、时间。

### 7.2 巡检页（Patrol）

- 顶部展示今日日期、巡检路线名称、环形进度图。
- 点位列表按顺序排列，已完成项左侧显示品牌色对勾；未打卡项显示灰色序号。
- 每个点位卡片包含：名称、区域、状态、打卡按钮、上报入口。
- 打卡按钮为渐变主按钮。

### 7.3 隐患页（Issues）

- 顶部搜索框 + 筛选器（状态、风险等级）。
- 右上角悬浮「+」主按钮。
- 列表项左侧 4px 色条表示风险等级；右侧状态徽章。
- 点击整行进入详情。

### 7.4 隐患详情（IssueDetail）

- 顶部标题与状态/风险徽章。
- 信息区：位置、负责人、截止日期、描述、照片网格。
- 进度时间线：垂直排列，节点为品牌色圆环。
- 底部操作栏：更新进度 / 编辑 / 关闭。

### 7.5 联系人页（Contacts）

- 搜索框 + 分组标签横向滚动。
- 联系人卡片：头像圆形、姓名、角色、电话、呼叫按钮。
- 一键拨号按钮为品牌渐变圆形。

### 7.6 统计页（Stats）

- 顶部周期选择器（本周/本月/本季度）。
- 4 个 KPI 卡片网格（2×2）。
- 趋势图与风险分布图，使用品牌渐变填充。
- 导出报告按钮位于底部。

## 8. 响应式约束

- 内容区最大宽度 420vp，居中。
- 所有固定定位元素（Tab 栏、底部按钮）宽度限制为与内容区一致，使用 `left:0; right:0; margin:0 auto; max-width:420px`。
- 触控目标最小 44×44vp。
- 长列表可滚动，页面底部预留 Tab 导航安全区 80vp。

## 9. Semantic UI Binding

### 9.1 Surfaces / Routes / Tabs

| Surface ID | Page ID | Route | Tab ID |
|------------|---------|-------|--------|
| home-page | home | pages/Home | tab-home |
| patrol-page | patrol | pages/Patrol | tab-patrol |
| issues-page | issues | pages/Issues | tab-issues |
| issue-form-page | issue-form | pages/IssueForm | — |
| issue-detail-page | issue-detail | pages/IssueDetail | — |
| contacts-page | contacts | pages/Contacts | tab-contacts |
| contact-form-page | contact-form | pages/ContactForm | — |
| stats-page | stats | pages/Stats | tab-stats |

### 9.2 Important Action / Input / Assertion IDs

- `home-notification-button`, `home-quick-report-button`, `home-quick-patrol-button`, `home-quick-contact-button`, `home-view-all-issues-link`, `home-recent-issues-list`
- `patrol-point-list`, `patrol-point-{id}-checkin-button`, `patrol-point-{id}-report-issue-link`, `patrol-checkin-submit-button`, `patrol-checkin-cancel-button`
- `issues-search-input`, `issues-filter-status`, `issues-filter-risk`, `issues-add-button`, `issues-list`
- `issue-form-title-input`, `issue-form-type-picker`, `issue-form-risk-picker`, `issue-form-location-input`, `issue-form-assignee-input`, `issue-form-due-date-picker`, `issue-form-description-input`, `issue-form-photo-grid`, `issue-form-add-photo-button`, `issue-form-submit-button`, `issue-form-cancel-button`
- `issue-detail-status-badge`, `issue-detail-risk-badge`, `issue-detail-timeline-list`, `issue-detail-progress-action-button`, `issue-detail-edit-button`, `issue-detail-close-button`
- `contacts-search-input`, `contacts-add-button`, `contacts-list`, `contacts-item-{id}-call-button`, `contacts-item-{id}-edit-button`
- `contact-form-name-input`, `contact-form-role-input`, `contact-form-group-picker`, `contact-form-phone-input`, `contact-form-priority-toggle`, `contact-form-save-button`, `contact-form-cancel-button`
- `stats-period-picker`, `stats-kpi-issues`, `stats-kpi-resolved`, `stats-kpi-completion`, `stats-kpi-patrol`, `stats-trend-chart`, `stats-risk-chart`, `stats-export-button`

### 9.3 Event Names

`open-notifications`, `navigate-issue-form`, `navigate-patrol`, `navigate-contacts`, `navigate-issues`, `open-checkin`, `navigate-issue-form-with-point`, `take-photo`, `submit-checkin`, `cancel-checkin`, `open-issue-detail`, `submit-issue`, `cancel-issue-form`, `update-progress`, `edit-issue`, `close-issue`, `call-contact`, `edit-contact`, `navigate-contact-form`, `save-contact`, `cancel-contact-form`, `export-report`。

### 9.4 Change Requests

- 无。视觉设计保留全部语义 ID 与事件名。

## 10. 图标策略

所有图标使用内联 SVG，禁止 emoji。每个 SVG 第一个子元素必须是 `<title>`，内容反映当前业务语义，例如：

- 首页通知铃铛 → `<title>查看通知消息</title>`
- 巡检打卡对勾 → `<title>确认巡检打卡</title>`
- 隐患上报相机 → `<title>拍摄隐患现场照片</title>`
- 联系人电话 → `<title>拨打联系人电话</title>`
- 统计导出 → `<title>导出统计报告</title>`

## 11. 动效与交互

- 页面切换：共享元素淡出淡入，时长 220ms，ease-out。
- 列表项按压：背景色过渡 120ms。
- 按钮按下：scale(0.98)，时长 100ms。
- Tab 切换：图标背景圆形缩放 + 颜色渐变过渡。
- 模态/底部弹窗：从底部滑入，背景遮罩渐变出现。
