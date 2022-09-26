// To parse this JSON data, do
//
//     final partTwoFourModel = partTwoFourModelFromJson(jsonString);

import 'dart:convert';

PartTwoFourModel partTwoFourModelFromJson(String str) =>
    PartTwoFourModel.fromJson(json.decode(str));

String partTwoFourModelToJson(PartTwoFourModel data) =>
    json.encode(data.toJson());

class PartTwoFourModel {
  PartTwoFourModel({
    required this.accType1,
    required this.ifscCode1,
    required this.accNo1,
    required this.bankName1,
    required this.defaultbank1,
  });

  String accType1;
  String ifscCode1;
  String accNo1;
  String bankName1;
  bool defaultbank1;

  factory PartTwoFourModel.fromJson(Map<String, dynamic> json) =>
      PartTwoFourModel(
        accType1: json["accType1"],
        ifscCode1: json["ifscCode1"],
        accNo1: json["accNo1"],
        bankName1: json["bankName1"],
        defaultbank1: json["defaultbank1"],
      );

  Map<String, dynamic> toJson() => {
        "accType1": accType1,
        "ifscCode1": ifscCode1,
        "accNo1": accNo1,
        "bankName1": bankName1,
        "defaultbank1": defaultbank1,
      };
}
