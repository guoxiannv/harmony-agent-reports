export enum HazardLevel {
  LOW = 'low',
  MEDIUM = 'medium',
  HIGH = 'high'
}

export enum HazardStatus {
  PENDING = 'pending',
  IN_PROGRESS = 'in_progress',
  AWAITING_ACCEPTANCE = 'awaiting_acceptance',
  CLOSED = 'closed'
}

export interface HazardInit {
  id?: string;
  title?: string;
  description?: string;
  location?: string;
  level?: HazardLevel;
  status?: HazardStatus;
  assignee?: string;
  deadline?: number | null;
  photos?: string[];
  createdAt?: number;
  updatedAt?: number;
}

export class Hazard {
  id: string = '';
  title: string = '';
  description: string = '';
  location: string = '';
  level: HazardLevel = HazardLevel.MEDIUM;
  status: HazardStatus = HazardStatus.PENDING;
  assignee: string = '';
  deadline: number | null = null;
  photos: string[] = [];
  createdAt: number = Date.now();
  updatedAt: number = Date.now();

  constructor(init: HazardInit = {}) {
    if (init.id !== undefined) this.id = init.id;
    if (init.title !== undefined) this.title = init.title;
    if (init.description !== undefined) this.description = init.description;
    if (init.location !== undefined) this.location = init.location;
    if (init.level !== undefined) this.level = init.level;
    if (init.status !== undefined) this.status = init.status;
    if (init.assignee !== undefined) this.assignee = init.assignee;
    if (init.deadline !== undefined) this.deadline = init.deadline;
    if (init.photos !== undefined) this.photos = init.photos;
    if (init.createdAt !== undefined) this.createdAt = init.createdAt;
    if (init.updatedAt !== undefined) this.updatedAt = init.updatedAt;
  }

  static from(other: Hazard): Hazard {
    const h = new Hazard();
    h.id = other.id;
    h.title = other.title;
    h.description = other.description;
    h.location = other.location;
    h.level = other.level;
    h.status = other.status;
    h.assignee = other.assignee;
    h.deadline = other.deadline;
    h.photos = other.photos;
    h.createdAt = other.createdAt;
    h.updatedAt = other.updatedAt;
    return h;
  }
}

export interface HazardCommentInit {
  id?: string;
  hazardId?: string;
  content?: string;
  createdAt?: number;
}

export class HazardComment {
  id: string = '';
  hazardId: string = '';
  content: string = '';
  createdAt: number = Date.now();

  constructor(init: HazardCommentInit = {}) {
    if (init.id !== undefined) this.id = init.id;
    if (init.hazardId !== undefined) this.hazardId = init.hazardId;
    if (init.content !== undefined) this.content = init.content;
    if (init.createdAt !== undefined) this.createdAt = init.createdAt;
  }
}
