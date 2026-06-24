import { FamilyInfo, FamilyMember } from '../models/AppTypes';

export class FamilyRepository {
  private info: FamilyInfo = new FamilyInfo()

  constructor() {
    this.info.inviteCode = this.generateCode()
    this.info.members = [
      this.makeMember('我', 'owner'),
      this.makeMember('妈妈', 'member'),
      this.makeMember('爸爸', 'member')
    ]
  }

  getInfo(): FamilyInfo {
    let result: FamilyInfo = new FamilyInfo()
    result.inviteCode = this.info.inviteCode
    result.members = this.info.members.slice()
    return result
  }

  private generateCode(): string {
    let parts: string[] = []
    for (let i = 0; i < 4; i++) {
      parts.push(Math.floor(Math.random() * 9999).toString().padStart(4, '0'))
    }
    return parts.join('-')
  }

  private makeMember(name: string, role: string): FamilyMember {
    let m: FamilyMember = new FamilyMember()
    m.id = 'fam_' + Math.floor(Math.random() * 100000)
    m.name = name
    m.role = role
    m.joinedAt = Date.now()
    return m
  }
}
