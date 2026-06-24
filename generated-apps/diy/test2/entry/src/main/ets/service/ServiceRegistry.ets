import { MemberService } from './MemberService';
import { CourseService } from './CourseService';
import { ReservationService } from './ReservationService';
import { MaterialService } from './MaterialService';
import { PointsService } from './PointsService';
import { SettingsService } from './SettingsService';
import { StorageService } from './StorageService';

export class ServiceRegistry {
  readonly storage: StorageService;
  readonly members: MemberService;
  readonly courses: CourseService;
  readonly reservations: ReservationService;
  readonly materials: MaterialService;
  readonly points: PointsService;
  readonly settings: SettingsService;

  private static instance?: ServiceRegistry;

  private constructor(context: Context) {
    this.storage = new StorageService(context);
    this.members = new MemberService(this.storage);
    this.courses = new CourseService(this.storage);
    this.reservations = new ReservationService(this.storage);
    this.materials = new MaterialService(this.storage);
    this.points = new PointsService(this.storage);
    this.settings = new SettingsService(this.storage);
  }

  static async get(context: Context): Promise<ServiceRegistry> {
    if (!ServiceRegistry.instance) {
      ServiceRegistry.instance = new ServiceRegistry(context);
      await ServiceRegistry.instance.storage.init();
    }
    return ServiceRegistry.instance;
  }
}
