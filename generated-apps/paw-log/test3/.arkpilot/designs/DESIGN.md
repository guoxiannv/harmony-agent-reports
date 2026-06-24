# PawLog 宠迹 · 视觉设计系统

## 1. 视觉主题 & 氛围

PawLog 的视觉氛围是“清晨宠物店窗边的第一缕阳光”——清新、温柔、值得信赖。整体以薄荷绿为主色，肉垫粉为情感辅色，营造治愈、圆润、无攻击性的数字空间。界面像被轻轻打磨过的鹅卵石：大圆角、柔和阴影、细腻的渐变、轻量毛玻璃，让所有与宠物健康相关的操作都显得轻松而非焦虑。

不同于冷冰冰的医疗工具，PawLog 强调“陪伴感”。卡片像小垫子一样微微浮起，按钮像宠物肉垫般圆润，空状态用插画与小动物剪影抚慰用户。色彩丰富但不杂乱，通过同色系渐变和透明叠加制造层次，避免单一纯色带来的廉价感。

**关键词**：薄荷绿、肉垫粉、圆润、治愈、清新、毛玻璃、轻拟物、宠物友好。

## 2. 色彩体系

### 2.1 主色（薄荷绿系）
| 名称 | 色值 | 用途 |
|------|------|------|
| 薄荷主色 | `#5DD9C1` | 品牌主按钮、Tab 激活态、关键图标 |
| 薄荷深 | `#3CB5A0` | 按下状态、强调文字、图表主线条 |
| 薄荷浅 | `#E6FAF6` | 浅色背景、卡片衬底、选中态背景 |
| 薄荷渐变起点 | `#7DE8D4` | 渐变按钮/卡片起点 |
| 薄荷渐变终点 | `#4CCBB4` | 渐变按钮/卡片终点 |

### 2.2 辅色（肉垫粉系）
| 名称 | 色值 | 用途 |
|------|------|------|
| 肉垫主色 | `#FFB8C9` | 情感高亮、饮食/爱心图标、空状态插画 |
| 肉垫深 | `#F28DA6` | 删除/警告柔和色、驱虫提醒标签 |
| 肉垫浅 | `#FFF0F3` | 浅粉卡片背景、选中态 |
| 肉垫渐变起点 | `#FFD1DC` | 渐变色块起点 |
| 肉垫渐变终点 | `#FFA0B6` | 渐变色块终点 |

### 2.3 中性色
| 名称 | 色值 | 用途 |
|------|------|------|
| 墨灰 | `#2D3436` | 主标题、正文 |
| 深灰 | `#636E72` | 次要文字、图标默认态 |
| 中灰 | `#B2BEC3` | 占位符、禁用态、分割线 |
| 浅灰 | `#F5F7FA` | 页面背景、列表背景 |
| 纯白 | `#FFFFFF` | 卡片背景、按钮文字 |

### 2.4 功能色
| 名称 | 色值 | 用途 |
|------|------|------|
| 阳光黄 | `#FFD166` | 待办提醒、疫苗标签 |
| 奶油杏 | `#FFF4E0` | 提醒卡片背景 |
| 天空蓝 | `#A8DADC` | 用药记录标签 |
| 薰衣草紫 | `#D8C3F3` | 家庭成员头像背景 |

### 2.5 渐变使用规范
- **主按钮渐变**：`linear-gradient(135deg, #7DE8D4 0%, #4CCBB4 100%)`，带 0 16px 32px rgba(92,217,193,0.28) 阴影。
- **肉垫卡片渐变**：`linear-gradient(135deg, #FFD1DC 0%, #FFA0B6 100%)`，用于首页情感卡片。
- **首页顶部背景**：`linear-gradient(180deg, #E6FAF6 0%, #F5F7FA 100%)`，营造顶部通透感。
- **图表渐变填充**：薄荷色由 `#5DD9C1` 40% 透明度向 0% 渐变，增加图表体积感。

### 2.6 毛玻璃
- 底部 TabBar、顶部Header、弹窗顶部区域使用毛玻璃：
  - `background: rgba(255,255,255,0.78)`
  - `backdrop-filter: blur(20px) saturate(180%)`
  - 边框底部：`1px solid rgba(255,255,255,0.6)`

## 3. 字体系统

### 3.1 字体家族
- **主要字体**：`-apple-system, BlinkMacSystemFont, 'SF Pro Text', 'PingFang SC', 'Helvetica Neue', sans-serif`
- **数字/图表**：`'SF Mono', 'SF Pro Display', monospace`（等宽或紧凑数字展示）

### 3.2 字号层级

| 角色 | 大小 | 字重 | 行高 | 字间距 | 用途 |
|------|------|------|------|--------|------|
| 页面大标题 | 28px | 700 | 1.18 | -0.5px | 首页问候、页面主标题 |
| 区块标题 | 20px | 700 | 1.24 | -0.3px | 卡片标题、列表分组标题 |
| 卡片标题 | 17px | 600 | 1.3 | -0.2px | 卡片内标题 |
| 正文 | 15px | 400 | 1.45 | 0 | 列表项正文、说明文字 |
| 正文强调 | 15px | 600 | 1.45 | 0 | 列表项数值、用户名 |
| 辅助文字 | 13px | 400 | 1.4 | 0 | 时间、标签、次要信息 |
| 微小文字 | 11px | 500 | 1.35 | 0.2px | 徽章、胶囊标签 |
| 数据大数字 | 36px | 700 | 1.1 | -1px | 体重数值、今日待办数 |

## 4. 组件样式

### 4.1 主按钮
- 背景：薄荷渐变
- 文字：白色，15px，weight 600
- 高度：52px
- 圆角：26px（全药丸）
- 阴影：`0 12px 24px rgba(76,203,180,0.28)`
- 按下：scale 0.98，亮度降低 5%

### 4.2 次级按钮
- 背景：`#E6FAF6`
- 文字：`#3CB5A0`，15px，weight 600
- 高度：44px
- 圆角：22px
- 按下：背景变为 `#D0F5EE`

### 4.3 图标按钮
- 尺寸：44px × 44px
- 背景：白色或 `#F5F7FA`
- 圆角：14px
- 图标颜色：`#636E72`
- 按下：背景 `#ECEFF2`

### 4.4 卡片
- 背景：白色
- 圆角：20px
- 内边距：16-20px
- 阴影：`0 8px 24px rgba(45,52,54,0.06)`
-  hover/press：阴影加深至 `0 12px 32px rgba(45,52,54,0.1)`

### 4.5 输入框
- 背景：`#F5F7FA`
- 圆角：14px
- 高度：48px
- 内边距：0 16px
- 占位符颜色：`#B2BEC3`
- 聚焦：边框 `2px solid #5DD9C1`

### 4.6 头像
- 宠物头像：56px 圆形，带 2px 白色边框与柔和阴影
- 用户头像：40px 圆形
- 成员头像：40px 圆形，备用背景按角色分配颜色

### 4.7 徽章/标签
- 背景色按类型：饮食（薄荷浅）、排泄（奶油杏）、体重（薰衣草紫浅）、用药（天空蓝浅）
- 圆角：10px
- 内边距：4px 10px
- 字号：11px，weight 500

### 4.8 图表卡片
- 背景：白色
- 圆角：20px
- 迷你图高度：100px
- 曲线颜色按指标：体重 `#5DD9C1`、饮水 `#A8DADC`、排泄 `#FFD166`
- 面积填充：对应颜色 20% 透明度渐变

### 4.9 底部 TabBar
- 背景：毛玻璃白色
- 高度：64px + 安全区
- 图标尺寸：24px
- 激活色：`#5DD9C1`
- 未激活色：`#B2BEC3`
- 文字：11px，weight 500
- 中央“+”按钮：悬浮于 TabBar 上方，56px 薄荷渐变圆形，带阴影

## 5. 布局原则

### 5.1 容器
- 内容最大宽度：390px，居中
- 页面水平内边距：20px
- 卡片间距：16px
- 区块间距：24px

### 5.2 首屏约束
- Header + 核心欢迎卡片 + 快捷记录入口必须在顶部 600vp 内可见。
- 提醒列表与健康概览可滚动展开。

### 5.3 圆角体系
| 级别 | 数值 | 用途 |
|------|------|------|
| 微 | 10px | 标签、徽章、小按钮 |
| 中 | 14px | 输入框、图标按钮 |
| 大 | 20px | 卡片、Sheet |
| 全药丸 | 999px | 主按钮、Tab 药丸 |
| 圆形 | 50% | 头像、悬浮按钮 |

### 5.4 阴影体系
| 级别 | 数值 | 用途 |
|------|------|------|
| 卡片 | `0 8px 24px rgba(45,52,54,0.06)` | 普通卡片 |
| 悬浮 | `0 12px 32px rgba(45,52,54,0.12)` | 底部 Tab、FAB |
| 按钮 | `0 12px 24px rgba(76,203,180,0.28)` | 主按钮 |
| 头像 | `0 4px 12px rgba(45,52,54,0.1)` | 宠物头像 |

## 6. 动效与交互

- 页面转场：轻微上滑 8px + 透明度 0→1，时长 220ms，ease-out。
- 按钮按下：scale 0.97，时长 100ms。
- 卡片按下：阴影加深，时长 120ms。
- 列表项出现：错位淡入，每项延迟 30ms。
- 图表加载：线条从左到右绘制，面积从下往上填充，时长 600ms。

## 7. 图标与插图

- 使用圆润线性图标，描边 2px，端点圆角。
- 优先使用本地 SVG 资源（如可用）；若本地无合适图标，可内联简洁 SVG。
- 所有内联 SVG 必须包含 `<title>` 描述其业务语义，例如“打开记录类型选择器”。
- 不使用 emoji 或象形 Unicode 作为图标。
- 空状态使用柔和的宠物剪影 + 肉垫粉/薄荷绿渐变背景。

## 8. Semantic UI Binding

### 8.1 Surfaces / Pages

| Surface ID | Page ID | Route | Tab ID |
|------------|---------|-------|--------|
| home | home-page | pages/HomePage | tab-home |
| records | records-page | pages/RecordsPage | tab-records |
| health | health-page | pages/HealthPage | tab-health |
| family | family-page | pages/FamilyPage | tab-family |
| profile | profile-page | pages/ProfilePage | tab-profile |
| pet-editor | pet-editor-page | pages/PetEditorPage | — |
| record-editor | record-editor-page | pages/RecordEditorPage | — |
| record-detail | record-detail-page | pages/RecordDetailPage | — |
| chart-detail | chart-detail-page | pages/ChartDetailPage | — |
| reminder-editor | reminder-editor-page | pages/ReminderEditorPage | — |
| medical-record-editor | medical-record-editor-page | pages/MedicalRecordEditorPage | — |
| medical-record-detail | medical-record-detail-page | pages/MedicalRecordDetailPage | — |
| member-invite | member-invite-page | pages/MemberInvitePage | — |
| pet-picker | pet-picker-sheet | — | — |
| record-type-picker | record-type-sheet | — | — |
| confirm-delete | confirm-delete-dialog | — | — |

### 8.2 Important Semantic Targets

| ID | Role | Event / Binding | Visual Mapping |
|----|------|-----------------|----------------|
| home-pet-switcher | action | open-pet-picker | 顶部宠物头像卡片，点击展开选择器 |
| home-current-pet-name | assertion | /pets/selected/name | 头像旁宠物昵称 |
| home-quick-log-button | action | open-record-type-sheet | 首页中央大圆形薄荷渐变按钮 |
| home-reminder-list | list | /reminders/today | 横向/纵向提醒卡片列表 |
| home-recent-record-list | list | /records/recent | 最近记录时间轴 |
| records-add-button | action | open-record-editor | 记录页顶部右侧圆形加号 |
| records-search-input | input | search-records | 顶部搜索输入框 |
| records-timeline-list | list | /records/filtered | 筛选后的时间轴 |
| health-pet-switcher | action | open-pet-picker | 健康页顶部宠物切换 |
| health-weight-chart-card | action | open-chart-detail | 体重趋势迷你图卡片 |
| health-add-reminder-button | action | open-reminder-editor | 提醒区块右侧“+” |
| health-add-medical-record-button | action | open-medical-record-editor | 病历区块右侧“+” |
| family-invite-button | action | open-member-invite | 家庭成员区块顶部邀请按钮 |
| family-member-list | list | /family/members | 成员卡片列表 |
| profile-manage-pets-button | action | go-to-pet-list | 我的页面“管理宠物档案”行 |
| pet-editor-save-button | action | save-pet | 表单底部主按钮 |
| record-editor-save-button | action | save-record | 表单底部主按钮 |
| reminder-editor-save-button | action | save-reminder | 表单底部主按钮 |
| medical-editor-save-button | action | save-medical-record | 表单底部主按钮 |
| confirm-delete-confirm-button | action | confirm-delete | 弹窗主按钮（肉垫深） |

### 8.3 Event Names Preserved

`open-pet-picker`, `open-record-type-sheet`, `open-record-editor`, `open-reminder-editor`, `open-medical-record-editor`, `open-member-invite`, `save-pet`, `delete-pet`, `save-record`, `delete-record`, `save-reminder`, `delete-reminder`, `save-medical-record`, `delete-medical-record`, `set-chart-period`, `copy-invite-code`, `share-invite-code`, `close-sheet`, `confirm-delete`, `cancel-delete`, `go-back`

### 8.4 Change Requests / Gaps

- 无变更请求。ui-tree.json 中的语义目标已覆盖所有关键交互与断言点。

## 9. Do's and Don'ts

### Do
- 大量使用圆角（20px 卡片、999px 按钮）。
- 使用薄荷绿渐变与肉垫粉渐变制造层次。
- 使用柔和阴影与毛玻璃提升质感。
- 在空状态、图标、插图中保持圆润宠物友好风格。
- 确保所有 SVG 图标包含业务语义 `<title>`。
- 保持内容区 max-width 390px 居中，底部 TabBar 固定。

### Don't
- 使用直角按钮或尖锐几何图标。
- 使用单一纯色大面积填充，避免廉价感。
- 使用 emoji 替代图标。
- 在 PC 浏览器上全宽拉伸内容。
- 将导航栏放在侧边。
