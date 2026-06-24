import { AppServices } from '../services/AppServices';
import { Profile } from '../models/Models';

export class ProfileController {
  private services: AppServices
  profile: Profile = new Profile()

  constructor(services: AppServices) {
    this.services = services
  }

  exportData(): string {
    return JSON.stringify({
      risks: this.services.riskRepo.list(),
      inspections: this.services.inspectionRepo.list(),
      contacts: this.services.contactRepo.list()
    })
  }
}
