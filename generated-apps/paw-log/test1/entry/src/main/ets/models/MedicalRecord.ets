@Observed
export class MedicalRecord {
  id: string = ''
  petId: string = ''
  date: string = ''
  hospital: string = ''
  doctor: string = ''
  symptom: string = ''
  diagnosis: string = ''
  prescription: string = ''
  images: string[] = []

  constructor(id: string, petId: string, date: string) {
    this.id = id
    this.petId = petId
    this.date = date
  }
}
