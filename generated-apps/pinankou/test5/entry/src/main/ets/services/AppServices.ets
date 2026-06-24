import { Context } from '@kit.AbilityKit';
import { JsonPreferenceStore } from './JsonPreferenceStore';
import { RiskRepository } from './RiskRepository';
import { InspectionRepository } from './InspectionRepository';
import { EmergencyContactRepository } from './EmergencyContactRepository';
import { StatsService } from './StatsService';
import { DialService } from './DialService';

export class AppServices {
  readonly store: JsonPreferenceStore
  readonly riskRepo: RiskRepository
  readonly inspectionRepo: InspectionRepository
  readonly contactRepo: EmergencyContactRepository
  readonly statsService: StatsService
  readonly dialService: DialService

  constructor(context: Context) {
    this.store = new JsonPreferenceStore(context, 'pinankou_store')
    this.riskRepo = new RiskRepository(this.store)
    this.inspectionRepo = new InspectionRepository(this.riskRepo, this.store)
    this.contactRepo = new EmergencyContactRepository(this.store)
    this.statsService = new StatsService(this.riskRepo, this.inspectionRepo)
    this.dialService = new DialService()
  }
}
