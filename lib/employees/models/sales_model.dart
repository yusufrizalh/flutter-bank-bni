class SalesModel {
  int? id;
  String? date;
  String? revenue;

  SalesModel({
    this.id,
    this.date,
    this.revenue,
  });

  SalesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    revenue = json['revenue'];
    // revenue = int.parse(json['revenue']) as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    data['revenue'] = revenue;
    return data;
  }
}
