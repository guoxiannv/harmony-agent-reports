// ShareService — builds ShareCardData payloads and, given a rendered card
// image file URI, invokes the system share sheet or saves to the album.
//
// Headless scope: data building is complete. shareImage() and saveImageToAlbum()
// use the real @kit.ShareKit / @kit.MediaLibraryKit APIs but require a card
// image file URI produced from a canvas PixelMap — that rendering is produced
// during visual integration. See .arkpilot/api-reference/02-share-kit.md and
// 03-media-library.md.

import { systemShare } from '@kit.ShareKit';
import { photoAccessHelper } from '@kit.MediaLibraryKit';
import { common } from '@kit.AbilityKit';
import { ShareCardData, makeShareCardData } from '../model/ShareCardData';
import { ShareTemplate } from '../model/Enums';
import { Checkin } from '../model/Checkin';

// UTD id for a generic image resource (equivalent to
// utd.UniformDataType.IMAGE resolved for a .png). Hardcoded because the
// @kit.UnifiedDataKit module is not resolvable in this SDK version; the value
// is stable per the Uniform Type Descriptor standard.
const IMAGE_UTD: string = 'general.image';

export class ShareService {
  // Build a card from a checkin (打卡分享).
  buildFromCheckin(
    checkin: Checkin,
    streakDays: number,
    totalCheckins: number,
    template: ShareTemplate
  ): ShareCardData {
    return makeShareCardData(
      checkin.dateKey,
      checkin.dishName,
      this.moodLineForMeal(checkin.meal),
      streakDays,
      totalCheckins,
      template
    );
  }

  // Build a card from a wheel result (转盘结果分享).
  buildFromWheel(
    dishName: string,
    dateKey: string,
    streakDays: number,
    totalCheckins: number,
    template: ShareTemplate
  ): ShareCardData {
    return makeShareCardData(
      dateKey,
      dishName,
      '今天转盘替你做了决定',
      streakDays,
      totalCheckins,
      template
    );
  }

  // Invoke the system share sheet for a card image file URI.
  async shareImage(context: common.UIAbilityContext, imageUri: string): Promise<void> {
    const sharedData: systemShare.SharedData = new systemShare.SharedData({
      utd: IMAGE_UTD,
      uri: imageUri,
      title: '今天吃什么打卡卡片',
    });
    const controller: systemShare.ShareController = new systemShare.ShareController(sharedData);
    await controller.show(context, {
      previewMode: systemShare.SharePreviewMode.DETAIL,
      selectionMode: systemShare.SelectionMode.SINGLE,
    });
  }

  // Save a card image file URI into the system album via the user-consent
  // creation dialog (no WRITE_IMAGEVIDEO permission required).
  async saveImageToAlbum(context: common.Context, imageUri: string): Promise<string> {
    const helper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);
    const config: photoAccessHelper.PhotoCreationConfig = {
      title: 'eatwhat_sharecard',
      fileNameExtension: 'png',
      photoType: photoAccessHelper.PhotoType.IMAGE,
      subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
    };
    const configs: Array<photoAccessHelper.PhotoCreationConfig> = [config];
    const srcUris: Array<string> = [imageUri];
    const destUris: Array<string> = await helper.showAssetsCreationDialog(srcUris, configs);
    if (destUris.length > 0) {
      return destUris[0];
    }
    return '';
  }

  private moodLineForMeal(meal: string): string {
    if (meal === 'breakfast') {
      return '元气满满的一天从早餐开始';
    } else if (meal === 'lunch') {
      return '好好吃午饭，下午才有劲';
    } else if (meal === 'dinner') {
      return '今天辛苦啦，晚餐好好犒劳自己';
    }
    return '深夜来一点，治愈一天的疲惫';
  }
}
