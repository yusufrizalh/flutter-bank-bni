class EmployeesModel {
  int? id;
  String? name;
  String? salary;
  String? address;
  String? createdAt;
  String? photo;

  EmployeesModel({
    this.id,
    this.name,
    this.salary,
    this.address,
    this.createdAt,
    this.photo,
  });

  EmployeesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    salary = json['salary'];
    address = json['address'];
    createdAt = json['created_at'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['salary'] = salary;
    data['address'] = address;
    data['created_at'] = createdAt;
    data['photo'] = photo;
    return data;
  }
}
