import { router } from '@kit.ArkUI';

export class PageContext {
  open(info: RouteInfo): void {
    try {
      let opts: RouterOptions = new RouterOptions()
      opts.url = `pages/${info.name}`
      let p: object = info.param ?? new Object()
      opts.params = p
      router.pushUrl(opts)
    } catch (err) {
      console.error('[PageContext] open failed', JSON.stringify(err))
    }
  }

  back(): void {
    try {
      router.back()
    } catch (err) {
      console.error('[PageContext] back failed', JSON.stringify(err))
    }
  }

  replace(info: RouteInfo): void {
    try {
      let opts: RouterOptions = new RouterOptions()
      opts.url = `pages/${info.name}`
      let p2: object = info.param ?? new Object()
      opts.params = p2
      router.replaceUrl(opts)
    } catch (err) {
      console.error('[PageContext] replace failed', JSON.stringify(err))
    }
  }
}

export class RouteInfo {
  name: string = ''
  param?: object
}

export class RouterOptions {
  url: string = ''
  params?: object
}
