# PawLog 宠迹 · 设计对齐计划

## 1. 视觉输入

- **语义 UI 协议**：`.arkpilot/designs/ui-tree.json`
- **最终视觉设计文档**：`.arkpilot/designs/DESIGN2.md`
- **HTML 设计稿**：
  - `.arkpilot/designs/page-home-page.html`
  - `.arkpilot/designs/page-records-page.html`
  - `.arkpilot/designs/page-health-page.html`
  - `.arkpilot/designs/page-family-page.html`
  - `.arkpilot/designs/page-profile-page.html`
  - `.arkpilot/designs/page-pet-editor-page.html`
  - `.arkpilot/designs/page-record-editor-page.html`
  - `.arkpilot/designs/page-medical-record-editor-page.html`
  - `.arkpilot/designs/page-member-invite-page.html`
- **Route-worthy 页面清单**：
  | Page ID | HTML 文件 | Route | Tab ID |
  |---------|-----------|-------|--------|
  | home-page | page-home-page.html | pages/HomePage | tab-home |
  | records-page | page-records-page.html | pages/RecordsPage | tab-records |
  | health-page | page-health-page.html | pages/HealthPage | tab-health |
  | family-page | page-family-page.html | pages/FamilyPage | tab-family |
  | profile-page | page-profile-page.html | pages/ProfilePage | tab-profile |
  | pet-editor-page | page-pet-editor-page.html | pages/PetEditorPage | — |
  | record-editor-page | page-record-editor-page.html | pages/RecordEditorPage | — |
  | medical-record-editor-page | page-medical-record-editor-page.html | pages/MedicalRecordEditorPage | — |
  | member-invite-page | page-member-invite-page.html | pages/MemberInvitePage | — |
- **补充浮层语义目标**：pet-picker-sheet、record-type-sheet、confirm-delete-dialog 未生成独立 HTML，执行阶段应以内联 Sheet/Dialog 实现，语义 ID 与事件按 ui-tree.json 绑定。

## 2. Semantic UI Binding

### 2.1 Surfaces / Routes

所有 surface id、page id、route、tab id 必须保持与 ui-tree.json 一致，不得重命名。

### 2.2 关键语义目标与 ArkTS `.id(...)` 绑定

| 页面 | 语义 ID | 角色 | ArkUI 绑定建议 |
|------|---------|------|----------------|
| home-page | `home-pet-switcher` | action | 顶部宠物头像+名字 Row，onClick → open-pet-picker |
| home-page | `home-current-pet-avatar` | assertion | Image 组件 .id |
| home-page | `home-current-pet-name` | assertion | Text 组件 .id |
| home-page | `home-add-pet-button` | action | 右上角 + 图标按钮 |
| home-page | `home-notification-button` | action | 提醒铃铛图标按钮 |
| home-page | `home-quick-log-button` | action | 中央 120vp 薄荷渐变圆形按钮 |
| home-page | `home-reminder-list` | list | List/Scroll 容器，itemIdPattern `home-reminder-{id}` |
| home-page | `home-recent-record-list` | list | 时间轴 List，itemIdPattern `home-recent-record-{id}` |
| home-page | `home-see-all-records-link` | action | "查看全部" 文本按钮 |
| home-page | `home-health-summary-card` | action | 健康概览卡片，onClick → go-to-health |
| records-page | `records-add-button` | action | Header 右侧 + 图标按钮 |
| records-page | `records-search-input` | input | Search/TextInput .id |
| records-page | `records-pet-filter` | input | 筛选 Chip/Select |
| records-page | `records-type-filter` | input | 筛选 Chip/Select |
| records-page | `records-date-filter` | input | 筛选 Chip/Select |
| records-page | `records-timeline-list` | list | 时间轴 List |
| health-page | `health-pet-switcher` | action | 顶部宠物切换条 |
| health-page | `health-period-7d/30d/90d` | action | 周期切换 Pill 按钮 |
| health-page | `health-weight-chart-card` | action | 体重图表卡片 |
| health-page | `health-water-chart-card` | action | 饮水量图表卡片 |
| health-page | `health-toilet-chart-card` | action | 排泄频次图表卡片 |
| health-page | `health-reminder-list` | list | 疫苗/驱虫提醒列表 |
| health-page | `health-add-reminder-button` | action | 提醒区块 + 按钮 |
| health-page | `health-medical-record-list` | list | 病历卡片列表 |
| health-page | `health-add-medical-record-button` | action | 病历区块 + 按钮 |
| family-page | `family-invite-button` | action | 顶部薄荷渐变邀请按钮 |
| family-page | `family-member-list` | list | 成员卡片列表 |
| family-page | `family-shared-pet-list` | list | 共享宠物列表 |
| profile-page | `profile-user-avatar` | assertion | 用户头像 |
| profile-page | `profile-user-name` | assertion | 用户名 |
| profile-page | `profile-manage-pets-button` | action | 管理宠物列表行 |
| profile-page | `profile-export-data-button` | action | 导出数据菜单行 |
| profile-page | `profile-settings-button` | action | 设置菜单行 |
| profile-page | `profile-about-button` | action | 关于菜单行 |
| pet-editor-page | `pet-editor-avatar-picker` | input | 头像选择器 |
| pet-editor-page | `pet-editor-name-input` | input | 昵称输入 |
| pet-editor-page | `pet-editor-species-picker` | input | 物种选择 |
| pet-editor-page | `pet-editor-breed-input` | input | 品种输入 |
| pet-editor-page | `pet-editor-gender-picker` | input | 性别选择 |
| pet-editor-page | `pet-editor-birthdate-picker` | input | 生日选择 |
| pet-editor-page | `pet-editor-weight-input` | input | 体重输入 |
| pet-editor-page | `pet-editor-tags-input` | input | 标签输入区 |
| pet-editor-page | `pet-editor-notes-input` | input | 备注输入 |
| pet-editor-page | `pet-editor-save-button` | action | 保存按钮 |
| pet-editor-page | `pet-editor-delete-button` | action | 删除按钮 |
| record-editor-page | `record-editor-pet-picker` | input | 宠物选择 |
| record-editor-page | `record-editor-type-picker` | input | 类型选择 |
| record-editor-page | `record-editor-datetime-picker` | input | 时间选择 |
| record-editor-page | `record-editor-food-name-input` | input | 食物名称 |
| record-editor-page | `record-editor-amount-input` | input | 数量 |
| record-editor-page | `record-editor-unit-input` | input | 单位 |
| record-editor-page | `record-editor-notes-input` | input | 备注 |
| record-editor-page | `record-editor-save-button` | action | 保存按钮 |
| record-editor-page | `record-editor-delete-button` | action | 删除按钮 |
| medical-record-editor-page | `medical-editor-pet-picker` | input | 宠物选择 |
| medical-record-editor-page | `medical-editor-date-picker` | input | 日期 |
| medical-record-editor-page | `medical-editor-clinic-input` | input | 医院 |
| medical-record-editor-page | `medical-editor-doctor-input` | input | 医生 |
| medical-record-editor-page | `medical-editor-complaint-input` | input | 主诉 |
| medical-record-editor-page | `medical-editor-diagnosis-input` | input | 诊断 |
| medical-record-editor-page | `medical-editor-treatment-input` | input | 治疗方案 |
| medical-record-editor-page | `medical-editor-cost-input` | input | 费用 |
| medical-record-editor-page | `medical-editor-photo-grid` | input | 图片网格 |
| medical-record-editor-page | `medical-editor-save-button` | action | 保存 |
| medical-record-editor-page | `medical-editor-delete-button` | action | 删除 |
| member-invite-page | `member-invite-code-display` | assertion | 邀请码文本 |
| member-invite-page | `member-invite-copy-button` | action | 复制按钮 |
| member-invite-page | `member-invite-share-button` | action | 分享按钮 |
| member-invite-page | `member-invite-back-button` | action | 返回按钮 |

### 2.3 事件名（必须原样保留）

`open-pet-picker`, `open-record-type-sheet`, `open-record-editor`, `open-reminder-editor`, `open-medical-record-editor`, `open-member-invite`, `save-pet`, `delete-pet`, `save-record`, `delete-record`, `save-reminder`, `delete-reminder`, `save-medical-record`, `delete-medical-record`, `set-chart-period`, `copy-invite-code`, `share-invite-code`, `close-sheet`, `confirm-delete`, `cancel-delete`, `go-back`

### 2.4 列表项 ID 策略

- `home-reminder-{id}`
- `home-recent-record-{id}`
- `records-timeline-item-{id}`
- `health-reminder-{id}`
- `health-medical-record-{id}`
- `family-member-{id}`
- `family-shared-pet-{id}`
- `chart-data-point-{id}`
- `medical-detail-photo-{index}`
- `pet-picker-item-{id}`

## 3. 视觉要求

### 3.1 色彩
- 主色：薄荷绿系 `#5DD9C1` / `#3CB5A0`，用于主按钮、Tab 激活、图表主线、核心图标。
- 辅色：肉垫粉系 `#FFB8C9` / `#F28DA6`，用于情感卡片、删除按钮、驱虫提醒、空状态。
- 功能色：阳光黄 `#FFD166`（提醒/排泄）、天空蓝 `#A8DADC`（用药/饮水）、薰衣草紫 `#CAB8F0`（体重/成员）、珊瑚橙 `#FF9F8E`（就医）。
- 中性色：墨灰 `#1F2937`、深灰 `#4B5563`、中灰 `#9CA3AF`、浅灰 `#F3F4F6`、白色 `#FFFFFF`。
- 渐变：主按钮 `linear-gradient(135deg, #8EEDDB, #45C4AD)`；删除按钮 `linear-gradient(135deg, #FFB8C9, #F28DA6)`；顶部英雄区 `linear-gradient(180deg, #E6FAF6, #F3F4F6)`。

### 3.2 字体
- 中文：`PingFang SC`；英文/数字：`SF Pro Display`。
- 页面标题 24px/700；区块标题 18-20px/700；正文 15px/400；强调 15px/700；辅助 13px；胶囊 11px/700；大数字 42px/800。

### 3.3 组件
- 主按钮：56px 高，全药丸 28px，薄荷渐变，白色文字，阴影 `0 14px 28px rgba(69,196,173,0.32)`。
- 图标按钮：44px，白色背景，14px 圆角，22px 图标。
- 卡片：白色，24px 圆角，20px 内边距，阴影 `0 12px 32px rgba(31,41,55,0.08)`，顶部 1px 白色高光边框。
- 输入框：52px 高，16px 圆角，#F3F4F6 背景；聚焦时背景变白 + `#5DD9C1` 边框 + `#E6FAF6` 光晕。
- 头像：宠物 64px 圆形，白色 3px 边框 + 阴影；用户 48px；成员 44px。
- 标签/徽章：10px 圆角，按类型配色。
- 底部 TabBar：毛玻璃白色 `rgba(255,255,255,0.82)` + `blur(24px)`，高度 76px，图标 24px，激活色 `#5DD9C1`；中央悬浮 + 按钮 56px 薄荷渐变。

### 3.4 布局
- 内容区最大宽度 390px，水平内边距 20px，卡片间距 16px，大区块间距 30px。
- 首页首屏：Header + 问候卡片 + 一键记录 + 今日提醒预览必须在顶部 600vp 内可见。
- 底部 TabBar 固定底部，禁止侧边导航。

### 3.5 动效
- 页面进入：上移 12px + 透明度，260ms。
- 按钮按下：scale 0.96，100ms。
- 卡片按下：阴影加深 + scale 0.98。
- 列表项：错位淡入 45ms。
- 图表：路径绘制 750ms，面积淡入 550ms。

## 4. 逐页抛光要点

### 4.1 首页 (home-page)
- 顶部使用 `linear-gradient(180deg, #E6FAF6, #F3F4F6)` 背景。
- 中央一键记录按钮是视觉焦点：120px 薄荷渐变圆形，带阴影与白色描边。
- 提醒列表横向可滚动，胶囊卡片带左侧彩色竖条。
- 最近记录使用时间轴样式，节点按类型着色。

### 4.2 记录页 (records-page)
- Header 粘性顶部毛玻璃。
- 搜索框 + 三个筛选 Chip（宠物、类型、日期）。
- 时间轴按日期分组，每项显示宠物小头像与类型徽章。

### 4.3 健康页 (health-page)
- 顶部宠物切换条。
- 周期切换 Pill：7d/30d/90d，激活态薄荷填充。
- 三个图表卡片：体重（曲线图）、饮水（柱状图）、排泄（柱状图）。
- 提醒与病历分区块，右上角 + 按钮。

### 4.4 家庭页 (family-page)
- 顶部邀请按钮使用薄荷渐变。
- 成员列表显示角色徽章（管理员/成员/待确认）。
- 共享宠物列表显示权限说明。

### 4.5 我的页 (profile-page)
- 顶部用户信息卡片使用薄荷渐变背景。
- 宠物网格展示已添加宠物。
- 更多功能使用菜单列表 + 彩色图标。

### 4.6 表单页（宠物/记录/病历编辑）
- 统一 Header：返回 + 标题 + 保存。
- 表单卡片 24px 圆角，分组清晰。
- 删除按钮使用肉垫粉渐变，位于卡片下方。

### 4.7 邀请页 (member-invite-page)
- 居中邀请码大卡片，字体 32px/800。
- 复制 + 分享双按钮。

## 5. HTML-to-ArkUI 映射说明

- 页面根 `div.page` → ArkTS 页面根 `Column()` 或 `Scroll()`，设置 `.width('100%')` 与底部 padding 避开 TabBar。
- `header.header` → 自定义 `PageHeader` 组件，粘性顶部使用毛玻璃效果。
- 卡片 `div.form-card` / `div.family-card` → `Column()` + `.backgroundColor('#FFFFFF')` + `.borderRadius(24)` + `.shadow(...)`。
- 主按钮 → `Button()` 或 `Column()` + `.linearGradient(...)` + `.borderRadius(999)`。
- 图标按钮 → `Button()` 或 `Column()` + `.backgroundColor('#FFFFFF')` + `.borderRadius(14)` + 阴影。
- 底部 TabBar → 沿用现有 `BottomTabBar` 组件结构，按 HTML 样式调整为毛玻璃与悬浮 + 按钮。
- SVG 图标 → ArkUI `SymbolGlyph` / `Image` / 内联 SVG 路径；必须保留语义 `.id`。
- 图表 → 使用 `Line` / `Path` / `Rect` 自绘或使用 HarmonyOS 图表库；保持配色与渐变。

## 6. 不可协商约束

1. 不得修改 ui-tree.json 中的语义 ID、page ID、route、tab ID 或事件名。
2. HTML 设计稿是最终视觉参考，ArkTS 实现需忠实还原其布局、颜色、圆角、阴影、图标与交互状态。
3. ui-tree.json 是语义绑定协议，不是布局树；视觉层级可在 HTML 基础上自由实现，但语义目标必须绑定到正确的交互/断言元素。
4. 所有语义 action/input/assertion/list 目标必须设置 `.id(...)`。
5. 底部 TabBar 固定底部，中央悬浮 + 按钮；禁止侧边导航或全宽铺满。
6. 内容区最大宽度约束在 390-420vp 内居中。
7. 不使用 emoji 作为图标；SVG 图标需保留业务语义（实现中可通过 `.id` 与注释维护）。
8. 不添加 spec 与 DESIGN2 中未定义的新功能或数据模型假设；如有发现缺口，记录为变更请求而不是静默实现。

## 7. 语义变更请求

- 当前无变更请求。所有关键交互与断言点均已覆盖。
