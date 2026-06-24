// FridgeController.ets
//
// Controller for the fridge-page surface. Owns /fridge/input,
// /fridge/ingredients, and /fridge/recommendations.

import { Ingredient, Recommendation } from '../model/Models';
import { DishCatalog } from '../data/DishCatalog';
import { IngredientCatalog } from '../data/IngredientCatalog';
import { RecommendationEngine } from '../service/RecommendationEngine';

export class FridgeController {
  // /fridge/input
  inputText: string = '';
  // /fridge/ingredients
  ingredients: Ingredient[] = [];
  // /fridge/recommendations
  recommendations: Recommendation[] = [];

  lastFeedback: string = '';
  private idCounter: number = 0;

  onChange: () => void = () => {};

  // input /fridge/input
  setInput(text: string): void {
    this.inputText = text;
    this.notify();
  }

  // Autocomplete suggestions for the current input.
  suggestions(limit: number = 8): string[] {
    return IngredientCatalog.suggest(this.inputText, limit);
  }

  // event add-ingredient
  addIngredient(): void {
    const name: string = this.inputText.trim();
    if (name.length === 0) {
      this.lastFeedback = '请输入食材名称';
      this.notify();
      return;
    }
    if (this.hasIngredient(name)) {
      this.lastFeedback = '已存在该食材';
      this.inputText = '';
      this.notify();
      return;
    }
    const item: Ingredient = { id: this.nextId(), name: name };
    this.ingredients.push(item);
    this.inputText = '';
    this.lastFeedback = '';
    this.notify();
  }

  // event remove-ingredient
  removeIngredient(id: string): void {
    const next: Ingredient[] = [];
    for (let i = 0; i < this.ingredients.length; i++) {
      if (this.ingredients[i].id !== id) {
        next.push(this.ingredients[i]);
      }
    }
    this.ingredients = next;
    this.notify();
  }

  // event recommend-by-ingredients
  recommend(): void {
    const names: string[] = this.ingredients.map((ing: Ingredient) => ing.name);
    this.recommendations = RecommendationEngine.rankByIngredients(DishCatalog.all(), names);
    if (this.recommendations.length === 0) {
      this.lastFeedback = names.length === 0 ? '请先添加食材' : '没有匹配的菜品';
    } else {
      this.lastFeedback = '';
    }
    this.notify();
  }

  private hasIngredient(name: string): boolean {
    const lower: string = name.toLowerCase();
    for (let i = 0; i < this.ingredients.length; i++) {
      if (this.ingredients[i].name.toLowerCase() === lower) {
        return true;
      }
    }
    return false;
  }

  nextId(): string {
    this.idCounter += 1;
    return `ing-${Date.now()}-${this.idCounter}`;
  }

  private notify(): void {
    this.onChange();
  }
}

export const fridgeController: FridgeController = new FridgeController();
