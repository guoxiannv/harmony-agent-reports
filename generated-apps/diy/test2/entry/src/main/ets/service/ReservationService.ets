import { Reservation, ReservationStatus } from '../model/Models';
import { StorageService } from './StorageService';

const KEY = 'reservations_v1';

export class ReservationService {
  private storage: StorageService;

  constructor(storage: StorageService) {
    this.storage = storage;
  }

  async list(): Promise<Reservation[]> {
    return await this.storage.getObject<Reservation[]>(KEY, []);
  }

  async listByCourse(courseId: string): Promise<Reservation[]> {
    const reservations = await this.list();
    return reservations
      .filter(r => r.courseId === courseId)
      .sort((a, b) => b.createdAt - a.createdAt);
  }

  async listByMember(memberId: string): Promise<Reservation[]> {
    const reservations = await this.list();
    return reservations
      .filter(r => r.memberId === memberId)
      .sort((a, b) => b.createdAt - a.createdAt);
  }

  async get(id: string): Promise<Reservation | undefined> {
    const reservations = await this.list();
    return reservations.find(r => r.id === id);
  }

  async save(reservation: Reservation): Promise<void> {
    const reservations = await this.list();
    const idx = reservations.findIndex(r => r.id === reservation.id);
    if (idx >= 0) {
      reservations[idx] = reservation;
    } else {
      reservations.push(reservation);
    }
    await this.storage.setObject(KEY, reservations);
  }

  async countByCourse(courseId: string, statuses: ReservationStatus[] = ['booked', 'completed']): Promise<number> {
    const reservations = await this.list();
    return reservations.filter(r => r.courseId === courseId && statuses.includes(r.status)).length;
  }

  async findByCourseAndMember(courseId: string, memberId: string): Promise<Reservation | undefined> {
    const reservations = await this.list();
    return reservations.find(r => r.courseId === courseId && r.memberId === memberId && r.status === 'booked');
  }
}
