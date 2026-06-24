import { AppViewModel } from '../viewmodels/AppViewModel';
import { AppServices } from '../services/AppServices';

export function getAppVM(): AppViewModel {
  let ctx: Context = getContext()
  let services: AppServices = AppServices.get(ctx as import('@kit.AbilityKit').common.UIAbilityContext)
  return new AppViewModel(services)
}
