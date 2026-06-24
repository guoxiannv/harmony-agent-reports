# 童词卡（Kids Word Cards）视觉设计规范 v1

## 1. Visual Theme & Atmosphere

童词卡以“森林学习角”为视觉主题：温暖的木质感与清新的自然色调，让孩子在专注中感到安心。整体风格比初版更具辨识度，避免千篇一律的糖果色儿童模板。使用深青绿作为稳定感来源，蜜桃色与苔藓绿作为功能色，米白与纸白构建阅读层。

关键气质：
- 自然专注：低饱和绿、土黄、暖米白构成主色调。
- 微妙纹理：背景使用极淡的纸张纹理（CSS 模拟），增加质感。
- 大卡片主角：卡片如同一张放在书桌上的单词卡，阴影柔和，边缘圆润。
- 正向但不喧哗：成功反馈使用金色星星动画，整体保持安静优雅。

## 2. Color Palette & Roles

### Primary
- **纸白** (`#FDFBF7`)：页面主背景，带极暖米色调。
- **森林绿** (`#2D6A4F`)：主品牌色，用于标题、关键图标、进度完成部分。
- **深炭** (`#2B2D42`)：主要文字颜色。

### Accent
- **苔藓绿** (`#52B788`)：“认识”按钮、正向反馈。
- **蜜桃橙** (`#F4A261`)：“不认识”按钮，温和提示需要复习。
- **暖金黄** (`#E9C46A`)：成就徽章、星星、完成状态点缀。
- **天空蓝** (`#8AB6D6`)：次要强调，音标标签、装饰元素。

### Neutral
- **浅米** (`#F2F0EB`)：卡片与按钮底层、分隔区域。
- **中灰** (`#8D99AE`)：辅助文字、音标。
- **暖灰** (`#5A6470`)：次级正文。

### Surface & Elevation
- **卡片背景**：`#FFFFFF`
- **卡片阴影**：`rgba(43, 45, 66, 0.10) 0px 16px 48px -8px`
- **认识按钮阴影**：`rgba(82, 183, 136, 0.40) 0px 10px 28px 0px`
- **不认识按钮阴影**：`rgba(244, 162, 97, 0.40) 0px 10px 28px 0px`
- **悬浮卡片**：`rgba(43, 45, 66, 0.14) 0px 20px 56px -8px`

### State
- **认识按钮默认**：背景 `#52B788`，文字白色。
- **认识按钮按下**：背景 `#409A6D`，缩放 0.96。
- **不认识按钮默认**：背景 `#F4A261`，文字白色。
- **不认识按钮按下**：背景 `#D98A4B`，缩放 0.96。
- **完成状态背景**：径向渐变 `radial-gradient(circle at 50% 30%, #FFF9E6 0%, #FDFBF7 70%)`。

## 3. Typography Rules

### Font Family
- **Display / 英文单词**：`SF Pro Display`, `Helvetica Neue`, Arial, sans-serif
- **Body / 中文释义**：`SF Pro Text`, `PingFang SC`, `Microsoft YaHei`, sans-serif

### Hierarchy

| Role | Font | Size | Weight | Line Height | Letter Spacing | Color |
|------|------|------|--------|-------------|----------------|-------|
| 页面标题 | SF Pro Text | 24px | 700 | 1.25 | -0.3px | `#2D6A4F` |
| 英文单词 | SF Pro Display | 52px | 800 | 1.05 | -0.6px | `#2B2D42` |
| 音标 | SF Pro Text | 18px | 500 | 1.5 | 0.2px | `#8D99AE` |
| 中文释义 | SF Pro Text | 30px | 700 | 1.35 | 0px | `#2B2D42` |
| 按钮文字 | SF Pro Text | 17px | 700 | 1.0 | 0px | `#FFFFFF` |
| 进度数字 | SF Pro Display | 22px | 700 | 1.0 | -0.3px | `#2B2D42` |
| 进度标签 | SF Pro Text | 11px | 600 | 1.3 | 0.5px | `#8D99AE` |
| 完成标题 | SF Pro Display | 40px | 800 | 1.1 | -0.4px | `#2D6A4F` |
| 完成说明 | SF Pro Text | 16px | 500 | 1.55 | 0px | `#5A6470` |

## 4. Component Stylings

### FlashCard（核心翻转卡片）
- 尺寸：宽度 100%（max-width 360px），高度 440px。
- 背景：正面 `#FFFFFF`，背面 `#FFFEFA`（极淡暖白）。
- 圆角：32px。
- 阴影：卡片阴影 `rgba(43, 45, 66, 0.10) 0px 16px 48px -8px`。
- 边框：1px solid `rgba(45, 106, 79, 0.08)`，增强卡片边界。
- 正面布局：垂直居中，英文单词 52px 超粗体；顶部有小森林叶图标 + “点我翻面”标签。
- 背面布局：顶部是天空蓝圆角标签“释义”，中部音标，下部中文释义 30px 粗体，中间用森林绿细虚线分隔。
- 3D 翻转：600ms，`cubic-bezier(0.34, 1.56, 0.64, 1)`，轻微回弹。
- 点击热区：整张卡片。

### ProgressHeader（顶部进度）
- 顶部安全区，背景透明（页面背景即纸白）。
- 左侧：森林绿叶子 SVG + 页面标题“今日复习”。
- 右侧：两列统计，数字 22px 粗体，标签 11px 大写间距。
- 进度条：高度 10px，圆角 5px，背景 `#E8E6E1`，已完成部分使用森林绿到苔藓绿渐变 `linear-gradient(90deg, #2D6A4F 0%, #52B788 100%)`。

### ActionBar（底部按钮组）
- 卡片下方 36px，水平排列，两个按钮等宽。
- 左：“不认识”蜜桃橙按钮；右：“认识”苔藓绿按钮。
- 按钮高度 60px，圆角 20px，各自彩色阴影。
- 按钮内部左侧有一个小圆点装饰 + 文字，增强可识别性。
- 间距：两按钮之间 16px。

### CompletionOverlay（完成状态）
- 全屏覆盖，背景径向渐变。
- 中央：金色星星徽章（暖金黄）带森林绿描边 + “太棒了！”标题 + “已认识 X / Y 个单词”说明。
- 下方：再复习一次按钮，森林绿背景，白色文字，圆角 20px，高度 60px。
- 点缀：背景有随机分布的淡色小星星装饰（非语义元素）。

## 5. Layout Principles

### Spacing System
- 基础单位：8px
- 常用尺寸：8, 12, 16, 20, 24, 32, 40, 48, 64

### Container
- 页面最大宽度：420px，居中。
- 水平内边距：24px。
- 顶部安全区：60px。

### Vertical Rhythm
- Header：60px 高 + 28px 下边距。
- 卡片：距 Header 40px，垂直视觉中心偏上。
- 操作按钮：距卡片 36px。
- 完成覆盖层：全屏居中。

### Responsive
- 手机竖屏：单列，卡片宽度自适应。
- 大屏：保持 420px max-width 居中。

## 6. Depth & Elevation

| Level | Treatment | Use |
|-------|-----------|-----|
| Level 0 | 无阴影，纸白背景 | 页面底层 |
| Level 1 | 柔和长阴影 0px 16px 48px -8px 0.10 | FlashCard |
| Level 2 | 彩色按钮阴影 0px 10px 28px 0.40 | 主操作按钮 |
| Level 3 | 全屏覆盖层 + 径向渐变 | 完成状态 |

## 7. Interaction & Motion

- **卡片翻转**：600ms 3D 翻转，弹性缓动。
- **按钮按下**：scale(0.96)，150ms。
- **卡片切换**：当前卡片向按钮对应方向滑出（认识向右、不认识向左），下一张从下方淡入上移，350ms。
- **进度条**：宽度变化 300ms ease-out，颜色渐变随进度变化。
- **完成动画**：星星徽章从 0 缩放并旋转 15° 回正，600ms 弹性。

## 8. Semantic UI Binding

### Surfaces
| Surface ID | Page ID | Route | Name |
|------------|---------|-------|------|
| study | study | pages/Study | 复习页 |

### Semantic Targets
| Semantic ID | Role | Event / Binding |
|-------------|------|-----------------|
| study-progress-header | assertion | `/study/progress` |
| study-remaining-count | assertion | `/study/remainingCount` |
| study-known-count | assertion | `/study/knownCount` |
| study-flashcard | action | `toggle-flip-card` |
| study-word-front | assertion | `/study/currentWord/english` |
| study-word-back-meaning | assertion | `/study/currentWord/meaning` |
| study-word-back-phonetic | assertion | `/study/currentWord/phonetic` |
| study-known-button | action | `mark-known` |
| study-unknown-button | action | `mark-unknown` |
| study-empty-state | assertion | `/study/isEmpty` |
| study-completion-panel | assertion | `/study/isComplete` |
| study-restart-button | action | `restart-study` |

### Events
- `toggle-flip-card`
- `mark-known`
- `mark-unknown`
- `restart-study`

## 9. Do's and Don'ts

### Do
- 使用自然森林色系，营造专注感。
- 使用纸张纹理与柔和阴影提升质感。
- 让英文单词超大、超粗，成为绝对视觉焦点。
- 使用方向性卡片切换动画对应两个按钮。
- 保持“不认识”按钮温和（蜜桃橙而非正红）。

### Don't
- 不要使用荧光糖果色或卡通图案背景。
- 不要让卡片与页面背景对比过低。
- 不要让按钮过小，儿童点击困难。
- 不要在卡片上使用过多颜色分散注意力。
- 不要省略翻转动画或将其简化为淡入淡出。
