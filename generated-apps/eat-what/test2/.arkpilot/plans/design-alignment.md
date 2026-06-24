# 今天吃什么 - 视觉对齐计划

## 1. Visual Inputs

- **Semantic UI Protocol**: `.arkpilot/designs/ui-tree.json`
- **Final Design Spec**: `.arkpilot/designs/DESIGN2.md`
- **HTML Artifacts**:
  - `.arkpilot/designs/page-home.html`
  - `.arkpilot/designs/page-wheel.html`
  - `.arkpilot/designs/page-ingredients.html`
  - `.arkpilot/designs/page-filter.html`
  - `.arkpilot/designs/page-records.html`
  - `.arkpilot/designs/page-record-form.html`
  - `.arkpilot/designs/page-share-card.html`
- **Route-worthy Pages**: home, wheel, ingredients, filter, records, record-form, share-card

## 2. Semantic UI Binding

### Surfaces / Routes / Tabs

| Surface ID | Page ID | Route | Tab ID |
|------------|---------|-------|--------|
| home | home | pages/Home | tab-home |
| wheel | wheel | pages/Wheel | - |
| ingredients | ingredients | pages/Ingredients | tab-ingredients |
| filter | filter | pages/Filter | - |
| records | records | pages/Records | tab-records |
| record-form | record-form | pages/RecordForm | - |
| share-card | share-card | pages/ShareCard | - |

### Action / Input / Assertion IDs

#### Home Page (`page-home.html`)
- `home-title` → 顶部日期/问候文本
- `home-quick-wheel-button` → "转一转" 主 CTA 按钮
- `home-filter-button` → 筛选入口图标按钮
- `home-recommend-list` → 推荐菜谱列表容器
  - item pattern: `home-dish-{id}`
- `home-empty-recommendations` → 无推荐空状态
- `home-today-record-status` → 今日打卡状态标签
- `home-add-record-button` → 右下角悬浮打卡按钮

#### Wheel Page (`page-wheel.html`)
- `wheel-back-button` → 左上角返回按钮
- `wheel-title` → 页面标题
- `wheel-canvas` → 转盘可视化区域
- `wheel-spin-button` → 转盘中心"开始"按钮
- `wheel-result-name` → 结果弹窗菜名文本
- `wheel-result-accept-button` → "就吃这个"
- `wheel-result-reshuffle-button` → "再转一次"
- `wheel-share-button` → 右上角分享按钮

#### Ingredients Page (`page-ingredients.html`)
- `ingredients-title` → 页面标题
- `ingredients-input` → 食材输入框
- `ingredients-add-button` → 添加食材按钮
- `ingredients-list` → 食材标签列表
  - item pattern: `ingredient-{id}`
- `ingredients-empty-state` → 无食材空状态
- `ingredient-delete-button` → 食材项删除按钮
- `ingredients-recommend-button` → "看看能做什么"
- `ingredients-dish-list` → 基于食材的推荐列表
  - item pattern: `ingredients-dish-{id}`
- `ingredients-empty-recommendations` → 无匹配菜谱空状态

#### Filter Page (`page-filter.html`)
- `filter-back-button` → 返回按钮
- `filter-mood-group` → 心情胶囊组
- `filter-time-group` → 时间胶囊组
- `filter-meal-group` → 餐别胶囊组
- `filter-apply-button` → 应用筛选按钮
- `filter-reset-button` → 重置按钮

#### Records Page (`page-records.html`)
- `records-title` → 页面标题
- `records-calendar` → 打卡日历组件
- `records-add-button` → 新增打卡按钮
- `records-list` → 打卡记录列表
  - item pattern: `record-{id}`
- `records-empty-state` → 无记录空状态
- `record-share-button` → 单条记录分享按钮

#### Record Form Page (`page-record-form.html`)
- `record-form-date-picker` → 日期选择
- `record-form-meal-group` → 餐别胶囊组
- `record-form-dish-input` → 菜名输入框
- `record-form-rating` → 满意度评分
- `record-form-note-input` → 备注输入框
- `record-form-save-button` → 保存按钮
- `record-form-cancel-button` → 取消按钮

#### Share Card Page (`page-share-card.html`)
- `share-card-preview` → 卡片预览区域
- `share-card-save-button` → 保存到相册按钮
- `share-card-close-button` → 关闭按钮

### Event Names

`open-wheel`, `open-filter`, `apply-filter`, `reset-filter`, `spin-wheel`, `accept-result`, `reshuffle`, `add-ingredient`, `delete-ingredient`, `show-ingredient-recommendations`, `open-add-record`, `save-record`, `cancel-record`, `open-share-card`, `save-share-card`, `close-share-card`, `navigate-back`

## 3. Visual Requirements

### Global Tokens
- **Background**: `#FAF8F5` (light), `#0F0F0F` (dark immersive)
- **Card**: `#FFFFFF`, radius 20px, shadow `0 12px 32px rgba(0,0,0,0.06)`
- **Primary CTA Gradient**: `linear-gradient(135deg, #FF6B35 0%, #FF8A5B 100%)`
- **Primary Text**: `#1A1A1A`
- **Secondary Text**: `#4A4A4A`
- **Tertiary Text**: `#8A8A8A`
- **Accent Colors**: 暖橙 `#FF6B35`, 薄荷青 `#3DD9C0`, 奶酪黄 `#FFC93D`, 莓红 `#FF4D6D`, 芋泥紫 `#9B7EDE`

### Typography
- Page title: 28px/700
- Section title: 20px/700 or 18px/700
- Card title: 16px/600
- Body: 15px/400
- Caption/Tag: 12px-13px

### Spacing
- Horizontal page padding: 20px
- Card internal padding: 16-20px
- Card gap: 12-16px
- Section gap: 20-32px
- Bottom safe area reserved for Tab Bar: 64px + safe inset

### Bottom Tab Bar (home / ingredients / records)
- Background: `rgba(255, 248, 245, 0.86)` + `backdrop-filter: blur(24px)`
- Height: 64px
- 3 tabs equal width
- Active color: `#FF6B35`; Inactive: `#8A8A8A`
- Fixed to bottom, constrained to body max-width 390px

### Per-Page Polish Notes

#### Home
- Hero top section: dark gradient `linear-gradient(160deg, #1C1C1E 0%, #0F0F0F 100%)`, height ~260px, border-radius 0 0 28px 28px.
- "转一转" button: gradient pill with shadow and rotate icon.
- Recommend list cards: thumbnail + name + meta tags.
- Floating record button: 52px circle, gradient, shadow, bottom 84px, right 20px.

#### Wheel
- Full-screen dark background.
- Wheel diameter: 340px (max 360px), centered.
- Wheel segments: 8 sections with alternating warm gradients.
- Pointer: white triangle at top center.
- Center button: 88px circle, gradient, pulse ring shadow.
- Result sheet: bottom sheet `#1C1C1E`, radius 28px 28px 0 0, contains dish thumb, name, desc, two action buttons.

#### Ingredients
- Input card with inline text input + add button.
- Ingredient chips: white pill with delete X.
- Recommend button: gradient pill in section header.
- Dish list cards with match percentage bar.

#### Filter
- Grouped cards for mood / time / meal.
- Chips default vs selected states with distinct colors per category.
- Bottom fixed action bar with primary "应用筛选" and secondary "重置".

#### Records
- Calendar card with month header, weekday grid, day dots for recorded days.
- Record cards: thumbnail, dish name, meal label, note, star rating, share button.

#### Record Form
- Stacked form rows in white card.
- Date picker, meal chips, dish input, star rating, note textarea.
- Bottom action bar with save/cancel.

#### Share Card
- Dark background, card preview centered.
- Card aspect ratio 3:4, rounded 28px, gradient dark surface.
- Hero icon block, dish name, desc, date/meal, brand + QR placeholder.
- Single "保存到相册" primary button at bottom.

### HTML-to-ArkUI Mapping Notes
- HTML `div.card` → ArkUI `Column` + `backgroundColor` + `borderRadius` + `shadow`.
- HTML chip groups → `List`/`Flex` of custom `Chip` components with selected state.
- Wheel canvas → custom `Canvas` component or `Stack` with rotated segments.
- Bottom sheet → `Sheet` or `Panel` with slide-up animation.
- Calendar grid → `Grid` with 7 columns and day cells.
- Rating stars → `Row` of `Image`/`SymbolGlyph` with click handlers.

## 4. Non-Negotiable Constraints

1. Do not change semantic IDs, page IDs, routes, tab IDs, or action event names silently.
2. Treat HTML artifacts as the final visual reference.
3. Treat `.arkpilot/designs/ui-tree.json` as a semantic binding protocol, not a layout tree.
4. Final ArkTS page/component structure should follow HTML/design-alignment artifacts, while binding semantic IDs to the correct interactive and assertion targets.
5. Do not add feature behavior, data model changes, or scaffold assumptions here unless recorded as change requests.
6. Target device: 1272vp × 2756vp phone, content max-width 390-420vp centered, bottom Tab Bar only.
7. No emoji or pictographic Unicode as UI icons; use SVGs with contextual `<title>` tags.
8. First-run state should be empty unless spec explicitly requires seeded demo data.

## 5. Semantic Change Requests

None. All semantic targets from `ui-tree.json` are preserved in the visual design and HTML artifacts.
