import { photoAccessHelper } from '@kit.MediaLibraryKit';

export class PhotoPickerService {
  async pickAvatar(context: Context): Promise<string> {
    const uris: string[] = await this.pickImages(context, 1);
    return uris[0] ?? '';
  }

  async pickWorks(context: Context, max: number): Promise<string[]> {
    return await this.pickImages(context, max);
  }

  private async pickImages(context: Context, max: number): Promise<string[]> {
    try {
      const picker: photoAccessHelper.PhotoViewPicker = new photoAccessHelper.PhotoViewPicker();
      const options: photoAccessHelper.PhotoSelectOptions = new photoAccessHelper.PhotoSelectOptions();
      options.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE;
      options.maxSelectNumber = max;
      const result: photoAccessHelper.PhotoSelectResult = await picker.select(options);
      return result.photoUris ?? [];
    } catch (_) {
      return [];
    }
  }
}
