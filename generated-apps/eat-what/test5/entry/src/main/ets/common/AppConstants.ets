// AppConstants.ets
// Mappings between option labels (from page-filter-page.html) and prepared SVG icon variants.
import { SvgIcon } from './SvgIcon';

export interface ChipOption {
  label: string;
  iconVariant: string;
}

export const MOOD_OPTIONS: ChipOption[] = [
  { label: '开心', iconVariant: 'mood-happy' },
  { label: '想吃辣', iconVariant: 'mood-spicy' },
  { label: '清淡', iconVariant: 'mood-light' },
  { label: '治愈', iconVariant: 'mood-comfort' },
  { label: '放纵', iconVariant: 'mood-indulgent' },
  { label: '随便', iconVariant: 'mood-whatever' },
];

export const TIME_SLOT_OPTIONS: ChipOption[] = [
  { label: '早餐', iconVariant: 'time-breakfast' },
  { label: '午餐', iconVariant: 'time-lunch' },
  { label: '晚餐', iconVariant: 'time-dinner' },
  { label: '夜宵', iconVariant: 'time-late' },
];
