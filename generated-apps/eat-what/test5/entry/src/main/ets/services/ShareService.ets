// ShareService.ets
// Composes share-card data and performs best-effort capture+save of a preview node.
// Save-to-album requires photo permission; first version saves to app files dir and
// returns a clear feedback path. Album permission is documented as deferred.

import { componentSnapshot } from '@kit.ArkUI';
import { fileIo as fs } from '@kit.CoreFileKit';
import { image } from '@kit.ImageKit';
import { common } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@kit.BasicServicesKit';

const DOMAIN = 0x0e1a;

export interface ShareCard {
  title: string;
  subtitle: string;
  caption: string;
  badge: string;
}

export interface ShareTemplate {
  id: string;
  name: string;
}

export const SHARE_TEMPLATES: ShareTemplate[] = [
  { id: 'today', name: '今日打卡' },
  { id: 'wheel', name: '转盘结果' },
  { id: 'streak', name: '连续打卡' },
];

export class ShareService {
  static templates(): ShareTemplate[] {
    return SHARE_TEMPLATES;
  }

  static buildCard(title: string, subtitle: string, caption: string, badge: string): ShareCard {
    return { title: title, subtitle: subtitle, caption: caption, badge: badge };
  }

  // Capture a node by id and save PNG to the app files dir. Returns saved path or empty.
  static async captureAndSave(context: common.Context, nodeId: string): Promise<string> {
    try {
      const pixelMap = await componentSnapshot.get(nodeId);
      const dir = context.filesDir;
      const fileName = 'share_' + Date.now() + '.png';
      const path = dir + '/' + fileName;
      const file = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      const packer = image.createImagePacker();
      const pngData: ArrayBuffer = await packer.packing(pixelMap, { format: 'image/png', quality: 90 });
      fs.writeSync(file.fd, pngData);
      fs.closeSync(file);
      hilog.info(DOMAIN, 'eatwhat', 'share card saved to %{public}s', path);
      return path;
    } catch (err) {
      const e = err as BusinessError;
      hilog.error(DOMAIN, 'eatwhat', 'captureAndSave failed code=%{public}s msg=%{public}s',
        e.code.toString(), e.message);
      return '';
    }
  }
}
