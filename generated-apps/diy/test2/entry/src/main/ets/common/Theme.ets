// Handcraft theme tokens for "手作·印记" (clay + handwritten warmth).
// Keep exported class names as Theme and BrandGradient.

export class Theme {
  // Background
  static readonly pageBgStart: string = '#FBF8F5';
  static readonly pageBgMid: string = '#F0EBE5';
  static readonly pageBgEnd: string = '#E9E3DA';
  static readonly pageBg: string = '#FBF8F5';

  // Cards
  static readonly cardBg: string = '#FFFDFA';
  static readonly cardBgGlass: string = 'rgba(255, 253, 250, 0.9)';
  static readonly darkCardBg: string = '#3A2D28';

  // Primary clay
  static readonly clay: string = '#B88363';
  static readonly clayActive: string = '#9C6B4F';
  static readonly clayLight: string = 'rgba(184, 131, 99, 0.12)';
  static readonly ochre: string = '#C87E5D';

  // Text
  static readonly textPrimary: string = '#3A2D28';
  static readonly textSecondary: string = '#9B9189';
  static readonly textLight: string = '#FBF8F5';
  static readonly textLightSecondary: string = 'rgba(251, 248, 245, 0.7)';

  // Accents
  static readonly moss: string = '#7E9273';
  static readonly glazeBlue: string = '#5E8A96';
  static readonly藤黄: string = '#D9A96D';

  // Borders / dividers
  static readonly borderDefault: string = 'rgba(195, 170, 150, 0.25)';
  static readonly borderSoft: string = 'rgba(195, 170, 150, 0.18)';
  static readonly cardDivider: string = 'rgba(195, 170, 150, 0.22)';
  static readonly dashedDivider: string = 'rgba(195, 170, 150, 0.22)';

  // States
  static readonly errorBg: string = '#F5E1D6';
  static readonly errorText: string = '#A2573E';
  static readonly disabledBg: string = 'rgba(184, 131, 99, 0.34)';

  // Spacing
  static readonly pageHorizontalPadding: number = 16;
  static readonly bottomTabHeight: number = 68;
  static readonly contentMaxWidth: number = 390;
  static readonly touchTarget: number = 44;

  // Radius
  static readonly radiusSmall: number = 12;
  static readonly radiusCard: number = 22;
  static readonly radiusButton: number = 16;
  static readonly radiusPill: number = 999;

  // Shadows
  static shadowCard(): ShadowOptions {
    return { radius: 28, color: 'rgba(58, 45, 40, 0.08)', offsetY: 10 };
  }

  static shadowButton(): ShadowOptions {
    return { radius: 18, color: 'rgba(184, 131, 99, 0.32)', offsetY: 6 };
  }

  static shadowFAB(): ShadowOptions {
    return { radius: 24, color: 'rgba(58, 45, 40, 0.36)', offsetY: 8 };
  }

  static shadowDarkCard(): ShadowOptions {
    return { radius: 28, color: 'rgba(58, 45, 40, 0.16)', offsetY: 10 };
  }
}

export class BrandGradient {
  static readonly pageBg: LinearGradient = {
    angle: 180,
    direction: GradientDirection.Bottom,
    colors: [['#FBF8F5', 0.0], ['#F0EBE5', 0.55], ['#E9E3DA', 1.0]],
  } as LinearGradient;
}
