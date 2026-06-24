import { AppServices } from '../services/AppServices';
import { EmergencyContact } from '../models/Models';

export class EmergencyController {
  private services: AppServices
  searchQuery: string = ''

  constructor(services: AppServices) {
    this.services = services
  }

  contacts(): EmergencyContact[] {
    return this.services.contactRepo.search(this.searchQuery)
  }

  setSearchQuery(query: string): void {
    this.searchQuery = query
  }

  addContact(name: string, role: string, duty: string, phone: string): void {
    let c: EmergencyContact = new EmergencyContact()
    c.name = name
    c.role = role
    c.duty = duty
    c.phone = phone
    this.services.contactRepo.add(c)
  }

  updateContact(contact: EmergencyContact): void {
    this.services.contactRepo.update(contact)
  }

  deleteContact(id: string): void {
    this.services.contactRepo.delete(id)
  }

  async dial(phone: string): Promise<boolean> {
    return this.services.dialService.dial(phone)
  }
}
