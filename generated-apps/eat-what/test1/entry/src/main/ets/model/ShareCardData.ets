// ShareCardData — payload rendered onto a share card.

import { ShareTemplate } from './Enums';

export interface ShareCardData {
  dateKey: string;
  title: string;        // dish name or meal summary
  moodLine: string;     // one-line mood / slogan
  streakDays: number;   // consecutive checkin days
  totalCheckins: number;// total checkin count
  template: string;     // ShareTemplate
}

export function makeShareCardData(
  dateKey: string,
  title: string,
  moodLine: string,
  streakDays: number,
  totalCheckins: number,
  template: ShareTemplate
): ShareCardData {
  const data: ShareCardData = {
    dateKey: dateKey,
    title: title,
    moodLine: moodLine,
    streakDays: streakDays,
    totalCheckins: totalCheckins,
    template: template,
  };
  return data;
}
