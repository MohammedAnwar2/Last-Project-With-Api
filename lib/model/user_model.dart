// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

List<UserModel> userModelFromJson(String str) => List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  int id;
  String email;
  String password;
  String name;
  String role;
  String avatar;
  DateTime creationAt;
  DateTime updatedAt;

  UserModel({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.role,
    required this.avatar,
    required this.creationAt,
    required this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    email: json["email"],
    password: json["password"],
    name: json["name"],
    role: json["role"],
    avatar: json["avatar"],
    creationAt: DateTime.parse(json["creationAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "password": password,
    "name": name,
    "role": roleValues.reverse[role],
    "avatar": avatar,
    "creationAt": creationAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}

enum Role { CUSTOMER, ADMIN }

final roleValues = EnumValues({
  "admin": Role.ADMIN,
  "customer": Role.CUSTOMER
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
