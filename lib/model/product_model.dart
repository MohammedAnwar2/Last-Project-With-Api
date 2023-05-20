// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  int id;
  String title;
  int price;
  String description;
  List<String> images;
  DateTime creationAt;
  DateTime updatedAt;
  Category category;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.images,
    required this.creationAt,
    required this.updatedAt,
    required this.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    title: json["title"],
    price: json["price"],
    description: json["description"],
    images: List<String>.from(json["images"].map((x) => x)),
    creationAt: DateTime.parse(json["creationAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    category: Category.fromJson(json["category"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "images": List<dynamic>.from(images.map((x) => x)),
    "creationAt": creationAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "category": category.toJson(),
  };
}

class Category {
  int id;
  String name;
  String image;
  DateTime creationAt;
  DateTime updatedAt;

  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.creationAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    creationAt: DateTime.parse(json["creationAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": nameValues.reverse[name],
    "image": image,
    "creationAt": creationAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}

enum Name { SHOES, OTHERS, ELECTRONICS, FURNITURE, DEV_OPS, DEV_OPS_CLASS, TEAM }

final nameValues = EnumValues({
  "DevOps": Name.DEV_OPS,
  "DevOps Class": Name.DEV_OPS_CLASS,
  "Electronics": Name.ELECTRONICS,
  "Furniture": Name.FURNITURE,
  "Others": Name.OTHERS,
  "Shoes": Name.SHOES,
  "Team ស្មោះ": Name.TEAM
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
