export enum RecordType {
  FOOD = 'food',
  WASTE = 'waste',
  WEIGHT = 'weight',
  MEDICINE = 'medicine'
}

export enum WasteType {
  PEE = 'pee',
  POOP = 'poop',
  VOMIT = 'vomit',
  OTHER = 'other'
}

@Observed
export class RecordModel {
  id: string = ''
  petId: string = ''
  type: RecordType = RecordType.FOOD
  datetime: string = ''
  foodAmount: number = 0
  foodType: string = ''
  wasteType: WasteType = WasteType.OTHER
  weightValue: number = 0
  medicineName: string = ''
  medicineDose: string = ''
  note: string = ''

  constructor(id: string, petId: string, type: RecordType, datetime: string) {
    this.id = id
    this.petId = petId
    this.type = type
    this.datetime = datetime
  }
}
