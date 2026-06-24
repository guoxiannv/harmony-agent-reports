// Built-in dish bank — the local-only dish dataset seeded on first launch.
// No backend, no network. Each dish carries tags, required ingredients, short
// steps, calories, applicable time slots, and mood tags so that the wheel,
// ingredient recommendation, and mood/time filtering all derive from one source.

import { Dish, makeBuiltinDish } from '../model/Dish';

export class DishBank {
  // Returns a fresh array of built-in dishes (callers own the array).
  static all(): Dish[] {
    const list: Dish[] = [];

    list.push(makeBuiltinDish('d_tomato_egg', '番茄炒蛋', '家常菜',
      ['清淡', '快手'], ['番茄', '鸡蛋'],
      ['鸡蛋打散', '番茄切块翻炒', '加入蛋液炒匀'], 220,
      ['breakfast', 'lunch', 'dinner'], ['light', 'quick']));

    list.push(makeBuiltinDish('d_fried_rice', '蛋炒饭', '主食',
      ['快手', '饱腹'], ['米饭', '鸡蛋', '葱'],
      ['隔夜米饭打散', '鸡蛋炒散', '下米饭翻炒调味'], 380,
      ['lunch', 'dinner', 'lateNight'], ['quick', 'heavy']));

    list.push(makeBuiltinDish('d_noodle', '阳春面', '主食',
      ['清淡', '治愈'], ['面条', '葱', '酱油'],
      ['水开下面', '调汤底', '盛面撒葱'], 320,
      ['breakfast', 'lunch', 'lateNight'], ['light', 'comfort']));

    list.push(makeBuiltinDish('d_congee', '皮蛋瘦肉粥', '主食',
      ['清淡', '暖胃'], ['大米', '皮蛋', '瘦肉'],
      ['大米熬粥', '瘦肉腌制', '加皮蛋煮透调味'], 260,
      ['breakfast', 'lateNight'], ['light', 'comfort']));

    list.push(makeBuiltinDish('d_kungpao', '宫保鸡丁', '家常菜',
      ['重口味', '下饭'], ['鸡胸肉', '花生', '干辣椒'],
      ['鸡丁腌制', '爆香干辣椒', '翻炒鸡丁花生调味'], 480,
      ['lunch', 'dinner'], ['heavy']));

    list.push(makeBuiltinDish('d_mapo', '麻婆豆腐', '家常菜',
      ['重口味', '下饭'], ['豆腐', '猪肉末', '豆瓣酱'],
      ['豆腐焯水', '炒肉末豆瓣酱', '加豆腐烧入味勾芡'], 360,
      ['lunch', 'dinner'], ['heavy']));

    list.push(makeBuiltinDish('d_steamed_fish', '清蒸鱼', '荤菜',
      ['清淡', '健康'], ['鱼', '姜', '葱'],
      ['鱼处理干净', '姜葱铺底蒸熟', '淋热油酱油'], 240,
      ['dinner'], ['light', 'healthy']));

    list.push(makeBuiltinDish('d_chicken_salad', '鸡胸肉沙拉', '轻食',
      ['健康', '低卡'], ['鸡胸肉', '生菜', '番茄'],
      ['鸡胸肉煎熟切片', '蔬菜洗净', '拌匀调味'], 280,
      ['lunch', 'dinner'], ['healthy', 'light']));

    list.push(makeBuiltinDish('d_beef_noodle', '红烧牛肉面', '主食',
      ['重口味', '饱腹'], ['牛肉', '面条', '姜'],
      ['牛肉炖烂', '调红烧汤底', '面条煮熟浇汤'], 560,
      ['lunch', 'dinner'], ['heavy', 'comfort']));

    list.push(makeBuiltinDish('d_dumpling', '猪肉白菜饺子', '主食',
      ['治愈', '饱腹'], ['饺子', '猪肉', '白菜'],
      ['水烧开', '下饺子煮至浮起', '蘸醋食用'], 420,
      ['dinner', 'lateNight'], ['comfort']));

    list.push(makeBuiltinDish('d_porridge_veg', '杂粮粥', '主食',
      ['清淡', '健康'], ['杂粮', '红枣'],
      ['杂粮洗净', '加水慢熬', '加红枣煮软'], 210,
      ['breakfast'], ['light', 'healthy']));

    list.push(makeBuiltinDish('d_omelette', '蔬菜煎蛋饼', '家常菜',
      ['快手', '营养'], ['鸡蛋', '胡萝卜', '葱'],
      ['蔬菜切丁', '蛋液混合', '小火煎成饼'], 250,
      ['breakfast', 'lunch'], ['quick', 'light']));

    list.push(makeBuiltinDish('d_hotpot', '麻辣火锅', '重口',
      ['重口味', '放纵'], ['火锅底料', '牛肉', '豆腐'],
      ['底料煮开', '下喜欢的食材', '蘸料食用'], 720,
      ['dinner', 'lateNight'], ['heavy', 'indulge']));

    list.push(makeBuiltinDish('d_braised_pork', '红烧肉', '荤菜',
      ['重口味', '放纵'], ['五花肉', '冰糖', '酱油'],
      ['五花肉焯水', '冰糖炒糖色', '加肉炖至软烂'], 600,
      ['lunch', 'dinner'], ['heavy', 'indulge']));

    list.push(makeBuiltinDish('d_cola_chicken', '可乐鸡翅', '荤菜',
      ['重口味', '快手'], ['鸡翅', '可乐', '酱油'],
      ['鸡翅划刀焯水', '煎至金黄', '加可乐酱油收汁'], 420,
      ['lunch', 'dinner'], ['quick', 'comfort']));

    list.push(makeBuiltinDish('d_tofu_soup', '番茄豆腐汤', '汤',
      ['清淡', '暖胃'], ['番茄', '豆腐', '葱'],
      ['番茄炒出汁', '加水煮开', '下豆腐煮透调味'], 160,
      ['lunch', 'dinner'], ['light', 'comfort']));

    list.push(makeBuiltinDish('d_fried_noodle', '酱油炒面', '主食',
      ['快手', '饱腹'], ['面条', '酱油', '卷心菜'],
      ['面条煮熟过水', '蔬菜炒香', '下面翻炒调味'], 410,
      ['lunch', 'dinner', 'lateNight'], ['quick']));

    list.push(makeBuiltinDish('d_cucumber', '凉拌黄瓜', '小菜',
      ['清淡', '快手'], ['黄瓜', '蒜', '醋'],
      ['黄瓜拍碎', '蒜泥调味', '拌匀冷藏'], 80,
      ['lunch', 'dinner'], ['light', 'quick']));

    list.push(makeBuiltinDish('d_curry_rice', '咖喱鸡饭', '主食',
      ['重口味', '治愈'], ['米饭', '鸡肉', '咖喱'],
      ['鸡肉土豆煮熟', '加咖喱块融化', '浇在米饭上'], 520,
      ['lunch', 'dinner'], ['heavy', 'comfort']));

    list.push(makeBuiltinDish('d_milk_tea', '自制奶茶', '饮品',
      ['治愈', '放纵'], ['红茶', '牛奶', '糖'],
      ['红茶煮浓', '加牛奶混合', '按口味加糖'], 240,
      ['lateNight'], ['comfort', 'indulge']));

    return list;
  }

  // Default ids used as the wheel pool when the user has not customized it.
  static defaultWheelIds(): string[] {
    const ids: string[] = [
      'd_tomato_egg', 'd_fried_rice', 'd_noodle', 'd_congee', 'd_kungpao',
      'd_mapo', 'd_steamed_fish', 'd_dumpling', 'd_cola_chicken', 'd_curry_rice',
    ];
    return ids;
  }
}
