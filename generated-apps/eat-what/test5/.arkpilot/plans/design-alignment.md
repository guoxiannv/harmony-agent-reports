# 今天吃什么 — 设计与语义对齐计划

## 1. 视觉输入

- **语义 UI 协议**：`.arkpilot/designs/ui-tree.json`
- **最终视觉设计**：`.arkpilot/designs/DESIGN2.md`
- **HTML  artifacts**：
  - `.arkpilot/designs/page-home-page.html`
  - `.arkpilot/designs/page-recommend-page.html`
  - `.arkpilot/designs/page-ingredient-page.html`
  - `.arkpilot/designs/page-filter-page.html`
  - `.arkpilot/designs/page-checkin-page.html`
  - `.arkpilot/designs/page-share-page.html`
  - `.arkpilot/designs/page-profile-page.html`
  - `.arkpilot/designs/page-dish-page.html`
- **预期 route-worthy 页面**：home-page, recommend-page, ingredient-page, filter-page, checkin-page, share-page, profile-page, dish-page

## 2. 语义 UI 绑定

### Surface 与路由/Tab

| Surface ID | Page ID | Route | Tab ID | 备注 |
|------------|---------|-------|--------|------|
| home | home-page | pages/Home | tab-home | 首页 |
| recommend | recommend-page | pages/Recommend | tab-recommend | 推荐页（Segment 容器） |
| wheel | wheel-page | pages/Wheel | (tab-recommend 子页) | 通过 recommend 页 Segment 切换 |
| ingredient | ingredient-page | pages/Ingredient | (tab-recommend 子页) | 通过 recommend 页 Segment 切换 |
| filter | filter-page | pages/Filter | (tab-recommend 子页) | 通过 recommend 页 Segment 切换 |
| checkin | checkin-page | pages/Checkin | tab-checkin | 打卡页 |
| share | share-page | pages/Share | — | 从打卡页/转盘结果进入 |
| profile | profile-page | pages/Profile | tab-profile | 我的页 |
| dish | dish-page | pages/DishLibrary | — | 从 profile 页进入 |

### 关键语义目标与事件映射

#### 首页
- `home-today-status-card`：状态断言
- `home-spin-wheel-button` → `navigate-to-wheel`
- `home-ingredient-button` → `navigate-to-ingredient`
- `home-filter-button` → `navigate-to-filter`
- `home-checkin-button` → `navigate-to-checkin`
- `home-recent-checkin-list` / `home-checkin-{id}`：最近打卡列表

#### 推荐页
- `recommend-segment-wheel` → `switch-to-wheel`
- `recommend-segment-ingredient` → `switch-to-ingredient`
- `recommend-segment-filter` → `switch-to-filter`

#### 转盘页
- `wheel-spin-button` → `spin-wheel`
- `wheel-canvas`：转盘状态断言
- `wheel-result-panel`：结果断言
- `wheel-candidate-list` / `wheel-candidate-{id}`：候选列表
- `wheel-add-candidate-input` / `wheel-add-candidate-button` → `add-wheel-candidate`
- `wheel-clear-candidates-button` → `clear-wheel-candidates`
- `wheel-go-checkin-button` → `navigate-to-checkin-with-result`

#### 食材页
- `ingredient-input` / `ingredient-add-button` → `add-ingredient`
- `ingredient-tag-list` / `ingredient-tag-{id}`：食材标签
- `ingredient-recommend-button` → `recommend-by-ingredients`
- `ingredient-result-list` / `ingredient-result-{id}`：推荐结果
- `ingredient-clear-button` → `clear-ingredients`

#### 筛选页
- `filter-mood-list` / `filter-mood-{id}`：心情筛选项
- `filter-time-list` / `filter-time-{id}`：时段筛选项
- `filter-apply-button` → `apply-filter`
- `filter-result-list` / `filter-result-{id}`：筛选结果
- `filter-reset-button` → `reset-filter`

#### 打卡页
- `checkin-calendar`：日历断言
- `checkin-streak-count`：连续打卡断言
- `checkin-total-count`：累计打卡断言
- `checkin-meal-breakfast` / `checkin-meal-lunch` / `checkin-meal-dinner` → `select-meal-type`
- `checkin-dish-input` → `update-checkin-dish`
- `checkin-note-input` → `update-checkin-note`
- `checkin-save-button` → `save-checkin`
- `checkin-share-button` → `navigate-to-share`
- `checkin-history-list` / `checkin-history-{id}`：历史记录

#### 分享页
- `share-card-preview`：卡片预览断言
- `share-save-button` → `save-share-card`
- `share-system-button` → `system-share-card`
- `share-template-list` / `share-template-{id}`：模板选择
- `share-caption-input` → `update-share-caption`

#### 我的页
- `profile-dish-library-button` → `navigate-to-dish-library`
- `profile-settings-button` → `open-settings`

#### 菜品管理页
- `dish-add-button` → `open-dish-form`
- `dish-list` / `dish-item-{id}`：菜品列表
- `dish-search-input` → `search-dishes`
- `dish-form-name-input` → `update-dish-name`
- `dish-form-tags-input` → `update-dish-tags`
- `dish-form-save-button` → `save-dish`
- `dish-form-delete-button` → `delete-dish`

## 3. 视觉要求

### 设计系统
- **主题**：Morning Kitchen，温暖晨光、食物杂志感
- **主色**：暖橙 `#FF8C42`，深橄榄绿 `#5A6B58`，鼠尾草绿 `#8FA897`，薄荷绿 `#4ECB9C`
- **背景**：纸白 `#FFFCFA`，奶油 `#FFF5ED`
- **文字**：深棕 `#2E2A25`，暖灰 `#7A746E`
- **主按钮**：暖橙渐变 + 18px 圆角 + 阴影
- **卡片**：白色/纸白背景 + 20-26px 圆角 + 双层柔和阴影
- **底部 Tab Bar**：玻璃拟态，固定在 420vp 居中容器底部，图标 24px，选中暖橙

### 每页执行重点

#### 首页
- Header：问候语 + 大标题 + 设置图标按钮
- 今日状态卡：奶油渐变背景，左侧文案 + 行动按钮，右侧厨师帽 SVG
- 快捷入口：2×2 Feature Card 网格，四张卡片不同柔和底色
- 最近打卡：横向滚动小卡片

#### 推荐页
- 顶部 Segmented Control，选中 pill 为深棕
- 内容区根据 Segment 切换显示转盘/食材/筛选

#### 转盘页
- 转盘直径 300px，12 扇区，中心 GO 按钮
- 顶部指针，底部候选输入 + 标签 + 清空
- 结果使用底部玻璃浮层

#### 食材页
- 输入行 + 圆形添加按钮
- 食材标签流式排列
- 全宽主按钮"开始推荐"
- 推荐结果列表卡片

#### 筛选页
- 心情标签 + 时段标签分组
- 应用筛选主按钮 + 重置按钮
- 结果 2 列网格卡片

#### 打卡页
- 顶部统计卡：连续/累计打卡大数字
- 日历 7 列，今日高亮，打卡日实心圆点
- 餐别选择三按钮
- 菜品/备注输入 + 保存按钮 + 分享按钮
- 历史记录列表

#### 分享页
- 横向模板选择器
- 320×480px 分享卡片预览
- 保存到相册 + 系统分享两个大按钮

#### 我的页
- 头像 + 昵称 + 统计
- 菜单列表：菜品管理、饮食统计、设置

#### 菜品管理页
- 搜索框 + 添加按钮
- 列表项：首字母头像 + 菜名 + 标签 + 编辑

### 响应式约束
- 内容区 max-width: 420vp，居中
- Tab Bar 宽度与 body 一致，不拉伸
- 首屏关键内容在顶部 580vp 内

## 4. HTML 到 ArkUI 映射

- `div.page` → `Column` + `Scroll`
- `header.header` → `Row` 顶部栏
- `.today-card` / `.card` → `Column` + 圆角 + 阴影
- `.quick-grid` → `GridRow`/`GridCol` 或 `Flex` wrap
- `.wheel` → 自定义 `Canvas` 或 `Shape` 绘制转盘
- `.tag-list` → `Flex` wrap
- `.chip-list` → `Flex` wrap
- `.calendar-grid` → `Grid` 7 列
- `.result-grid` → `Grid` 2 列
- `.tab-bar` → `Tabs` 底部栏或固定 `Row`
- `.result-sheet` / `.share-card` → `Sheet` 或 `Stack` 浮层

## 5. 非协商约束

- **不得更改语义 ID、page ID、route、tab ID、事件名**。
- HTML artifacts 是最终视觉参考，ArkTS 实现需忠实还原布局、颜色、圆角、阴影、图标。
- `ui-tree.json` 是语义绑定协议，不是最终布局树；允许为视觉需求增加包装容器，但语义目标必须绑定到正确的交互/断言元素。
- 每个 inline SVG 必须包含 `<title>` 作为第一个子元素（已满足）。
- 不使用 emoji 作为 UI 图标（已满足）。
- 不将 HTML 中的示例数据作为默认种子数据；App 首次启动应为空状态。
- 不引入 spec 之外的功能行为。

## 6. 语义变更请求

无。

---

*对齐计划版本：v1.0*  
*日期：2026/06/23*
