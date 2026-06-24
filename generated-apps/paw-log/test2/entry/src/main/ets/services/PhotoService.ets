import { common } from '@kit.AbilityKit';
import { photoAccessHelper } from '@kit.MediaLibraryKit';
import { fileIo } from '@kit.CoreFileKit';

const MAX_IMAGES = 6

export class PhotoService {
  private context: common.UIAbilityContext

  constructor(context: common.UIAbilityContext) {
    this.context = context
  }

  async pickAvatar(): Promise<string> {
    return this.pickImage(1)
  }

  async pickMedicalImages(existingCount: number): Promise<string[]> {
    let limit: number = Math.max(0, MAX_IMAGES - existingCount)
    if (limit === 0) {
      return []
    }
    let uri: string = await this.pickImage(limit)
    return uri.length > 0 ? [uri] : []
  }

  private async pickImage(maxSelect: number): Promise<string> {
    try {
      let picker: photoAccessHelper.PhotoViewPicker = new photoAccessHelper.PhotoViewPicker()
      let options: photoAccessHelper.PhotoSelectOptions = new photoAccessHelper.PhotoSelectOptions()
      options.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE
      options.maxSelectNumber = maxSelect
      let result: photoAccessHelper.PhotoSelectResult = await picker.select(options)
      if (result && result.photoUris && result.photoUris.length > 0) {
        return await this.copyToSandbox(result.photoUris[0])
      }
    } catch (err) {
      console.error('[PhotoService] pick failed', JSON.stringify(err))
    }
    return ''
  }

  private async copyToSandbox(srcUri: string): Promise<string> {
    try {
      let fileName: string = 'img_' + Date.now() + '_' + Math.floor(Math.random() * 1000) + '.jpg'
      let filesDir: string = this.context.filesDir
      if (!filesDir.endsWith('/')) {
        filesDir += '/'
      }
      let destPath: string = filesDir + fileName
      let srcFile: fileIo.File = fileIo.openSync(srcUri, fileIo.OpenMode.READ_ONLY)
      let destFile: fileIo.File = fileIo.openSync(destPath, fileIo.OpenMode.CREATE | fileIo.OpenMode.WRITE_ONLY)
      let buf: ArrayBuffer = new ArrayBuffer(1024 * 64)
      let readLen: number = 0
      while ((readLen = fileIo.readSync(srcFile.fd, buf)) > 0) {
        let writeBuf: ArrayBuffer = buf.slice(0, readLen)
        fileIo.writeSync(destFile.fd, writeBuf)
      }
      fileIo.closeSync(srcFile)
      fileIo.closeSync(destFile)
      return 'file://' + destPath
    } catch (err) {
      console.error('[PhotoService] copy failed', JSON.stringify(err))
      return ''
    }
  }
}
