// To parse this JSON data, do
//
//     final bankTransitModel = bankTransitModelFromJson(jsonString);

import 'dart:convert';

BankTransitModel bankTransitModelFromJson(String str) =>
    BankTransitModel.fromJson(json.decode(str));

String bankTransitModelToJson(BankTransitModel data) =>
    json.encode(data.toJson());

class BankTransitModel {
  BankTransitModel({
    this.success,
    this.sipWiseResp,
    this.pgLinkData,
  });

  bool? success;
  List<SipWiseResp>? sipWiseResp;
  PgLinkData? pgLinkData;

  factory BankTransitModel.fromJson(Map<String, dynamic> json) =>
      BankTransitModel(
        success: json["success"],
        sipWiseResp: List<SipWiseResp>.from(
            json["sipWiseResp"].map((x) => SipWiseResp.fromJson(x))),
        pgLinkData: PgLinkData.fromJson(json["pgLinkData"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "sipWiseResp": List<dynamic>.from(sipWiseResp!.map((x) => x.toJson())),
        "pgLinkData": pgLinkData?.toJson(),
      };
}

class PgLinkData {
  PgLinkData();

  factory PgLinkData.fromJson(Map<String, dynamic> json) => PgLinkData();

  Map<String, dynamic> toJson() => {};
}

class SipWiseResp {
  SipWiseResp({
    this.fundId,
    this.bseClientCode,
    this.amount,
    this.fsmId,
    this.folioNumber,
    this.bseSipRegId,
    this.sipDate,
    this.status,
    this.sipType,
    this.err,
  });

  int? fundId;
  String? bseClientCode;
  int? amount;
  int? fsmId;
  String? folioNumber;
  String? bseSipRegId;
  String? sipDate;
  String? status;
  String? sipType;
  String? err;

  factory SipWiseResp.fromJson(Map<String, dynamic> json) => SipWiseResp(
        fundId: json["fundId"],
        bseClientCode: json["bseClientCode"],
        amount: json["amount"],
        fsmId: json["fsmId"],
        folioNumber: json["folioNumber"],
        bseSipRegId: json["bseSipRegId"],
        sipDate: json["sipDate"],
        status: json["status"],
        sipType: json["sipType"],
        err: json["err"],
      );

  Map<String, dynamic> toJson() => {
        "fundId": fundId,
        "bseClientCode": bseClientCode,
        "amount": amount,
        "fsmId": fsmId,
        "folioNumber": folioNumber,
        "bseSipRegId": bseSipRegId,
        "sipDate": sipDate,
        "status": status,
        "sipType": sipType,
        "err": err,
      };
}
