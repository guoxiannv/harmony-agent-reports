# 设计对齐计划

## 1. 视觉输入

- **语义 UI 协议**：`.arkpilot/designs/ui-tree.json`
- **最终视觉设计文档**：`.arkpilot/designs/DESIGN2.md`
- **HTML 设计稿**：
  - `.arkpilot/designs/page-home-page.html`
  - `.arkpilot/designs/page-pantry-page.html`
  - `.arkpilot/designs/page-check-in-page.html`
  - `.arkpilot/designs/page-profile-page.html`
  - `.arkpilot/designs/page-result-page.html`
  - `.arkpilot/designs/page-check-in-editor-page.html`
  - `.arkpilot/designs/page-share-card-page.html`
- **路由页面列表**：home-page、pantry-page、check-in-page、profile-page、result-page、check-in-editor-page、share-card-page

## 2. Semantic UI Binding

### Surface / Page / Route / Tab
| Surface ID | Page ID | Route | Tab ID |
|------------|---------|-------|--------|
| home | home-page | pages/HomePage | tab-home |
| pantry | pantry-page | pages/PantryPage | tab-pantry |
| check-in | check-in-page | pages/CheckInPage | tab-check-in |
| profile | profile-page | pages/ProfilePage | tab-profile |
| result | result-page | pages/ResultPage | - |
| check-in-editor | check-in-editor-page | pages/CheckInEditorPage | - |
| share-card | share-card-page | pages/ShareCardPage | - |

### 必须保留的 ArkTS `.id(...)`

#### 首页（home-page）
- `home-mood-filter`：心情标签选择区
- `home-time-filter`：时间胶囊选择区
- `home-spin-button`：开始转盘按钮
- `home-wheel-result`：结果展示区（断言目标）
- `home-result-detail-button`：查看详情按钮
- `home-quick-pantry-button`：跳转食材页按钮

#### 食材页（pantry-page）
- `pantry-input`：食材输入框
- `pantry-add-button`：添加食材按钮
- `pantry-item-list` / `pantry-item-{id}`：食材标签列表
- `pantry-remove-button`：删除食材按钮
- `pantry-recommend-button`：推荐按钮
- `pantry-mood-filter`：心情筛选
- `pantry-result-list` / `pantry-dish-{id}`：推荐结果列表
- `pantry-dish-card`：可点击的菜品卡片

#### 打卡页（check-in-page）
- `check-in-add-button`：补录打卡 FAB
- `check-in-list` / `check-in-record-{id}`：打卡记录列表
- `check-in-share-button`：生成分享卡片
- `check-in-delete-button`：删除记录

#### 我的页（profile-page）
- `profile-streak-count`：连续打卡天数
- `profile-total-check-ins`：总打卡数
- `profile-settings-button`：设置入口

#### 结果页（result-page）
- `result-dish-name`：菜名
- `result-dish-tags`：标签
- `result-check-in-button`：记录打卡
- `result-share-button`：分享卡片
- `result-back-button`：返回

#### 打卡编辑页（check-in-editor-page）
- `editor-date-picker`：日期
- `editor-meal-picker`：餐别
- `editor-dish-input`：菜品
- `editor-mood-picker`：心情
- `editor-note-input`：备注
- `editor-save-button`：保存
- `editor-back-button`：返回

#### 分享卡片页（share-card-page）
- `share-card-preview`：卡片预览
- `share-save-button`：保存图片
- `share-system-button`：系统分享
- `share-back-button`：返回

### 事件名
`spin-wheel`, `mood-filter-change`, `time-filter-change`, `go-to-pantry`, `add-pantry-item`, `remove-pantry-item`, `recommend-by-pantry`, `pantry-mood-filter-change`, `open-dish-detail`, `open-check-in-editor`, `save-check-in`, `delete-check-in`, `open-share-card`, `save-share-card`, `system-share-card`, `check-in-from-result`, `share-from-result`, `back-from-result`, `back-from-editor`, `back-from-share`, `open-settings`。

### 重复项与空状态策略
- 列表 ID：`pantry-item-list`, `pantry-result-list`, `check-in-list`
- itemIdPattern：`pantry-item-{id}`, `pantry-dish-{id}`, `check-in-record-{id}`
- 空状态：保留列表容器，内部渲染空状态文案即可，不强制新 ID。

## 3. 视觉要求

### 设计系统（来自 DESIGN2.md）
- **背景**：Cream `#FFF8F0`；深色主题用 Espresso `#2E2B28`。
- **食物色谱**：Tomato `#E85D4E`、Avocado `#7CAE7A`、Yolk `#F2B134`、Caramel `#C47D4C`、Taro `#A68CC6`、Mint `#7DD3C0`、Berry `#D67A94`。
- **主按钮**：番茄红渐变 + 高光 + 阴影 `rgba(232,93,78,0.28) 0 10px 24px`，圆角 18px，高度 54px。
- **次按钮**：白底 + `#E8DDD1` 边框，圆角 18px，高度 50-54px。
- **卡片**：白底，圆角 24px，阴影 `rgba(46,43,40,0.08) 0 10px 32px`，padding 22px。
- **筛选标签**：Inactive 白底灰字；Active 浅食物色底 + 深色字。
- **时间胶囊**：Inactive 白底；Active Espresso 底白字。
- **底部 Tab**：浮岛玻璃 `rgba(255,248,240,0.94)` + `blur(24px)`，顶部圆角 28px，选中 Tomato，未选中灰。
- **转盘**：直径 320px，8 分区食物色，中心白圆红边，指针 Tomato。
- **排版**：Display 40px/800，H1 26px/700，Body 16px/400，Caption 14px，Micro 12px。

### 各页面实现重点

#### 首页
- 标题 + 日期胶囊在同一行。
- 心情标签、时间胶囊横向可滚动。
- 转盘居中，中心「开始」按钮。
- 结果区在转盘下方，显示菜名、心情小标签、查看详情。
- 底部两个按钮叠放。

#### 食材页
- 输入框 + 圆形添加按钮放在白色卡片内。
- 食材标签云，每个标签带彩色小圆点和删除 X。
- 「看看能做什么」主按钮。
- 推荐结果用左色块 + 右信息的卡片列表。

#### 打卡页
- 顶部统计卡：连续打卡（Tomato 大数字）+ 总次数（深色）。
- 日期标题吸顶，Cream Dark 底。
- 记录项左侧 4px 彩色竖条，右侧操作按钮（分享、删除）。
- 右下角番茄红 FAB。

#### 我的页
- 头像 + 昵称 + 连续打卡徽章。
- 2×2 统计网格。
- 设置列表项带图标和箭头。

#### 结果页
- 上半部分深色 Hero（Espresso 渐变），菜名 Display 居中。
- 下半部分白底卡片上拉覆盖，包含食材清单、推荐语、时间/难度。
- 底部固定双按钮。

#### 打卡编辑页
- 顶部返回 + 标题。
- 表单垂直排列：日期、餐别胶囊、菜品输入、心情选择、备注多行。
- 底部保存按钮。

#### 分享卡片页
- 卡片预览居中，330px 宽，圆角 28px，渐变背景。
- 卡片内容：日期徽标、菜名、心情标签、推荐语、品牌 footer。
- 底部保存 + 分享按钮。

## 4. HTML-to-ArkUI 映射注意

- HTML 中的固定定位 Tab Bar 在 ArkUI 中应作为 `BottomTabBar` 组件，放在 `Index.ets` 的 Stack 底部。
- 所有卡片、按钮、标签可直接映射为 ArkUI `Column`/`Row` + 圆角 + 阴影。
- 转盘在 ArkUI 中可用 `Canvas` 或分片 `Shape` 实现，HTML 中的 `conic-gradient` 仅作视觉参考。
- 分享卡片的渐变背景在 ArkUI 中用 `linearGradient` 实现；装饰圆点可用绝对定位的 `Circle`。
- 输入框聚焦光晕用 `focusStyle` 或 `.stateStyles` 实现。

## 5. 非协商约束

- 不得重命名语义 ID、page ID、route、tab ID、事件名。
- HTML 产物是最终视觉参考，最终 ArkTS 结构应与之对齐。
- `ui-tree.json` 是语义绑定协议，不是布局树；实现时可以自由组合视觉容器，但必须保留语义目标。
- 不要在本阶段添加新的功能行为或数据模型假设。
- Tab 必须位于底部，不得侧边显示。
- 内容区 max-width 390px 居中，不得全宽铺满。
- 首屏关键内容必须在 600vp 内可见。
- 所有 SVG 图标必须包含上下文化 `<title>`。
- 不使用 emoji 作为 UI 图标。

## 6. 变更请求

无。
