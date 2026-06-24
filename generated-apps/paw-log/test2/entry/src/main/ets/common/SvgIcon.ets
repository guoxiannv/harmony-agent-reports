import { Theme } from '../common/Theme';

@Component
export struct SvgIcon {
  @Prop iconSize: number = 24;
  @Prop color: string = Theme.forest900;
  @Prop strokeWidth: number = 2;
  @Prop variant: string = 'home';

  build() {
    if (this.variant === 'home') {
      this.HomeIcon()
    } else if (this.variant === 'records') {
      this.RecordsIcon()
    } else if (this.variant === 'trends') {
      this.TrendsIcon()
    } else if (this.variant === 'care') {
      this.CareIcon()
    } else if (this.variant === 'profile') {
      this.ProfileIcon()
    } else if (this.variant === 'add') {
      this.AddIcon()
    } else if (this.variant === 'chevronDown') {
      this.ChevronDownIcon()
    } else if (this.variant === 'diet') {
      this.DietIcon()
    } else if (this.variant === 'stool') {
      this.StoolIcon()
    } else if (this.variant === 'weight') {
      this.WeightIcon()
    } else if (this.variant === 'meds') {
      this.MedsIcon()
    } else if (this.variant === 'vaccine') {
      this.VaccineIcon()
    } else if (this.variant === 'deworm') {
      this.DewormIcon()
    } else if (this.variant === 'checkup') {
      this.CheckupIcon()
    } else if (this.variant === 'bath') {
      this.BathIcon()
    } else if (this.variant === 'medical') {
      this.MedicalIcon()
    } else if (this.variant === 'family') {
      this.FamilyIcon()
    } else if (this.variant === 'settings') {
      this.SettingsIcon()
    } else if (this.variant === 'about') {
      this.AboutIcon()
    } else if (this.variant === 'paw') {
      this.PawIcon()
    } else if (this.variant === 'back') {
      this.BackIcon()
    } else if (this.variant === 'close') {
      this.CloseIcon()
    } else {
      this.HomeIcon()
    }
  }

  @Builder
  HomeIcon() {
    Stack() {
      Shape() {
        Path().commands('M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z')
          .stroke(this.color)
          .strokeWidth(this.strokeWidth)
          .fill('none')
          .strokeLineCap(LineCapStyle.Round)
          .strokeLineJoin(LineJoinStyle.Round)
        Path().commands('M9 22V12h6v10')
          .stroke(this.color)
          .strokeWidth(this.strokeWidth)
          .fill('none')
          .strokeLineCap(LineCapStyle.Round)
          .strokeLineJoin(LineJoinStyle.Round)
      }
      .width(this.iconSize)
      .height(this.iconSize)
    }
    .width(this.iconSize)
    .height(this.iconSize)
  }

  @Builder
  RecordsIcon() {
    Stack() {
      Shape() {
        Path().commands('M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z')
          .stroke(this.color)
          .strokeWidth(this.strokeWidth)
          .fill('none')
          .strokeLineCap(LineCapStyle.Round)
          .strokeLineJoin(LineJoinStyle.Round)
        Path().commands('M14 2v6h6')
          .stroke(this.color)
          .strokeWidth(this.strokeWidth)
          .fill('none')
          .strokeLineCap(LineCapStyle.Round)
          .strokeLineJoin(LineJoinStyle.Round)
        Path().commands('M16 13H8 M16 17H8')
          .stroke(this.color)
          .strokeWidth(this.strokeWidth)
          .fill('none')
          .strokeLineCap(LineCapStyle.Round)
      }
      .width(this.iconSize)
      .height(this.iconSize)
    }
    .width(this.iconSize)
    .height(this.iconSize)
  }

  @Builder
  TrendsIcon() {
    Stack() {
      Shape() {
        Path().commands('M3 3v18h18')
          .stroke(this.color)
          .strokeWidth(this.strokeWidth)
          .fill('none')
          .strokeLineCap(LineCapStyle.Round)
          .strokeLineJoin(LineJoinStyle.Round)
        Path().commands('M18.7 8l-5.1 5.2-2.8-2.7L7 14.3')
          .stroke(this.color)
          .strokeWidth(this.strokeWidth)
          .fill('none')
          .strokeLineCap(LineCapStyle.Round)
          .strokeLineJoin(LineJoinStyle.Round)
      }
      .width(this.iconSize)
      .height(this.iconSize)
    }
    .width(this.iconSize)
    .height(this.iconSize)
  }

  @Builder
  CareIcon() {
    Stack() {
      Shape() {
        Path().commands('M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z')
          .stroke(this.color)
          .strokeWidth(this.strokeWidth)
          .fill('none')
          .strokeLineCap(LineCapStyle.Round)
          .strokeLineJoin(LineJoinStyle.Round)
      }
      .width(this.iconSize)
      .height(this.iconSize)
    }
    .width(this.iconSize)
    .height(this.iconSize)
  }

  @Builder
  ProfileIcon() {
    Stack() {
      Shape() {
        Path().commands('M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2')
          .stroke(this.color)
          .strokeWidth(this.strokeWidth)
          .fill('none')
          .strokeLineCap(LineCapStyle.Round)
        Circle().width(8).height(8).offset({ x: 8, y: 3 })
          .stroke(this.color)
          .strokeWidth(this.strokeWidth)
          .fill('none')
      }
      .width(this.iconSize)
      .height(this.iconSize)
    }
    .width(this.iconSize)
    .height(this.iconSize)
  }

  @Builder
  AddIcon() {
    Stack() {
      Shape() {
        Path().commands('M12 5v14M5 12h14')
          .stroke(this.color)
          .strokeWidth(this.strokeWidth)
          .fill('none')
          .strokeLineCap(LineCapStyle.Round)
      }
      .width(this.iconSize)
      .height(this.iconSize)
    }
    .width(this.iconSize)
    .height(this.iconSize)
  }

  @Builder
  ChevronDownIcon() {
    Stack() {
      Shape() {
        Path().commands('M6 9l6 6 6-6')
          .stroke(this.color)
          .strokeWidth(this.strokeWidth)
          .fill('none')
          .strokeLineCap(LineCapStyle.Round)
          .strokeLineJoin(LineJoinStyle.Round)
      }
      .width(this.iconSize)
      .height(this.iconSize)
    }
    .width(this.iconSize)
    .height(this.iconSize)
  }

  @Builder
  DietIcon() {
    Stack() {
      Shape() {
        Path().commands('M18 8h1a4 4 0 0 1 0 8h-1M2 8h16v9a4 4 0 0 1-4 4H6a4 4 0 0 1-4-4V8z')
          .stroke(this.color)
          .strokeWidth(this.strokeWidth)
          .fill('none')
          .strokeLineCap(LineCapStyle.Round)
          .strokeLineJoin(LineJoinStyle.Round)
        Path().commands('M6 2v6 M10 2v6 M14 2v6')
          .stroke(this.color)
          .strokeWidth(this.strokeWidth)
          .fill('none')
          .strokeLineCap(LineCapStyle.Round)
      }
      .width(this.iconSize)
      .height(this.iconSize)
    }
    .width(this.iconSize)
    .height(this.iconSize)
  }

  @Builder
  StoolIcon() {
    Stack() {
      Shape() {
        Path().commands('M12 22c4.97 0 9-3.58 9-8s-4.03-8-9-8-9 3.58-9 8 4.03 8 9 8z')
          .stroke(this.color)
          .strokeWidth(this.strokeWidth)
          .fill('none')
        Circle().width(3).height(3).offset({ x: 7, y: 10 }).fill(this.color)
        Circle().width(3).height(3).offset({ x: 14, y: 10 }).fill(this.color)
        Path().commands('M9 17c1.5 1.5 4.5 1.5 6 0')
          .stroke(this.color)
          .strokeWidth(this.strokeWidth)
          .fill('none')
          .strokeLineCap(LineCapStyle.Round)
      }
      .width(this.iconSize)
      .height(this.iconSize)
    }
    .width(this.iconSize)
    .height(this.iconSize)
  }

  @Builder
  WeightIcon() {
    Stack() {
      Shape() {
        Path().commands('M12 2a4 4 0 0 1 4 4c0 1.5-.8 2.8-2 3.4V9h4a2 2 0 0 1 2 2v9a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2v-9a2 2 0 0 1 2-2h4v-.6c-1.2-.6-2-1.9-2-3.4a4 4 0 0 1 4-4z')
          .stroke(this.color)
          .strokeWidth(this.strokeWidth)
          .fill('none')
      }
      .width(this.iconSize)
      .height(this.iconSize)
    }
    .width(this.iconSize)
    .height(this.iconSize)
  }

  @Builder
  MedsIcon() {
    Stack() {
      Shape() {
        Path().commands('M10 2h4a2 2 0 0 1 2 2v3H8V4a2 2 0 0 1 2-2z')
          .stroke(this.color)
          .strokeWidth(this.strokeWidth)
          .fill('none')
        Rect().width(12).height(15).offset({ x: 6, y: 7 }).radius(2)
          .stroke(this.color)
          .strokeWidth(this.strokeWidth)
          .fill('none')
        Path().commands('M12 12v5 M9.5 14.5h5')
          .stroke(this.color)
          .strokeWidth(this.strokeWidth)
          .fill('none')
          .strokeLineCap(LineCapStyle.Round)
      }
      .width(this.iconSize)
      .height(this.iconSize)
    }
    .width(this.iconSize)
    .height(this.iconSize)
  }

  @Builder
  VaccineIcon() {
    Stack() {
      Shape() {
        Path().commands('M12 2v4 M12 18v4 M4.93 4.93l2.83 2.83 M16.24 16.24l2.83 2.83 M2 12h4 M18 12h4 M4.93 19.07l2.83-2.83 M16.24 7.76l2.83-2.83')
          .stroke(this.color)
          .strokeWidth(this.strokeWidth)
          .fill('none')
          .strokeLineCap(LineCapStyle.Round)
      }
      .width(this.iconSize)
      .height(this.iconSize)
    }
    .width(this.iconSize)
    .height(this.iconSize)
  }

  @Builder
  DewormIcon() {
    Stack() {
      Shape() {
        Circle().width(18).height(18).offset({ x: 3, y: 3 })
          .stroke(this.color)
          .strokeWidth(this.strokeWidth)
          .fill('none')
        Path().commands('M12 7v5l3 3')
          .stroke(this.color)
          .strokeWidth(this.strokeWidth)
          .fill('none')
          .strokeLineCap(LineCapStyle.Round)
          .strokeLineJoin(LineJoinStyle.Round)
      }
      .width(this.iconSize)
      .height(this.iconSize)
    }
    .width(this.iconSize)
    .height(this.iconSize)
  }

  @Builder
  CheckupIcon() {
    Stack() {
      Shape() {
        Rect().width(16).height(20).offset({ x: 4, y: 2 }).radius(2)
          .stroke(this.color)
          .strokeWidth(this.strokeWidth)
          .fill('none')
        Path().commands('M9 9l2 2 4-4')
          .stroke(this.color)
          .strokeWidth(this.strokeWidth)
          .fill('none')
          .strokeLineCap(LineCapStyle.Round)
          .strokeLineJoin(LineJoinStyle.Round)
      }
      .width(this.iconSize)
      .height(this.iconSize)
    }
    .width(this.iconSize)
    .height(this.iconSize)
  }

  @Builder
  BathIcon() {
    Stack() {
      Shape() {
        Path().commands('M4 12h16M6 12v4a3 3 0 0 0 3 3h6a3 3 0 0 0 3-3v-4')
          .stroke(this.color)
          .strokeWidth(this.strokeWidth)
          .fill('none')
          .strokeLineCap(LineCapStyle.Round)
        Path().commands('M8 8a4 4 0 0 1 8 0')
          .stroke(this.color)
          .strokeWidth(this.strokeWidth)
          .fill('none')
          .strokeLineCap(LineCapStyle.Round)
      }
      .width(this.iconSize)
      .height(this.iconSize)
    }
    .width(this.iconSize)
    .height(this.iconSize)
  }

  @Builder
  MedicalIcon() {
    Stack() {
      Shape() {
        Rect().width(16).height(20).offset({ x: 4, y: 2 }).radius(2)
          .stroke(this.color)
          .strokeWidth(this.strokeWidth)
          .fill('none')
        Path().commands('M12 8v8 M8 12h8')
          .stroke(this.color)
          .strokeWidth(this.strokeWidth)
          .fill('none')
          .strokeLineCap(LineCapStyle.Round)
      }
      .width(this.iconSize)
      .height(this.iconSize)
    }
    .width(this.iconSize)
    .height(this.iconSize)
  }

  @Builder
  FamilyIcon() {
    Stack() {
      Shape() {
        Path().commands('M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2')
          .stroke(this.color)
          .strokeWidth(this.strokeWidth)
          .fill('none')
          .strokeLineCap(LineCapStyle.Round)
        Circle().width(8).height(8).offset({ x: 5, y: 3 }).fill('none').stroke(this.color).strokeWidth(this.strokeWidth)
        Path().commands('M23 21v-2a4 4 0 0 0-3-3.87')
          .stroke(this.color)
          .strokeWidth(this.strokeWidth)
          .fill('none')
          .strokeLineCap(LineCapStyle.Round)
        Circle().width(8).height(8).offset({ x: 15, y: 3 }).fill('none').stroke(this.color).strokeWidth(this.strokeWidth)
      }
      .width(this.iconSize)
      .height(this.iconSize)
    }
    .width(this.iconSize)
    .height(this.iconSize)
  }

  @Builder
  SettingsIcon() {
    Stack() {
      Shape() {
        Circle().width(8).height(8).offset({ x: 8, y: 8 }).fill('none').stroke(this.color).strokeWidth(this.strokeWidth)
        Path().commands('M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z')
          .stroke(this.color)
          .strokeWidth(this.strokeWidth)
          .fill('none')
          .strokeLineCap(LineCapStyle.Round)
          .strokeLineJoin(LineJoinStyle.Round)
      }
      .width(this.iconSize)
      .height(this.iconSize)
    }
    .width(this.iconSize)
    .height(this.iconSize)
  }

  @Builder
  AboutIcon() {
    Stack() {
      Shape() {
        Circle().width(18).height(18).offset({ x: 3, y: 3 }).fill('none').stroke(this.color).strokeWidth(this.strokeWidth)
        Text('i').fontSize(this.iconSize * 0.5).fontColor(this.color).fontWeight(FontWeight.Bold)
      }
      .width(this.iconSize)
      .height(this.iconSize)
    }
    .width(this.iconSize)
    .height(this.iconSize)
  }

  @Builder
  PawIcon() {
    Stack() {
      Shape() {
        Path().commands('M12 14c-3.5 0-6 2.5-6 5.5 0 1.5 1 2.5 2.5 2.5h7c1.5 0 2.5-1 2.5-2.5 0-3-2.5-5.5-6-5.5z')
          .fill(this.color)
        Circle().width(4).height(4).offset({ x: 6, y: 7 }).fill(this.color)
        Circle().width(4).height(4).offset({ x: 14, y: 7 }).fill(this.color)
        Circle().width(5).height(5).offset({ x: 10, y: 4 }).fill(this.color)
      }
      .width(this.iconSize)
      .height(this.iconSize)
    }
    .width(this.iconSize)
    .height(this.iconSize)
  }

  @Builder
  BackIcon() {
    Stack() {
      Shape() {
        Path().commands('M19 12H5 M12 19l-7-7 7-7')
          .stroke(this.color)
          .strokeWidth(this.strokeWidth)
          .fill('none')
          .strokeLineCap(LineCapStyle.Round)
          .strokeLineJoin(LineJoinStyle.Round)
      }
      .width(this.iconSize)
      .height(this.iconSize)
    }
    .width(this.iconSize)
    .height(this.iconSize)
  }

  @Builder
  CloseIcon() {
    Stack() {
      Shape() {
        Path().commands('M18 6L6 18 M6 6l12 12')
          .stroke(this.color)
          .strokeWidth(this.strokeWidth)
          .fill('none')
          .strokeLineCap(LineCapStyle.Round)
          .strokeLineJoin(LineJoinStyle.Round)
      }
      .width(this.iconSize)
      .height(this.iconSize)
    }
    .width(this.iconSize)
    .height(this.iconSize)
  }
}
