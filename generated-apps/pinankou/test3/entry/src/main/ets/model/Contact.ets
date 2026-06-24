export interface ContactInit {
  id?: string;
  name?: string;
  role?: string;
  department?: string;
  phone?: string;
  isEmergency?: boolean;
  createdAt?: number;
  updatedAt?: number;
}

export class Contact {
  id: string = '';
  name: string = '';
  role: string = '';
  department: string = '';
  phone: string = '';
  isEmergency: boolean = false;
  createdAt: number = Date.now();
  updatedAt: number = Date.now();

  constructor(init: ContactInit = {}) {
    if (init.id !== undefined) this.id = init.id;
    if (init.name !== undefined) this.name = init.name;
    if (init.role !== undefined) this.role = init.role;
    if (init.department !== undefined) this.department = init.department;
    if (init.phone !== undefined) this.phone = init.phone;
    if (init.isEmergency !== undefined) this.isEmergency = init.isEmergency;
    if (init.createdAt !== undefined) this.createdAt = init.createdAt;
    if (init.updatedAt !== undefined) this.updatedAt = init.updatedAt;
  }

  static from(other: Contact): Contact {
    const c = new Contact();
    c.id = other.id;
    c.name = other.name;
    c.role = other.role;
    c.department = other.department;
    c.phone = other.phone;
    c.isEmergency = other.isEmergency;
    c.createdAt = other.createdAt;
    c.updatedAt = other.updatedAt;
    return c;
  }
}
