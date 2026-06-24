// AppController.ets
//
// 应用级状态机 / 视图模型（spec 第8节 FR-1~FR-5）。
// - 持有跨页面共享的响应式状态（写入 AppStorage，供页面 @StorageLink 绑定）。
// - 通过 StorageService 落盘冰箱食材与打卡记录。
// - 暴露与 ui-tree.json 一一对应的事件方法（events 列表）。
// 页面在视觉集成阶段通过 @StorageLink 读取状态、通过 AppController 调用事件。

import { common } from '@kit.AbilityKit';
import { DISH_BANK } from '../data/DishBank';
import {
  CheckInRecord,
  Dish,
  MealType,
  MoodTag,
  PantryItem,
  ShareCardModel,
  TimeSceneFilter,
  todayKey,
} from '../model/Types';
import { CheckInService } from '../services/CheckInService';
import { PantryService } from '../services/PantryService';
import { RecommendService } from '../services/RecommendService';
import { ShareCardService } from '../services/ShareCardService';
import { StorageService } from '../services/StorageService';

// AppStorage key 常量（与页面 @StorageLink 保持一致）
const KEY_PANTRY: string = 'pantryItems';
const KEY_CHECK_INS: string = 'checkInRecords';
const KEY_HOME_MOODS: string = 'homeMoods';
const KEY_HOME_TIME: string = 'homeTime';
const KEY_WHEEL_RESULT: string = 'wheelResult';
const KEY_PANTRY_MOODS: string = 'pantryMoods';
const KEY_PANTRY_RESULTS: string = 'pantryResults';
const KEY_PANTRY_INPUT: string = 'pantryInput';
const KEY_EDITOR_DATE: string = 'editorDate';
const KEY_EDITOR_MEAL: string = 'editorMeal';
const KEY_EDITOR_DISH: string = 'editorDish';
const KEY_EDITOR_MOODS: string = 'editorMoods';
const KEY_EDITOR_NOTE: string = 'editorNote';
const KEY_EDITOR_EDITING_ID: string = 'editorEditingId';
const KEY_RESULT_DISH: string = 'resultDish';
const KEY_SHARE_CARD: string = 'shareCard';

export class AppController {
  private static instance: AppController | null = null;
  private storage: StorageService = StorageService.getInstance();

  static getInstance(): AppController {
    if (AppController.instance === null) {
      AppController.instance = new AppController();
    }
    return AppController.instance;
  }

  // 应用启动初始化：先同步写入 AppStorage 默认键（保证页面 @StorageLink 可用），
  // 再异步加载持久化数据覆盖。EntryAbility.onCreate 调用。
  async init(context: common.Context): Promise<void> {
    AppStorage.setOrCreate<PantryItem[]>(KEY_PANTRY, []);
    AppStorage.setOrCreate<CheckInRecord[]>(KEY_CHECK_INS, []);
    AppStorage.setOrCreate<MoodTag[]>(KEY_HOME_MOODS, []);
    AppStorage.setOrCreate<TimeSceneFilter>(KEY_HOME_TIME, '');
    AppStorage.setOrCreate<Dish | null>(KEY_WHEEL_RESULT, null);
    AppStorage.setOrCreate<MoodTag[]>(KEY_PANTRY_MOODS, []);
    AppStorage.setOrCreate<Dish[]>(KEY_PANTRY_RESULTS, []);
    AppStorage.setOrCreate<string>(KEY_PANTRY_INPUT, '');
    AppStorage.setOrCreate<string>(KEY_EDITOR_DATE, todayKey());
    AppStorage.setOrCreate<MealType>(KEY_EDITOR_MEAL, '午餐');
    AppStorage.setOrCreate<string>(KEY_EDITOR_DISH, '');
    AppStorage.setOrCreate<MoodTag[]>(KEY_EDITOR_MOODS, []);
    AppStorage.setOrCreate<string>(KEY_EDITOR_NOTE, '');
    AppStorage.setOrCreate<string>(KEY_EDITOR_EDITING_ID, '');
    AppStorage.setOrCreate<Dish | null>(KEY_RESULT_DISH, null);
    AppStorage.setOrCreate<ShareCardModel | null>(KEY_SHARE_CARD, null);

    await this.storage.init(context);
    const pantry: PantryItem[] = await this.storage.loadPantry();
    const checkIns: CheckInRecord[] = await this.storage.loadCheckIns();
    AppStorage.set<PantryItem[]>(KEY_PANTRY, pantry);
    AppStorage.set<CheckInRecord[]>(KEY_CHECK_INS, checkIns);
  }

  // ---------- 首页 / 转盘 (FR-1, FR-3) ----------

  // event: mood-filter-change
  setHomeMoods(moods: MoodTag[]): void {
    AppStorage.set<MoodTag[]>(KEY_HOME_MOODS, moods);
  }

  // event: time-filter-change
  setHomeTime(time: TimeSceneFilter): void {
    AppStorage.set<TimeSceneFilter>(KEY_HOME_TIME, time);
  }

  // 当前筛选候选池（供转盘与“候选为空”断言）。
  homeCandidates(): Dish[] {
    return RecommendService.filterCandidates(DISH_BANK, this.homeMoods(), this.homeTime());
  }

  homeCandidatesEmpty(): boolean {
    return this.homeCandidates().length === 0;
  }

  // event: spin-wheel
  spinWheel(): void {
    const picked: Dish | null = RecommendService.spinPick(this.homeCandidates());
    AppStorage.set<Dish | null>(KEY_WHEEL_RESULT, picked);
  }

  // event: spin-wheel —— 由转盘组件落点后写入结果，保证视觉与数据一致。
  setWheelResult(dish: Dish | null): void {
    AppStorage.set<Dish | null>(KEY_WHEEL_RESULT, dish);
  }

  wheelResult(): Dish | null {
    const v: Dish | null | undefined = AppStorage.get<Dish>(KEY_WHEEL_RESULT);
    return v === undefined ? null : v;
  }

  homeMoods(): MoodTag[] {
    return AppStorage.get<MoodTag[]>(KEY_HOME_MOODS) ?? [];
  }

  homeTime(): TimeSceneFilter {
    return AppStorage.get<TimeSceneFilter>(KEY_HOME_TIME) ?? '';
  }

  // 进入结果详情页（event: open-result-detail / open-dish-detail）。
  openResultDetail(dish: Dish): void {
    AppStorage.set<Dish | null>(KEY_RESULT_DISH, dish);
  }

  resultDish(): Dish | null {
    const v: Dish | null | undefined = AppStorage.get<Dish>(KEY_RESULT_DISH);
    return v === undefined ? null : v;
  }

  // ---------- 食材页 (FR-2, FR-3) ----------

  pantryItems(): PantryItem[] {
    return AppStorage.get<PantryItem[]>(KEY_PANTRY) ?? [];
  }

  // event: pantry-input-change
  setPantryInput(text: string): void {
    AppStorage.set<string>(KEY_PANTRY_INPUT, text);
  }

  pantryInput(): string {
    return AppStorage.get<string>(KEY_PANTRY_INPUT) ?? '';
  }

  // event: add-pantry-item
  addPantryItem(): void {
    const next: PantryItem[] = PantryService.addItem(this.pantryItems(), this.pantryInput());
    AppStorage.set<PantryItem[]>(KEY_PANTRY, next);
    AppStorage.set<string>(KEY_PANTRY_INPUT, '');
    this.persistPantry(next);
  }

  // event: remove-pantry-item
  removePantryItem(id: string): void {
    const next: PantryItem[] = PantryService.removeItem(this.pantryItems(), id);
    AppStorage.set<PantryItem[]>(KEY_PANTRY, next);
    this.persistPantry(next);
  }

  // event: pantry-mood-filter-change
  setPantryMoods(moods: MoodTag[]): void {
    AppStorage.set<MoodTag[]>(KEY_PANTRY_MOODS, moods);
  }

  pantryMoods(): MoodTag[] {
    return AppStorage.get<MoodTag[]>(KEY_PANTRY_MOODS) ?? [];
  }

  // event: recommend-by-pantry
  recommendByPantry(): void {
    const results: Dish[] =
      RecommendService.recommendByPantry(DISH_BANK, this.pantryItems(), this.pantryMoods(), '');
    AppStorage.set<Dish[]>(KEY_PANTRY_RESULTS, results);
  }

  pantryResults(): Dish[] {
    return AppStorage.get<Dish[]>(KEY_PANTRY_RESULTS) ?? [];
  }

  // ---------- 打卡编辑 (FR-4) ----------

  // event: open-check-in-editor（新建模式，可预填菜品名）。
  openCheckInEditorNew(prefillDish: string): void {
    AppStorage.set<string>(KEY_EDITOR_EDITING_ID, '');
    AppStorage.set<string>(KEY_EDITOR_DATE, todayKey());
    AppStorage.set<MealType>(KEY_EDITOR_MEAL, this.guessMeal());
    AppStorage.set<string>(KEY_EDITOR_DISH, prefillDish);
    AppStorage.set<MoodTag[]>(KEY_EDITOR_MOODS, []);
    AppStorage.set<string>(KEY_EDITOR_NOTE, '');
  }

  // 编辑已有打卡（event: open-check-in-editor 编辑模式）。
  openCheckInEditorEdit(record: CheckInRecord): void {
    AppStorage.set<string>(KEY_EDITOR_EDITING_ID, record.id);
    AppStorage.set<string>(KEY_EDITOR_DATE, record.date);
    AppStorage.set<MealType>(KEY_EDITOR_MEAL, record.meal);
    AppStorage.set<string>(KEY_EDITOR_DISH, record.dishName);
    AppStorage.set<MoodTag[]>(KEY_EDITOR_MOODS, record.moods);
    AppStorage.set<string>(KEY_EDITOR_NOTE, record.note);
  }

  // event: editor-date-change / editor-meal-change / editor-dish-change /
  // editor-mood-change / editor-note-change
  setEditorDate(date: string): void {
    AppStorage.set<string>(KEY_EDITOR_DATE, date);
  }

  setEditorMeal(meal: MealType): void {
    AppStorage.set<MealType>(KEY_EDITOR_MEAL, meal);
  }

  setEditorDish(name: string): void {
    AppStorage.set<string>(KEY_EDITOR_DISH, name);
  }

  setEditorMoods(moods: MoodTag[]): void {
    AppStorage.set<MoodTag[]>(KEY_EDITOR_MOODS, moods);
  }

  setEditorNote(note: string): void {
    AppStorage.set<string>(KEY_EDITOR_NOTE, note);
  }

  editorEditingId(): string {
    return AppStorage.get<string>(KEY_EDITOR_EDITING_ID) ?? '';
  }

  // event: save-check-in
  saveCheckIn(): void {
    const date: string = AppStorage.get<string>(KEY_EDITOR_DATE) ?? todayKey();
    const meal: MealType = AppStorage.get<MealType>(KEY_EDITOR_MEAL) ?? '午餐';
    const dishName: string = AppStorage.get<string>(KEY_EDITOR_DISH) ?? '';
    const moods: MoodTag[] = AppStorage.get<MoodTag[]>(KEY_EDITOR_MOODS) ?? [];
    const note: string = AppStorage.get<string>(KEY_EDITOR_NOTE) ?? '';
    if (dishName.trim().length === 0) {
      return; // 菜名为空不保存（校验）
    }
    const editingId: string = this.editorEditingId();
    const records: CheckInRecord[] = this.checkInRecords();
    let next: CheckInRecord[];
    if (editingId.length > 0) {
      next = CheckInService.update(records, {
        id: editingId,
        date: date,
        meal: meal,
        dishName: dishName.trim(),
        moods: moods,
        note: note,
        createdAt: Date.now(),
      });
    } else {
      next = CheckInService.add(records, {
        id: this.genCheckInId(),
        date: date,
        meal: meal,
        dishName: dishName.trim(),
        moods: moods,
        note: note,
        createdAt: Date.now(),
      });
    }
    AppStorage.set<CheckInRecord[]>(KEY_CHECK_INS, next);
    this.persistCheckIns(next);
  }

  // event: delete-check-in
  deleteCheckIn(id: string): void {
    const next: CheckInRecord[] = CheckInService.remove(this.checkInRecords(), id);
    AppStorage.set<CheckInRecord[]>(KEY_CHECK_INS, next);
    this.persistCheckIns(next);
  }

  checkInRecords(): CheckInRecord[] {
    return AppStorage.get<CheckInRecord[]>(KEY_CHECK_INS) ?? [];
  }

  // ---------- 结果页 -> 打卡 (FR-1, FR-4, FR-5) ----------

  // event: check-in-from-result：用结果菜品直接打开打卡编辑（预填菜品名）。
  checkInFromResult(): string {
    const dish: Dish | null = this.resultDish();
    const dishName: string = dish === null ? '' : dish.name;
    const moods: MoodTag[] = dish === null ? [] : dish.moods;
    this.openCheckInEditorNew(dishName);
    if (moods.length > 0) {
      this.setEditorMoods(moods);
    }
    return dishName;
  }

  // event: share-from-result
  shareFromResult(): void {
    const dish: Dish | null = this.resultDish();
    if (dish === null) {
      return;
    }
    AppStorage.set<ShareCardModel | null>(KEY_SHARE_CARD, ShareCardService.buildFromDish(dish));
  }

  // event: open-share-card（从打卡记录生成）
  openShareCard(record: CheckInRecord): void {
    AppStorage.set<ShareCardModel | null>(KEY_SHARE_CARD, ShareCardService.buildFromCheckIn(record));
  }

  shareCard(): ShareCardModel | null {
    const v: ShareCardModel | null | undefined = AppStorage.get<ShareCardModel>(KEY_SHARE_CARD);
    return v === undefined ? null : v;
  }

  // ---------- 我的 (Profile) ----------

  streak(): number {
    return CheckInService.streak(this.checkInRecords(), Date.now());
  }

  totalCheckIns(): number {
    return CheckInService.total(this.checkInRecords());
  }

  // ---------- 私有辅助 ----------

  private persistPantry(items: PantryItem[]): void {
    this.storage.savePantry(items);
  }

  private persistCheckIns(records: CheckInRecord[]): void {
    this.storage.saveCheckIns(records);
  }

  private genCheckInId(): string {
    return `checkin-${Date.now()}-${Math.floor(Math.random() * 100000)}`;
  }

  // 按当前小时推测默认餐别。
  private guessMeal(): MealType {
    const h: number = new Date().getHours();
    if (h < 10) {
      return '早餐';
    }
    if (h < 14) {
      return '午餐';
    }
    if (h < 17) {
      return '加餐';
    }
    if (h < 21) {
      return '晚餐';
    }
    return '夜宵';
  }
}
