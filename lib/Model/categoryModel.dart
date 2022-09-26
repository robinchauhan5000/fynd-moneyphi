// To parse this JSON data, do
//
//     final CategoryModel = CategoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel CategoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

String CategoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  CategoryModel({
    required this.success,
    required this.data,
  });

  bool success;
  List<Datum>? data;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        success: json["success"] == null ? false : json["success"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.catName,
    required this.subCategories,
  });

  int id;
  String catName;
  List<SubCategory>? subCategories;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        catName: json["catName"] == null ? null : json["catName"],
        subCategories: json["subCategories"] == null
            ? null
            : List<SubCategory>.from(
                json["subCategories"].map((x) => SubCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? 0 : id,
        "catName": catName == null ? "" : catName,
        "subCategories": subCategories == null
            ? ""
            : List<dynamic>.from(subCategories!.map((x) => x.toJson())),
      };
}

class SubCategory {
  SubCategory({
    required this.image,
    required this.subCatName,
  });

  String image;
  String subCatName;

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        image: json["image"] == null ? null : json["image"],
        subCatName: json["subCatName"] == null ? null : json["subCatName"],
      );

  Map<String, dynamic> toJson() => {
        "image": image == null ? null : image,
        "subCatName": subCatName == null ? null : subCatName,
      };
}
