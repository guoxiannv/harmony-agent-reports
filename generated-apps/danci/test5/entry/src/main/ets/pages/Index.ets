// Index.ets
//
// App shell entry. The product spec defines a single-page review app with no
// tabs/navigation, so this shell hosts the single ReviewPage surface directly.
//
// Note (deviation from scaffold template, recorded in handoff):
// The bundled template shipped a multi-tab shell (BottomTabBar + TabTypes +
// HomePage/ExplorePage/... placeholders). The spec explicitly mandates a
// single-page app with no tabs, so Index is reduced to a single-surface host.
// The scaffold shell files (BottomTabBar, TabTypes, SvgIcon) are retained on
// disk but intentionally unused. Theme.ets is still the shared token layer.

import { ReviewPage } from './ReviewPage';
import { BrandGradient } from '../common/Theme';

@Entry
@Component
struct Index {
  build() {
    Column() {
      ReviewPage()
    }
    .width('100%')
    .height('100%')
    .linearGradient(BrandGradient.pageTop)
    .alignItems(HorizontalAlign.Center)
  }
}
