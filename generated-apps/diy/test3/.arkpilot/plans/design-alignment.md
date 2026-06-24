# 手作·印记 — 设计对齐计划

## 1. 视觉输入

- **语义 UI 协议**：`.arkpilot/designs/ui-tree.json`
- **最终视觉设计**：`.arkpilot/designs/DESIGN2.md`
- **HTML 设计稿**：
  - `.arkpilot/designs/page-home-page.html`
  - `.arkpilot/designs/page-classes-page.html`
  - `.arkpilot/designs/page-points-page.html`
  - `.arkpilot/designs/page-profile-page.html`
  - `.arkpilot/designs/page-profile-edit-page.html`
  - `.arkpilot/designs/page-class-detail-page.html`
  - `.arkpilot/designs/page-dormant-page.html`
  - `.arkpilot/designs/page-inventory-page.html`
- **路由页面清单**：
  - `home-page` → `pages/Home`（Tab 首页）
  - `classes-page` → `pages/Classes`（Tab 课程）
  - `points-page` → `pages/Points`（Tab 积分）
  - `profile-page` → `pages/Profile`（Tab 我的）
  - `profile-edit-page` → `pages/ProfileEdit`
  - `class-detail-page` → `pages/ClassDetail`
  - `dormant-page` → `pages/Dormant`
  - `inventory-page` → `pages/Inventory`

## 2. Semantic UI Binding

### 2.1 页面 / 路由 / Tab

| pageId | route | tabId | 说明 |
|--------|-------|-------|------|
| home-page | pages/Home | tab-home | 首页：签到、积分、动态 |
| classes-page | pages/Classes | tab-classes | 课程预约：日历 + 课程列表 |
| points-page | pages/Points | tab-points | 积分与消费：余额、明细、消费 |
| profile-page | pages/Profile | tab-profile | 会员档案：信息、工艺、作品 |
| profile-edit-page | pages/ProfileEdit | — | 编辑档案 |
| class-detail-page | pages/ClassDetail | — | 课程详情与耗材 |
| dormant-page | pages/Dormant | — | 沉睡会员提醒 |
| inventory-page | pages/Inventory | — | 库存管理 |

### 2.2 语义 ID 映射

#### 首页（home-page）
- `home-checkin-button`：圆形窑火橙签到按钮
- `home-points-balance`： hero 卡片积分余额数值
- `home-streak-days`： hero 卡片连续签到天数
- `home-recent-list`：最近动态列表容器；列表项遵循 `home-activity-{id}`
- `home-empty-state`：动态为空状态
- `home-dormant-alert`：顶部铃铛入口，跳转沉睡会员页
- `tab-home` / `tab-classes` / `tab-points` / `tab-profile`：底部 Tab

#### 课程页（classes-page）
- `classes-calendar`：日历卡片容器，触发 `select-class-date`
- `classes-slot-list`：课程列表容器；列表项遵循 `classes-slot-{id}`
- `classes-slot-{id}-book`：预约按钮 → `book-class-slot`
- `classes-slot-{id}-cancel`：取消预约按钮 → `cancel-class-slot`
- `classes-slot-{id}-capacity`：名额剩余文本
- `classes-slot-{id}-stock-warning`：库存不足提示标签
- `classes-empty-state`：当天无课程空态

#### 课程详情（class-detail-page）
- `class-detail-title` / `class-detail-date` / `class-detail-capacity`：标题、日期、名额
- `class-detail-materials`：耗材列表，项 ID `class-material-{id}`
- `class-detail-book`：预约按钮 → `book-class`
- `class-detail-cancel`：取消预约按钮 → `cancel-booking`
- `class-detail-stock-alert`：库存不足全局提示

#### 积分页（points-page）
- `points-balance`：当前积分
- `points-lifetime`：累计积分
- `points-segment`：积分/消费分段器 → `switch-points-tab`
- `points-history-list`：积分明细列表，项 `points-history-{id}`
- `points-consumption-list`：消费记录列表，项 `points-consumption-{id}`
- `points-history-empty` / `points-consumption-empty`：对应空态

#### 档案页（profile-page）
- `profile-avatar`：头像
- `profile-name` / `profile-level`：昵称、等级
- `profile-craft-tags`：擅长工艺标签列表，项 `profile-craft-{id}`
- `profile-gallery`：作品图集列表，项 `profile-work-{id}`
- `profile-edit-button`：编辑档案 → `navigate-profile-edit`
- `profile-inventory-button`：库存管理入口 → `navigate-inventory`
- `profile-crafts-empty` / `profile-gallery-empty`：空态

#### 编辑档案（profile-edit-page）
- `profile-edit-name-input`：昵称输入 → `update-name`
- `profile-edit-craft-input`：工艺标签输入 → `add-craft`
- `profile-edit-craft-list`：已添加工艺列表，项 `profile-edit-craft-{id}`
- `profile-edit-craft-{id}-remove`：删除工艺 → `remove-craft`
- `profile-edit-add-work`：添加作品图 → `add-work-image`
- `profile-edit-work-list`：作品图列表，项 `profile-edit-work-{id}`
- `profile-edit-work-{id}-remove`：删除作品图 → `remove-work-image`
- `profile-edit-save`：保存 → `save-profile`

#### 沉睡会员（dormant-page）
- `dormant-count`：待唤醒人数
- `dormant-list`：沉睡会员列表，项 `dormant-member-{id}`
- `dormant-member-{id}-wake`：唤醒按钮 → `wake-member`
- `dormant-member-{id}-last-active`：最后活跃时间
- `dormant-threshold-input`：沉睡判定天数输入 → `update-threshold`
- `dormant-empty-state`：空态

#### 库存管理（inventory-page）
- `inventory-list`：库存列表，项 `inventory-item-{id}`
- `inventory-item-{id}-quantity`：库存数量
- `inventory-item-{id}-restock`：补货 → `restock-item`
- `inventory-item-{id}-link-class`：关联课程 → `link-class-material`
- `inventory-low-stock-alert`：库存预警提示
- `inventory-empty-state`：空态

### 2.3 事件清单

| 事件名 | 触发场景 |
|--------|----------|
| member-checkin | 首页签到按钮点击 |
| navigate-dormant | 首页铃铛 / 沉睡入口点击 |
| navigate-inventory | 档案页库存管理入口点击 |
| navigate-profile-edit | 档案页编辑按钮点击 |
| select-class-date | 课程页日历日期选择 |
| book-class-slot | 课程列表项预约 |
| cancel-class-slot | 课程列表项取消预约 |
| book-class | 课程详情页预约 |
| cancel-booking | 课程详情页取消预约 |
| switch-points-tab | 积分/消费分段切换 |
| update-name | 昵称输入变化/提交 |
| add-craft | 添加工艺标签 |
| remove-craft | 删除工艺标签 |
| add-work-image | 添加作品图片 |
| remove-work-image | 删除作品图片 |
| save-profile | 保存档案 |
| wake-member | 标记会员已唤醒 |
| update-threshold | 修改沉睡判定阈值 |
| restock-item | 库存补货 |
| link-class-material | 库存关联课程耗材 |

## 3. 视觉要求

### 3.1 色彩 Tokens

- 页面背景：`#FAF6F1`（素坯白）
- 卡片背景：`#FAF6F1` / `#EDE6DC`（泥板灰）
- 主文本：`#3A2E29`（深褐）
- 次要文本：`#6B5A4F`（中褐）
- 占位/禁用：`#A89A8E`（浅褐）
- 品牌主色：`#A65D48`（赤陶棕）
- 主 CTA：`#E57A39`（窑火橙）
- 成功/已约：`#4D8A72`（青釉绿）
- 警告/签到：`#C99E3A`（藤金黄）
- 错误/库存不足：`#B84A3D`（窑变红）
- 边框/分隔：`#DCC8B0`
- 阴影：`rgba(111, 69, 59, 0.10)` 及不同层级

### 3.2 字体

- 大标题、区块标题：手写感字体（Ma Shan Zheng / ZCOOL XiaoWei），fallback cursive
- 正文、列表、按钮：系统无衬线（PingFang SC / HarmonyOS Sans SC）
- 数据数字：加粗、紧凑字距

### 3.3 组件样式

- 主按钮：窑火橙填充、胶囊形、白色文字、底部阴影
- 次要按钮：泥板灰填充、赤陶棕文字、1px 边框
- 危险按钮：窑变红填充
- 卡片：20–24px 圆角、18–20px 内边距、暖调弥散阴影
- 输入框：16px 圆角、泥板灰边框、focus 时赤陶棕边框 + 外发光
- 标签：砂金米背景、虚线藤黄边框、胶囊形
- 底部 Tab：磨砂玻璃背景、固定在底部、图标 + 文字、active 为赤陶棕

### 3.4 页面级抛光

- **首页**：首屏必须在 600vp 内展示品牌标题、会员 hero 卡片、签到按钮；hero 使用赤陶棕渐变；签到按钮使用窑火橙大圆形，强调触觉反馈。
- **课程页**：日历使用 7 列网格，选中日期为赤陶棕圆形，有课日期底部青釉绿小点；课程卡片左侧时间、右侧内容，库存不足时预约按钮禁用并显示红色标签。
- **积分页**：顶部积分卡片使用砂金米渐变，大字号展示余额；分段器胶囊切换；列表项左侧色块图标区分类型。
- **档案页**：头像圆形带泥板灰边框；擅长工艺使用标签网格；作品图使用 3 列等宽网格，最后一项为上传入口。
- **编辑档案**：输入框 + 添加行 + 可删除标签；作品图带右上角删除按钮；底部悬浮保存按钮。
- **课程详情**：顶部赤陶棕渐变 hero；库存不足时顶部红色 alert；耗材列表展示库存状态；底部双按钮（取消/预约）。
- **沉睡会员**：顶部藤金黄汇总卡片；阈值输入行；会员卡片展示唤醒按钮与建议话术。
- **库存管理**：顶部库存不足 alert；每项卡片展示数量、补货与关联课程按钮，数量低于阈值时红色显示。

### 3.5 响应式约束

- 内容区 max-width 420vp，水平居中。
- 底部 Tab 必须固定在底部，宽度与 body 一致（max-width 420vp，left/right 0，margin auto），禁止侧边导航。
- 首屏关键内容在 600vp 内可见。
- 长页面其余内容可滚动。

## 4. HTML 到 ArkUI 映射说明

- HTML 的 `.page` 对应 ArkUI `Column` + `Scroll`。
- HTML 的卡片使用 ArkUI `Column` + `borderRadius` + `shadow` 实现。
- HTML 的 `data-ui-id` 必须映射到 ArkUI 控件的 `.id(...)`。
- 底部 Tab Bar 在 ArkUI 中应使用 `Tabs` + `TabContent`，或在 `Page` 底部固定一个自定义 `Row`；若自定义实现，需确保与 HTML 中 `.tabbar` 视觉一致。
- 日历网格使用 `Grid` 或 `Row/Column` 嵌套；日期项为 `Text` 或 `Button`。
- 作品图网格使用 `Grid` 3 列。
- 列表类结构优先使用 `List` + `ListItem`，将 `data-ui-id` 置于 `List`，`data-ui-id-item` 模式通过列表项 `.id(...)` 动态拼接实现。
- 空态在 ArkUI 中用条件渲染（`if/else`）控制显隐，对应 HTML 中的 `display:none` 占位。

## 5. 非协商约束

1. **不得静默修改语义 ID、页面 ID、路由、Tab ID 或事件名**。如需调整，必须以 change request 形式记录。
2. **HTML 设计稿是最终视觉参考**。最终 ArkTS 实现需还原布局、颜色、圆角、阴影、图标、空态。
3. **`ui-tree.json` 是语义绑定协议，不是最终布局树**。实现时可根据视觉需要调整组件层级与包裹方式，但语义目标 ID 必须绑定到正确的交互/断言元素。
4. **禁止添加本计划未记录的新功能、数据模型或脚手架假设**。
5. **所有 SVG 图标必须包含语义化 title**；HTML 中已注入，ArkTS 中应保留或等效描述。
6. **目标设备**：1272×2756vp 普通手机，内容 max-width 420vp 居中，底部 Tab。

## 6. 语义变更请求

- 无。
