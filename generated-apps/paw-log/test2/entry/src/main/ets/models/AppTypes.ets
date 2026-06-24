export enum Gender {
  Unknown = 'unknown',
  Male = 'male',
  Female = 'female'
}

export enum RecordType {
  Diet = 'diet',
  Stool = 'stool',
  Weight = 'weight',
  Meds = 'meds'
}

export enum ReminderCategory {
  Vaccine = 'vaccine',
  Deworm = 'deworm',
  Checkup = 'checkup',
  Bath = 'bath'
}

export enum TrendsMetric {
  Weight = 'weight',
  Diet = 'diet',
  Stool = 'stool'
}

export enum TrendsPeriod {
  Week = 'week',
  Month = 'month'
}

export enum RecordsFilter {
  All = 'all',
  Diet = 'diet',
  Stool = 'stool',
  Weight = 'weight',
  Meds = 'meds'
}

export enum CareTab {
  Reminders = 'reminders',
  Medical = 'medical'
}

export enum AppSurface {
  Home = 'home',
  Records = 'records',
  Trends = 'trends',
  Care = 'care',
  Profile = 'profile',
  ReminderDetail = 'reminder-detail',
  MedicalCase = 'medical-case',
  MedicalCaseEditor = 'medical-case-editor',
  PetEditor = 'pet-editor'
}

export enum SheetSurface {
  None = 'none',
  PetPicker = 'pet-picker',
  AddRecord = 'add-record',
  RecordDiet = 'record-diet',
  RecordStool = 'record-stool',
  RecordWeight = 'record-weight',
  RecordMeds = 'record-meds',
  FamilyInvite = 'family-invite'
}

export enum ReminderDialogMode {
  None = 'none',
  Create = 'create',
  Edit = 'edit'
}

export class Pet {
  id: string = ''
  name: string = ''
  avatar: string = ''
  species: string = ''
  breed: string = ''
  birthday: number = 0
  gender: Gender = Gender.Unknown
  neutered: boolean = false
  weight: number = 0
  notes: string = ''
  createdAt: number = 0
  updatedAt: number = 0
}

export class Record {
  id: string = ''
  petId: string = ''
  type: RecordType = RecordType.Diet
  time: number = 0
  title: string = ''
  subtitle: string = ''
  tagText: string = ''
  tagColor: string = ''
  payload: RecordPayload = new DietPayload()
  createdAt: number = 0
}

export class RecordPayload {
  kind: RecordType = RecordType.Diet
}

export class DietPayload extends RecordPayload {
  foodName: string = ''
  amount: number = 0
  unit: string = 'g'
  note: string = ''

  constructor() {
    super()
    this.kind = RecordType.Diet
  }
}

export class StoolPayload extends RecordPayload {
  type: string = 'normal'
  color: string = ''
  smell: string = ''
  note: string = ''

  constructor() {
    super()
    this.kind = RecordType.Stool
  }
}

export class WeightPayload extends RecordPayload {
  value: number = 0
  unit: string = 'kg'

  constructor() {
    super()
    this.kind = RecordType.Weight
  }
}

export class MedsPayload extends RecordPayload {
  name: string = ''
  dose: string = ''
  note: string = ''

  constructor() {
    super()
    this.kind = RecordType.Meds
  }
}

export class Reminder {
  id: string = ''
  petId: string = ''
  title: string = ''
  category: ReminderCategory = ReminderCategory.Vaccine
  dueDate: number = 0
  isDone: boolean = false
  createdAt: number = 0
  updatedAt: number = 0
}

export class MedicalCase {
  id: string = ''
  petId: string = ''
  title: string = ''
  date: number = 0
  hospital: string = ''
  diagnosis: string = ''
  note: string = ''
  images: string[] = []
  createdAt: number = 0
  updatedAt: number = 0
}

export class FamilyMember {
  id: string = ''
  name: string = ''
  avatar: string = ''
  role: string = 'member'
  joinedAt: number = 0
}

export class FamilyInfo {
  inviteCode: string = ''
  members: FamilyMember[] = []
}

export class TodaySummaryItem {
  type: RecordType = RecordType.Diet
  label: string = ''
  value: string = ''
  unit: string = ''
  status: 'ok' | 'empty' = 'empty'
}

export class RecordItem {
  id: string = ''
  type: RecordType = RecordType.Diet
  time: number = 0
  title: string = ''
  subtitle: string = ''
  tagText: string = ''
  tagColor: string = ''
}

export class ReminderItem {
  id: string = ''
  title: string = ''
  category: ReminderCategory = ReminderCategory.Vaccine
  dueDate: number = 0
  isDone: boolean = false
  isUrgent: boolean = false
}

export class TrendPoint {
  date: number = 0
  value: number = 0
}

export class TrendDataset {
  label: string = ''
  color: string = ''
  points: TrendPoint[] = []
}

export class TrendChart {
  labels: string[] = []
  datasets: TrendDataset[] = []
}

export class TrendStat {
  key: string = ''
  label: string = ''
  value: string = ''
  unit: string = ''
  change: string = ''
}

export class MedicalListItem {
  id: string = ''
  title: string = ''
  date: number = 0
  hospital: string = ''
  diagnosis: string = ''
  imageCount: number = 0
}

export class UserProfile {
  nickname: string = ''
  avatar: string = ''
}

export class PetEditorRouteParams {
  mode: 'create' | 'edit' = 'create'
  petId: string = ''
}

export class MedicalEditorRouteParams {
  mode: 'create' | 'edit' = 'create'
  caseId: string = ''
}

export class ReminderDetailRouteParams {
  reminderId: string = ''
}

export class MedicalCaseRouteParams {
  caseId: string = ''
}
