import { PointsRecord, PointsType } from '../model/Models';
import { StorageService } from './StorageService';

const KEY = 'points_records_v1';

export interface EarnPointsParams {
  memberId: string;
  value: number;
  type: PointsType;
  balanceAfter: number;
  description?: string;
  relatedCourseId?: string;
  relatedMaterialId?: string;
}

export interface UsePointsParams {
  memberId: string;
  value: number;
  balanceAfter: number;
  type: PointsType;
  description?: string;
  relatedCourseId?: string;
  relatedMaterialId?: string;
}

export class PointsService {
  private storage: StorageService;

  constructor(storage: StorageService) {
    this.storage = storage;
  }

  async list(): Promise<PointsRecord[]> {
    return await this.storage.getObject<PointsRecord[]>(KEY, []);
  }

  async listByMember(memberId: string, limit: number = 100): Promise<PointsRecord[]> {
    const records = await this.list();
    return records
      .filter(r => r.memberId === memberId)
      .sort((a, b) => b.createdAt - a.createdAt)
      .slice(0, limit);
  }

  async recent(limit: number = 20): Promise<PointsRecord[]> {
    const records = await this.list();
    return records.sort((a, b) => b.createdAt - a.createdAt).slice(0, limit);
  }

  async earn(params: EarnPointsParams): Promise<PointsRecord> {
    const record = new PointsRecord();
    record.id = this.generateId();
    record.memberId = params.memberId;
    record.value = Math.abs(params.value);
    record.balanceAfter = params.balanceAfter;
    record.type = params.type;
    record.description = params.description;
    record.relatedCourseId = params.relatedCourseId;
    record.relatedMaterialId = params.relatedMaterialId;
    record.createdAt = Date.now();
    await this.save(record);
    return record;
  }

  async use(params: UsePointsParams): Promise<PointsRecord> {
    const record = new PointsRecord();
    record.id = this.generateId();
    record.memberId = params.memberId;
    record.value = -Math.abs(params.value);
    record.balanceAfter = params.balanceAfter;
    record.type = params.type;
    record.description = params.description;
    record.relatedCourseId = params.relatedCourseId;
    record.relatedMaterialId = params.relatedMaterialId;
    record.createdAt = Date.now();
    await this.save(record);
    return record;
  }

  private async save(record: PointsRecord): Promise<void> {
    const records = await this.list();
    records.push(record);
    await this.storage.setObject(KEY, records);
  }

  private generateId(): string {
    return `pts_${Date.now()}_${Math.floor(Math.random() * 100000)}`;
  }
}
