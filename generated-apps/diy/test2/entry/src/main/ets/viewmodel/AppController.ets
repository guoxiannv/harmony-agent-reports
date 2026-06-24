import { CheckInForm, Course, CraftTag, Material, Member, PointsRecord, Reservation, Settings } from '../model/Models';
import { ServiceRegistry } from '../service/ServiceRegistry';

export interface BookCourseResult {
  success: boolean;
  message?: string;
  reservation?: Reservation;
}

export interface CancelReservationResult {
  success: boolean;
  message?: string;
}

export interface SubmitCheckInResult {
  success: boolean;
  message?: string;
}

export interface RedeemPointsResult {
  success: boolean;
  message?: string;
}

export interface TodayCounts {
  classes: number;
  reservations: number;
}

export class AppController {
  private registry: ServiceRegistry;
  settings: Settings = new Settings();

  constructor(registry: ServiceRegistry) {
    this.registry = registry;
  }

  async loadSettings(): Promise<void> {
    this.settings = await this.registry.settings.load();
  }

  async saveSettings(settings: Settings): Promise<void> {
    this.settings = settings;
    await this.registry.settings.save(settings);
  }

  // Members
  async listMembers(query: string = '', tag?: CraftTag): Promise<Member[]> {
    return await this.registry.members.search(query, tag);
  }

  async getMember(id: string): Promise<Member | undefined> {
    return await this.registry.members.get(id);
  }

  async saveMember(member: Member): Promise<void> {
    if (!member.id) {
      member.id = this.generateId('mem');
      member.createdAt = Date.now();
    }
    await this.registry.members.save(member);
  }

  async deleteMember(id: string): Promise<void> {
    await this.registry.members.delete(id);
  }

  // Courses
  async listCourses(date?: number): Promise<Course[]> {
    if (date !== undefined) {
      return await this.registry.courses.listByDate(date);
    }
    return await this.registry.courses.list();
  }

  async getCourse(id: string): Promise<Course | undefined> {
    return await this.registry.courses.get(id);
  }

  async saveCourse(course: Course): Promise<void> {
    if (!course.id) {
      course.id = this.generateId('crs');
    }
    await this.registry.courses.save(course);
  }

  async deleteCourse(id: string): Promise<void> {
    await this.registry.courses.delete(id);
  }

  // Inventory
  async listMaterials(query: string = ''): Promise<Material[]> {
    return await this.registry.materials.search(query);
  }

  async getMaterial(id: string): Promise<Material | undefined> {
    return await this.registry.materials.get(id);
  }

  async saveMaterial(material: Material): Promise<void> {
    if (!material.id) {
      material.id = this.generateId('mat');
    }
    await this.registry.materials.save(material);
  }

  async deleteMaterial(id: string): Promise<void> {
    await this.registry.materials.delete(id);
  }

  async restockMaterial(id: string, delta: number): Promise<void> {
    const material = await this.registry.materials.get(id);
    if (!material) {
      return;
    }
    material.stock += delta;
    if (material.stock < 0) {
      material.stock = 0;
    }
    await this.registry.materials.save(material);
  }

  // Reservations
  async listReservationsByCourse(courseId: string): Promise<Reservation[]> {
    return await this.registry.reservations.listByCourse(courseId);
  }

  async getReservation(id: string): Promise<Reservation | undefined> {
    return await this.registry.reservations.get(id);
  }

  async bookCourse(courseId: string, memberId: string): Promise<BookCourseResult> {
    const result: BookCourseResult = { success: false };
    const course = await this.registry.courses.get(courseId);
    const member = await this.registry.members.get(memberId);
    if (!course || !member) {
      result.message = '课程或会员不存在';
      return result;
    }

    const bookedCount = await this.registry.reservations.countByCourse(courseId);
    if (bookedCount >= course.capacity) {
      result.message = '课程名额已满';
      return result;
    }

    // consume material stock
    for (const ref of course.materials) {
      const ok = await this.registry.materials.consume(ref.materialId, ref.quantity);
      if (!ok) {
        // rollback already consumed materials
        for (const rollbackRef of course.materials) {
          if (rollbackRef.materialId === ref.materialId) {
            break;
          }
          await this.registry.materials.rollback(rollbackRef.materialId, rollbackRef.quantity);
        }
        result.message = '材料库存不足，请补货';
        return result;
      }
    }

    const reservation = new Reservation();
    reservation.id = this.generateId('res');
    reservation.courseId = courseId;
    reservation.memberId = memberId;
    reservation.status = 'booked';
    reservation.createdAt = Date.now();
    await this.registry.reservations.save(reservation);
    result.reservation = reservation;

    // reward points
    if (course.rewardPoints > 0) {
      member.points += course.rewardPoints;
      await this.registry.members.save(member);
      await this.registry.points.earn({
        memberId,
        value: course.rewardPoints,
        type: 'course',
        balanceAfter: member.points,
        description: `完成课程奖励：${course.title}`,
        relatedCourseId: courseId,
      });
    }

    await this.registry.members.updateLastVisit(memberId);
    result.success = true;
    return result;
  }

  async cancelReservation(reservationId: string): Promise<CancelReservationResult> {
    const result: CancelReservationResult = { success: false };
    const reservation = await this.registry.reservations.get(reservationId);
    if (!reservation) {
      result.message = '预约不存在';
      return result;
    }
    if (reservation.status !== 'booked') {
      result.message = '预约已取消或已完成';
      return result;
    }

    const course = await this.registry.courses.get(reservation.courseId);
    const member = await this.registry.members.get(reservation.memberId);

    reservation.status = 'cancelled';
    reservation.cancelledAt = Date.now();
    await this.registry.reservations.save(reservation);

    if (course) {
      for (const ref of course.materials) {
        await this.registry.materials.rollback(ref.materialId, ref.quantity);
      }
    }

    if (course && member && course.rewardPoints > 0) {
      member.points -= course.rewardPoints;
      if (member.points < 0) {
        member.points = 0;
      }
      await this.registry.members.save(member);
      await this.registry.points.use({
        memberId: member.id,
        value: course.rewardPoints,
        balanceAfter: member.points,
        type: 'course',
        description: `取消课程扣除奖励：${course.title}`,
        relatedCourseId: course.id,
      });
    }

    result.success = true;
    return result;
  }

  // Points
  async listPointsHistory(memberId?: string, limit: number = 100): Promise<PointsRecord[]> {
    if (memberId) {
      return await this.registry.points.listByMember(memberId, limit);
    }
    return await this.registry.points.recent(limit);
  }

  async submitCheckIn(form: CheckInForm): Promise<SubmitCheckInResult> {
    const result: SubmitCheckInResult = { success: false };
    if (!form.selectedMemberId) {
      result.message = '请选择会员';
      return result;
    }
    const member = await this.registry.members.get(form.selectedMemberId);
    if (!member) {
      result.message = '会员不存在';
      return result;
    }

    if (form.type === 'check-in') {
      const today = this.startOfDay(Date.now());
      const records = await this.registry.points.listByMember(member.id, 10);
      const alreadyCheckedIn = records.some((r: PointsRecord) => r.type === 'check-in' && this.startOfDay(r.createdAt) === today);
      if (alreadyCheckedIn) {
        result.message = '今日已签到';
        return result;
      }
      member.points += this.settings.checkInPoints;
      await this.registry.members.save(member);
      await this.registry.points.earn({
        memberId: member.id,
        value: this.settings.checkInPoints,
        type: 'check-in',
        balanceAfter: member.points,
        description: '每日签到',
      });
      await this.registry.members.updateLastVisit(member.id);
      result.success = true;
      return result;
    }

    // spend
    const amount = Math.max(0, form.amount);
    const points = form.points > 0 ? form.points : Math.floor(amount * this.settings.spendRatio);
    if (amount > 0 || points > 0) {
      member.points += points;
      await this.registry.members.save(member);
      await this.registry.points.earn({
        memberId: member.id,
        value: points,
        type: 'spend',
        balanceAfter: member.points,
        description: `消费 ¥${amount}`,
      });
      await this.registry.members.updateLastVisit(member.id);
    }

    result.success = true;
    return result;
  }

  async redeemPoints(memberId: string, points: number, description: string, materialId?: string): Promise<RedeemPointsResult> {
    const result: RedeemPointsResult = { success: false };
    const member = await this.registry.members.get(memberId);
    if (!member) {
      result.message = '会员不存在';
      return result;
    }
    if (member.points < points) {
      result.message = '积分不足';
      return result;
    }
    member.points -= points;
    await this.registry.members.save(member);
    await this.registry.points.use({
      memberId,
      value: points,
      balanceAfter: member.points,
      type: 'redeem',
      description,
      relatedMaterialId: materialId,
    });
    result.success = true;
    return result;
  }

  // Sleeping members
  async listSleepingMembers(): Promise<Member[]> {
    const members = await this.registry.members.list();
    const thresholdMs = this.settings.sleepThresholdDays * 24 * 60 * 60 * 1000;
    const now = Date.now();
    return members.filter((m: Member) => {
      if (!m.lastVisitAt) {
        return false;
      }
      return now - m.lastVisitAt > thresholdMs;
    }).sort((a: Member, b: Member) => (b.lastVisitAt ?? 0) - (a.lastVisitAt ?? 0));
  }

  async sleepingCount(): Promise<number> {
    const members = await this.listSleepingMembers();
    return members.length;
  }

  async wakeMembers(memberIds: string[], pointsBonus: number = 50): Promise<void> {
    for (const id of memberIds) {
      const member = await this.registry.members.get(id);
      if (!member) {
        continue;
      }
      if (pointsBonus > 0) {
        member.points += pointsBonus;
        await this.registry.members.save(member);
        await this.registry.points.earn({
          memberId: id,
          value: pointsBonus,
          type: 'wake',
          balanceAfter: member.points,
          description: '沉睡唤醒礼遇',
        });
      }
    }
  }

  // Dashboard
  async todayCounts(): Promise<TodayCounts> {
    const today = Date.now();
    const courses = await this.registry.courses.listByDate(today);
    const courseIds = new Set<string>(courses.map((c: Course) => c.id));
    const reservations = await this.registry.reservations.list();
    const todayReservations = reservations.filter((r: Reservation) => courseIds.has(r.courseId) && r.status === 'booked');
    const counts: TodayCounts = {
      classes: courses.length,
      reservations: todayReservations.length,
    };
    return counts;
  }

  // Helpers
  private generateId(prefix: string): string {
    return `${prefix}_${Date.now()}_${Math.floor(Math.random() * 100000)}`;
  }

  private startOfDay(ts: number): number {
    const d = new Date(ts);
    d.setHours(0, 0, 0, 0);
    return d.getTime();
  }
}
