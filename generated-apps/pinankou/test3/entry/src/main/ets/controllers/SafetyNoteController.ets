import { StorageService } from '../services/StorageService';
import { SafetyNote, Priority } from '../model/SafetyNote';

export class SafetyNoteController {
  private storage = StorageService.getInstance();

  list(): SafetyNote[] {
    return this.storage.listNotes();
  }

  get(id: string): SafetyNote | undefined {
    return this.storage.getNote(id);
  }

  createDraft(): SafetyNote {
    return new SafetyNote({
      title: '',
      description: '',
      priority: Priority.MEDIUM,
      assignee: '',
      deadline: null,
      isDone: false
    });
  }

  save(note: SafetyNote): SafetyNote {
    return this.storage.saveNote(note);
  }

  delete(id: string): void {
    this.storage.deleteNote(id);
  }
}
