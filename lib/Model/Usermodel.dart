import 'Address.dart';
import 'Company.dart';

class Usermodel {
  Usermodel({
      required this.id,
      required this.name,
      required this.email,
       required this.address,
      required this.phoneNumbers,
      required this.company,});

  Usermodel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    address = Address.fromJson(json['address'] ?? {});
    phoneNumbers = json['phoneNumbers'] != null ? json['phoneNumbers'].cast<String>() : [];
    company = Company.fromJson(json['company'] ?? {});
  }

  int? id;
  String? name;
  String? email;
  Address? address;
  List<String>? phoneNumbers;
  Company? company;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['address'] = address?.toJson();
      map['phoneNumbers'] = phoneNumbers;
    map['company'] = company?.toJson();
      return map;
  }

}