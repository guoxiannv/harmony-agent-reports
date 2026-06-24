// ShareCardService.ets
//
// 分享卡片数据构建（FR-5）。从打卡记录或菜品生成 ShareCardModel。
// 卡片渲染、保存到相册与系统分享在视觉集成阶段实现，这里只产出数据。

import { CheckInRecord, Dish, ShareCardModel } from '../model/Types';

export class ShareCardService {
  static buildFromCheckIn(record: CheckInRecord): ShareCardModel {
    return {
      date: record.date,
      meal: record.meal,
      dishName: record.dishName,
      moods: record.moods,
      recommend: record.note.length > 0 ? record.note : '今天这顿，刚刚好。',
    };
  }

  static buildFromDish(dish: Dish): ShareCardModel {
    return {
      date: '',
      meal: '午餐',
      dishName: dish.name,
      moods: dish.moods,
      recommend: dish.recommend,
    };
  }
}
