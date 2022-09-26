// To parse this JSON data, do
//
//     final partTwoThreeModel = partTwoThreeModelFromJson(jsonString);

import 'dart:convert';

PartTwoThreeModel partTwoThreeModelFromJson(String str) =>
    PartTwoThreeModel.fromJson(json.decode(str));

String partTwoThreeModelToJson(PartTwoThreeModel data) =>
    json.encode(data.toJson());

class PartTwoThreeModel {
  PartTwoThreeModel({
    required this.nomineeName,
    required this.nomineeRelation,
    required this.nomineeDob,
    required this.nomineeGuardian,
  });

  String nomineeName;
  String nomineeRelation;
  DateTime nomineeDob;
  String nomineeGuardian;

  factory PartTwoThreeModel.fromJson(Map<String, dynamic> json) =>
      PartTwoThreeModel(
        nomineeName: json["nomineeName"],
        nomineeRelation: json["nomineeRelation"],
        nomineeDob: DateTime.parse(json["nomineeDOB"]),
        nomineeGuardian: json["nomineeGuardian"],
      );

  Map<String, dynamic> toJson() => {
        "nomineeName": nomineeName,
        "nomineeRelation": nomineeRelation,
        "nomineeDOB":
            "${nomineeDob.year.toString().padLeft(4, '0')}-${nomineeDob.month.toString().padLeft(2, '0')}-${nomineeDob.day.toString().padLeft(2, '0')}",
        "nomineeGuardian": nomineeGuardian,
      };
}
