// Flashcard.ets
//
// 3D flip flashcard for the WordFlip Kids review surface.
//
// Visual source: .arkpilot/designs/page-review-page.html (.flashcard + .card-face).
// Behavior: parent owns `flipped` and triggers toggle via onFlip; this component
// only renders the front/back faces and animates the rotateY turn.
//
// ArkUI has no CSS backface-visibility, so we crossfade the two faces through
// the flip edge: the front fades out and the back (pre-rotated 180° so it ends
// upright) fades in while the whole card rotates rotateY 0→180.

@Component
export struct Flashcard {
  @Prop english: string = '';
  @Prop meaning: string = '';
  @Prop phonetic: string = '';
  @Prop flipped: boolean = false;
  onFlip: () => void = () => {};

  private readonly cardWidth: number = 330;
  private readonly cardHeight: number = 440;
  private readonly flipDuration: number = 550;
  build() {
    Stack() {
      // ---- Front face (English) ----
      Column() {
        // Top gradient line.
        Row()
          .width('100%')
          .height(8)
          .linearGradient({
            angle: 90,
            colors: [['#0D9488', 0.0], ['#0EA5E9', 1.0]],
          })

        // Flip hint badge (top-right), stroke SVG, color baked in.
        Row() {
          Image($rawfile('icon_翻转卡片查看释义.svg'))
            .width(18)
            .height(18)
            .draggable(false)
        }
        .width(32)
        .height(32)
        .borderRadius(16)
        .backgroundColor('#E0F2FE')
        .justifyContent(FlexAlign.Center)
        .alignItems(VerticalAlign.Center)
        .position({ x: this.cardWidth - 52, y: 20 })

        // English word.
        Column() {
          Text(this.english)
            .fontSize(54)
            .fontWeight(FontWeight.Bold)
            .fontColor('#1E293B')
            .textAlign(TextAlign.Center)
            .maxLines(3)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
          Text('点击卡片查看释义')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
            .fontColor('#94A3B8')
            .margin({ top: 18 })
        }
        .layoutWeight(1)
        .width('100%')
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .padding({ left: 32, right: 32, bottom: 32 })
      }
      .width('100%')
      .height('100%')
      .borderRadius(28)
      .backgroundColor('#FFFFFF')
      .clip(true)
      .shadow({ radius: 60, color: 'rgba(30,41,59,0.09)', offsetX: 0, offsetY: 24 })
      // Front visible when not flipped.
      .opacity(this.flipped ? 0 : 1)

      // ---- Back face (meaning + phonetic) ----
      Column() {
        Row()
          .width('100%')
          .height(8)
          .linearGradient({
            angle: 90,
            colors: [['#0D9488', 0.0], ['#0EA5E9', 1.0]],
          })

        // Meaning section.
        Column() {
          Text('中文释义')
            .fontSize(12)
            .fontWeight(FontWeight.Bold)
            .fontColor('#94A3B8')
            .margin({ bottom: 10 })
          Text(this.meaning)
            .fontSize(34)
            .fontWeight(FontWeight.Bold)
            .fontColor('#0F172A')
            .textAlign(TextAlign.Center)
            .maxLines(4)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
        }
        .layoutWeight(1)
        .width('100%')
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)

        // Divider.
        Divider()
          .color('#F1F5F9')
          .strokeWidth(1)
          .margin({ left: 28, right: 28 })

        // Phonetic section.
        Column() {
          Text('音标')
            .fontSize(12)
            .fontWeight(FontWeight.Bold)
            .fontColor('#94A3B8')
            .margin({ bottom: 10 })
          Text(this.phonetic.length > 0 ? this.phonetic : '—')
            .fontSize(20)
            .fontWeight(FontWeight.Normal)
            .fontColor('#475569')
            .textAlign(TextAlign.Center)
        }
        .layoutWeight(1)
        .width('100%')
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
      }
      .width('100%')
      .height('100%')
      .borderRadius(28)
      .backgroundColor('#FFFFFF')
      .clip(true)
      .shadow({ radius: 60, color: 'rgba(30,41,59,0.09)', offsetX: 0, offsetY: 24 })
      // Pre-rotate back 180° around Y so it reads upright once the card finishes turning.
      .rotate({ y: 1, angle: 180 })
      // Back visible when flipped.
      .opacity(this.flipped ? 1 : 0)
    }
    .width(this.cardWidth)
    .height(this.cardHeight)
    .rotate({ y: 1, angle: this.flipped ? 180 : 0 })
    .animation({ duration: this.flipDuration, curve: Curve.EaseInOut })
    .onClick(() => this.onFlip())
    .id('review-flashcard')
  }
}
