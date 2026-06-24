import { CraftTag, Member } from '../model/Models';
import { StorageService } from './StorageService';

const KEY = 'members_v1';

export class MemberService {
  private storage: StorageService;

  constructor(storage: StorageService) {
    this.storage = storage;
  }

  async list(): Promise<Member[]> {
    return await this.storage.getObject<Member[]>(KEY, []);
  }

  async get(id: string): Promise<Member | undefined> {
    const members = await this.list();
    return members.find(m => m.id === id);
  }

  async save(member: Member): Promise<void> {
    const members = await this.list();
    const idx = members.findIndex(m => m.id === member.id);
    if (idx >= 0) {
      members[idx] = member;
    } else {
      members.push(member);
    }
    await this.storage.setObject(KEY, members);
  }

  async delete(id: string): Promise<void> {
    const members = await this.list();
    const filtered = members.filter(m => m.id !== id);
    await this.storage.setObject(KEY, filtered);
  }

  async search(query: string, tag?: CraftTag): Promise<Member[]> {
    const members = await this.list();
    const q = query.trim().toLowerCase();
    return members.filter(m => {
      const matchesQuery = !q ||
        m.name.toLowerCase().includes(q) ||
        m.phone.includes(q);
      const matchesTag = !tag || m.craftTags.includes(tag);
      return matchesQuery && matchesTag;
    });
  }

  async updateLastVisit(memberId: string, timestamp: number = Date.now()): Promise<void> {
    const member = await this.get(memberId);
    if (!member) {
      return;
    }
    member.lastVisitAt = timestamp;
    await this.save(member);
  }
}
