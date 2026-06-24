import { Course } from '../model/Models';
import { StorageService } from './StorageService';

const KEY = 'courses_v1';

export class CourseService {
  private storage: StorageService;

  constructor(storage: StorageService) {
    this.storage = storage;
  }

  async list(): Promise<Course[]> {
    return await this.storage.getObject<Course[]>(KEY, []);
  }

  async get(id: string): Promise<Course | undefined> {
    const courses = await this.list();
    return courses.find(c => c.id === id);
  }

  async save(course: Course): Promise<void> {
    const courses = await this.list();
    const idx = courses.findIndex(c => c.id === course.id);
    if (idx >= 0) {
      courses[idx] = course;
    } else {
      courses.push(course);
    }
    await this.storage.setObject(KEY, courses);
  }

  async delete(id: string): Promise<void> {
    const courses = await this.list();
    const filtered = courses.filter(c => c.id !== id);
    await this.storage.setObject(KEY, filtered);
  }

  async listByDate(dateTimestamp: number): Promise<Course[]> {
    const startOfDay = this.startOfDay(dateTimestamp);
    const endOfDay = startOfDay + 24 * 60 * 60 * 1000 - 1;
    const courses = await this.list();
    return courses
      .filter(c => c.startTime >= startOfDay && c.startTime <= endOfDay)
      .sort((a, b) => a.startTime - b.startTime);
  }

  private startOfDay(ts: number): number {
    const d = new Date(ts);
    d.setHours(0, 0, 0, 0);
    return d.getTime();
  }
}
