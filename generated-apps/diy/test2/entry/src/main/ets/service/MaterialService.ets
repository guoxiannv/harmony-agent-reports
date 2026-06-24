import { Material } from '../model/Models';
import { StorageService } from './StorageService';

const KEY = 'materials_v1';

export class MaterialService {
  private storage: StorageService;

  constructor(storage: StorageService) {
    this.storage = storage;
  }

  async list(): Promise<Material[]> {
    return await this.storage.getObject<Material[]>(KEY, []);
  }

  async get(id: string): Promise<Material | undefined> {
    const materials = await this.list();
    return materials.find(m => m.id === id);
  }

  async save(material: Material): Promise<void> {
    const materials = await this.list();
    const idx = materials.findIndex(m => m.id === material.id);
    if (idx >= 0) {
      materials[idx] = material;
    } else {
      materials.push(material);
    }
    await this.storage.setObject(KEY, materials);
  }

  async delete(id: string): Promise<void> {
    const materials = await this.list();
    const filtered = materials.filter(m => m.id !== id);
    await this.storage.setObject(KEY, filtered);
  }

  async search(query: string): Promise<Material[]> {
    const materials = await this.list();
    const q = query.trim().toLowerCase();
    if (!q) {
      return materials;
    }
    return materials.filter(m => m.name.toLowerCase().includes(q));
  }

  async consume(materialId: string, quantity: number): Promise<boolean> {
    const material = await this.get(materialId);
    if (!material || material.stock < quantity) {
      return false;
    }
    material.stock -= quantity;
    await this.save(material);
    return true;
  }

  async rollback(materialId: string, quantity: number): Promise<void> {
    const material = await this.get(materialId);
    if (!material) {
      return;
    }
    material.stock += quantity;
    await this.save(material);
  }

  async lowStockCount(): Promise<number> {
    const materials = await this.list();
    return materials.filter(m => m.stock <= m.safetyStock).length;
  }
}
