import { Theme } from '../common/Theme';
import { StudyPage } from '../pages/StudyPage';

@Entry
@Component
struct Index {
  build() {
    Stack() {
      StudyPage()
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.pageBg)
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
  }
}
