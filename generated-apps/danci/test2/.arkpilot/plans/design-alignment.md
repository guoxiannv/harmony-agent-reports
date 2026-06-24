# Design Alignment Plan

## 1. Visual Inputs

- **Semantic UI Protocol**: `.arkpilot/designs/ui-tree.json`
- **Final Design Artifact**: `.arkpilot/designs/DESIGN2.md`
- **HTML Artifact**: `.arkpilot/designs/page-study.html`
- **Route-worthy Pages**: `study` → `pages/Study` → `page-study.html`

## 2. Semantic UI Binding

### Surfaces
| Surface ID | Page ID | Route | Name |
|------------|---------|-------|------|
| study | study | pages/Study | 复习页 |

### Action / Input Targets
| Semantic ID | Required `.id(...)` | Event to emit |
|-------------|---------------------|---------------|
| study-flashcard | `study-flashcard` | `toggle-flip-card` |
| study-known-button | `study-known-button` | `mark-known` |
| study-unknown-button | `study-unknown-button` | `mark-unknown` |
| study-restart-button | `study-restart-button` | `restart-study` |

### Assertion / State Targets
| Semantic ID | Binding Path | Notes |
|-------------|--------------|-------|
| study-progress-header | `/study/progress` | 顶部毛玻璃进度头部容器 |
| study-remaining-count | `/study/remainingCount` | 剩余卡片数字 |
| study-known-count | `/study/knownCount` | 已认识卡片数字 |
| study-word-front | `/study/currentWord/english` | 卡片正面英文单词 |
| study-word-back-meaning | `/study/currentWord/meaning` | 卡片背面中文释义 |
| study-word-back-phonetic | `/study/currentWord/phonetic` | 卡片背面音标 |
| study-empty-state | `/study/isEmpty` | 词库为空时的提示容器 |
| study-completion-panel | `/study/isComplete` | 完成状态覆盖层 |
| study-completion-desc | `/study/knownCount` | 完成状态说明文本（已认识 X / Y 个单词） |

### Repeated Items
- 本应用为单卡片堆，无列表项重复模式。

### Events Summary
- `toggle-flip-card`：点击卡片触发 3D 翻转。
- `mark-known`：当前单词已认识，从队列移除，已认识数 +1。
- `mark-unknown`：当前单词不认识，移至队列底部。
- `restart-study`：完成后再复习一次，重置队列与统计。

## 3. Visual Requirements

### Color Tokens
- 页面背景：`#FAF8FF`（月光白）
- 主色：`#6B4EE6`（暮光紫）
- 深色文字：`#2D2A4A`（深靛）
- 认识按钮：`linear-gradient(135deg, #3DD9A0 0%, #2BC88E 100%)`
- 不认识按钮：`linear-gradient(135deg, #FF8C69 0%, #F57A54 100%)`
- 完成星星：`#FFD36E`（星尘金）
- 辅助灰：`#9B96B0` / `#6B6580`
- 分隔线：`#B8B0E6`（雾紫虚线）

### Typography
- 英文单词：`SF Pro Display`, 54px, weight 800, line-height 1.0, letter-spacing -0.6px
- 中文释义：`SF Pro Text`, 30px, weight 700, line-height 1.35
- 音标：18px, weight 500, color `#9B96B0`
- 页面标题：22px, weight 700, color `#6B4EE6`
- 按钮文字：17px, weight 700, white
- 进度数字：20px, weight 700
- 完成标题：40px, weight 800, color `#6B4EE6`

### Spacing & Layout
- 内容最大宽度：420px，居中。
- 页面水平内边距：24px。
- Header 顶部安全区：56px。
- 卡片顶部距 Header：48px，确保首屏核心内容在 600vp 内。
- 底部操作区固定，毛玻璃，圆角 24px 24px 0 0。
- 按钮高度 60px，圆角 22px，间距 14px。

### Card
- 尺寸：max-width 360px，height 460px。
- 圆角：36px。
- 背景：正面 `#FFFFFF`，背面 `#FBFAFF`。
- 边框：1px solid `rgba(107, 78, 230, 0.10)`。
- 阴影：双层柔和阴影（紫色/深靛两层）。
- 3D 翻转：800ms，`cubic-bezier(0.34, 1.56, 0.64, 1)`，使用 `preserve-3d` 与 `rotateY(180deg)`。

### Header
- 毛玻璃效果：`rgba(255,255,255,0.72)` + `backdrop-filter: blur(20px) saturate(180%)`。
- 底部圆角：24px。
- 左侧标题 + 星形图标；右侧“剩余 / 已认识”统计。
- 进度条高度 10px，圆角 5px，已完成部分使用暮光紫到精灵绿渐变。

### Action Bar
- 毛玻璃面板，底部固定，圆角 24px 24px 0 0。
- 两个渐变按钮：左“不认识”（暖橙粉），右“认识”（精灵绿）。
- 按钮带对应彩色阴影。

### Completion Overlay
- 全屏覆盖，径向渐变背景。
- 中央金色星星徽章，带阴影与浮动动画。
- 标题“太棒了！”，说明“已认识 X / Y 个单词”。
- 暮光紫渐变“再复习一次”按钮。
- 背景装饰：半透明小星星缓慢漂浮（decorative，无语义 ID）。

## 4. HTML-to-ArkUI Mapping Notes

- `div.app-shell` → ArkTS 外层 `Column` / `Stack`，限制 `maxWidth('420px')` 并居中。
- `.header` → 顶部 `Stack` 或 `Column`，使用 `backgroundBlurStyle` 或半透明背景 + `blur` 实现毛玻璃。
- `.flip-card` → ArkTS 自定义组件 `FlashCard`，外层 `Stack` 设置 `rotate({ y: isFlipped ? 180 : 0 })` 与动画；注意正面背面通过 `Visibility` 或 `opacity` + `rotate` 控制，避免背面文字在翻转前透显。
- `.flip-card-face` → `Stack` + `Column` 居中。
- `.action-bar` → 底部固定 `Stack` / `Column`，同样使用毛玻璃效果。
- `.completion-overlay` → 条件渲染的 `Stack` 覆盖全屏，背景渐变，子元素居中。
- SVG 图标 → ArkTS 中可使用 `Image` 组件加载 SVG 资源，或内联 `Svg`/`Path` 组件；标题/标签语义已在 HTML 中通过 `<title>` 表达，实现时保留对应 `alt` 或 `ariaLabel`。

## 5. Non-Negotiable Constraints

- 不得修改语义 ID、page ID、route 或事件名称。
- 必须保持 `study-flashcard` 点击触发 3D 翻转动画。
- 必须保持“认识”移除卡片、“不认识”放回队列底部的行为。
- 必须实时更新 `study-remaining-count` 与 `study-known-count`。
- 必须在队列空时显示 `study-completion-panel` 并提供 `study-restart-button`。
- 内容区 max-width 不得超过 420px，禁止全宽拉伸或侧边导航。
- 首屏 Header + 核心卡片必须在顶部 600vp 内可见。
- HTML 中的示例数据仅用于视觉参考，不强制作为应用默认种子数据。

## 6. Open Items / Change Requests

- 当前设计为单页面无导航。若后续需要阶段选择或词库管理，需在 ui-tree.json 中新增 surface 并同步更新设计文档。
- 已完成拆分：完成状态说明文本使用独立的 `study-completion-desc` 语义 ID，`study-empty-state` 保留给词库真正为空的场景。ui-tree.json、ui-behavior.json、StudyPage.ets 已同步更新。
