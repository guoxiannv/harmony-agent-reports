// Central store over AppStorage. Owns all entity CRUD + transaction primitives.
// Pages observe via @StorageLink. Mutations reassign arrays (no spreads) and
// trigger best-effort persistence.
// ArkTS strict-safe.

import {
  AppSettings, Member, Course, Booking, PointTransaction, Material, InventoryTransaction,
  CourseMaterial, PointTxType, InventoryTxType,
  MemberRow, CourseRow, MaterialRow, PointRow,
  ServiceResult,
  KEY_MEMBERS, KEY_COURSES, KEY_BOOKINGS, KEY_POINT_TX, KEY_MATERIALS, KEY_INV_TX, KEY_SETTINGS,
} from '../common/Models';
import { TimeUtil, IdUtil, TextUtil } from '../common/Util';
import { PersistenceService } from './PersistenceService';

export class AppStore {
  private static instance: AppStore | null = null;

  static get(): AppStore {
    if (AppStore.instance === null) {
      AppStore.instance = new AppStore();
      AppStore.instance.seed();
    }
    return AppStore.instance;
  }

  // Ensure AppStorage keys exist with sane defaults.
  private seed(): void {
    if (AppStorage.get<Member[]>(KEY_MEMBERS) === undefined || AppStorage.get<Member[]>(KEY_MEMBERS) === null) {
      AppStorage.setOrCreate<Member[]>(KEY_MEMBERS, []);
    }
    if (AppStorage.get<Course[]>(KEY_COURSES) === undefined || AppStorage.get<Course[]>(KEY_COURSES) === null) {
      AppStorage.setOrCreate<Course[]>(KEY_COURSES, []);
    }
    if (AppStorage.get<Booking[]>(KEY_BOOKINGS) === undefined || AppStorage.get<Booking[]>(KEY_BOOKINGS) === null) {
      AppStorage.setOrCreate<Booking[]>(KEY_BOOKINGS, []);
    }
    if (AppStorage.get<PointTransaction[]>(KEY_POINT_TX) === undefined || AppStorage.get<PointTransaction[]>(KEY_POINT_TX) === null) {
      AppStorage.setOrCreate<PointTransaction[]>(KEY_POINT_TX, []);
    }
    if (AppStorage.get<Material[]>(KEY_MATERIALS) === undefined || AppStorage.get<Material[]>(KEY_MATERIALS) === null) {
      AppStorage.setOrCreate<Material[]>(KEY_MATERIALS, []);
    }
    if (AppStorage.get<InventoryTransaction[]>(KEY_INV_TX) === undefined || AppStorage.get<InventoryTransaction[]>(KEY_INV_TX) === null) {
      AppStorage.setOrCreate<InventoryTransaction[]>(KEY_INV_TX, []);
    }
    if (AppStorage.get<AppSettings>(KEY_SETTINGS) === undefined || AppStorage.get<AppSettings>(KEY_SETTINGS) === null) {
      AppStorage.setOrCreate<AppSettings>(KEY_SETTINGS, PersistenceService.defaultSettings());
    }
  }

  // ---------- settings ----------
  getSettings(): AppSettings {
    const s = AppStorage.get<AppSettings>(KEY_SETTINGS);
    if (s !== undefined && s !== null) {
      return s;
    }
    return PersistenceService.defaultSettings();
  }

  updateSettings(s: AppSettings): void {
    AppStorage.setOrCreate<AppSettings>(KEY_SETTINGS, s);
    this.persist();
  }

  // ---------- members ----------
  getMembers(): Member[] {
    return AppStorage.get<Member[]>(KEY_MEMBERS) ?? [];
  }

  getMember(id: string): Member | null {
    const list = this.getMembers();
    for (let i = 0; i < list.length; i++) {
      if (list[i].id === id) {
        return list[i];
      }
    }
    return null;
  }

  findMemberByPhone(phone: string, excludeId: string): Member | null {
    const p = TextUtil.trim(phone);
    const list = this.getMembers();
    for (let i = 0; i < list.length; i++) {
      if (list[i].phone === p && list[i].id !== excludeId) {
        return list[i];
      }
    }
    return null;
  }

  saveMember(form: Member, editingId: string): ServiceResult {
    const name = TextUtil.trim(form.name);
    const phone = TextUtil.trim(form.phone);
    if (name.length === 0) {
      return new ServiceResult(false, '请填写姓名', '');
    }
    if (phone.length === 0) {
      return new ServiceResult(false, '请填写手机号', '');
    }
    if (this.findMemberByPhone(phone, editingId) !== null) {
      return new ServiceResult(false, '该手机号已存在', '');
    }
    const list = this.getMembers();
    const next: Member[] = [];
    if (editingId.length === 0) {
      const created: Member = {
        id: IdUtil.next('m'),
        name: name,
        phone: phone,
        nickname: TextUtil.trim(form.nickname),
        birthday: form.birthday,
        crafts: this.cloneStrings(form.crafts),
        notes: form.notes,
        allergy: form.allergy,
        workImages: this.cloneStrings(form.workImages),
        points: 0,
        totalSpend: 0,
        lastVisitAt: 0,
        createdAt: TimeUtil.now(),
      };
      next.push(created);
      for (let i = 0; i < list.length; i++) {
        next.push(list[i]);
      }
      AppStorage.setOrCreate<Member[]>(KEY_MEMBERS, next);
      this.persist();
      return new ServiceResult(true, '已添加会员', created.id);
    }
    let savedId = '';
    for (let i = 0; i < list.length; i++) {
      if (list[i].id === editingId) {
        const updated: Member = {
          id: list[i].id,
          name: name,
          phone: phone,
          nickname: TextUtil.trim(form.nickname),
          birthday: form.birthday,
          crafts: this.cloneStrings(form.crafts),
          notes: form.notes,
          allergy: form.allergy,
          workImages: this.cloneStrings(form.workImages),
          points: list[i].points,
          totalSpend: list[i].totalSpend,
          lastVisitAt: list[i].lastVisitAt,
          createdAt: list[i].createdAt,
        };
        savedId = updated.id;
        next.push(updated);
      } else {
        next.push(list[i]);
      }
    }
    AppStorage.setOrCreate<Member[]>(KEY_MEMBERS, next);
    this.persist();
    return new ServiceResult(true, '已保存', savedId);
  }

  deleteMember(id: string): void {
    const list = this.getMembers();
    const next: Member[] = [];
    for (let i = 0; i < list.length; i++) {
      if (list[i].id !== id) {
        next.push(list[i]);
      }
    }
    AppStorage.setOrCreate<Member[]>(KEY_MEMBERS, next);
    // Cascade: cancel active bookings for this member (stock restoration handled by cancel).
    const bookings = this.getBookings();
    for (let i = 0; i < bookings.length; i++) {
      if (bookings[i].memberId === id && bookings[i].status === 'active') {
        this.cancelBooking(bookings[i].id);
      }
    }
    this.persist();
  }

  touchMember(id: string, visitMs: number, addSpend: number): void {
    const list = this.getMembers();
    const next: Member[] = [];
    for (let i = 0; i < list.length; i++) {
      if (list[i].id === id) {
        const m: Member = {
          id: list[i].id, name: list[i].name, phone: list[i].phone, nickname: list[i].nickname,
          birthday: list[i].birthday, crafts: list[i].crafts, notes: list[i].notes, allergy: list[i].allergy,
          workImages: list[i].workImages, points: list[i].points,
          totalSpend: list[i].totalSpend + addSpend,
          lastVisitAt: visitMs > 0 ? visitMs : list[i].lastVisitAt,
          createdAt: list[i].createdAt,
        };
        next.push(m);
      } else {
        next.push(list[i]);
      }
    }
    AppStorage.setOrCreate<Member[]>(KEY_MEMBERS, next);
    this.persist();
  }

  // Mirror member.points from latest tx (call after applyPointTx).
  private syncMemberPoints(memberId: string, balance: number): void {
    const list = this.getMembers();
    const next: Member[] = [];
    for (let i = 0; i < list.length; i++) {
      if (list[i].id === memberId) {
        const m: Member = {
          id: list[i].id, name: list[i].name, phone: list[i].phone, nickname: list[i].nickname,
          birthday: list[i].birthday, crafts: list[i].crafts, notes: list[i].notes, allergy: list[i].allergy,
          workImages: list[i].workImages, points: balance, totalSpend: list[i].totalSpend,
          lastVisitAt: list[i].lastVisitAt, createdAt: list[i].createdAt,
        };
        next.push(m);
      } else {
        next.push(list[i]);
      }
    }
    AppStorage.setOrCreate<Member[]>(KEY_MEMBERS, next);
  }

  // ---------- point transactions ----------
  getPointTx(): PointTransaction[] {
    return AppStorage.get<PointTransaction[]>(KEY_POINT_TX) ?? [];
  }

  memberBalance(memberId: string): number {
    const m = this.getMember(memberId);
    return m !== null ? m.points : 0;
  }

  hasCheckedInToday(memberId: string): boolean {
    const list = this.getPointTx();
    const todayStart = TimeUtil.startOfDay(TimeUtil.now());
    for (let i = 0; i < list.length; i++) {
      if (list[i].memberId === memberId && list[i].type === 'checkin' && list[i].createdAt >= todayStart) {
        return true;
      }
    }
    return false;
  }

  // Apply a signed point delta. Returns updated balance or -1 on rejected spend.
  applyPointTx(memberId: string, type: PointTxType, signedAmount: number, reason: string,
    refType: string, refId: string): number {
    const balance = this.memberBalance(memberId);
    if (signedAmount < 0 && balance + signedAmount < 0) {
      return -1; // insufficient
    }
    const newBalance = balance + signedAmount;
    const tx: PointTransaction = {
      id: IdUtil.next('p'),
      memberId: memberId,
      type: type,
      amount: signedAmount,
      balanceAfter: newBalance,
      reason: reason,
      refType: refType,
      refId: refId,
      createdAt: TimeUtil.now(),
    };
    const list = this.getPointTx();
    const next: PointTransaction[] = [tx];
    for (let i = 0; i < list.length; i++) {
      next.push(list[i]);
    }
    AppStorage.setOrCreate<PointTransaction[]>(KEY_POINT_TX, next);
    this.syncMemberPoints(memberId, newBalance);
    this.persist();
    return newBalance;
  }

  // ---------- materials ----------
  getMaterials(): Material[] {
    return AppStorage.get<Material[]>(KEY_MATERIALS) ?? [];
  }

  getMaterial(id: string): Material | null {
    const list = this.getMaterials();
    for (let i = 0; i < list.length; i++) {
      if (list[i].id === id) {
        return list[i];
      }
    }
    return null;
  }

  saveMaterial(form: Material, editingId: string): ServiceResult {
    const name = TextUtil.trim(form.name);
    if (name.length === 0) {
      return new ServiceResult(false, '请填写物料名称', '');
    }
    const list = this.getMaterials();
    const next: Material[] = [];
    if (editingId.length === 0) {
      const created: Material = {
        id: IdUtil.next('mat'),
        name: name,
        spec: form.spec,
        unit: form.unit.length === 0 ? '份' : form.unit,
        stock: form.stock,
        safeStock: form.safeStock,
        notes: form.notes,
        createdAt: TimeUtil.now(),
      };
      next.push(created);
      for (let i = 0; i < list.length; i++) {
        next.push(list[i]);
      }
      AppStorage.setOrCreate<Material[]>(KEY_MATERIALS, next);
      this.persist();
      return new ServiceResult(true, '已添加物料', created.id);
    }
    let savedId = '';
    for (let i = 0; i < list.length; i++) {
      if (list[i].id === editingId) {
        const updated: Material = {
          id: list[i].id, name: name, spec: form.spec,
          unit: form.unit.length === 0 ? '份' : form.unit,
          stock: list[i].stock, safeStock: form.safeStock, notes: form.notes, createdAt: list[i].createdAt,
        };
        savedId = updated.id;
        next.push(updated);
      } else {
        next.push(list[i]);
      }
    }
    AppStorage.setOrCreate<Material[]>(KEY_MATERIALS, next);
    this.persist();
    return new ServiceResult(true, '已保存', savedId);
  }

  materialStock(materialId: string): number {
    const m = this.getMaterial(materialId);
    return m !== null ? m.stock : 0;
  }

  // Apply signed inventory delta. Returns new stock or -1 on rejected over-draw.
  applyInventoryTx(materialId: string, type: InventoryTxType, signedQty: number, reason: string,
    refType: string, refId: string): number {
    const m = this.getMaterial(materialId);
    if (m === null) {
      return -1;
    }
    let newStock = m.stock + signedQty;
    if (newStock < 0) {
      newStock = 0; // clamp; record what actually happened
    }
    const tx: InventoryTransaction = {
      id: IdUtil.next('inv'),
      materialId: materialId,
      type: type,
      quantity: signedQty,
      balanceAfter: newStock,
      reason: reason,
      refType: refType,
      refId: refId,
      createdAt: TimeUtil.now(),
    };
    const list = this.getInvTx();
    const nextInv: InventoryTransaction[] = [tx];
    for (let i = 0; i < list.length; i++) {
      nextInv.push(list[i]);
    }
    AppStorage.setOrCreate<InventoryTransaction[]>(KEY_INV_TX, nextInv);

    // Update material stock.
    const mats = this.getMaterials();
    const nextMats: Material[] = [];
    for (let i = 0; i < mats.length; i++) {
      if (mats[i].id === materialId) {
        nextMats.push({
          id: mats[i].id, name: mats[i].name, spec: mats[i].spec, unit: mats[i].unit,
          stock: newStock, safeStock: mats[i].safeStock, notes: mats[i].notes, createdAt: mats[i].createdAt,
        });
      } else {
        nextMats.push(mats[i]);
      }
    }
    AppStorage.setOrCreate<Material[]>(KEY_MATERIALS, nextMats);
    this.persist();
    return newStock;
  }

  getInvTx(): InventoryTransaction[] {
    return AppStorage.get<InventoryTransaction[]>(KEY_INV_TX) ?? [];
  }

  // ---------- courses ----------
  getCourses(): Course[] {
    return AppStorage.get<Course[]>(KEY_COURSES) ?? [];
  }

  getCourse(id: string): Course | null {
    const list = this.getCourses();
    for (let i = 0; i < list.length; i++) {
      if (list[i].id === id) {
        return list[i];
      }
    }
    return null;
  }

  saveCourse(form: Course, editingId: string): ServiceResult {
    const title = TextUtil.trim(form.title);
    if (title.length === 0) {
      return new ServiceResult(false, '请填写课程名称', '');
    }
    if (form.capacity < 1) {
      return new ServiceResult(false, '容量至少为 1', '');
    }
    const list = this.getCourses();
    const next: Course[] = [];
    const materialsClone: CourseMaterial[] = this.cloneCourseMaterials(form.materials);
    if (editingId.length === 0) {
      const created: Course = {
        id: IdUtil.next('c'),
        title: title,
        startAt: form.startAt,
        durationMin: form.durationMin,
        capacity: form.capacity,
        price: form.price,
        location: form.location,
        materials: materialsClone,
        notes: form.notes,
        createdAt: TimeUtil.now(),
      };
      next.push(created);
      for (let i = 0; i < list.length; i++) {
        next.push(list[i]);
      }
      AppStorage.setOrCreate<Course[]>(KEY_COURSES, next);
      this.persist();
      return new ServiceResult(true, '已创建课程', created.id);
    }
    let savedId = '';
    for (let i = 0; i < list.length; i++) {
      if (list[i].id === editingId) {
        const updated: Course = {
          id: list[i].id, title: title, startAt: form.startAt, durationMin: form.durationMin,
          capacity: form.capacity, price: form.price, location: form.location,
          materials: materialsClone, notes: form.notes, createdAt: list[i].createdAt,
        };
        savedId = updated.id;
        next.push(updated);
      } else {
        next.push(list[i]);
      }
    }
    AppStorage.setOrCreate<Course[]>(KEY_COURSES, next);
    this.persist();
    return new ServiceResult(true, '已保存', savedId);
  }

  deleteCourse(id: string): void {
    const list = this.getCourses();
    const next: Course[] = [];
    for (let i = 0; i < list.length; i++) {
      if (list[i].id !== id) {
        next.push(list[i]);
      }
    }
    AppStorage.setOrCreate<Course[]>(KEY_COURSES, next);
    // Cancel active bookings of this course (restore stock).
    const bookings = this.getBookings();
    for (let i = 0; i < bookings.length; i++) {
      if (bookings[i].courseId === id && bookings[i].status === 'active') {
        this.cancelBooking(bookings[i].id);
      }
    }
    this.persist();
  }

  // ---------- bookings ----------
  getBookings(): Booking[] {
    return AppStorage.get<Booking[]>(KEY_BOOKINGS) ?? [];
  }

  activeBookingsForCourse(courseId: string): Booking[] {
    const list = this.getBookings();
    const out: Booking[] = [];
    for (let i = 0; i < list.length; i++) {
      if (list[i].courseId === courseId && list[i].status === 'active') {
        out.push(list[i]);
      }
    }
    return out;
  }

  hasActiveBooking(courseId: string, memberId: string): boolean {
    const list = this.getBookings();
    for (let i = 0; i < list.length; i++) {
      if (list[i].courseId === courseId && list[i].memberId === memberId && list[i].status === 'active') {
        return true;
      }
    }
    return false;
  }

  // Orchestrated booking: validates capacity + stock, deducts materials, awards points.
  createBooking(courseId: string, memberId: string, remark: string, usePoints: boolean): ServiceResult {
    const course = this.getCourse(courseId);
    if (course === null) {
      return new ServiceResult(false, '课程不存在', '');
    }
    const member = this.getMember(memberId);
    if (member === null) {
      return new ServiceResult(false, '会员不存在', '');
    }
    if (this.hasActiveBooking(courseId, memberId)) {
      return new ServiceResult(false, '该会员已预约此课程', '');
    }
    const active = this.activeBookingsForCourse(courseId);
    if (active.length >= course.capacity) {
      return new ServiceResult(false, '课程名额已满', '');
    }
    // Validate stock availability for every material.
    for (let i = 0; i < course.materials.length; i++) {
      const cm = course.materials[i];
      if (this.materialStock(cm.materialId) < cm.quantity) {
        const m = this.getMaterial(cm.materialId);
        const nm = m !== null ? m.name : cm.materialId;
        return new ServiceResult(false, `物料「${nm}」库存不足`, '');
      }
    }
    // Commit booking.
    const booking: Booking = {
      id: IdUtil.next('b'),
      courseId: courseId,
      memberId: memberId,
      remark: remark,
      usePoints: usePoints,
      status: 'active',
      createdAt: TimeUtil.now(),
    };
    const list = this.getBookings();
    const next: Booking[] = [booking];
    for (let i = 0; i < list.length; i++) {
      next.push(list[i]);
    }
    AppStorage.setOrCreate<Booking[]>(KEY_BOOKINGS, next);

    // Deduct materials.
    for (let i = 0; i < course.materials.length; i++) {
      const cm = course.materials[i];
      this.applyInventoryTx(cm.materialId, 'courseConsume', -cm.quantity, `课程预约：${course.title}`, 'booking', booking.id);
    }

    // Points: earn = price * pointsPerYuan; optionally spend existing points to offset.
    const settings = this.getSettings();
    const earn = Math.round(course.price * settings.pointsPerYuan);
    let spend = 0;
    if (usePoints && member.points > 0 && earn > 0) {
      spend = Math.min(member.points, earn);
    }
    if (spend > 0) {
      this.applyPointTx(memberId, 'spend', -spend, `课程抵扣：${course.title}`, 'course', booking.id);
    }
    const netEarn = earn - spend;
    if (netEarn > 0) {
      this.applyPointTx(memberId, 'earn', netEarn, `课程消费：${course.title}`, 'course', booking.id);
    }

    this.touchMember(memberId, TimeUtil.now(), course.price);
    this.persist();
    return new ServiceResult(true, '预约成功', booking.id);
  }

  cancelBooking(bookingId: string): void {
    const list = this.getBookings();
    let target: Booking | null = null;
    for (let i = 0; i < list.length; i++) {
      if (list[i].id === bookingId) {
        target = list[i];
        break;
      }
    }
    if (target === null || target.status !== 'active') {
      return;
    }
    const course = this.getCourse(target.courseId);
    const next: Booking[] = [];
    for (let i = 0; i < list.length; i++) {
      if (list[i].id === bookingId) {
        next.push({
          id: list[i].id, courseId: list[i].courseId, memberId: list[i].memberId,
          remark: list[i].remark, usePoints: list[i].usePoints, status: 'cancelled', createdAt: list[i].createdAt,
        });
      } else {
        next.push(list[i]);
      }
    }
    AppStorage.setOrCreate<Booking[]>(KEY_BOOKINGS, next);

    // Restore stock.
    if (course !== null) {
      for (let i = 0; i < course.materials.length; i++) {
        const cm = course.materials[i];
        this.applyInventoryTx(cm.materialId, 'bookingCancel', cm.quantity, `取消预约：${course.title}`, 'booking', bookingId);
      }
    }
    this.persist();
  }

  cancelCourseBookingsForCourse(courseId: string): void {
    const list = this.getBookings();
    for (let i = 0; i < list.length; i++) {
      if (list[i].courseId === courseId && list[i].status === 'active') {
        this.cancelBooking(list[i].id);
      }
    }
  }

  // ---------- derived rows ----------
  memberRows(keyword: string, sleepingOnly: boolean): MemberRow[] {
    const settings = this.getSettings();
    const now = TimeUtil.now();
    const thresholdMs = settings.sleepingThresholdDays * 24 * 3600 * 1000;
    const list = this.getMembers();
    const kw = TextUtil.trim(keyword).toLowerCase();
    const out: MemberRow[] = [];
    for (let i = 0; i < list.length; i++) {
      const m = list[i];
      if (kw.length > 0) {
        const hay = (m.name + ' ' + m.phone + ' ' + m.nickname).toLowerCase();
        if (hay.indexOf(kw) < 0) {
          continue;
        }
      }
      const isSleeping = m.lastVisitAt > 0 && (now - m.lastVisitAt) > thresholdMs;
      if (sleepingOnly && !isSleeping) {
        continue;
      }
      out.push({
        id: m.id,
        name: m.name,
        phone: m.phone,
        nickname: m.nickname,
        craftsLabel: TextUtil.join(m.crafts, ' · '),
        points: m.points,
        isSleeping: isSleeping,
        lastVisitLabel: TimeUtil.relativeDays(m.lastVisitAt, now),
      });
    }
    return out;
  }

  courseRows(filterDateMs: number): CourseRow[] {
    const list = this.getCourses();
    const out: CourseRow[] = [];
    const filterStart = filterDateMs > 0 ? TimeUtil.startOfDay(filterDateMs) : 0;
    const filterEnd = filterStart + 24 * 3600 * 1000;
    for (let i = 0; i < list.length; i++) {
      const c = list[i];
      if (filterStart > 0 && (c.startAt < filterStart || c.startAt >= filterEnd)) {
        continue;
      }
      const booked = this.activeBookingsForCourse(c.id).length;
      out.push({
        id: c.id,
        title: c.title,
        startLabel: TimeUtil.dateLabel(c.startAt),
        timeLabel: TimeUtil.timeLabel(c.startAt),
        booked: booked,
        capacity: c.capacity,
        price: c.price,
        isFull: booked >= c.capacity,
        startAt: c.startAt,
      });
    }
    // Sort ascending by startAt.
    out.sort((a: CourseRow, b: CourseRow) => a.startAt - b.startAt);
    return out;
  }

  materialRows(lowOnly: boolean): MaterialRow[] {
    const list = this.getMaterials();
    const out: MaterialRow[] = [];
    for (let i = 0; i < list.length; i++) {
      const m = list[i];
      const isLow = m.stock <= m.safeStock;
      if (lowOnly && !isLow) {
        continue;
      }
      out.push({
        id: m.id, name: m.name, spec: m.spec, unit: m.unit,
        stock: m.stock, safeStock: m.safeStock, isLow: isLow,
      });
    }
    return out;
  }

  pointRows(memberId: string, typeFilter: string): PointRow[] {
    const list = this.getPointTx();
    const out: PointRow[] = [];
    for (let i = 0; i < list.length; i++) {
      const t = list[i];
      if (memberId.length > 0 && t.memberId !== memberId) {
        continue;
      }
      if (typeFilter === 'earn' && t.amount < 0) {
        continue;
      }
      if (typeFilter === 'spend' && t.amount >= 0) {
        continue;
      }
      const member = this.getMember(t.memberId);
      out.push({
        id: t.id, type: t.type, amount: t.amount, balanceAfter: t.balanceAfter,
        reason: t.reason, createdAt: t.createdAt,
        memberName: member !== null ? member.name : '已删除会员',
      });
    }
    out.sort((a: PointRow, b: PointRow) => b.createdAt - a.createdAt);
    return out;
  }

  sleepingCount(): number {
    const settings = this.getSettings();
    const now = TimeUtil.now();
    const thresholdMs = settings.sleepingThresholdDays * 24 * 3600 * 1000;
    const list = this.getMembers();
    let n = 0;
    for (let i = 0; i < list.length; i++) {
      if (list[i].lastVisitAt > 0 && (now - list[i].lastVisitAt) > thresholdMs) {
        n += 1;
      }
    }
    return n;
  }

  lowStockCount(): number {
    const list = this.getMaterials();
    let n = 0;
    for (let i = 0; i < list.length; i++) {
      if (list[i].stock <= list[i].safeStock) {
        n += 1;
      }
    }
    return n;
  }

  totalPoints(): number {
    const list = this.getMembers();
    let n = 0;
    for (let i = 0; i < list.length; i++) {
      n += list[i].points;
    }
    return n;
  }

  // ---------- helpers ----------
  private cloneStrings(src: string[]): string[] {
    const out: string[] = [];
    for (let i = 0; i < src.length; i++) {
      out.push(src[i]);
    }
    return out;
  }

  private cloneCourseMaterials(src: CourseMaterial[]): CourseMaterial[] {
    const out: CourseMaterial[] = [];
    for (let i = 0; i < src.length; i++) {
      out.push({ materialId: src[i].materialId, quantity: src[i].quantity });
    }
    return out;
  }

  private persist(): void {
    PersistenceService.scheduleSave();
  }
}
