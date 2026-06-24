# 平安扣 Pinankou 视觉设计系统

## 1. Visual Theme & Atmosphere

平安扣（Pinankou）传递“被守护的安全感”。视觉上以蓝绿色系为主调，象征清澈、可靠与生命力；辅以柔和的浅灰蓝背景与白色卡片，营造干净、专业、不压迫的界面氛围。界面采用移动应用常见的卡片式信息层级，首屏聚焦今日任务与关键数据，底部 Tab 保持稳定导航，适合一线人员高频、快速地完成记录、上报与查看。

整体风格介于企业工具与消费级效率 App 之间：信息密度适中、圆角亲和、按钮明确、状态颜色语义清晰。通过微妙的渐变背景、柔和的阴影和玻璃质感 Tab 栏，让界面既有安全感又不失现代感，避免传统安全类应用过于严肃或单调的“AI 模板”感。

**Key Characteristics:**
- 主色为蓝绿色安全感配色（Teal / Cyan / Deep Blue），传递信任与冷静
- 背景使用浅灰蓝（#F0F4F8）与白色卡片形成自然层级
- 卡片使用大圆角（16-20px）、柔和阴影、微妙的顶部浅色渐变
- 底部 Tab 栏采用毛玻璃效果（backdrop-filter blur），图标线性 + 填充双态
- 状态颜色语义化：成功青绿、警告琥珀、危险玫瑰红、信息蓝
- 信息层级通过字号、字重、颜色饱和度区分，首屏核心卡片控制在 600vp 内
- 使用 SVG 线性图标，配合语义化 `<title>`，不使用 emoji 或 Unicode 图标

## 2. Color Palette & Roles

### Primary
- **主品牌青** `#0D9488`：主按钮、选中态、关键强调、品牌图标（Teal 600）
- **品牌深蓝** `#0F172A`：标题文字、深色卡片、底部 Tab 激活图标（Slate 900）
- **品牌浅青** `#CCFBF1`：标签背景、选中态背景、成功浅底色（Teal 100）
- **品牌淡青渐变** `linear-gradient(135deg, #F0FDFA 0%, #E0F2FE 100%)`：页面背景、顶部氛围渐变

### Secondary
- **辅助蓝** `#0EA5E9`：信息提示、次要按钮、图表辅助色（Sky 500）
- **辅助靛蓝** `#6366F1`：图表第三色、高亮标签（Indigo 500）
- **辅助薄荷** `#2DD4BF`：成功状态、完成图标（Teal 400）

### Functional / Status
- **成功绿** `#10B981`：已整改、已完成、通过状态
- **警告琥珀** `#F59E0B`：待整改、中等风险、提醒
- **危险玫瑰** `#F43F5E`：高风险、逾期、紧急呼叫
- **信息蓝** `#3B82F6`：通知、提示、进行中
- **中性灰** `#94A3B8`：未开始、已取消、禁用

### Surfaces
- **页面背景** `#F0F4F8`（浅灰蓝）
- **卡片背景** `#FFFFFF`（纯白，带 1px #E2E8F0 边框或无边框）
- **次级卡片** `#F8FAFC`（Slate 50）
- **深色卡片** `#0F172A`（用于统计看板重点指标、首页顶部横幅）
- **玻璃面板** `rgba(255, 255, 255, 0.85)` + `backdrop-filter: blur(20px) saturate(180%)`

### Text
- **主标题** `#0F172A`（Slate 900）
- **正文** `#334155`（Slate 700）
- **次要文字** `#64748B`（Slate 500）
- **禁用/占位** `#94A3B8`（Slate 400）
- **浅色背景上的反白文字** `#FFFFFF`
- **深色卡片上的次要文字** `rgba(255, 255, 255, 0.72)`

### Buttons
- **主按钮背景** `#0D9488`，文字 `#FFFFFF`，hover `#0F766E`，active `#115E59`
- **次要按钮背景** `#FFFFFF`，文字 `#0D9488`，边框 `1px solid #0D9488`
- **危险按钮背景** `#F43F5E`，文字 `#FFFFFF`
- **幽灵按钮背景** `transparent`，文字 `#334155`
- **禁用按钮背景** `#E2E8F0`，文字 `#94A3B8`

### Shadows
- **卡片阴影** `0 4px 16px rgba(15, 23, 42, 0.06)`
- **悬浮阴影** `0 8px 24px rgba(15, 23, 42, 0.10)`
- **按钮阴影** `0 2px 8px rgba(13, 148, 136, 0.24)`
- **顶部渐变氛围** `linear-gradient(180deg, rgba(13, 148, 136, 0.08) 0%, rgba(240, 244, 248, 0) 100%)`

## 3. Typography Rules

### Font Family
- **Display / Headline**: `HarmonyOS Sans SC`, `PingFang SC`, `Microsoft YaHei`, `sans-serif`
- **Body**: `HarmonyOS Sans SC`, `PingFang SC`, `Microsoft YaHei`, `sans-serif`

### Hierarchy

| Role | Size | Weight | Line Height | Letter Spacing | Color |
|------|------|--------|-------------|----------------|-------|
| Page Title | 22px | 700 | 1.3 | -0.2px | #0F172A |
| Section Title | 18px | 700 | 1.35 | -0.1px | #0F172A |
| Card Title | 16px | 600 | 1.4 | 0 | #0F172A |
| Body | 15px | 400 | 1.5 | 0 | #334155 |
| Body Emphasis | 15px | 600 | 1.4 | 0 | #0F172A |
| Caption | 13px | 400 | 1.4 | 0 | #64748B |
| Caption Bold | 13px | 600 | 1.4 | 0 | #334155 |
| Micro | 12px | 500 | 1.3 | 0 | #64748B |
| Stat Number | 32px | 700 | 1.1 | -0.5px | #0F172A |
| Stat Label | 13px | 400 | 1.4 | 0 | #64748B |
| Tab Label | 11px | 500 | 1.2 | 0 | #64748B / #0D9488 active |

### Principles
- 中文标题避免过小，确保在户外/现场环境下可读
- 数字指标使用更紧的字距和更大字重，增强数据感
- 标签、徽章使用 12-13px，保证批量信息扫描效率
- 正文行高 1.5，中文阅读舒适

## 4. Component Stylings

### Buttons

**Primary CTA（主按钮）**
- 背景：`#0D9488`，文字 `#FFFFFF`
- 圆角：12px
- 内边距：12px 20px
- 字号：15px，weight 600
- 阴影：`0 2px 8px rgba(13, 148, 136, 0.24)`
- Active：背景 `#115E59`

**Secondary（次要按钮）**
- 背景：`#FFFFFF`，边框：`1px solid #0D9488`
- 文字：`#0D9488`
- 圆角：12px

**Danger（危险操作）**
- 背景：`#F43F5E`，文字 `#FFFFFF`
- 圆角：12px

**Floating Action Button（FAB）**
- 背景：`#0D9488` 渐变 `linear-gradient(135deg, #14B8A6 0%, #0D9488 100%)`
- 阴影：`0 6px 18px rgba(13, 148, 136, 0.35)`
- 圆形 56px

### Cards
- 背景：`#FFFFFF`
- 圆角：16px
- 内边距：16px
- 阴影：`0 4px 16px rgba(15, 23, 42, 0.06)`
- 可选 1px 边框：`#E2E8F0`
- Hover：轻微上移 -2px + 悬浮阴影

### Badges / Tags
- 成功：`#ECFDF5` 背景，`#10B981` 文字
- 警告：`#FFFBEB` 背景，`#F59E0B` 文字
- 危险：`#FFF1F2` 背景，`#F43F5E` 文字
- 信息：`#EFF6FF` 背景，`#3B82F6` 文字
- 圆角：999px（pill），内边距：4px 10px，字号 12px

### Input Fields
- 背景：`#F8FAFC`
- 边框：`1px solid #E2E8F0`
- 圆角：12px
- 内边距：12px 14px
- Focus：边框 `#0D9488`，阴影 `0 0 0 3px rgba(13, 148, 136, 0.12)`
- Placeholder：`#94A3B8`

### Tab Bar
- 背景：`rgba(255, 255, 255, 0.92)` + `backdrop-filter: blur(20px) saturate(180%)`
- 顶部边框：`0.5px solid rgba(226, 232, 240, 0.8)`
- 高度：约 64px（含安全区）
- 图标 24px，标签 11px
- 未选中：`#64748B`，选中：`#0D9488`

### Navigation Bar
- 背景：`#FFFFFF` 或透明（首页顶部可融入背景渐变）
- 高度：56px
- 标题 18px weight 700
- 返回按钮 24px

### Progress Ring
- 轨道：`#E2E8F0`
- 进度：`#0D9488`（完成率）、`#3B82F6`（巡检率）
- 线宽：8px
- 中心展示百分比数字

## 5. Layout Principles

### Spacing System
- 基础单位：4px
- 常用间距：4, 8, 12, 16, 20, 24, 28, 32, 40px

### Page Container
- 最大宽度：420px，居中
- 水平内边距：16px（手机两侧安全区）
- 顶部避开状态栏/导航栏
- 底部预留 TabBar 高度 + 12px

### Grid
- 移动端单列为主
- 首页快捷入口采用 2×2 或 4 列图标网格
- 统计指标采用 2 列卡片网格

### Whitespace Philosophy
- 卡片之间 12-16px，保持信息分组清晰
- 区块标题与内容之间 12px
- 页面顶部保留 16-20px 呼吸空间
- 长列表底部预留 TabBar 安全区

## 6. Depth & Elevation

| Level | Treatment | Use |
|-------|-----------|-----|
| Level 0 | 无阴影，纯背景 | 页面底层、分隔区块 |
| Level 1 | `0 4px 16px rgba(15,23,42,0.06)` | 普通卡片、列表项 |
| Level 2 | `0 8px 24px rgba(15,23,42,0.10)` | 悬浮卡片、底部 Sheet、Dropdown |
| Level 3 | `0 6px 18px rgba(13,148,136,0.35)` | FAB、主按钮强调 |
| Glass | 毛玻璃 + 半透明背景 | 底部 TabBar、顶部导航（可选） |

## 7. Page-Specific Design Notes

### 工作台（home-page）
- 顶部：品牌色渐变小横幅 + 问候语 + 通知铃铛
- 快捷入口：4 个圆形图标按钮（新建隐患、开始巡检、一键呼救、更多）
- 核心数据：3 个横向数据卡片（待整改、今日巡检、完成率）
- 今日待办：列表展示 3-5 条待处理事项，空状态引导创建

### 隐患管理（hazard-page）
- 顶部搜索栏 + 状态筛选标签（全部/待整改/整改中/已完成）
- 隐患列表卡片：标题、位置、等级徽章、截止时间、状态
- 右下角 FAB 新建隐患

### 隐患详情（hazard-detail-page）
- 顶部大图/照片占位 + 返回/编辑
- 标题 + 状态徽章 + 等级徽章
- 信息网格：位置、上报人、截止时间、责任人
- 整改进度时间线 + 催办/验收按钮

### 隐患编辑（hazard-edit-page）
- 表单垂直排列：标题、位置、风险等级、描述、拍照、责任人、截止时间
- 底部固定保存按钮

### 巡检打卡（patrol-page）
- 路线选择卡片 + 开始巡检按钮
- 巡检点位列表：点位名称、状态、打卡按钮
- 底部完成巡检按钮

### 应急联系人（contacts-page）
- 搜索 + 分组筛选
- 联系人卡片：头像、姓名、角色、电话、一键呼叫按钮

### 统计看板（stats-page）
- 时间筛选（本周/本月/本年）
- 顶部 3 个深色重点指标卡片
- 趋势图（折线/柱状混合）
- 隐患类型/区域排名列表

### 我的（profile-page）
- 顶部用户信息卡片
- 设置、同步数据、关于 入口列表

## 8. Semantic UI Binding

### Surfaces & Routes

| Surface ID | Page ID | Route | Tab ID | Name |
|------------|---------|-------|--------|------|
| home-page | home-page | pages/Home | tab-home | 工作台 |
| hazard-page | hazard-page | pages/Hazard | tab-hazard | 隐患管理 |
| hazard-detail-page | hazard-detail-page | pages/HazardDetail | - | 隐患详情 |
| hazard-edit-page | hazard-edit-page | pages/HazardEdit | - | 隐患编辑 |
| patrol-page | patrol-page | pages/Patrol | tab-patrol | 巡检打卡 |
| contacts-page | contacts-page | pages/Contacts | tab-contacts | 应急联系人 |
| stats-page | stats-page | pages/Stats | tab-stats | 统计看板 |
| profile-page | profile-page | pages/Profile | tab-profile | 我的 |

### Important Action / Input / Assertion IDs

| ID | Role | Event / Binding |
|----|------|-----------------|
| home-add-hazard-button | action | navigate-to-hazard-edit |
| home-start-patrol-button | action | navigate-to-patrol |
| home-emergency-call-button | action | call-primary-emergency-contact |
| home-summary-pending-count | assertion | /summary/pendingHazards |
| home-summary-today-patrol-count | assertion | /summary/todayPatrols |
| home-summary-completion-rate | assertion | /summary/completionRate |
| home-todo-list | list | /todos |
| home-notification-button | action | open-notifications |
| hazard-create-button | action | navigate-to-hazard-edit |
| hazard-search-input | input | /hazards/filter/keyword |
| hazard-status-filter | input | /hazards/filter/status |
| hazard-list | list | /hazards |
| hazard-empty-state | assertion | - |
| hazard-detail-back-button | action | navigate-back |
| hazard-detail-edit-button | action | navigate-to-hazard-edit |
| hazard-detail-title | assertion | /hazard/title |
| hazard-detail-status | assertion | /hazard/status |
| hazard-detail-urge-button | action | urge-rectification |
| hazard-detail-accept-button | action | accept-rectification |
| hazard-detail-progress-list | list | /hazard/progress |
| hazard-edit-back-button | action | navigate-back |
| hazard-edit-title-input | input | /hazardForm/title |
| hazard-edit-location-input | input | /hazardForm/location |
| hazard-edit-level-picker | input | /hazardForm/level |
| hazard-edit-description-input | input | /hazardForm/description |
| hazard-edit-photo-button | action | take-photo |
| hazard-edit-assignee-picker | input | /hazardForm/assignee |
| hazard-edit-deadline-picker | input | /hazardForm/deadline |
| hazard-edit-save-button | action | save-hazard |
| patrol-route-list | list | /patrol/routes |
| patrol-start-button | action | start-patrol |
| patrol-checkpoint-list | list | /patrol/checkpoints |
| patrol-checkin-button | action | checkin-patrol-point |
| patrol-report-abnormal-button | action | report-abnormal-at-checkpoint |
| patrol-complete-button | action | complete-patrol |
| contacts-search-input | input | /contacts/filter/keyword |
| contacts-group-filter | input | /contacts/filter/group |
| contacts-list | list | /contacts |
| contacts-call-button | action | call-contact |
| contacts-add-button | action | add-contact |
| stats-time-filter | input | /stats/filter/timeRange |
| stats-hazard-total | assertion | /stats/hazardTotal |
| stats-completion-rate | assertion | /stats/completionRate |
| stats-patrol-coverage | assertion | /stats/patrolCoverage |
| stats-trend-chart | assertion | /stats/trend |
| stats-rank-list | list | /stats/rank |
| profile-avatar | assertion | /profile/avatar |
| profile-name | assertion | /profile/name |
| profile-settings-button | action | open-settings |
| profile-sync-button | action | sync-data |
| profile-about-button | action | open-about |

### Event Names Preserved

- navigate-to-hazard-edit
- navigate-to-patrol
- call-primary-emergency-contact
- open-notifications
- navigate-back
- save-hazard
- take-photo
- urge-rectification
- accept-rectification
- start-patrol
- checkin-patrol-point
- report-abnormal-at-checkpoint
- complete-patrol
- call-contact
- add-contact
- open-settings
- sync-data
- open-about

### Change Requests / Gaps

- 无。ui-tree.json 已覆盖全部页面与核心交互语义目标。

## 9. Do's and Don'ts

### Do
- 使用蓝绿色主色 `#0D9488` 作为品牌主调
- 在卡片、按钮、Tab 选中态中保持一致的品牌色运用
- 使用状态色徽章清晰表达隐患/巡检状态
- 使用 16px+ 大圆角卡片，营造亲和的安全感
- 为所有 SVG 图标注入语义化 `<title>`
- 保持底部 Tab 导航固定，宽度与 body 一致
- 使用毛玻璃效果提升顶部/底部栏质感

### Don't
- 不要使用 emoji 或 Unicode 图标替代 SVG
- 不要让 Tab 导航在 PC 浏览器上全宽拉伸
- 不要使用超过 3 种主色，避免花哨
- 不要让首屏核心内容超出 600vp
- 不要在空状态仅显示“暂无数据”，必须提供主操作引导
- 不要为生硬模板感使用过度复杂的渐变背景

## 10. Responsive Behavior

- 设计稿基准宽度：390px
- 内容最大宽度：420px，居中
- 在更大屏幕上保持居中卡片式布局，不左右铺满
- 底部 Tab 栏最大宽度与内容区一致，居中固定
- 字号不随宽度放大，保持移动阅读体验

## 11. Iconography

- 使用本地 Lucide SVG 线性图标
- 每个 inline SVG 必须有语义化 `<title>` 作为首个子元素
- 常用图标映射：
  - 工作台：home.svg
  - 隐患：shield-alert.svg
  - 巡检：route.svg / map-pin.svg
  - 联系人：phone-call.svg
  - 统计：bar-chart.svg
  - 我的：user.svg
  - 新建：plus.svg
  - 搜索：search.svg
  - 返回：chevron-left.svg
  - 通知：bell.svg
  - 拍照：camera.svg
  - 完成：check-circle.svg
  - 高风险：alert-circle.svg
  - 一键呼救：siren.svg
  - 设置：settings.svg
  - 同步：refresh.svg
  - 删除：trash.svg
  - 编辑：edit.svg

