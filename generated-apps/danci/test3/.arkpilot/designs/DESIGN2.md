# WordFlip Kids 视觉设计系统（最终定稿版）

## 1. Visual Theme & Atmosphere

最终视觉方向是「阳光书桌上的彩色单词卡」。整体界面像孩子摊开一叠手工学习卡片：背景是柔和的暖米色桌面，卡片是纯白圆角索引卡，顶部贴着彩色标签条，按钮像两颗胖乎乎的彩色图钉。界面既不过于幼稚，也不会像成人工具那样冷峻。

氛围关键词：明亮、温暖、专注、有成就感。

## 2. Color Palette & Roles

### Backgrounds
- **Page Base** `#F5F0EA`：暖米色主背景。
- **Page Top Glow** `radial-gradient(ellipse 120% 60% at 50% 0%, rgba(255,255,255,0.85) 0%, rgba(245,240,234,0) 60%)`：顶部自然光晕。
- **Card Surface** `#FFFFFF`：卡片正反面。
- **Card Edge Glow** `inset 0 0 0 1px rgba(255,255,255,0.85)`：卡片边缘微亮。
- **Header Glass** `rgba(255,255,255,0.82)` + `backdrop-filter: saturate(160%) blur(24px)`。
- **Overlay Backdrop** `rgba(40, 36, 32, 0.50)` + `backdrop-filter: blur(5px)`。

### Primary Accents（三色和谐渐变）
- **Teal** `#0D9488`：主色，标题装饰、进度条、学习中状态点。
- **Sky** `#0EA5E9`：辅助蓝，与 Teal 渐变衔接。
- **Violet** `#8B5CF6`：点缀色，空状态与完成徽章光晕。
- **Gradient Primary** `linear-gradient(135deg, #0D9488 0%, #0EA5E9 55%, #8B5CF6 100%)`。
- **Gradient Decorative Line** `linear-gradient(90deg, #0D9488, #0EA5E9)`。

### Semantic Actions
- **Known** `linear-gradient(135deg, #22C55E 0%, #0D9488 100%)`，阴影 `0 10px 28px rgba(13, 148, 136, 0.35)`。
- **Unknown** `linear-gradient(135deg, #FB923C 0%, #F97316 100%)`，阴影 `0 10px 28px rgba(249, 115, 22, 0.35)`。
- **Known Active** `#047857`。
- **Unknown Active** `#C2410C`。

### Text
- **Heading** `#1E293B`
- **Meaning** `#0F172A`
- **Body / Phonetic** `#475569`
- **Muted** `#94A3B8`
- **On Gradient** `#FFFFFF`

### Decorative
- **Sticker Mint** `#CCFBF1`：卡片顶部标签条。
- **Empty Violet Circle** `#EDE9FE`：空状态图标背景。
- **Completion Glow** `0 18px 48px rgba(139, 92, 246, 0.32)`：完成徽章光晕。

## 3. Typography Rules

- 标题：`Nunito`, `PingFang SC`, `HarmonyOS Sans SC`。
- 音标：`Inter`, `SF Mono`, `monospace` fallback。

| Role | Size | Weight | Line Height | Letter Spacing |
|------|------|--------|-------------|----------------|
| Page Title | 30px | 800 | 1.15 | -0.6px |
| Progress Number | 24px | 800 | 1.0 | -0.5px |
| Progress Label | 11px | 700 | 1.3 | 0.4px |
| Flashcard Word | 54px | 800 | 1.08 | -1.2px |
| Flashcard Meaning | 34px | 700 | 1.35 | 0px |
| Flashcard Phonetic | 20px | 500 | 1.45 | 0.6px |
| Button Text | 17px | 800 | 1.0 | 0.3px |
| Empty Title | 22px | 800 | 1.3 | -0.3px |
| Empty Body | 15px | 600 | 1.55 | 0px |
| Completion Title | 30px | 800 | 1.15 | -0.6px |
| Completion Number | 60px | 800 | 1.0 | -1.2px |

## 4. Component Stylings

### 3D Flashcard
- 宽 `min(330px, 80vw)`，高 `440px`，圆角 28px。
- 正面：白色背景，顶部 8px 高 Gradient Decorative Line，右上角 32px 圆形翻转提示贴纸 `#E0F2FE`，内嵌循环箭头 SVG。
- 背面：顶部同装饰线；中间 1px `#F1F5F9` 分隔线将释义区与音标区分开。
- 阴影：`0 24px 60px rgba(30,41,59,0.09), 0 10px 24px rgba(30,41,59,0.05), inset 0 0 0 1px rgba(255,255,255,0.85)`。
- 透视 `1400px`，翻转 `rotateY(180deg)`，550ms，cubic-bezier(0.34,1.56,0.64,1)。

### Buttons
- 双按钮横向排列，高度 60px，圆角 20px，阴影同色系弥散。
- 文字白色，17px，weight 800。
- 按下 scale 0.96，150ms。

### Progress Header
- 毛玻璃胶囊，圆角 22px，内边距 18px 22px。
- 左侧标题旁 8px 青绿状态点。
- 右侧两个统计小卡片，白底、14px 圆角、轻微阴影。

### Completion Overlay
- 遮罩半透黑 + 模糊。
- 弹窗白底，32px 圆角，宽度 `min(330px, 82vw)`。
- 顶部 80px 渐变徽章 + 紫色光晕，内嵌对勾 SVG。
- 「再学一次」按钮使用 Gradient Primary。

### Empty State
- 120px 淡紫圆图标背景，打开的书本 SVG。
- 标题 + 说明文字居中。

## 5. Layout Principles

- 内容区 max-width 390px，水平 padding 20px，居中。
- Header 距顶 20px（含安全区），与卡片间距 32px。
- 卡片与按钮组间距 32px，按钮间距 16px。
- 首屏 Header + 卡片顶部在 600vp 内可见。

## 6. Depth & Elevation

| Level | Treatment |
|-------|-----------|
| Page | 暖米色 + 顶部径向光晕 |
| Header | 毛玻璃 + 白边框 |
| Card | 双弥散阴影 + 内发光 |
| Buttons | 彩色弥散阴影 |
| Overlay | 半透明遮罩 + 大圆角卡片 + 紫色光晕 |

## 7. Motion & Interaction

- 3D 翻转：550ms ease-out-back。
- 按钮按下：scale 0.96 / 150ms。
- 卡片切换：当前右滑淡出，下一张右滑淡入，320ms。
- 进度数字：scale 弹跳 220ms。
- 完成弹窗：遮罩 fade 200ms，弹窗 scale 0.88→1 + opacity 380ms ease-out-back。

## 8. Semantic UI Binding

保持与 `ui-tree.json` 完全一致：

| Semantic ID | Visual Control | Binding / Event |
|-------------|----------------|-----------------|
| `review-title` | 页面标题 | `pageTitle` |
| `review-remaining-count` | 剩余统计数字 | `remainingCount` |
| `review-correct-count` | 答对统计数字 | `correctCount` |
| `review-flashcard` | 3D 翻转卡片 | `currentWord`, event `toggle-flip` |
| `review-word-front` | 正面英文单词 | `currentWord.english` |
| `review-word-back-meaning` | 背面中文释义 | `currentWord.meaning` |
| `review-word-back-phonetic` | 背面音标 | `currentWord.phonetic` |
| `review-known-button` | 绿色「认识」按钮 | event `mark-known` |
| `review-unknown-button` | 橙色「不认识」按钮 | event `mark-unknown` |
| `review-empty-state` | 空状态视图 | `isQueueEmpty` |
| `review-completion-overlay` | 完成覆盖层 | `isComplete` |
| `review-restart-button` | 「再学一次」按钮 | event `restart-review` |

## 9. Final Responsive Notes

- 390px 内容区居中，PC 上两侧留白。
- 卡片宽度 80vw 约束，保证小屏边距。
- 无 Tab、无侧栏，单页流程。

## 10. Do's and Don'ts

### Do
- 保持暖米色背景与三色渐变点缀。
- 卡片必须带有真实厚度：双阴影 + 内发光 + 圆角。
- 按钮使用渐变 + 同色系阴影。
- 不认识按钮使用暖橙，避免红色。
- 给完成状态一个庆祝感徽章与光晕。

### Don't
- 不要全宽拉伸或侧栏导航。
- 不要让卡片扁平无阴影。
- 不要使用单一纯色按钮。
- 不要在默认状态展示背面释义。
