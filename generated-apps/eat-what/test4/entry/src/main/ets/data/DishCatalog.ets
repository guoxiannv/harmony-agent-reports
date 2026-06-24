// DishCatalog.ets
//
// The dish library for the 今天吃什么 app. Per spec this is a hard-coded
// fallback dish list (default behavior), NOT seeded user/demo data. It powers
// the wheel, fridge recommendations, and mood/time filtering.

import { Dish } from '../model/Models';

export class DishCatalog {
  private static readonly DISHES: Dish[] = [
    {
      id: 'd-tomato-egg', name: '番茄炒蛋', ingredientNames: ['番茄', '鸡蛋'],
      moods: ['quick', 'comfort'], times: ['breakfast', 'lunch', 'dinner'],
      minutes: 10, calories: 220,
    },
    {
      id: 'd-fried-rice', name: '蛋炒饭', ingredientNames: ['米饭', '鸡蛋', '葱'],
      moods: ['quick', 'comfort'], times: ['lunch', 'dinner', 'lateNight'],
      minutes: 15, calories: 480,
    },
    {
      id: 'd-noodle', name: '阳春面', ingredientNames: ['面条', '葱', '鸡蛋'],
      moods: ['light', 'comfort'], times: ['breakfast', 'lunch', 'lateNight'],
      minutes: 12, calories: 350,
    },
    {
      id: 'd-hotpot', name: '麻辣火锅', ingredientNames: ['牛肉', '豆腐', '白菜', '辣椒'],
      moods: ['rich', 'spicy'], times: ['dinner'],
      minutes: 60, calories: 900,
    },
    {
      id: 'd-mapo-tofu', name: '麻婆豆腐', ingredientNames: ['豆腐', '猪肉', '辣椒'],
      moods: ['spicy', 'rich'], times: ['lunch', 'dinner'],
      minutes: 25, calories: 420,
    },
    {
      id: 'd-congee', name: '皮蛋瘦肉粥', ingredientNames: ['大米', '皮蛋', '猪肉'],
      moods: ['light', 'comfort'], times: ['breakfast', 'lateNight'],
      minutes: 40, calories: 300,
    },
    {
      id: 'd-steak', name: '香煎牛排', ingredientNames: ['牛肉', '黄油'],
      moods: ['rich'], times: ['dinner'],
      minutes: 20, calories: 650,
    },
    {
      id: 'd-salad', name: '田园沙拉', ingredientNames: ['生菜', '番茄', '黄瓜'],
      moods: ['light', 'quick'], times: ['lunch', 'dinner'],
      minutes: 10, calories: 180,
    },
    {
      id: 'd-cake', name: '提拉米苏', ingredientNames: ['奶油', '咖啡', '鸡蛋'],
      moods: ['sweet'], times: ['lunch', 'dinner'],
      minutes: 45, calories: 380,
    },
    {
      id: 'd-dumplings', name: '白菜猪肉饺子', ingredientNames: ['面粉', '猪肉', '白菜'],
      moods: ['comfort', 'rich'], times: ['dinner', 'lateNight'],
      minutes: 50, calories: 520,
    },
    {
      id: 'd-curry', name: '咖喱鸡肉饭', ingredientNames: ['鸡肉', '土豆', '咖喱'],
      moods: ['spicy', 'rich'], times: ['lunch', 'dinner'],
      minutes: 35, calories: 600,
    },
    {
      id: 'd-sandwich', name: '鸡蛋三明治', ingredientNames: ['面包', '鸡蛋', '生菜'],
      moods: ['quick', 'light'], times: ['breakfast', 'lunch'],
      minutes: 8, calories: 320,
    },
    {
      id: 'd-ramen', name: '日式拉面', ingredientNames: ['面条', '鸡蛋', '猪肉'],
      moods: ['comfort', 'rich'], times: ['lunch', 'dinner', 'lateNight'],
      minutes: 30, calories: 550,
    },
    {
      id: 'd-pancake', name: '松饼', ingredientNames: ['面粉', '鸡蛋', '牛奶'],
      moods: ['sweet', 'quick'], times: ['breakfast'],
      minutes: 15, calories: 360,
    },
    {
      id: 'd-grilled-fish', name: '香煎三文鱼', ingredientNames: ['三文鱼', '柠檬'],
      moods: ['light', 'rich'], times: ['dinner'],
      minutes: 18, calories: 420,
    },
    {
      id: 'd-oatmeal', name: '牛奶燕麦', ingredientNames: ['燕麦', '牛奶'],
      moods: ['light', 'quick'], times: ['breakfast'],
      minutes: 5, calories: 260,
    },
  ];

  static all(): Dish[] {
    return DishCatalog.DISHES;
  }

  static byId(id: string): Dish | null {
    for (let i = 0; i < DishCatalog.DISHES.length; i++) {
      if (DishCatalog.DISHES[i].id === id) {
        return DishCatalog.DISHES[i];
      }
    }
    return null;
  }
}
