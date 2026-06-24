export enum Priority {
  LOW = 'low',
  MEDIUM = 'medium',
  HIGH = 'high'
}

export interface SafetyNoteInit {
  id?: string;
  title?: string;
  description?: string;
  priority?: Priority;
  assignee?: string;
  deadline?: number | null;
  isDone?: boolean;
  createdAt?: number;
  updatedAt?: number;
}

export class SafetyNote {
  id: string = '';
  title: string = '';
  description: string = '';
  priority: Priority = Priority.MEDIUM;
  assignee: string = '';
  deadline: number | null = null;
  isDone: boolean = false;
  createdAt: number = Date.now();
  updatedAt: number = Date.now();

  constructor(init: SafetyNoteInit = {}) {
    if (init.id !== undefined) this.id = init.id;
    if (init.title !== undefined) this.title = init.title;
    if (init.description !== undefined) this.description = init.description;
    if (init.priority !== undefined) this.priority = init.priority;
    if (init.assignee !== undefined) this.assignee = init.assignee;
    if (init.deadline !== undefined) this.deadline = init.deadline;
    if (init.isDone !== undefined) this.isDone = init.isDone;
    if (init.createdAt !== undefined) this.createdAt = init.createdAt;
    if (init.updatedAt !== undefined) this.updatedAt = init.updatedAt;
  }

  static from(other: SafetyNote): SafetyNote {
    const n = new SafetyNote();
    n.id = other.id;
    n.title = other.title;
    n.description = other.description;
    n.priority = other.priority;
    n.assignee = other.assignee;
    n.deadline = other.deadline;
    n.isDone = other.isDone;
    n.createdAt = other.createdAt;
    n.updatedAt = other.updatedAt;
    return n;
  }
}
