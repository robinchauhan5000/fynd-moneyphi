import 'dart:convert';

GetBankDetailsModel getBankDetailsModelFromJson(String str) =>
    GetBankDetailsModel.fromJson(json.decode(str));

String getBankDetailsModelToJson(GetBankDetailsModel data) =>
    json.encode(data.toJson());

class GetBankDetailsModel {
  GetBankDetailsModel({
    required this.success,
    required this.totalBanks,
    required this.banksData,
    required this.mandatesData,
  });

  bool success;
  int totalBanks;
  List<BanksDatum> banksData;
  List<MandatesDatum> mandatesData;

  factory GetBankDetailsModel.fromJson(Map<String, dynamic> json) =>
      GetBankDetailsModel(
        success: json["success"],
        totalBanks: json["totalBanks"],
        banksData: List<BanksDatum>.from(
            json["banksData"].map((x) => BanksDatum.fromJson(x))),
        mandatesData: List<MandatesDatum>.from(
            json["mandatesData"].map((x) => MandatesDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "totalBanks": totalBanks,
        "banksData": List<dynamic>.from(banksData.map((x) => x.toJson())),
        "mandatesData": List<dynamic>.from(mandatesData.map((x) => x.toJson())),
      };
}

class BanksDatum {
  BanksDatum({
    required this.accType,
    required this.accNumber,
    required this.bankName,
    required this.micrNo,
    required this.ifscCode,
    required this.defaultbank,
    required this.netBanking,
    required this.upi,
    required this.mandateData,
  });

  String accType;
  String accNumber;
  String bankName;
  String micrNo;
  String ifscCode;
  String defaultbank;
  bool netBanking;
  bool upi;
  List<dynamic> mandateData;

  factory BanksDatum.fromJson(Map<String, dynamic> json) => BanksDatum(
        accType: json["accType"],
        accNumber: json["accNumber"],
        bankName: json["bankName"],
        micrNo: json["micrNo"],
        ifscCode: json["ifscCode"],
        defaultbank: json["defaultbank"],
        netBanking: json["netBanking"],
        upi: json["upi"],
        mandateData: List<dynamic>.from(json["mandateData"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "accType": accType,
        "accNumber": accNumber,
        "bankName": bankName,
        "micrNo": micrNo,
        "ifscCode": ifscCode,
        "defaultbank": defaultbank,
        "netBanking": netBanking,
        "upi": upi,
        "mandateData": List<dynamic>.from(mandateData.map((x) => x)),
      };
}

class MandatesDatum {
  MandatesDatum({
    required this.bankName,
    required this.accNumber,
    required this.amount,
    required this.amountRemains,
    required this.mandateType,
    required this.bseMandateId,
    required this.endDate,
    required this.status,
    required this.netBanking,
    required this.upi,
  });

  String bankName;
  String accNumber;
  int amount;
  int amountRemains;
  String mandateType;
  String bseMandateId;
  DateTime endDate;
  String status;
  bool netBanking;
  bool upi;

  factory MandatesDatum.fromJson(Map<String, dynamic> json) => MandatesDatum(
        bankName: json["bankName"],
        accNumber: json["accNumber"],
        amount: json["amount"],
        amountRemains: json["amountRemains"],
        mandateType: json["mandateType"],
        bseMandateId: json["bseMandateId"],
        endDate: DateTime.parse(json["endDate"]),
        status: json["status"],
        netBanking: json["netBanking"],
        upi: json["upi"],
      );

  Map<String, dynamic> toJson() => {
        "bankName": bankName,
        "accNumber": accNumber,
        "amount": amount,
        "amountRemains": amountRemains,
        "mandateType": mandateType,
        "bseMandateId": bseMandateId,
        "endDate":
            "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "status": status,
        "netBanking": netBanking,
        "upi": upi,
      };
}
