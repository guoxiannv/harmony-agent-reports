import { AppStore } from './AppStore';
import { Gender, Pet } from '../models/AppTypes';

const KEY_PETS = 'pets'
const KEY_CURRENT_PET_ID = 'currentPetId'

export class PetRepository {
  private store: AppStore
  private pets: Pet[] = []
  private currentPetId: string = ''
  private initialized: boolean = false

  constructor(store: AppStore) {
    this.store = store
  }

  async init(): Promise<void> {
    if (this.initialized) {
      return
    }
    let raw: string = await this.store.getString(KEY_PETS, '[]')
    try {
      let parsed: object[] = JSON.parse(raw) as object[]
      this.pets = parsed.map((o: object) => this.toPet(o as Record<string, string | number | boolean>))
    } catch (_) {
      this.pets = []
    }
    this.currentPetId = await this.store.getString(KEY_CURRENT_PET_ID, '')
    this.initialized = true
  }

  list(): Pet[] {
    return this.pets.slice()
  }

  getCurrent(): Pet | null {
    if (this.currentPetId.length === 0) {
      return this.pets.length > 0 ? this.pets[0] : null
    }
    let found: Pet | undefined = this.pets.find((p: Pet) => p.id === this.currentPetId)
    return found ?? (this.pets.length > 0 ? this.pets[0] : null)
  }

  getById(id: string): Pet | null {
    return this.pets.find((p: Pet) => p.id === id) ?? null
  }

  async setCurrent(id: string): Promise<void> {
    this.currentPetId = id
    await this.store.setString(KEY_CURRENT_PET_ID, id)
  }

  async save(pet: Pet): Promise<void> {
    if (pet.id.length === 0) {
      pet.id = this.makeId()
      pet.createdAt = Date.now()
      this.pets.push(pet)
    } else {
      let idx: number = this.pets.findIndex((p: Pet) => p.id === pet.id)
      if (idx >= 0) {
        pet.createdAt = this.pets[idx].createdAt
        this.pets[idx] = pet
      } else {
        this.pets.push(pet)
      }
    }
    pet.updatedAt = Date.now()
    await this.persist()
    if (this.currentPetId.length === 0) {
      await this.setCurrent(pet.id)
    }
  }

  async delete(id: string): Promise<void> {
    this.pets = this.pets.filter((p: Pet) => p.id !== id)
    await this.persist()
    if (this.currentPetId === id) {
      this.currentPetId = this.pets.length > 0 ? this.pets[0].id : ''
      await this.store.setString(KEY_CURRENT_PET_ID, this.currentPetId)
    }
  }

  private async persist(): Promise<void> {
    await this.store.setString(KEY_PETS, JSON.stringify(this.pets))
  }

  private toPet(raw: Record<string, string | number | boolean>): Pet {
    let p: Pet = new Pet()
    p.id = String(raw['id'] ?? '')
    p.name = String(raw['name'] ?? '')
    p.avatar = String(raw['avatar'] ?? '')
    p.species = String(raw['species'] ?? '')
    p.breed = String(raw['breed'] ?? '')
    p.birthday = Number(raw['birthday'] ?? 0)
    p.gender = String(raw['gender'] ?? 'unknown') as Gender
    p.neutered = Boolean(raw['neutered'] ?? false)
    p.weight = Number(raw['weight'] ?? 0)
    p.notes = String(raw['notes'] ?? '')
    p.createdAt = Number(raw['createdAt'] ?? 0)
    p.updatedAt = Number(raw['updatedAt'] ?? 0)
    return p
  }

  private makeId(): string {
    return 'pet_' + Date.now() + '_' + Math.floor(Math.random() * 1000)
  }
}
