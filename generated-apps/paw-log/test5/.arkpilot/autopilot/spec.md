# PawLog 宠迹 — Product Specification

## Classification
- **Type**: CONCRETE
- The user provided a clear feature list, visual direction (mint green + paw pink, rounded/healing vibe), and explicit build/run verification expectation. No follow-up questions required.

## Target Device
- 屏幕分辨率：1272vp × 2756vp（宽 × 高）
- 设备类型：普通手机（非折叠机、非平板）
- 像素密度倍率：3x（即HTML设计稿390px = 设备上1170vp物理像素，但ArkTS使用vp单位时1px≈1vp）
- 布局策略：内容区max-width约束在390-420vp内居中，禁止全宽铺满。Tab导航栏等必须在底部，且若使用 `position: fixed` 必须限制宽度与body一致（如 `width: 100%; max-width: 390px; margin: 0 auto; left: 0; right: 0;`），严禁在PC浏览器上全宽拉伸。严禁生成在侧边（如右边/左边）。
- 特殊注意：2756px高度意味着屏幕很长，滚动区域充足，但需确保首屏关键内容（Header+核心卡片）在顶部600vp内可见。

## Value Proposition
PawLog 宠迹是一款面向多宠家庭的轻量级健康与日常记录工具。它将“多宠档案、一键记录、健康趋势、疫苗驱虫提醒、就医病历、家庭成员共享”整合在一个治愈风格的界面中，让宠物主人在碎片化时间里高效追踪每只毛孩子的饮食、排泄、体重、用药与医疗历史，降低遗忘与信息分散带来的焦虑。

## Product Category & Primary User Scenario
- **Category**: 宠物生活 / 健康记录 / 家庭协作工具
- **Primary scenario**: 宠物主人（尤其多宠家庭）每日快速记录多只宠物的饮食、排泄、体重、用药；定期查看健康趋势；接收疫苗/驱虫到期提醒；在就医时快速调阅病历与历史数据；与家人共享宠物档案和记录权限。

## Core Jobs-to-be-Done
1. **管理多宠档案** — 添加、编辑、切换、删除宠物档案，记录头像、昵称、品种、生日、性别、体重基准、绝育状态、Chip/病历号等基础信息。
2. **一键记录日常** — 在首页针对当前宠物快速记录饮食（食物类型/分量/时间）、排泄（大小便性状/时间）、体重（当前体重/测量时间）、用药（药品/剂量/时间）。
3. **查看健康趋势** — 以图表形式查看体重、饮食、排泄、用药随时间的变化，支持按周/月/年筛选。
4. **疫苗与驱虫提醒** — 记录疫苗/驱虫历史，自动计算下次到期时间，在首页与提醒列表中展示即将到期/已过期项。
5. **就医病历归档** — 记录每次就医的医院、医生、诊断、处方、费用、附件（照片），按时间线归档。
6. **家庭成员共享** — 邀请家人加入宠物档案，共享查看与记录权限（本阶段以本地家庭成员标识+共享开关/邀请码形式实现，不依赖后端账号体系）。

## Page Structure
| Surface ID | Page ID | Route / Tab | Type | Purpose |
|------------|---------|-------------|------|---------|
| home | home-page | tab-home | Tab | 首页：宠物切换、今日待办提醒、一键记录入口、最近动态、今日概览 |
| records | records-page | tab-records | Tab | 记录列表：按宠物/类别/时间筛选，查看与编辑单条记录 |
| trends | trends-page | tab-trends | Tab | 健康趋势：图表展示体重/饮食/排泄/用药趋势 |
| health | health-page | tab-health | Tab | 健康中心：疫苗/驱虫记录与到期提醒、就医病历列表 |
| profile | profile-page | tab-profile | Tab | 我的/设置：宠物档案管理、家庭成员共享、通用设置 |
| pet-editor | pet-editor-page | — | Full-page overlay | 宠物档案新增/编辑 |
| record-editor | record-editor-page | — | Full-page overlay | 记录新增/编辑（饮食/排泄/体重/用药） |
| vaccine-editor | vaccine-editor-page | — | Full-page overlay | 疫苗/驱虫记录新增/编辑 |
| medical-record-editor | medical-record-editor-page | — | Full-page overlay | 就医病历新增/编辑 |
| medical-record-detail | medical-record-detail-page | — | Full-page overlay | 就医病历详情 |
| member-invite | member-invite-page | — | Full-page overlay | 家庭成员邀请/共享管理 |
| reminder-list | reminder-list-page | — | Full-page overlay | 全部提醒列表 |

## Navigation Model
- **Primary navigation**: 底部固定 TabBar，5 个 Tab（首页、记录、趋势、健康、我的）。
- **Secondary navigation**: 首页/健康页的快捷入口卡片、记录列表的筛选器、趋势页的时间维度切换。
- **Full-page overlays**: 宠物编辑、记录编辑、疫苗编辑、病历编辑/详情、家庭成员邀请、全部提醒列表通过 surface 切换覆盖当前 Tab 内容；返回后回到上一个 Tab。
- **State persistence**: 当前选中宠物、当前 Tab、列表筛选条件在单会话内保持；编辑/删除操作即时刷新列表。

## Data Source Strategy
- **Local-first**: 所有数据默认存储在 App 本地偏好存储/关系型数据库（Preference / RDB）中，不强制要求联网或后端账号。
- **No preset seed data by default**: 首次启动为真实空状态，用户自行创建宠物与记录。HTML 设计稿中的示例数据仅作视觉参考，不作为功能种子数据。
- **Family sharing local abstraction**: 家庭成员以本地“成员”模型表示，包含昵称、角色（管理员/协作者）、邀请码或开关状态；不强制实现真实后端共享。
- **Reminder engine**: 基于本地记录的疫苗/驱虫时间 + 推荐周期计算下次到期日，首页与健康页展示待办提醒。
- **Chart data**: 从本地记录聚合生成趋势数据，缺数据时显示空状态。
- **Attachments**: 病历照片以本地临时图片引用或占位图表示；本阶段不实现相机/文件选择，仅预留字段与 UI 位置。

## Component Structure
- **Layout shell**: `Index.ets` 作为 surface 路由容器，内嵌 `BottomTabBar` 与全页覆盖 surface。
- **Tab pages**:
  - `HomePage` — 宠物切换头、提醒横幅、快速记录 FAB/网格、最近记录流、今日概览。
  - `RecordsPage` — 筛选栏、记录时间线列表、空状态。
  - `TrendsPage` — 宠物选择、时间维度切换、图表区、关键指标卡片。
  - `HealthPage` — 疫苗/驱虫模块、就医病历模块、提醒入口。
  - `ProfilePage` — 宠物档案管理、家庭成员、设置入口。
- **Overlay pages**:
  - `PetEditorPage`, `RecordEditorPage`, `VaccineEditorPage`, `MedicalRecordEditorPage`, `MedicalRecordDetailPage`, `MemberInvitePage`, `ReminderListPage`.
- **Shared components**:
  - `BottomTabBar`, `PetSwitcher`, `ActionButton`, `RecordCard`, `TrendChart`, `ReminderBadge`, `FormField`, `Avatar`, `EmptyState`, `SectionHeader`, `ConfirmDialog`.
- **Models / Services**:
  - `Pet`, `Record`, `VaccineDeworm`, `MedicalRecord`, `FamilyMember`, `Reminder` models；
  - `PetService`, `RecordService`, `HealthService`, `ReminderService`, `FamilyService`.

## Constraints
- 视觉必须采用薄荷绿（mint）+ 肉垫粉（paw pink）主色调，整体圆润、治愈、无攻击性。
- 目标设备为普通手机，内容区最大宽度 390-420vp 居中，禁止侧边导航栏。
- 底部 Tab 导航固定，且仅在 Tab 页面显示。
- 首屏关键内容（Header + 核心卡片）必须在顶部 600vp 内可见。
- 不使用 emoji 或象形 Unicode 作为 UI 图标；所有图标使用 SVG 并带上下文 title。
- 本阶段只产出设计产物，不创建 HarmonyOS 源码。

## Non-Goals
- 不实现真实的云同步、后端账号体系、即时通讯或推送通知。
- 不实现相机拍摄/文件选择器，病历附件仅作占位。
- 不实现基于地图的附近医院推荐。
- 不提供默认种子/示例数据作为首次启动内容。

## Acceptance Criteria
- [ ] 规格、ui-tree.json、DESIGN.md、DESIGN1.md、HTML 产物、design-alignment.md 全部存在。
- [ ] ui-tree.json 覆盖全部 route-worthy surface 与关键语义目标。
- [ ] HTML 设计稿在 390px 宽度容器中居中展示，底部 Tab 可见，首屏核心内容位于 600px 内。
- [ ] 所有 inline SVG 包含业务语义明确的 `<title>` 作为首个子元素。
- [ ] 设计对齐计划完整映射语义 ID、事件、视觉要求与约束。

## Open Questions
- 是否需要记录共享的权限细分（只读 vs 可编辑）？（本阶段默认协作者可编辑，管理员可删除/邀请）
- 是否需要在提醒中使用本地通知？（本阶段以红点/横幅提醒为主，不实现系统通知）
- 是否需要支持体重单位的切换（kg / lb）？（本阶段默认 kg，设置页预留单位入口）
