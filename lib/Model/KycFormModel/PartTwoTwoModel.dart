// To parse this JSON data, do
//
//     final partTwoTwoModel = partTwoTwoModelFromJson(jsonString);

import 'dart:convert';

PartTwoTwoModel partTwoTwoModelFromJson(String str) =>
    PartTwoTwoModel.fromJson(json.decode(str));

String partTwoTwoModelToJson(PartTwoTwoModel data) =>
    json.encode(data.toJson());

class PartTwoTwoModel {
  PartTwoTwoModel({
    this.occupation,
    this.incSlab,
    this.sourceWealth,
    this.politicallyExposed,
    this.politicallyRelated,
    this.birthCountry,
    this.birthPlace,
  });

  String? occupation;
  String? incSlab;
  String? sourceWealth;
  String? politicallyExposed;
  String? politicallyRelated;
  String? birthCountry;
  String? birthPlace;

  factory PartTwoTwoModel.fromJson(Map<String, dynamic> json) =>
      PartTwoTwoModel(
        occupation: json["occupation"],
        incSlab: json["incSlab"],
        sourceWealth: json["sourceWealth"],
        politicallyExposed: json["politicallyExposed"],
        politicallyRelated: json["politicallyRelated"],
        birthCountry: json["birthCountry"],
        birthPlace: json["birthPlace"],
      );

  Map<String, dynamic> toJson() => {
        "occupation": occupation,
        "incSlab": incSlab,
        "sourceWealth": sourceWealth,
        "politicallyExposed": politicallyExposed,
        "politicallyRelated": politicallyRelated,
        "birthCountry": birthCountry,
        "birthPlace": birthPlace,
      };
}
