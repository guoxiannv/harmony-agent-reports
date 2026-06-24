import { StorageService } from '../services/StorageService';
import { Hazard, HazardStatus, HazardLevel, HazardComment } from '../model/Hazard';

export interface HazardFilter {
  status: string;
  level: string;
}

export class HazardController {
  private storage = StorageService.getInstance();

  list(filter: HazardFilter = { status: 'all', level: 'all' }): Hazard[] {
    let items = this.storage.listHazards();
    if (filter.status !== 'all') {
      items = items.filter(h => h.status === filter.status);
    }
    if (filter.level !== 'all') {
      items = items.filter(h => h.level === filter.level);
    }
    return items;
  }

  get(id: string): Hazard | undefined {
    return this.storage.getHazard(id);
  }

  createDraft(): Hazard {
    return new Hazard({
      title: '',
      location: '',
      description: '',
      level: HazardLevel.MEDIUM,
      status: HazardStatus.PENDING,
      assignee: '',
      deadline: null,
      photos: []
    });
  }

  save(hazard: Hazard): Hazard {
    return this.storage.saveHazard(hazard);
  }

  delete(id: string): void {
    this.storage.deleteHazard(id);
  }

  addComment(hazardId: string, content: string): void {
    this.storage.addComment(hazardId, content);
  }

  comments(hazardId: string): HazardComment[] {
    return this.storage.listCommentsByHazard(hazardId);
  }
}
