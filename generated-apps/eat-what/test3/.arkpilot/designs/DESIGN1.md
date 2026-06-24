# 今天吃什么 — 视觉设计系统 v1.1

## 1. Visual Theme & Atmosphere

本次升级为「食帖手账」风格：在奶油纸质感基础上加入轻微的杂志排版感，让界面更像一页可翻阅的美食手账。色彩上不再只用单一番茄红，而是构建一套协调的「食物色谱」——番茄、牛油果、蛋黄、焦糖、紫薯、薄荷——每种颜色只出现在对应语义位置，整体高级而不杂乱。

### 设计关键词
- 食帖手账、奶油纸、食物色谱、柔和投影、玻璃浮岛、圆润饱满、微动效。

## 2. Semantic UI Binding

同 DESIGN.md，无变更：
- Surfaces: home-page / pantry-page / check-in-page / profile-page / result-page / check-in-editor-page / share-card-page
- Action/Input/Assertion IDs: 全部保留
- Event names: 全部保留

## 3. Color Palette & Roles（升级版）

### Page Backgrounds
- **Cream** `#FFF8F0`：主背景。
- **Cream Dark** `#F3ECE1`：次级背景、输入框、分组背景。
- **Espresso** `#2E2B28`：深色 Hero、分享卡片主题色。

### Food Spectrum（食物色谱）
| 颜色名 | 色值 | 用途 |
|--------|------|------|
| Tomato | `#E85D4E` | 主 CTA、转盘指针、首页强调 |
| Avocado | `#7CAE7A` | 健康标签、成功态、食材页强调 |
| Yolk | `#F2B134` | 时间标签、评分、次级强调 |
| Caramel | `#C47D4C` | 文本强调、难度标签 |
| Taro | `#A68CC6` | 心情标签「治愈」、装饰 |
| Mint | `#7DD3C0` | 心情标签「清爽」、装饰 |
| Berry | `#D67A94` | 心情标签「解馋」、装饰 |

### Semantic Surfaces
- **Primary Button**: 背景 `linear-gradient(180deg, #E85D4E 0%, #D64F42 100%)`，文字白。
- **Secondary Button**: 白底 + 1.5px `#E8DDD1` 边框 + `#2E2B28` 文字。
- **Mood Tag Active**: 不同心情对应不同浅色调（放纵=Tomato 10%、健康=Avocado 10%、快手=Yolk 10%、治愈=Taro 10%、清爽=Mint 10%、解馋=Berry 10%），文字用对应深色。
- **Time Chip Active**: `#2E2B28` 背景，白色文字。
- **Card**: 白底，`rgba(46,43,40,0.08) 0 10px 32px` 阴影，圆角 24px。

### Text
- **Primary**: `#2E2B28`
- **Secondary**: `#6D6761`
- **Tertiary**: `#A9A29B`
- **On Dark**: `#FFF8F0`

## 4. Typography

| 角色 | 尺寸 | 字重 | 行高 |
|------|------|------|------|
| Display | 38px | 800 | 1.12 |
| H1 | 26px | 700 | 1.25 |
| H2 | 20px | 600 | 1.3 |
| Body | 16px | 400 | 1.55 |
| Body Bold | 16px | 600 | 1.55 |
| Caption | 14px | 400 | 1.45 |
| Micro | 12px | 500 | 1.35 |

## 5. Components（升级版）

### Primary Button
- 高度 54px，圆角 18px。
- 背景：番茄红渐变 + 顶部 1px 高光 `rgba(255,255,255,0.2)`。
- 阴影：`rgba(232, 93, 78, 0.28) 0 10px 24px`。
- 文字：白，16px，字重 600。

### Filter Tag / Mood Tag
- 圆角 14px，高度 38px。
- Inactive：白底 + 1px `#E8DDD1` 边框 + `#6D6761` 文字。
- Active：彩色浅底（按情绪）+ 无框 + 对应深文字。
- 点击时有轻微 scale(0.97) 反馈。

### Time Chip
- 胶囊形（圆角 999px）。
- Inactive：白底 + 1px `#E8DDD1`。
- Active：Espresso 底 + 白字 +  subtle inner shadow。

### Input
- 背景 `#F3ECE1`，圆角 16px，高度 54px。
- 聚焦：边框 2px `#E85D4E`，内发光 `rgba(232,93,78,0.08) 0 0 0 4px`。

### Card
- 白底，圆角 24px。
- 阴影：`rgba(46,43,40,0.08) 0 10px 32px 0`。
- 内部布局 20px padding。

### Wheel
- 直径 320px，圆环 32px。
- 分区颜色循环使用食物色谱（Tomato/Avocado/Yolk/Caramel/Taro/Mint/Berry/Cream Dark）。
- 指针：Tomato 倒三角，带阴影。
- 中心：白底圆形，投影强调。

### Bottom Tab Bar（浮岛玻璃）
- 背景：`rgba(255, 248, 240, 0.94)` + `backdrop-filter: blur(24px)`。
- 顶部圆角 28px，内部安全区 padding。
- 阴影：`rgba(46,43,40,0.08) 0 -6px 24px`。
- 选中图标颜色 `#E85D4E`，未选中 `#A9A29B`。

## 6. Layout

- 页面水平内边距 22px。
- 内容最大宽度 390px，居中。
- 卡片间距 18px。
- 首屏 600vp 内必须看到标题 + 核心转盘或卡片。

## 7. Page-by-Page Visual Notes

### home-page
- 顶部：品牌名「今天吃什么」+ 右侧日期胶囊（Cream Dark 底）。
- 心情标签横向滚动；时间胶囊横向滚动。
- 转盘占位区 360×360，居中。
- 结果区：当转盘停止，菜名以 Display 尺寸弹入，下方「查看详情」文字按钮。
- 底部：「开始转盘」主按钮 + 「冰箱食材推荐」次级按钮。

### pantry-page
- 标题「冰箱有什么」。
- 输入框 + 添加按钮（圆形番茄红）。
- 食材标签云：彩色小圆点 + 文字 + 删除 X。
- 推荐按钮：全宽主按钮。
- 结果列表：垂直卡片，左图/色块占位 + 右信息。

### check-in-page
- 顶部统计卡：连续打卡天数（大数字）+ 总次数（小字）。
- 日期分组：粘性日期标题（Cream Dark 底）。
- 记录项：左色条（按餐别）+ 餐别 + 菜名 + 心情标签 + 删除按钮。
- FAB：右下角 56px 番茄红圆形 + 加号。

### profile-page
- 头部：用户头像占位 + 昵称 + 连续打卡徽章。
- 统计网格：连续打卡、总打卡、本月最爱、本周菜数。
- 设置列表：标准列表项。

### result-page
- 深色 Hero：Espresso 渐变背景，菜名 Display 居中，标签胶囊。
- 卡片：食材清单（Avocado 勾选）、推荐语、时间/难度。
- 底部：双按钮（番茄红「打卡」+ 白底「分享卡片」）。

### check-in-editor-page
- 顶部返回 + 标题。
- 表单分组：日期、餐别横向选择、菜品、心情标签、备注多行输入。
- 底部保存按钮。

### share-card-page
- 卡片预览：圆角 28px，渐变背景（按心情色）。
- 卡片内容：日期徽标、菜名、心情标签、推荐语、底部装饰线。
- 底部双按钮：保存、分享。

## 8. Do's and Don'ts

### Do
- 每个心情标签使用独立浅色背景。
- 主按钮用渐变 + 投影。
- 转盘分区使用多种食物色。
- 卡片使用大圆角和柔和阴影。
- 底部 Tab 使用浮岛 + 玻璃拟态。

### Don't
- 不要全局用一种强调色。
- 不要让组件没有阴影或圆角（会显得简陋）。
- 不要使用 emoji。
- 不要让 Tab 在侧边或全宽。
- 不要首屏塞满内容，留出呼吸感。
