# PawLog 宠迹 — Design Alignment Plan

## 1. Visual Inputs
- **Semantic UI Protocol**: `.arkpilot/designs/ui-tree.json`
- **Final Design Artifact**: `.arkpilot/designs/DESIGN2.md`
- **HTML Artifacts**:
  - `.arkpilot/designs/page-home-page.html`
  - `.arkpilot/designs/page-records-page.html`
  - `.arkpilot/designs/page-trends-page.html`
  - `.arkpilot/designs/page-health-page.html`
  - `.arkpilot/designs/page-profile-page.html`
  - `.arkpilot/designs/page-pet-editor-page.html`
  - `.arkpilot/designs/page-record-editor-page.html`
  - `.arkpilot/designs/page-vaccine-editor-page.html`
  - `.arkpilot/designs/page-medical-record-editor-page.html`
  - `.arkpilot/designs/page-medical-record-detail-page.html`
  - `.arkpilot/designs/page-member-invite-page.html`
  - `.arkpilot/designs/page-reminder-list-page.html`
- **Route-worthy Pages**: 5 Tab pages + 7 overlay pages = 12 HTML artifacts

## 2. Semantic UI Binding

### Surfaces / Routes / Tabs
| Surface ID | Page ID | Route | Tab ID | HTML Artifact |
|------------|---------|-------|--------|---------------|
| home | home-page | pages/HomePage | tab-home | page-home-page.html |
| records | records-page | pages/RecordsPage | tab-records | page-records-page.html |
| trends | trends-page | pages/TrendsPage | tab-trends | page-trends-page.html |
| health | health-page | pages/HealthPage | tab-health | page-health-page.html |
| profile | profile-page | pages/ProfilePage | tab-profile | page-profile-page.html |
| pet-editor | pet-editor-page | — | — | page-pet-editor-page.html |
| record-editor | record-editor-page | — | — | page-record-editor-page.html |
| vaccine-editor | vaccine-editor-page | — | — | page-vaccine-editor-page.html |
| medical-record-editor | medical-record-editor-page | — | — | page-medical-record-editor-page.html |
| medical-record-detail | medical-record-detail-page | — | — | page-medical-record-detail-page.html |
| member-invite | member-invite-page | — | — | page-member-invite-page.html |
| reminder-list | reminder-list-page | — | — | page-reminder-list-page.html |

### Action / Input / Assertion IDs to Preserve
| Semantic ID | Visual Element | Implementation Binding |
|-------------|----------------|------------------------|
| home-pet-switcher | 顶部宠物切换胶囊 | `.onClick(() => openPetSwitcher())`, `.id('home-pet-switcher')` |
| home-current-pet-name | Header 宠物名 | Text binding `/currentPet/name`, `.id('home-current-pet-name')` |
| home-current-pet-avatar | Header 宠物头像 | Image/placeholder binding, `.id('home-current-pet-avatar')` |
| home-add-reminder-banner | 提醒横幅 | `.onClick(() => openReminderList())` |
| home-reminder-count | 提醒 badge | Text binding `/reminders/pendingCount` |
| home-quick-food | 饮食快捷按钮 | `.onClick(() => openRecordEditor('food'))` |
| home-quick-toilet | 排泄快捷按钮 | `.onClick(() => openRecordEditor('toilet'))` |
| home-quick-weight | 体重快捷按钮 | `.onClick(() => openRecordEditor('weight'))` |
| home-quick-medicine | 用药快捷按钮 | `.onClick(() => openRecordEditor('medicine'))` |
| home-recent-records-list | 最近记录列表 | ForEach records, item IDs `home-recent-record-{id}` |
| home-today-summary | 今日概览卡片 | binding `/summary/today` |
| home-go-health / home-go-trends | 链接跳转 | `goToTab('tab-health')` / `goToTab('tab-trends')` |
| records-filter-pet / records-filter-category | 筛选胶囊 | bind state, emit `change-filter-pet/category` |
| records-add-button | 添加按钮 / FAB | `.onClick(() => openRecordEditor())` |
| records-list | 记录时间线 | ForEach, `records-item-{id}`, emptyStateId `records-empty` |
| records-item-menu | 记录项菜单按钮 | emit `open-record-menu` |
| trends-pet-switcher | 趋势页宠物选择器 | emit `change-trends-pet` |
| trends-metric-selector | 指标切换 | emit `change-trends-metric` |
| trends-time-range | 时间范围 | emit `change-trends-time-range` |
| trends-chart | 图表区 | binding `/trends/chartData` |
| trends-chart-empty | 图表空状态 | binding `/trends/hasData` |
| trends-stat-cards | 统计卡片 | binding `/trends/stats` |
| health-pet-switcher | 健康页宠物选择器 | emit `change-health-pet` |
| health-reminder-list | 待办提醒列表 | ForEach, `health-reminder-{id}` |
| health-add-vaccine / health-add-deworm | 疫苗/驱虫添加 | `openVaccineEditor('vaccine'/'deworm')` |
| health-vaccine-history / health-deworm-history | 历史列表 | ForEach, `health-vaccine-{id}` / `health-deworm-{id}` |
| health-medical-records | 病历列表 | ForEach, `health-medical-{id}` |
| health-add-medical | 添加病历 | `openMedicalEditor()` |
| profile-user-avatar / profile-user-name | 用户头像/昵称 | binding `/family/self` |
| profile-pet-list | 宠物档案列表 | ForEach, `profile-pet-{id}` |
| profile-add-pet | 添加宠物 | `openPetEditor()` |
| profile-family-members | 家庭成员列表 | ForEach, `profile-member-{id}` |
| profile-invite-member | 邀请成员 | `openMemberInvite()` |
| profile-settings-unit | 体重单位切换 | emit `change-weight-unit` |
| profile-settings-about | 关于入口 | `openAbout()` |
| pet-editor-* | 宠物表单字段 | 对应 input binding |
| record-editor-* | 记录表单字段 | 按 category 动态显示 |
| vaccine-editor-* | 疫苗/驱虫字段 | type radio |
| medical-editor-* / medical-detail-* | 病历字段/详情 | 编辑与详情页一致映射 |
| member-invite-* | 邀请字段 | name, role, code actions |
| reminder-list / reminder-mark-done | 提醒列表与完成 | list + action |

### Events to Preserve
所有事件名称必须原样触发：
- `open-pet-switcher`, `open-reminder-list`, `open-record-editor`
- `open-pet-editor`, `open-vaccine-editor`, `open-medical-editor`
- `open-medical-detail`, `open-member-invite`, `go-to-health`, `go-to-trends`
- `change-filter-pet`, `change-filter-category`, `change-trends-pet`
- `change-trends-metric`, `change-trends-time-range`, `change-health-pet`
- `change-weight-unit`, `save-pet`, `delete-pet`, `save-record`, `delete-record`
- `save-vaccine`, `delete-vaccine`, `save-medical`, `delete-medical`
- `save-member`, `generate-invite-code`, `copy-invite-code`
- `mark-reminder-done`, `navigate-back`, `open-record-menu`
- `pick-avatar`, `pick-attachments`, `open-about`

## 3. Visual Requirements

### Color Tokens
- 主色：Mint `#7ED7C2`，深薄荷 `#4CB5A0`
- 辅色：Paw Pink `#FFB8C9`，深粉 `#F48FB1`
- 背景：Cream `#FFFBF6`，卡片白 `#FFFFFF`，暖白 `#FFF8F0`
- 文字：Charcoal `#3A3630`，次要 `#5C5750`，占位 `#C4BEB4`
- 语义：Success `#8FD9A8`，Warning `#F5D485`，Danger `#E88C8C`，Info `#8AC4E6`

### Typography
- 标题 22px weight 700，正文 15px weight 400，标签 13px weight 600
- Tab 标签 11px weight 600

### Spacing / Radius
- 页面边距 16px，卡片内边距 18px
- 卡片圆角 24px，按钮圆角 22px，输入框圆角 16px
- TabBar 高度 76px，顶部圆角 28px

### Elevation
- 卡片阴影：`0 10px 28px rgba(126,215,194,0.20)` / pink variant
- 按钮阴影：`0 6px 16px rgba(76,181,160,0.28)` / pink variant
- TabBar：毛玻璃 `rgba(255,255,255,0.82) backdrop-filter blur(24px)`

### Icons
- 全部使用 SVG，每个 inline `<svg>` 第一个子元素必须是 `<title>`，内容反映业务语义
- 不使用 emoji / Unicode 图标

### Per-Page Polish Notes
- **home**: 顶部渐变背景，宠物切换胶囊，提醒横幅左粉边，四个 72px 快捷按钮，今日概览 2×2 网格，最近记录卡片
- **records**: 筛选胶囊横向滚动，时间线按日期分组，记录卡片带类别 tag 与菜单按钮，右下角 FAB
- **trends**: 指标胶囊、时间范围切换、顶部渐变条图表卡片、区域填充折线图、2×2 统计卡
- **health**: 宠物选择器、待办提醒卡片、疫苗/驱虫/病历三个模块卡片，每个模块有添加按钮
- **profile**: 用户信息头、宠物档案列表、家庭成员列表、设置项（单位切换 + 关于）
- **editors**: 顶部保存/编辑按钮、圆角输入框、胶囊单选、删除按钮粉色底
- **reminder-list**: 提醒卡片按紧急程度分色边框，右侧完成按钮

### Responsive Constraints
- 内容区最大宽度 390px（最大 420px），居中
- TabBar 与内容区等宽，固定在底部，禁止侧边
- 首屏关键内容（Header + 提醒横幅 + 快捷操作）在 600vp 内可见

### HTML-to-ArkUI Mapping
- `.phone-frame` → 外层 Stack/Column，maxWidth 390vp，居中
- `.header` → Row，sticky top，毛玻璃背景
- `.card` → Column + borderRadius + shadow
- `.tabbar` → BottomTabBar component（见已有 `BottomTabBar.ets` 模板）
- 快捷按钮网格 → Grid/Row
- 图表 → 可用 ArkUI 自定义折线图或占位 Shape
- 表单输入 → TextInput / Select / DatePicker / Toggle

## 4. Non-Negotiable Constraints
- **不得更改语义 ID、page ID、route、tab ID、事件名称**。
- HTML 产物是最终视觉参考；ArkTS 实现应忠实还原其布局、配色、圆角、阴影、图标、空状态。
- `ui-tree.json` 是语义绑定协议，不是最终布局树；实现时可自由组织容器，但语义目标必须绑定到正确交互元素。
- Tab 导航必须在底部，不得出现在侧边。
- 不使用 emoji 或 Unicode 作为图标。
- 所有 inline SVG 必须包含上下文 `<title>`。
- 不实现真实后端/云同步/推送通知；家庭成员共享以本地模型实现。
- 不实现相机/文件选择器，附件仅作占位。
- 首次启动为空状态，不内置种子数据。

## 5. Semantic Change Requests
- 无变更请求。所有语义 ID 已在视觉设计阶段完成映射。
