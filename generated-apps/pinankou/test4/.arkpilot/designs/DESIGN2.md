# 平安扣 Pinankou 视觉设计规范（精修最终版 DESIGN2）

## 1. 设计语言与氛围

「平安扣」最终视觉定位为「温润的安全感」——既有工具 App 的清晰效率，又有消费级应用的精致质感。通过以下手段实现：

- **色彩**：以 Teal 为魂，深海蓝为骨，薄荷青为呼吸；功能色仅点缀风险等级，不喧宾夺主。
- **材质**：白色卡片浮在薄荷色页面上，毛玻璃导航与柔和阴影制造层次。
- **信息层级**：大标题 + 小标签 + 强对比数值，让一线用户在户外或匆忙场景下也能一扫即懂。
- **情感**：空状态插画与完成态动效提供正向反馈，降低安全工作的压迫感。

## 2. 最终色彩系统

### 2.1 品牌光谱

| Token | 色值 | 用途 |
|-------|------|------|
| `--brand-deep` | `#115E59` | 深色强调、选中文字 |
| `--brand-primary` | `#0D9488` | 主按钮、图标、进度 |
| `--brand-bright` | `#14B8A6` | 渐变、高亮 |
| `--brand-light` | `#5EEAD4` | 光晕、图表浅色端 |
| `--brand-mint` | `#CCFBF1` | 标签背景、成功态背景 |
| `--brand-pale` | `#F0FDFA` | 页面背景 |

### 2.2 功能色

| Token | 色值 | 背景 | 用途 |
|-------|------|------|------|
| `--safe` | `#059669` | `#D1FAE5` | 低风险/已完成 |
| `--warning` | `#B45309` | `#FEF3C7` | 中风险/处理中 |
| `--danger` | `#DC2626` | `#FEE2E2` | 高风险/逾期 |
| `--critical` | `#991B1B` | `#FECACA` | 重大风险 |
| `--info` | `#1D4ED8` | `#DBEAFE` | 信息/链接 |

### 2.3 中性色

| Token | 色值 |
|-------|------|
| `--text-primary` | `#0F172A` |
| `--text-secondary` | `#475569` |
| `--text-tertiary` | `#94A3B8` |
| `--surface-primary` | `#FFFFFF` |
| `--surface-secondary` | `#F8FAFC` |
| `--surface-tertiary` | `#E2E8F0` |
| `--page-bg` | `#F0FDFA` |
| `--glass-bg` | `rgba(255,255,255,0.80)` |
| `--glass-border` | `rgba(255,255,255,0.55)` |

### 2.4 最终阴影

```css
--shadow-sm: 0 1px 2px rgba(15,23,42,0.04);
--shadow-md: 0 4px 14px -3px rgba(13,148,136,0.13);
--shadow-lg: 0 12px 32px -10px rgba(13,148,136,0.20);
--glow-brand: 0 0 18px rgba(94,234,212,0.48);
```

## 3. 最终组件规范

### 3.1 主按钮

```css
background: linear-gradient(135deg, #0D9488 0%, #14B8A6 60%, #5EEAD4 100%);
color: #FFFFFF;
border-radius: 9999px;
height: 48px;
padding: 0 28px;
font-size: 14px;
font-weight: 700;
box-shadow: 0 4px 14px -3px rgba(13,148,136,0.28);
```

### 3.2 次级按钮

```css
background: rgba(13,148,136,0.08);
color: #0D9488;
border-radius: 9999px;
height: 40px;
padding: 0 20px;
font-size: 14px;
font-weight: 600;
```

### 3.3 KPI 卡片

```css
background: linear-gradient(145deg, #FFFFFF 0%, #F0FDFA 100%);
border-radius: 20px;
padding: 18px;
box-shadow: 0 4px 14px -3px rgba(13,148,136,0.10);
/* 顶部 3px 品牌渐变条 */
border-top: 3px solid transparent;
border-image: linear-gradient(90deg, #0D9488, #5EEAD4) 1;
```

### 3.4 列表项

```css
background: #FFFFFF;
border-radius: 14px;
padding: 16px;
box-shadow: 0 1px 2px rgba(15,23,42,0.04);
/* 左侧状态彩条 */
border-left: 4px solid var(--status-color);
```

### 3.5 输入框

```css
background: #F8FAFC;
border-radius: 12px;
height: 48px;
padding: 0 16px;
font-size: 14px;
border: 1px solid transparent;
/* focus */
border-color: #0D9488;
box-shadow: 0 0 0 3px rgba(13,148,136,0.10);
```

### 3.6 底部 Tab 导航

```css
background: rgba(255,255,255,0.80);
backdrop-filter: blur(24px) saturate(160%);
border-top: 1px solid rgba(226,232,240,0.6);
height: 68px;
/* 选中图标 */
background: linear-gradient(135deg, #0D9488, #14B8A6);
border-radius: 14px;
padding: 8px;
box-shadow: 0 0 18px rgba(94,234,212,0.48);
```

### 3.7 徽章

- 风险等级：功能色背景 + 深色文字，圆角 9999px，padding 5px 10px，font 10px weight 700。
- 状态：中性浅色背景 + 次要文字，或品牌浅色背景 + 品牌深色文字。

## 4. 页面最终视觉

### 4.1 首页（page-home.html）

- 毛玻璃 Header：左侧「平安扣」H1，右侧通知铃铛图标（带未读红点）。
- Hero：问候语 + 日期，背景有 2 个装饰性渐变圆。
- 3 个 KPI 卡片等宽网格：
  - 巡检进度：36%（示例）
  - 待处理隐患：5（示例）
  - 本周已整改：12（示例）
- 快捷操作：三个 Pill 主按钮（上报隐患、开始巡检、应急联系）。
- 最近动态列表：4 条示例隐患，每条带左侧色条、标题、状态徽章、时间。

### 4.2 巡检页（page-patrol.html）

- 顶部卡片：左侧环形进度 36%，右侧路线名「A 栋日常巡检」、完成数 4/11。
- 点位列表 4 条：
  - 2 条已完成（左侧对勾圆形、标题灰色划线）；
  - 1 条当前（左侧高亮数字、渐变边框）；
  - 1 条未开始（左侧灰色数字）。
- 每个点位卡片右侧：打卡按钮 + 报隐患链接。

### 4.3 隐患页（page-issues.html）

- 搜索框。
- 状态筛选 Pill：全部/待处理/处理中/已完成。
- 风险筛选 Pill：全部/低/中/高/重大。
- 列表 4 条：不同风险等级与状态。
- 右下角悬浮「+」按钮。

### 4.4 隐患详情（page-issue-detail.html）

- 顶部照片区或品牌渐变占位。
- 标题 + 状态/风险徽章。
- 信息网格：位置、负责人、截止日期、上报人。
- 描述卡片。
- 时间线 3 个节点：上报 → 指派 → 处理中。
- 底部操作栏：更新进度（主按钮）、编辑（次级）、关闭（幽灵）。

### 4.5 联系人页（page-contacts.html）

- 搜索框。
- 分组标签：全部/消防/安保/医疗/管理。
- 联系人列表 4 条：头像、姓名、角色、电话、呼叫按钮。
- 顶部「紧急联系人」带红色徽章。

### 4.6 统计页（page-stats.html）

- 周期选择器：本周/本月/本季度，本周选中。
- 4 个 KPI 卡片 2×2：
  - 隐患总数 23
  - 已整改 18
  - 整改率 78%
  - 巡检完成率 82%
- 趋势图：折线 + 品牌渐变填充。
- 风险分布：环形图或横向条。
- 底部「导出报告」主按钮。

## 5. SVG 与图标

- 所有图标使用内联 SVG，第一个子元素必须是 contextual `<title>`。
- 图标尺寸：导航 24×24px，按钮内 20×20px，列表内 16×16px。
- 图标描边宽度统一 2px，端点 round，拐角 round。

## 6. 响应式

- 内容最大宽度 420vp，居中。
- 底部固定元素宽度与内容区一致，使用 `max-width:420px; left:0; right:0; margin:0 auto`。
- 触控目标 ≥ 44×44vp。

## 7. Semantic UI Binding（最终确认）

全部语义 ID、路由、Tab ID、事件名与 ui-tree.json 完全一致，无变更请求。

## 8. 设计原则总结

1. 同色系渐变，拒绝彩虹色。
2. 白色卡片 + 薄荷背景，制造「湖面浮岛」层次。
3. 状态与风险用功能色小面积点缀。
4. 每个图标 SVG 都带 contextual title。
5. 首屏关键信息在 600vp 内可见。
6. 底部 Tab 固定，宽度受限，绝不侧边导航。
