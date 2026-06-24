// AppController — central view-model for the 今天吃什么 app.
//
// Owns all reactive state for the semantic bindings in ui-tree.json and the
// event methods that implement ui-behavior.json interaction flows. The UI layer
// (Pages/Components, added during visual integration) reads these fields and
// calls these methods; a single `notify()` callback lets the shell re-render.
//
// This is headless logic: no @Component / UI build here. Services carry the
// persistence and domain rules; this class is the state + orchestration hub.

import { PersistenceService } from '../services/PersistenceService';
import { DishRepository } from '../services/DishRepository';
import { IngredientStore } from '../services/IngredientStore';
import { CheckinStore } from '../services/CheckinStore';
import { RecommendEngine, Recommendation } from '../services/RecommendEngine';
import { ShareService } from '../services/ShareService';
import { Dish } from '../model/Dish';
import { Ingredient } from '../model/Ingredient';
import { Checkin } from '../model/Checkin';
import { ShareCardData } from '../model/ShareCardData';
import {
  MealType, MoodType, TimeSlot, ShareTemplate,
  ALL_MOODS, ALL_TIME_SLOTS
} from '../model/Enums';
import { common } from '@kit.AbilityKit';

export type AppSurface =
  | 'home'
  | 'ingredients'
  | 'discover'
  | 'checkin'
  | 'profile'
  | 'dish-detail'
  | 'share-card';

export type AppTab = 'tab-home' | 'tab-ingredients' | 'tab-discover' | 'tab-checkin' | 'tab-profile';

@ObservedV2
export class AppController {
  private static instance: AppController | null = null;

  static getInstance(): AppController {
    if (AppController.instance === null) {
      AppController.instance = new AppController();
    }
    return AppController.instance;
  }

  // ---- navigation ----
  @Trace surface: AppSurface = 'home';
  @Trace activeTab: AppTab = 'tab-home';
  @Trace pendingDishId: string = '';
  private lastTabBeforePush: AppTab = 'tab-home';

  // ---- overlays ----
  @Trace checkinFormVisible: boolean = false;
  @Trace wheelSettingsVisible: boolean = false;

  // ---- wheel (/wheel/*) ----
  @Trace selectedDish: Dish | null = null;
  @Trace isSpinning: boolean = false;

  // ---- ingredients (/ingredients*) ----
  @Trace ingredients: Ingredient[] = [];
  @Trace recommendations: Recommendation[] = [];

  // ---- discover (/discover/*) ----
  @Trace selectedMoods: string[] = [];
  @Trace selectedTimes: string[] = [];
  @Trace results: Dish[] = [];

  // ---- checkin (/checkin/*) ----
  @Trace todayCheckins: Checkin[] = [];
  @Trace todayCount: number = 0;
  @Trace todayCalories: number = 0;
  @Trace streakDays: number = 0;
  @Trace totalCheckins: number = 0;

  // ---- checkin form (/checkinForm/*) ----
  @Trace formMeal: MealType = 'lunch';
  @Trace formDishQuery: string = '';
  @Trace formNote: string = '';
  @Trace formSelectedDish: Dish | null = null;
  @Trace formEditingId: string = '';
  @Trace formSource: string = '';
  @Trace dishSearchResults: Dish[] = [];

  // ---- wheel settings (/wheelSettings/*) ----
  @Trace wheelNewDishName: string = '';
  @Trace wheelCustomDishes: Dish[] = [];

  // ---- profile (/profile/*) ----
  @Trace profileCustomDishes: Dish[] = [];

  // ---- share (/share/*) ----
  @Trace shareCardData: ShareCardData | null = null;
  @Trace shareSelectedTemplate: ShareTemplate = 'classic';
  @Trace shareSource: string = '';
  @Trace shareOriginDishName: string = '';

  // ---- today key ----
  @Trace todayKey: string = '';

  // ---- reactivity hook (kept for non-V2 consumers; V2 @Trace drives UI) ----
  onStateChange: (() => void) | null = null;

  // ---- services ----
  private persistence: PersistenceService;
  private dishRepo: DishRepository;
  private ingredientStore: IngredientStore;
  private checkinStore: CheckinStore;
  private recommendEngine: RecommendEngine;
  private shareService: ShareService;
  private initialized: boolean = false;

  constructor() {
    this.persistence = new PersistenceService();
    this.dishRepo = new DishRepository(this.persistence);
    this.ingredientStore = new IngredientStore(this.persistence);
    this.checkinStore = new CheckinStore(this.persistence);
    this.recommendEngine = new RecommendEngine();
    this.shareService = new ShareService();
  }

  getPersistence(): PersistenceService {
    return this.persistence;
  }

  getDishRepo(): DishRepository {
    return this.dishRepo;
  }

  getShareService(): ShareService {
    return this.shareService;
  }

  // Call once from EntryAbility (after windowStageCreate, on the UI thread).
  async init(context: common.Context): Promise<void> {
    if (this.initialized) {
      return;
    }
    await this.persistence.init(context);
    await this.dishRepo.ensureLoaded();
    await this.ingredientStore.ensureLoaded();
    await this.checkinStore.ensureLoaded();
    this.todayKey = this.computeTodayKey();
    this.refreshAll();
    this.initialized = true;
    this.notify();
  }

  // ===================== wheel =====================

  spinWheel(): void {
    if (this.isSpinning) {
      return;
    }
    const pool: Dish[] = this.dishRepo.wheelPool();
    if (pool.length === 0) {
      this.selectedDish = null;
      this.notify();
      return;
    }
    this.isSpinning = true;
    this.selectedDish = null;
    this.notify();

    // Uniform random pick. (UI phase will add the rotation animation timing.)
    const index: number = Math.floor(Math.random() * pool.length);
    const picked: Dish = pool[index];

    this.isSpinning = false;
    this.selectedDish = picked;
    this.notify();
  }

  openWheelSettings(): void {
    this.wheelCustomDishes = this.dishRepo.wheelCustomDishes();
    this.wheelSettingsVisible = true;
    this.notify();
  }

  closeWheelSettings(): void {
    this.wheelSettingsVisible = false;
    this.notify();
  }

  setWheelNewDishName(name: string): void {
    this.wheelNewDishName = name;
    this.notify();
  }

  async addWheelDish(): Promise<boolean> {
    const added: Dish | null = await this.dishRepo.addWheelDish(this.wheelNewDishName);
    if (added === null) {
      return false;
    }
    this.wheelNewDishName = '';
    this.wheelCustomDishes = this.dishRepo.wheelCustomDishes();
    this.notify();
    return true;
  }

  async removeWheelDish(id: string): Promise<void> {
    await this.dishRepo.removeWheelDish(id);
    this.wheelCustomDishes = this.dishRepo.wheelCustomDishes();
    this.notify();
  }

  async resetWheelDishes(): Promise<void> {
    await this.dishRepo.resetWheelDishes();
    this.wheelCustomDishes = this.dishRepo.wheelCustomDishes();
    this.notify();
  }

  // ===================== ingredients =====================

  async addIngredient(name: string): Promise<boolean> {
    const added: Ingredient | null = await this.ingredientStore.add(name);
    if (added === null) {
      return false;
    }
    this.ingredients = this.ingredientStore.all();
    this.recomputeRecommendations();
    this.notify();
    return true;
  }

  async removeIngredient(id: string): Promise<void> {
    await this.ingredientStore.remove(id);
    this.ingredients = this.ingredientStore.all();
    this.recomputeRecommendations();
    this.notify();
  }

  async clearIngredients(): Promise<void> {
    await this.ingredientStore.clear();
    this.ingredients = this.ingredientStore.all();
    this.recomputeRecommendations();
    this.notify();
  }

  private recomputeRecommendations(): void {
    this.recommendations = this.recommendEngine.recommend(this.dishRepo.allAvailable(), this.ingredients);
  }

  // ===================== discover =====================

  toggleMood(mood: MoodType): void {
    this.selectedMoods = this.toggleValue(this.selectedMoods, mood);
    this.recomputeDiscover();
    this.notify();
  }

  toggleTime(time: TimeSlot): void {
    this.selectedTimes = this.toggleValue(this.selectedTimes, time);
    this.recomputeDiscover();
    this.notify();
  }

  resetFilters(): void {
    this.selectedMoods = [];
    this.selectedTimes = [];
    this.recomputeDiscover();
    this.notify();
  }

  isMoodSelected(mood: MoodType): boolean {
    return this.containsValue(this.selectedMoods, mood);
  }

  isTimeSelected(time: TimeSlot): boolean {
    return this.containsValue(this.selectedTimes, time);
  }

  private recomputeDiscover(): void {
    this.results = this.dishRepo.filter(this.selectedMoods, this.selectedTimes);
  }

  // ===================== dish detail =====================

  openDishDetail(dishId: string): void {
    this.pendingDishId = dishId;
    this.lastTabBeforePush = this.activeTab;
    this.surface = 'dish-detail';
    this.notify();
  }

  getPendingDish(): Dish | null {
    if (this.pendingDishId.length === 0) {
      return null;
    }
    return this.dishRepo.findById(this.pendingDishId);
  }

  // ===================== checkin =====================

  // source values mirror ui-tree context.source: 'home-quick' | 'ingredients-recommend'
  // | 'dish-detail' | 'checkin'. presetDishId preselects a dish; editingId edits.
  openCheckinForm(source: string, presetDishId: string, editingId: string): void {
    this.formSource = source;
    this.formEditingId = editingId;
    this.formNote = '';
    this.formDishQuery = '';
    this.formSelectedDish = null;
    this.dishSearchResults = [];
    this.formMeal = 'lunch';

    if (editingId.length > 0) {
      const existing: Checkin | null = this.checkinStore.findById(editingId);
      if (existing !== null) {
        this.formMeal = existing.meal as MealType;
        this.formNote = existing.note;
        this.formDishQuery = existing.dishName;
        const dish: Dish | null = this.dishRepo.findById(existing.dishId);
        if (dish !== null) {
          this.formSelectedDish = dish;
        }
      }
    } else if (presetDishId.length > 0) {
      const dish: Dish | null = this.dishRepo.findById(presetDishId);
      if (dish !== null) {
        this.formSelectedDish = dish;
        this.formDishQuery = dish.name;
      }
    }

    this.checkinFormVisible = true;
    this.notify();
  }

  cancelCheckinForm(): void {
    this.checkinFormVisible = false;
    this.notify();
  }

  selectMeal(meal: MealType): void {
    this.formMeal = meal;
    this.notify();
  }

  setDishQuery(query: string): void {
    this.formDishQuery = query;
    this.dishSearchResults = this.dishRepo.searchByName(query);
    // Auto-match if the query exactly equals a dish name.
    const exact: Dish | null = this.dishRepo.findByName(query);
    this.formSelectedDish = exact;
    this.notify();
  }

  selectDishFromSearch(dish: Dish): void {
    this.formSelectedDish = dish;
    this.formDishQuery = dish.name;
    this.dishSearchResults = [];
    this.notify();
  }

  setNote(note: string): void {
    this.formNote = note;
    this.notify();
  }

  async submitCheckin(): Promise<boolean> {
    if (this.formSelectedDish === null) {
      return false;
    }
    const dish: Dish = this.formSelectedDish;
    const id: string = this.formEditingId.length > 0 ? this.formEditingId : 'k_' + Date.now();
    const checkin: Checkin = CheckinStore.buildCheckin(
      id,
      dish.id,
      dish.name,
      this.formMeal,
      this.formNote,
      dish.calories,
      Date.now()
    );
    await this.checkinStore.upsert(checkin);
    this.refreshCheckinStats();
    this.checkinFormVisible = false;
    this.notify();
    return true;
  }

  editCheckin(id: string): void {
    this.openCheckinForm('checkin', '', id);
  }

  async deleteCheckin(id: string): Promise<void> {
    await this.checkinStore.remove(id);
    this.refreshCheckinStats();
    this.notify();
  }

  // ===================== share =====================

  openShareCard(source: string, checkinId: string): void {
    this.shareSource = source;
    this.shareSelectedTemplate = 'classic';
    let data: ShareCardData | null = null;
    if (source === 'checkin' && checkinId.length > 0) {
      const checkin: Checkin | null = this.checkinStore.findById(checkinId);
      if (checkin !== null) {
        data = this.shareService.buildFromCheckin(
          checkin, this.streakDays, this.totalCheckins, this.shareSelectedTemplate);
        this.shareOriginDishName = checkin.dishName;
      }
    } else {
      // wheel-result or dish-detail share
      const dish: Dish | null = this.pendingDishId.length > 0 ? this.dishRepo.findById(this.pendingDishId) : null;
      const name: string = dish !== null ? dish.name : (this.selectedDish !== null ? this.selectedDish.name : '今日推荐');
      data = this.shareService.buildFromWheel(
        name, this.todayKey, this.streakDays, this.totalCheckins, this.shareSelectedTemplate);
      this.shareOriginDishName = name;
    }
    this.shareCardData = data;
    this.lastTabBeforePush = this.activeTab;
    this.surface = 'share-card';
    this.notify();
  }

  selectTemplate(template: ShareTemplate): void {
    this.shareSelectedTemplate = template;
    if (this.shareCardData !== null) {
      const rebuilt: ShareCardData = {
        dateKey: this.shareCardData.dateKey,
        title: this.shareCardData.title,
        moodLine: this.shareCardData.moodLine,
        streakDays: this.shareCardData.streakDays,
        totalCheckins: this.shareCardData.totalCheckins,
        template: template,
      };
      this.shareCardData = rebuilt;
    }
    this.notify();
  }

  // Visual integration renders the card to an image file then calls these.
  async shareCard(context: common.UIAbilityContext, imageUri: string): Promise<void> {
    await this.shareService.shareImage(context, imageUri);
  }

  async saveCard(context: common.Context, imageUri: string): Promise<string> {
    return await this.shareService.saveImageToAlbum(context, imageUri);
  }

  // ===================== profile =====================

  async addCustomDish(name: string): Promise<boolean> {
    const added: Dish | null = await this.dishRepo.addCustomDish(name);
    if (added === null) {
      return false;
    }
    this.profileCustomDishes = this.dishRepo.customDishes();
    this.notify();
    return true;
  }

  async clearAllData(): Promise<void> {
    await this.ingredientStore.clear();
    await this.checkinStore.clear();
    await this.dishRepo.clearAllUserData();
    this.refreshAll();
    this.notify();
  }

  // ===================== navigation =====================

  goToTab(tab: AppTab): void {
    this.activeTab = tab;
    if (tab === 'tab-home') {
      this.surface = 'home';
    } else if (tab === 'tab-ingredients') {
      this.surface = 'ingredients';
    } else if (tab === 'tab-discover') {
      this.surface = 'discover';
    } else if (tab === 'tab-checkin') {
      this.surface = 'checkin';
    } else if (tab === 'tab-profile') {
      this.surface = 'profile';
      this.profileCustomDishes = this.dishRepo.customDishes();
    }
    this.notify();
  }

  back(): void {
    if (this.checkinFormVisible) {
      this.checkinFormVisible = false;
      this.notify();
      return;
    }
    if (this.wheelSettingsVisible) {
      this.wheelSettingsVisible = false;
      this.notify();
      return;
    }
    if (this.surface === 'dish-detail' || this.surface === 'share-card') {
      this.goToTab(this.lastTabBeforePush);
      return;
    }
    this.goToTab('tab-home');
  }

  isTabSurface(): boolean {
    return this.surface === 'home'
      || this.surface === 'ingredients'
      || this.surface === 'discover'
      || this.surface === 'checkin'
      || this.surface === 'profile';
  }

  // ===================== helpers =====================

  private refreshAll(): void {
    this.ingredients = this.ingredientStore.all();
    this.recomputeRecommendations();
    this.recomputeDiscover();
    this.refreshCheckinStats();
    this.wheelCustomDishes = this.dishRepo.wheelCustomDishes();
    this.profileCustomDishes = this.dishRepo.customDishes();
  }

  private refreshCheckinStats(): void {
    this.todayCheckins = this.checkinStore.todayList(this.todayKey);
    this.todayCount = this.todayCheckins.length;
    this.todayCalories = this.checkinStore.todayCalories(this.todayKey);
    this.streakDays = this.checkinStore.streakDays(this.todayKey);
    this.totalCheckins = this.checkinStore.totalCheckins();
  }

  private computeTodayKey(): string {
    const now: number = Date.now();
    const date: Date = new Date(now);
    const year: number = date.getFullYear();
    const month: number = date.getMonth() + 1;
    const day: number = date.getDate();
    const monthStr: string = month < 10 ? '0' + month : '' + month;
    const dayStr: string = day < 10 ? '0' + day : '' + day;
    return year + '-' + monthStr + '-' + dayStr;
  }

  private toggleValue(arr: string[], value: string): string[] {
    const next: string[] = [];
    let present: boolean = false;
    for (let i = 0; i < arr.length; i++) {
      if (arr[i] === value) {
        present = true;
      } else {
        next.push(arr[i]);
      }
    }
    if (!present) {
      next.push(value);
    }
    return next;
  }

  private containsValue(arr: string[], value: string): boolean {
    for (let i = 0; i < arr.length; i++) {
      if (arr[i] === value) {
        return true;
      }
    }
    return false;
  }

  private notify(): void {
    if (this.onStateChange !== null) {
      this.onStateChange();
    }
  }

  // Expose label helpers for the UI (avoids duplicating enum label logic).
  availableMoods(): MoodType[] {
    return ALL_MOODS;
  }

  availableTimeSlots(): TimeSlot[] {
    return ALL_TIME_SLOTS;
  }
}
