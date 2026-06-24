export enum Gender {
  MALE = 'male',
  FEMALE = 'female',
  UNKNOWN = 'unknown'
}

@Observed
export class Pet {
  id: string = ''
  name: string = ''
  avatar: string = ''
  species: string = ''
  breed: string = ''
  birthday: string = ''
  gender: Gender = Gender.UNKNOWN
  weight: number = 0
  neutered: boolean = false
  medicalHistory: string = ''

  constructor(id: string, name: string) {
    this.id = id
    this.name = name
  }
}
