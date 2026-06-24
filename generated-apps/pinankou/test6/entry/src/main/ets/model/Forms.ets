// Forms.ets
//
// Form payload interfaces used by AppViewModel event methods (save-matter,
// save-risk, save-contact). Explicit named interfaces are required by ArkTS
// strict mode (no inline object-literal types, no utility types like Omit).

import {
  MatterCategory,
  MatterPriority,
  MatterStatus,
  RiskSeverity,
  RiskStatus,
} from './Enums';

export interface MatterFormPayload {
  id: string;            // empty for create
  title: string;
  category: MatterCategory;
  priority: MatterPriority;
  description: string;
  status: MatterStatus;
}

export interface RiskFormPayload {
  id: string;            // empty for create
  title: string;
  severity: RiskSeverity;
  location: string;
  description: string;
  mediaUri: string;
  relatedMatterId: string;
  status: RiskStatus;
}

export interface ContactFormPayload {
  id: string;            // empty for create
  name: string;
  role: string;
  phone: string;
  isPriority: boolean;
}

export interface SaveResult {
  ok: boolean;
  error: string;         // empty when ok
  id: string;            // resulting record id
}
