# 宠迹 · PawLog — 视觉对齐计划

## 1. 视觉输入

- 语义 UI 协议：`.arkpilot/designs/ui-tree.json`
- 最终视觉设计：`.arkpilot/designs/DESIGN2.md`
- HTML 设计稿：
  - `page-home-page.html`
  - `page-records-page.html`
  - `page-charts-page.html`
  - `page-profile-page.html`
  - `page-pets-page.html`
  - `page-pet-detail-page.html`
  - `page-reminders-page.html`
  - `page-medical-page.html`
  - `page-family-page.html`
  - `page-record-editor-sheet.html`
  - `page-pet-editor-sheet.html`
  - `page-reminder-editor-sheet.html`
  - `page-medical-editor-sheet.html`
  - `page-family-invite-sheet.html`

## 2. Semantic UI Binding

### 页面/表面与路由

| pageId | route | tabId | HTML 文件 |
|--------|-------|-------|-----------|
| home-page | pages/Home | tab-home | page-home-page.html |
| records-page | pages/Records | tab-records | page-records-page.html |
| charts-page | pages/Charts | tab-charts | page-charts-page.html |
| profile-page | pages/Profile | tab-profile | page-profile-page.html |
| pets-page | pages/Pets | — | page-pets-page.html |
| pet-detail-page | pages/PetDetail | — | page-pet-detail-page.html |
| reminders-page | pages/Reminders | — | page-reminders-page.html |
| medical-page | pages/Medical | — | page-medical-page.html |
| family-page | pages/Family | — | page-family-page.html |
| record-editor-sheet | sheet/RecordEditor | — | page-record-editor-sheet.html |
| pet-editor-sheet | sheet/PetEditor | — | page-pet-editor-sheet.html |
| reminder-editor-sheet | sheet/ReminderEditor | — | page-reminder-editor-sheet.html |
| medical-editor-sheet | sheet/MedicalEditor | — | page-medical-editor-sheet.html |
| family-invite-sheet | sheet/FamilyInvite | — | page-family-invite-sheet.html |

### 关键语义目标与 ArkTS `.id(...)` 绑定

**首页（home-page）**
- `home-pet-switcher`：宠物横向切换器容器
- `home-pet-chip-{id}`：单个宠物头像 chip
- `home-add-pet-button`：添加宠物按钮
- `home-reminder-list`：今日提醒列表容器
- `home-reminder-{id}`：单个提醒条目
- `home-quick-record-food/waste/weight/medicine`：一键记录四宫格按钮
- `home-recent-record-list`：最近记录列表容器
- `home-recent-record-{id}`：单个最近记录条目
- `home-view-all-records`：查看全部记录
- `home-tab-bar`：底部 Tab 容器
- `home-tab-records/charts/profile`：Tab 项
- `home-fab-add`：中央悬浮添加按钮

**记录页（records-page）**
- `records-filter-pet/type/date-range`：筛选器
- `records-clear-filters`：清空筛选
- `records-list`：记录时间线列表
- `records-item-{id}`：单条记录
- `records-add-button`：添加记录按钮

**趋势页（charts-page）**
- `charts-pet-switcher`：宠物选择器
- `charts-metric-tabs`：指标切换容器
- `charts-metric-weight/food/waste/medicine`：指标按钮
- `charts-period-week/month`：周期切换
- `charts-canvas`：图表区域
- `charts-insight-card`：洞察卡片

**我的页（profile-page）**
- `profile-pets-row`：宠物档案入口
- `profile-reminders-row`：提醒管理入口
- `profile-medical-row`：病历归档入口
- `profile-family-row`：家庭成员入口
- `profile-settings-row`：设置入口

**宠物列表/详情**
- `pets-list`、`pets-card-{id}`、`pets-add-button`
- `pet-detail-back`、`pet-detail-edit`、`pet-detail-avatar/name/info/latest-weight`
- `pet-detail-reminder-list`、`pet-detail-medical-list`
- `pet-detail-add-reminder`、`pet-detail-add-medical`

**提醒/病历/家庭页**
- `reminders-list`、`reminders-item-{id}`、`reminders-item-{id}-toggle`、`reminders-add-button`
- `medical-list`、`medical-card-{id}`、`medical-card-{id}-images-{index}`、`medical-add-button`
- `family-group-name`、`family-member-list`、`family-invite-button`

**Sheet 弹窗**
- `record-editor-*`、`pet-editor-*`、`reminder-editor-*`、`medical-editor-*`
- `family-invite-code`、`family-invite-copy`、`family-invite-share`

### 重复项策略

- 列表项使用 `itemIdPattern`，实现时根据数据 ID 替换 `{id}` 或 `{index}`。
- 空状态 ID 已在 `ui-tree.json` 中声明，但 HTML 为视觉参考未显式渲染空状态；实现时应为每个列表补充空状态视图。

## 3. 视觉要求

### 色彩

- 主色：薄荷绿 `#14B8A6` → `#2DD4BF` 渐变
- 辅色：肉垫粉 `#FB7185`
- 页面背景：径向渐变 `radial-gradient(circle at 12% 0%, #F0FDF9 0%, #F8FAFC 40%, #FFF6F7 100%)`
- 标准卡片：白色 + 圆角 22px + 柔和阴影
- 强调卡片：`linear-gradient(160deg, #FFFFFF 0%, #F0FDF9 100%)`
- 温情卡片：`linear-gradient(160deg, #FFF1F2 0%, #FFFFFF 100%)`

### 排版

- 中文使用 PingFang SC / Hiragino Sans GB / Microsoft YaHei
- 数字使用 SF Pro Display
- 页面标题 22px / 700，卡片标题 18px / 700，正文 15px / 400

### 组件映射

- 主按钮：薄荷渐变胶囊，50px 高，25px 圆角，投影
- 次按钮：白色底 + 浅灰边框
- 悬浮按钮：60px 圆形，薄荷到粉色渐变，中央加号
- Tab Bar：毛玻璃底部固定，宽度受限 390px 居中，中央悬浮按钮凸出
- 卡片：22px 圆角，18px 内边距，柔和阴影
- 输入框：14px 圆角，52px 高，focus 外发光

### 首屏约束

- 首页 Header + 宠物切换器 + 今日待办 + 一键记录必须在 600vp 内可见。
- 内容区 max-width 390px，禁止全宽铺满。
- Tab Bar 必须位于底部，禁止侧边。

### 图标

- 全部使用 inline SVG，首子元素为 `<title>`，描述业务语义。
- 不使用 emoji 或象形 Unicode。

## 4. HTML-to-ArkUI 映射备注

- 页面背景径向渐变：在 ArkUI 中可用 `linearGradient` 或背景色近似实现，优先保证主色氛围。
- 毛玻璃 Tab Bar：使用 `blur` 与半透明背景；在 HarmonyOS 中可用 `BackdropBlur` / `backgroundBlurStyle`。
- 图表：使用 `@ohos/arkui-chart` 或自定义 `Canvas` 绘制折线，保留渐变填充与发光数据点。
- 底部 Sheet：使用 `bindSheet` 或自定义底部弹窗，顶部圆角 28px，带 drag handle。
- 时间线：左侧圆点 + 竖线，右侧卡片。
- 宠物切换器：横向 `List`/`Scroll`，选中态外环变色。

## 5. 非协商约束

- 不要修改语义 ID、pageId、route、tabId 或事件名。
- HTML 是最终视觉参考，但 `ui-tree.json` 是语义协议，不是布局树。
- 允许实现时为视觉层级添加包装容器，但稳定 ID 必须绑定到正确交互/断言目标。
- 不要添加 spec 之外的功能行为或数据模型假设。
- 首次启动保持空状态，不要预置演示数据。

## 6. 语义变更请求

- 无。所有语义目标在视觉设计中均已找到对应位置。

## 7. 实现优先级建议

1. 搭建页面框架与底部 Tab + 路由。
2. 实现首页宠物切换器、今日待办、一键记录、最近记录。
3. 实现记录页时间线与筛选。
4. 实现趋势页图表与指标切换。
5. 实现我的页入口与次级页面（宠物、提醒、病历、家庭）。
6. 实现各 Sheet 弹窗表单。
7. 联调数据持久化与空状态。
