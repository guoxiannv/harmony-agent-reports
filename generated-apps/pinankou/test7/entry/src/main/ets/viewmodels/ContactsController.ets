// ContactsController.ets
//
// Headless logic for the Emergency Contacts (应急联系人) domain. Owns search
// state, CRUD, and the dial-intent parameters for the call-contact event.

import { EmergencyContact } from '../common/Models';
import { DataStore } from '../services/DataStore';
import { nextId } from '../common/Ids';

const KEY_SEARCH: string = 'pinankou.contacts.search';

export class ContactsController {
  static ensureInit(): void {
    if (AppStorage.get<string>(KEY_SEARCH) === undefined) {
      AppStorage.SetOrCreate<string>(KEY_SEARCH, '');
    }
  }

  static getSearch(): string {
    return AppStorage.get<string>(KEY_SEARCH) ?? '';
  }

  static setSearch(value: string): void {
    AppStorage.SetOrCreate<string>(KEY_SEARCH, value);
  }

  // Semantic event: search-contacts
  static filteredItems(): EmergencyContact[] {
    const rawSearch: string = ContactsController.getSearch();
    const search: string = rawSearch.trim().toLowerCase();
    const all: EmergencyContact[] = DataStore.getContacts();
    if (search.length === 0) {
      return all;
    }
    const out: EmergencyContact[] = [];
    for (const c of all) {
      if (c.name.toLowerCase().includes(search)
        || c.phone.toLowerCase().includes(search)
        || c.role.toLowerCase().includes(search)) {
        out.push(c);
      }
    }
    return out;
  }

  // Semantic event: save-contact (create path)
  static create(name: string, phone: string, role: string): EmergencyContact {
    const contact: EmergencyContact = new EmergencyContact(nextId('contact'), name, phone, role);
    DataStore.upsertContact(contact);
    return contact;
  }

  // Semantic event: save-contact (edit path)
  static save(contact: EmergencyContact): void {
    DataStore.upsertContact(contact);
  }

  // Semantic event: delete-contact
  static remove(id: string): void {
    DataStore.removeContact(id);
  }

  // Semantic event: call-contact. Returns the phone URI for the visual layer
  // to feed a system dial want (real dial wired during visual integration /
  // on-device).
  static dialUri(phone: string): string {
    const cleaned: string = phone.replace(/\s+/g, '');
    return `tel:${cleaned}`;
  }
}
