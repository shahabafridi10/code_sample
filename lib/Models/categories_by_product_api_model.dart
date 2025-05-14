// To parse this JSON data, do
//
//     final categoriesByProductModel = categoriesByProductModelFromJson(jsonString);

import 'dart:convert';

List<CategoriesByProductModel> categoriesByProductModelFromJson(String str) => List<CategoriesByProductModel>.from(json.decode(str).map((x) => CategoriesByProductModel.fromJson(x)));

String categoriesByProductModelToJson(List<CategoriesByProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoriesByProductModel {
  String? slug;
  String? name;
  String? url;

  CategoriesByProductModel({
    this.slug,
    this.name,
    this.url,
  });

  factory CategoriesByProductModel.fromJson(Map<String, dynamic> json) => CategoriesByProductModel(
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
