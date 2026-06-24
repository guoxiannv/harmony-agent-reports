import { StorageService } from '../services/StorageService';
import { Contact } from '../model/Contact';

export class ContactController {
  private storage = StorageService.getInstance();

  list(query: string = ''): Contact[] {
    return this.storage.searchContacts(query);
  }

  get(id: string): Contact | undefined {
    return this.storage.getContact(id);
  }

  createDraft(): Contact {
    return new Contact({
      name: '',
      role: '',
      department: '',
      phone: '',
      isEmergency: false
    });
  }

  save(contact: Contact): Contact {
    return this.storage.saveContact(contact);
  }

  delete(id: string): void {
    this.storage.deleteContact(id);
  }
}
