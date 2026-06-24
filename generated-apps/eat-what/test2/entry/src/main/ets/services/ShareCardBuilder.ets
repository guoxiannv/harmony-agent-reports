// ShareCardBuilder.ets
//
// Builds ShareCardData from either a saved check-in record or an
// in-the-moment decision result (wheel / ingredient / filter).

import { Dish, DishRecord, ShareCardData, ShareCardSource, mealLabelOf } from '../common/Models';
import { DateUtil } from '../common/DateUtil';

export class ShareCardBuilder {
  static fromRecord(rec: DishRecord): ShareCardData {
    const mealLabel = mealLabelOf(rec.meal);
    return {
      dishName: rec.dishName,
      dateLabel: DateUtil.formatChinese(rec.date),
      mealLabel,
      reason: `今日${mealLabel}打卡`,
      tags: [],
      source: 'record',
    };
  }

  static fromDecision(
    dish: Dish,
    source: ShareCardSource,
    reason: string,
    dateLabel: string,
  ): ShareCardData {
    return {
      dishName: dish.name,
      dateLabel,
      mealLabel: '',
      reason,
      tags: dish.tags.slice(),
      source,
    };
  }
}
