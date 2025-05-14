// To parse this JSON data, do
//
//     final productApiModel = productApiModelFromJson(jsonString);

import 'dart:convert';

List<CategoriesApiModel> productApiModelFromJson(String str) => List<CategoriesApiModel>.from(json.decode(str).map((x) => CategoriesApiModel.fromJson(x)));

String productApiModelToJson(List<CategoriesApiModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoriesApiModel {
  String? slug;
  String? name;
  String? url;

  CategoriesApiModel({
    this.slug,
    this.name,
    this.url,
  });

  factory CategoriesApiModel.fromJson(Map<String, dynamic> json) => CategoriesApiModel(
    slug: json["slug"],
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "slug": slug,
    "name": name,
    "url": url,
  };
}
