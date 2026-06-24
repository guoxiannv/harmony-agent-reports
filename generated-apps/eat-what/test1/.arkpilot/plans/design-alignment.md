# 今天吃什么 - 设计对齐计划

## 1. 视觉输入

- **语义 UI 协议**: `.arkpilot/designs/ui-tree.json`
- **最终视觉设计**: `.arkpilot/designs/DESIGN2.md`
- **HTML 设计稿**:
  - `.arkpilot/designs/page-home-page.html`
  - `.arkpilot/designs/page-ingredients-page.html`
  - `.arkpilot/designs/page-discover-page.html`
  - `.arkpilot/designs/page-checkin-page.html`
  - `.arkpilot/designs/page-share-card-page.html`
  - `.arkpilot/designs/page-dish-detail-page.html`
  - `.arkpilot/designs/page-profile-page.html`
  - `.arkpilot/designs/page-checkin-form-sheet.html`
  - `.arkpilot/designs/page-wheel-settings-sheet.html`
- **路由页面清单**: home-page, ingredients-page, discover-page, checkin-page, share-card-page, dish-detail-page, profile-page, checkin-form-sheet, wheel-settings-sheet

## 2. Semantic UI Binding

### 页面/路由/Tab 映射
| pageId | route | tabId |
|--------|-------|-------|
| home-page | pages/Home | tab-home |
| ingredients-page | pages/Ingredients | tab-ingredients |
| discover-page | pages/Discover | tab-discover |
| checkin-page | pages/Checkin | tab-checkin |
| share-card-page | pages/ShareCard | - |
| dish-detail-page | pages/DishDetail | - |
| profile-page | pages/Profile | tab-profile |
| checkin-form-sheet | pages/CheckinForm | - |
| wheel-settings-sheet | pages/WheelSettings | - |

### 必须保留的语义 ID
| ID | 角色 | ArkTS 绑定建议 |
|----|------|----------------|
| home-spin-button | action | Button `.id('home-spin-button')`，点击触发 `spin-wheel` |
| home-wheel-result | assertion | Text `.id('home-wheel-result')`，绑定 `/wheel/selectedDish.name` |
| home-result-view-button | action | Button `.id('home-result-view-button')`，触发 `open-dish-detail` |
| home-spin-again-button | action | Button `.id('home-spin-again-button')`，触发 `spin-wheel` |
| home-wheel-settings-button | action | Icon/Button `.id('home-wheel-settings-button')`，触发 `open-wheel-settings` |
| home-quick-checkin-button | action | Button `.id('home-quick-checkin-button')`，触发 `open-checkin-form` |
| ingredients-input | input | TextInput `.id('ingredients-input')` |
| ingredients-add-button | action | Button `.id('ingredients-add-button')`，触发 `add-ingredient` |
| ingredients-list | list | List/Flow `.id('ingredients-list')`，item pattern `ingredient-item-{id}` |
| ingredients-clear-button | action | Button `.id('ingredients-clear-button')`，触发 `clear-ingredients` |
| ingredients-recommend-list | list | List `.id('ingredients-recommend-list')`，item pattern `ingredients-dish-{id}` |
| ingredients-recommend-checkin-button | action | Button `.id('ingredients-recommend-checkin-button')`，触发 `open-checkin-form` |
| discover-mood-filter | input | 标签组 `.id('discover-mood-filter')`，绑定 `selectedMoods` |
| discover-time-filter | input | 标签组 `.id('discover-time-filter')`，绑定 `selectedTimes` |
| discover-reset-button | action | Button `.id('discover-reset-button')`，触发 `reset-filters` |
| discover-result-list | list | Grid/List `.id('discover-result-list')`，item pattern `discover-dish-{id}` |
| checkin-add-button | action | Button `.id('checkin-add-button')`，触发 `open-checkin-form` |
| checkin-today-count | assertion | Text `.id('checkin-today-count')`，绑定 `/checkin/todayCount` |
| checkin-today-calories | assertion | Text `.id('checkin-today-calories')`，绑定 `/checkin/todayCalories` |
| checkin-timeline-list | list | List `.id('checkin-timeline-list')`，item pattern `checkin-item-{id}` |
| checkin-edit-button | action | Button `.id('checkin-edit-button')`，触发 `edit-checkin` |
| checkin-delete-button | action | Button `.id('checkin-delete-button')`，触发 `delete-checkin` |
| checkin-share-button | action | Button `.id('checkin-share-button')`，触发 `open-share-card` |
| share-card-preview | assertion | 卡片容器 `.id('share-card-preview')`，绑定 `/share/cardData` |
| share-template-selector | input | 模板选择 `.id('share-template-selector')`，绑定 `/share/selectedTemplate` |
| share-save-button | action | Button `.id('share-save-button')`，触发 `save-card` |
| share-share-button | action | Button `.id('share-share-button')`，触发 `share-card` |
| dish-detail-title | assertion | Text `.id('dish-detail-title')`，绑定 `/dish/name` |
| dish-detail-checkin-button | action | Button `.id('dish-detail-checkin-button')`，触发 `open-checkin-form` |
| dish-detail-share-button | action | Button `.id('dish-detail-share-button')`，触发 `open-share-card` |
| profile-custom-dishes-list | list | List `.id('profile-custom-dishes-list')`，item pattern `profile-custom-dish-{id}` |
| profile-add-custom-dish-button | action | Button `.id('profile-add-custom-dish-button')`，触发 `add-custom-dish` |
| profile-clear-data-button | action | Row/Button `.id('profile-clear-data-button')`，触发 `clear-all-data` |
| checkin-form-meal-picker | input | 餐别选择 `.id('checkin-form-meal-picker')`，绑定 `/checkinForm/meal` |
| checkin-form-dish-search | input | TextInput `.id('checkin-form-dish-search')`，绑定 `/checkinForm/dishQuery` |
| checkin-form-note-input | input | TextArea `.id('checkin-form-note-input')`，绑定 `/checkinForm/note` |
| checkin-form-submit-button | action | Button `.id('checkin-form-submit-button')`，触发 `submit-checkin` |
| checkin-form-cancel-button | action | Button `.id('checkin-form-cancel-button')`，触发 `cancel-checkin-form` |
| wheel-settings-input | input | TextInput `.id('wheel-settings-input')` |
| wheel-settings-add-button | action | Button `.id('wheel-settings-add-button')`，触发 `add-wheel-dish` |
| wheel-settings-list | list | List `.id('wheel-settings-list')`，item pattern `wheel-settings-dish-{id}` |
| wheel-settings-reset-button | action | Button `.id('wheel-settings-reset-button')`，触发 `reset-wheel-dishes` |

### 事件名称
`spin-wheel`, `open-dish-detail`, `open-wheel-settings`, `add-wheel-dish`, `reset-wheel-dishes`, `add-ingredient`, `clear-ingredients`, `filter-mood`, `filter-time`, `reset-filters`, `open-checkin-form`, `submit-checkin`, `cancel-checkin-form`, `edit-checkin`, `delete-checkin`, `open-share-card`, `select-template`, `save-card`, `share-card`, `add-custom-dish`, `clear-all-data`

### 重复项 ID 策略
- `ingredient-item-{id}`: 冰箱食材标签
- `ingredients-dish-{id}`: 食材推荐菜品卡片
- `discover-dish-{id}`: 发现页筛选结果
- `checkin-item-{id}`: 打卡时间轴条目
- `profile-custom-dish-{id}`: 我的页自定义菜品
- `wheel-settings-dish-{id}`: 转盘设置自定义菜品

### 空状态 ID
- `ingredients-empty-state`
- `ingredients-recommend-empty-state`
- `discover-empty-state`
- `checkin-empty-state`
- `profile-custom-dishes-empty-state`
- `wheel-settings-empty-state`

## 3. 视觉要求

### 色彩 token
- 页面背景: `#FDF8F3`
- 卡片背景: `#FFFFFF`
- 主标题: `#1A1A1A`
- 正文: `#4A4A4A`
- 辅助/占位: `#A8A29E`
- 主强调: `#D97736`
- 主渐变: `linear-gradient(145deg, #F2A864 0%, #D97736 100%)`
- 标签背景未选中: `#FFF5ED`
- 标签背景选中: `#D97736`
- 绿色系: `#4A9B8E` / `#E3F3F0` / `#147A6B`
- 黄色系: `#E4B84A` / `#FFF6D6` / `#A67C1A`
- 紫色系: `#8B7EC8` / `#F0EBFF` / `#6B5BAB`
- 红色系: `#C65D4F` / `#FBE8E6` / `#A8483C`

### 阴影与 elevation
- 悬浮卡片/转盘: `0 14px 36px rgba(217, 119, 54, 0.12)`
- 普通卡片: `0 8px 24px rgba(0,0,0,0.05)`
- 主按钮: `0 10px 26px rgba(217, 119, 54, 0.36)`
- 底部 Tab: `background: rgba(255,255,255,0.86); backdrop-filter: saturate(200%) blur(28px)`

### 圆角
- 大卡片: 24-28px
- 按钮: 18-20px
- 输入框: 16px
- 标签: 14px
- 小图标按钮: 14px

### 字体
- 标题: 800/700，紧凑行高
- 正文: 500，1.55 行高
- 辅助: 13px 500/600

### 首页
- 顶部暖色径向光晕背景（装饰，非语义）
- 转盘 300px 圆形，conic-gradient 6 色分区
- 指针在顶部，焦糖色
- 中心 "开始" 按钮 92px 圆形
- 结果卡片左侧 5px 色条

### 食材推荐页
- 输入框 + 圆形添加按钮
- 已选食材为暖色标签，带删除图标
- 推荐卡片展示匹配度条与热量

### 发现页
- 两排标签，可换行/滚动
- 结果网格 2 列
- 卡片顶部为彩色渐变封面

### 打卡页
- 顶部统计卡片使用焦糖渐变
- 时间轴左侧彩色餐别圆点
- 每条记录可编辑/删除

### 分享卡片页
- 卡片 300×420px，圆角 28px
- 装饰性圆形波纹（非语义）
- 模板切换为 64×64px 圆角缩略图
- 保存/分享按钮并排

### 菜品详情页
- Hero 区 260px 渐变
- 信息网格 3 列
- 食材清单为圆角标签
- 步骤卡片左侧数字圆圈
- 底部悬浮双按钮

### 我的页
- 用户信息卡片渐变背景
- 自定义菜品列表
- 清空数据入口

### Sheet 页
- 底部弹出，圆角 32px
- 半透明黑色遮罩
- 表单分组清晰

## 4. 非协商约束

- **不要** 修改语义 ID、pageId、route、tabId、事件名称。
- HTML 是最终视觉参考；ArkTS 实现应尽可能还原其布局、色彩、阴影、圆角。
- `ui-tree.json` 是语义绑定协议，不是最终布局树；允许为视觉需要增减布局容器，只要保留语义目标。
- 底部 Tab 必须固定在底部，宽度限制在 390px 居中，不能铺满 PC 浏览器宽度，不能在侧边。
- 内容区 max-width 390px，禁止全宽拉伸。
- 首屏 Header + 核心卡片必须在 600vp 内可见。
- 所有 inline SVG 必须包含 `<title>` 作为第一个子元素（HTML 中已满足）。
- HTML 中的示例数据仅供视觉参考，不成为默认种子数据；应用首次启动应为空状态。
- 本阶段不生成 HarmonyOS 源码或实现计划。

## 5. 语义变更请求

无。
