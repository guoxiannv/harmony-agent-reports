export enum ActivityKind {
  HAZARD = 'hazard',
  INSPECTION = 'inspection',
  SAFETY_NOTE = 'safety_note',
  CONTACT = 'contact'
}

export interface ActivityInit {
  id?: string;
  kind?: ActivityKind;
  entityId?: string;
  title?: string;
  subtitle?: string;
  timestamp?: number;
}

export class Activity {
  id: string = '';
  kind: ActivityKind = ActivityKind.HAZARD;
  entityId: string = '';
  title: string = '';
  subtitle: string = '';
  timestamp: number = Date.now();

  constructor(init: ActivityInit | Activity = {}) {
    if (init.id !== undefined) this.id = init.id;
    if (init.kind !== undefined) this.kind = init.kind;
    if (init.entityId !== undefined) this.entityId = init.entityId;
    if (init.title !== undefined) this.title = init.title;
    if (init.subtitle !== undefined) this.subtitle = init.subtitle;
    if (init.timestamp !== undefined) this.timestamp = init.timestamp;
  }
}
