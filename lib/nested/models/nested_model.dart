class NestedModel {
  int? id;
  List<Name>? name;
  String? salary;
  List<Address>? address;
  String? createdAt;
  String? photo;
  List<Department>? department;

  NestedModel({
    this.id,
    this.name,
    this.salary,
    this.address,
    this.createdAt,
    this.photo,
    this.department,
  });

  NestedModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['name'] != null) {
      name = <Name>[];
      json['name'].forEach((v) {
        name!.add(Name.fromJson(v));
      });
    }
    salary = json['salary'];
    if (json['address'] != null) {
      address = <Address>[];
      json['address'].forEach((v) {
        address!.add(Address.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    photo = json['photo'];
    if (json['department'] != null) {
      department = <Department>[];
      json['department'].forEach((v) {
        department!.add(Department.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (name != null) {
      data['name'] = name!.map((v) => v.toJson()).toList();
    }
    data['salary'] = salary;
    if (address != null) {
      data['address'] = address!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = createdAt;
    data['photo'] = photo;
    if (department != null) {
      data['department'] = department!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Name {
  String? first;
  String? last;

  Name({this.first, this.last});

  Name.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first'] = first;
    data['last'] = last;
    return data;
  }
}

class Address {
  String? street;
  int? postal;
  String? city;

  Address({this.street, this.postal, this.city});

  Address.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    postal = json['postal'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['street'] = street;
    data['postal'] = postal;
    data['city'] = city;
    return data;
  }
}

class Department {
  int? id;
  String? name;
  List<Supervisor>? supervisor;

  Department({this.id, this.name, this.supervisor});

  Department.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['supervisor'] != null) {
      supervisor = <Supervisor>[];
      json['supervisor'].forEach((v) {
        supervisor!.add(Supervisor.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (supervisor != null) {
      data['supervisor'] = supervisor!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Supervisor {
  int? id;
  String? name;
  List<Manager>? manager;

  Supervisor({this.id, this.name, this.manager});

  Supervisor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['manager'] != null) {
      manager = <Manager>[];
      json['manager'].forEach((v) {
        manager!.add(Manager.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (manager != null) {
      data['manager'] = manager!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Manager {
  int? id;
  String? name;

  Manager({this.id, this.name});

  Manager.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
