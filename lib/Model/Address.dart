class Address {
  Address({
      required this.street,
      required this.city,
      required this.state,});

  Address.fromJson(dynamic json) {
    street = json['street'];
    city = json['city'];
    state = json['state'];
  }
  String? street;
  String? city;
  String? state;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['street'] = street;
    map['city'] = city;
    map['state'] = state;
    return map;
  }

}