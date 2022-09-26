// To parse this JSON data, do
//
//     final partTwoOneModel = partTwoOneModelFromJson(jsonString);

import 'dart:convert';

PartTwoOneModel partTwoOneModelFromJson(String str) =>
    PartTwoOneModel.fromJson(json.decode(str));

String partTwoOneModelToJson(PartTwoOneModel data) =>
    json.encode(data.toJson());

class PartTwoOneModel {
  PartTwoOneModel(
      {this.fName,
      this.lName,
      this.motherName,
      this.fatherName,
      this.dob,
      this.gender,
      this.addrType,
      this.paddr1,
      this.pcity,
      this.pstate,
      this.pcountry,
      this.ppincode,
      this.emailDeclaration,
      this.mobileDeclaration,
      this.paddr2});

  String? fName;
  String? lName;
  String? motherName;
  String? fatherName;
  String? dob;
  String? gender;
  String? addrType;
  String? paddr1;
  String? paddr2;
  String? pcity;
  String? pstate;
  String? pcountry;
  String? ppincode;
  String? mobileDeclaration;
  String? emailDeclaration;

  factory PartTwoOneModel.fromJson(Map<String, dynamic> json) =>
      PartTwoOneModel(
        fName: json["fName"],
        lName: json["lName"],
        motherName: json["motherName"],
        fatherName: json["fatherName"],
        dob: json["dob"],
        gender: json["gender"],
        addrType: json["addrType"],
        paddr1: json["paddr1"],
        paddr2: json["paddr2"],
        pcity: json["pcity"],
        pstate: json["pstate"],
        pcountry: json["pcountry"],
        ppincode: json["ppincode"],
        emailDeclaration: json["emailDeclaration"],
        mobileDeclaration: json["mobileDeclaration"],
      );

  Map<String, dynamic> toJson() => {
        "fName": fName,
        "lName": lName,
        "motherName": motherName,
        "fatherName": fatherName,
        "dob": dob,
        "gender": gender,
        "addrType": addrType,
        "paddr1": paddr1,
        "addr2": paddr2,
        "pcity": pcity,
        "pstate": pstate,
        "pcountry": pcountry,
        "ppincode": ppincode,
        "mobileDeclaration": mobileDeclaration,
        "emailDeclaration": emailDeclaration,
      };
}
