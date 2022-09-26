// To parse this JSON data, do
//
//     final registerSipModel = registerSipModelFromJson(jsonString);

import 'dart:convert';

RegisterSipModel registerSipModelFromJson(String str) =>
    RegisterSipModel.fromJson(json.decode(str));

String registerSipModelToJson(RegisterSipModel data) =>
    json.encode(data.toJson());

class RegisterSipModel {
  RegisterSipModel({
    required this.sips,
  });

  Sips sips;

  factory RegisterSipModel.fromJson(Map<String, dynamic> json) =>
      RegisterSipModel(
        sips: Sips.fromJson(json["sips"]),
      );

  Map<String, dynamic> toJson() => {
        "sips": sips.toJson(),
      };
}

class Sips {
  Sips({
    required this.fundData,
    required this.mandateId,
    required this.mandateType,
    required this.userGoalInputIds,
    required this.firstOrderFlag,
  });

  List<FundDatum> fundData;
  String mandateId;
  String mandateType;
  List<int> userGoalInputIds;
  String firstOrderFlag;

  factory Sips.fromJson(Map<String, dynamic> json) => Sips(
        fundData: List<FundDatum>.from(
            json["fundData"].map((x) => FundDatum.fromJson(x))),
        mandateId: json["mandateId"],
        mandateType: json["mandateType"],
        userGoalInputIds:
            List<int>.from(json["userGoalInputIds"].map((x) => x)),
        firstOrderFlag: json["firstOrderFlag"],
      );

  Map<String, dynamic> toJson() => {
        "fundData": List<dynamic>.from(fundData.map((x) => x.toJson())),
        "mandateId": mandateId,
        "mandateType": mandateType,
        "userGoalInputIds": List<dynamic>.from(userGoalInputIds.map((x) => x)),
        "firstOrderFlag": firstOrderFlag,
      };
}

class FundDatum {
  FundDatum({
    required this.fundBseCode,
    required this.startDate,
    required this.frequency,
    required this.amount,
    required this.noOfInstallments,
    required this.fundId,
    required this.sipDate,
    required this.selectedFolio,
    required this.mandateId,
  });

  String fundBseCode;
  DateTime startDate;
  String frequency;
  int amount;
  int noOfInstallments;
  int fundId;
  String sipDate;
  String selectedFolio;
  String mandateId;

  factory FundDatum.fromJson(Map<String, dynamic> json) => FundDatum(
        fundBseCode: json["fundBSECode"],
        startDate: DateTime.parse(json["startDate"]),
        frequency: json["frequency"],
        amount: json["amount"],
        noOfInstallments: json["noOfInstallments"],
        fundId: json["fundId"],
        sipDate: json["sipDate"],
        selectedFolio: json["selectedFolio"],
        mandateId: json["mandateId"],
      );

  Map<String, dynamic> toJson() => {
        "fundBSECode": fundBseCode,
        "startDate":
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "frequency": frequency,
        "amount": amount,
        "noOfInstallments": noOfInstallments,
        "fundId": fundId,
        "sipDate": sipDate,
        "selectedFolio": selectedFolio,
        "mandateId": mandateId,
      };
}
