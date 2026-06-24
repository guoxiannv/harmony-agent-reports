import { common } from '@kit.AbilityKit';
import { AppStore } from './AppStore';
import { FamilyRepository } from './FamilyRepository';
import { MedicalRepository } from './MedicalRepository';
import { PetRepository } from './PetRepository';
import { PhotoService } from './PhotoService';
import { RecordRepository } from './RecordRepository';
import { ReminderRepository } from './ReminderRepository';

export class AppServices {
  readonly store: AppStore
  readonly petRepository: PetRepository
  readonly recordRepository: RecordRepository
  readonly reminderRepository: ReminderRepository
  readonly medicalRepository: MedicalRepository
  readonly familyRepository: FamilyRepository
  readonly photoService: PhotoService

  private constructor(context: common.UIAbilityContext) {
    this.store = new AppStore(context)
    this.petRepository = new PetRepository(this.store)
    this.recordRepository = new RecordRepository(this.store)
    this.reminderRepository = new ReminderRepository(this.store)
    this.medicalRepository = new MedicalRepository(this.store)
    this.familyRepository = new FamilyRepository()
    this.photoService = new PhotoService(context)
  }

  private static instance?: AppServices

  static get(context: common.UIAbilityContext): AppServices {
    if (!AppServices.instance) {
      AppServices.instance = new AppServices(context)
    }
    return AppServices.instance
  }

  async init(): Promise<void> {
    await this.store.init()
    await Promise.all([
      this.petRepository.init(),
      this.recordRepository.init(),
      this.reminderRepository.init(),
      this.medicalRepository.init()
    ])
  }
}
