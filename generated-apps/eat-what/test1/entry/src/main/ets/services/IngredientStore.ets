// IngredientStore — persistence-backed CRUD for the user's fridge ingredient list.

import { Ingredient, makeIngredient } from '../model/Ingredient';
import { PersistenceService } from './PersistenceService';

export const KEY_INGREDIENTS: string = 'ingredients';

export class IngredientStore {
  private persistence: PersistenceService;
  private cache: Ingredient[] = [];
  private loaded: boolean = false;

  constructor(persistence: PersistenceService) {
    this.persistence = persistence;
  }

  async ensureLoaded(): Promise<void> {
    if (this.loaded) {
      return;
    }
    const raw: string = await this.persistence.loadString(KEY_INGREDIENTS, '');
    if (raw.length > 0) {
      try {
        this.cache = JSON.parse(raw) as Ingredient[];
      } catch (e) {
        this.cache = [];
      }
    }
    this.loaded = true;
  }

  all(): Ingredient[] {
    const out: Ingredient[] = [];
    for (let i = 0; i < this.cache.length; i++) {
      out.push(this.cache[i]);
    }
    return out;
  }

  hasName(name: string): boolean {
    const lowered: string = name.trim().toLowerCase();
    for (let i = 0; i < this.cache.length; i++) {
      if (this.cache[i].name.trim().toLowerCase() === lowered) {
        return true;
      }
    }
    return false;
  }

  async add(name: string): Promise<Ingredient | null> {
    const trimmed: string = name.trim();
    if (trimmed.length === 0 || this.hasName(trimmed)) {
      return null;
    }
    const ingredient: Ingredient = makeIngredient('i_' + Date.now() + '_' + this.cache.length, trimmed);
    this.cache.push(ingredient);
    await this.persist();
    return ingredient;
  }

  async remove(id: string): Promise<void> {
    const next: Ingredient[] = [];
    for (let i = 0; i < this.cache.length; i++) {
      if (this.cache[i].id !== id) {
        next.push(this.cache[i]);
      }
    }
    this.cache = next;
    await this.persist();
  }

  async clear(): Promise<void> {
    this.cache = [];
    await this.persist();
  }

  private async persist(): Promise<void> {
    await this.persistence.saveString(KEY_INGREDIENTS, JSON.stringify(this.cache));
  }
}
