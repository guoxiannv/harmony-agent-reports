export enum FamilyRole {
  OWNER = 'owner',
  MEMBER = 'member'
}

@Observed
export class FamilyMember {
  id: string = ''
  nickname: string = ''
  role: FamilyRole = FamilyRole.MEMBER
  avatar: string = ''
}

@Observed
export class FamilyGroup {
  id: string = ''
  name: string = ''
  inviteCode: string = ''
  members: FamilyMember[] = []

  constructor(id: string, name: string, inviteCode: string) {
    this.id = id
    this.name = name
    this.inviteCode = inviteCode
  }
}
