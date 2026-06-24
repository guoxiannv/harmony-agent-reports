# 今天吃什么 — Product Spec

## Classification

CONCRETE — the user provided a clear app concept with four core feature areas and an explicit build/validation expectation (handled by downstream execution/QA lanes).

## Value Proposition

A friendly, single-tap decision helper that ends the daily "今天吃什么" dilemma. It turns a fridge inventory, a mood, or a moment of indecision into a concrete dish recommendation, then lets the user record what they ate and share it as a pretty card.

## Product Category & Primary User Scenario

- **Category**: Lifestyle / food decision helper + light habit tracker.
- **Primary scenario**: A user opens the app before a meal, quickly gets a dish suggestion, optionally records the meal, and can share the result.
- **Secondary scenario**: User has leftover ingredients and wants a recommendation constrained by what is already in the fridge.

## Core Jobs-to-be-Done

1. **Spin for a dish** — one-tap random wheel to decide a meal when the user has no preference.
2. **Cook from the fridge** — input available ingredients and get a ranked dish recommendation that uses them.
3. **Match mood & moment** — filter recommendations by mood (e.g., 想吃好的, 清淡, 重口味) and meal time (早餐 / 午餐 / 晚餐 / 夜宵).
4. **Log daily meals** — record what was eaten today with one tap from a recommendation, plus optional note.
5. **Share a meal card** — generate a stylized share card for the current logged meal and copy/export it.

## Target Device

- 屏幕分辨率：1272vp × 2756vp（宽 × 高）
- 设备类型：普通手机（非折叠机、非平板）
- 像素密度倍率：3x（即 HTML 设计稿 390px = 设备上 1170vp 物理像素，但 ArkTS 使用 vp 单位时 1px ≈ 1vp）
- 布局策略：内容区 max-width 约束在 390–420vp 内居中，禁止全宽铺满。**注意：Tab 导航栏等必须在底部，且若使用 `position: fixed` 必须限制宽度与 body 一致（如 `width: 100%; max-width: 390px; margin: 0 auto; left: 0; right: 0;`），严禁在 PC 浏览器上全宽拉伸。严禁生成在侧边（如右边/左边）。**
- 特殊注意：2756px 高度意味着屏幕很长，滚动区域充足，但需确保首屏关键内容（Header + 核心卡片）在顶部 600vp 内可见。

## Page Structure

| Page ID | Route | Tab | Purpose |
|---------|-------|-----|---------|
| `home-page` | `pages/Home` | `tab-home` | Decision hub: spin wheel, current recommendation, quick filters. |
| `fridge-page` | `pages/Fridge` | `tab-fridge` | Ingredient inventory + recommend-by-ingredients. |
| `mood-page` | `pages/Mood` | `tab-mood` | Mood / time filters and matching dish list. |
| `log-page` | `pages/Log` | `tab-log` | Daily meal log and history. |
| `share-card-sheet` | — | — | Modal/sheet for generating and sharing the meal card (launched from log or home). |

## Navigation Model

- Bottom tab bar with four tabs: Home, Fridge, Mood, Log.
- Share Card is a full-screen sheet/modal, not a tab.
- All primary flows are reachable within 2 taps from the tab bar.

## Data Source Strategy

- **Local-only by default**. Dish library, ingredient catalog, mood tags, and daily logs are stored in local app preferences / lightweight local storage.
- **No mandatory network API** for v1.
- **No seeded demo data by default**. The app ships empty; users add ingredients themselves or use the wheel with a default dish list that is hard-coded as fallback behavior, not sample seed data.
- **Share card output** is rendered locally and exported as an image via the platform share sheet / clipboard image.

## Component Structure

- **WheelComponent**: canvas/graphics wheel with spin animation, result pointer, and highlight sector.
- **DishCard**: recommendation card showing dish name, tags, time estimate, ingredient overlap.
- **IngredientInputChip**: add/remove ingredient chips with autocomplete from local catalog.
- **FilterChips**: mood and time selectors.
- **LogEntryRow**: compact daily entry with dish, time, note, share trigger.
- **ShareCardRenderer**: stylized card preview with dish name, date, decorative food illustration placeholder, and export action.
- **BottomTabBar**: four-item tab navigation.

## Constraints

- Must work offline.
- Must preserve all semantic IDs defined in `ui-tree.json`.
- Wheel animation must be interruptible and produce deterministic result after spin.
- Share card must render within the device viewport and be exportable as image.

## Non-Goals

- Social feed, accounts, or backend sync.
- Recipe detail cooking steps (only ingredient list and rough time).
- Restaurant / delivery integration.
- Complex dietary restrictions beyond the provided mood/filter tags.

## Acceptance Criteria

1. Home screen shows a tappable wheel and a result area; spinning produces a dish name.
2. Fridge screen lets user add ingredients and receive a dish ranked by overlap.
3. Mood screen lets user pick mood + time and see a filtered dish list; tapping a dish logs it.
4. Log screen lists today’s meals; each entry has a share button that opens the share-card sheet.
5. Share-card sheet previews a card and has a primary export/share action.
6. Bottom tab navigation switches between Home, Fridge, Mood, Log.

## Open Questions / Change Requests

- None at design-lane start. Any gaps discovered during visual design will be recorded as change requests in the design alignment plan.
