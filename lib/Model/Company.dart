class Company {
  Company({
    required this.name,
    required this.position,});

  Company.fromJson(dynamic json) {
    name = json['name'];
    position = json['position'];
  }

  String? name;
  String? position;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['position'] = position;
    return map;
  }
}
