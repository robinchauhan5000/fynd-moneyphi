// To parse this JSON data, do
//
//     final bankResponseModel = bankResponseModelFromJson(jsonString);

import 'dart:convert';

BankResponseModel bankResponseModelFromJson(String str) =>
    BankResponseModel.fromJson(json.decode(str));

String bankResponseModelToJson(BankResponseModel data) =>
    json.encode(data.toJson());

class BankResponseModel {
  BankResponseModel({
    required this.micr,
    required this.contact,
    required this.address,
    required this.neft,
    required this.swift,
    required this.iso3166,
    required this.branch,
    required this.centre,
    required this.district,
    required this.upi,
    required this.city,
    required this.imps,
    required this.state,
    required this.rtgs,
    required this.bank,
    required this.bankcode,
    required this.ifsc,
  });

  String micr;
  String contact;
  String address;
  bool neft;
  String swift;
  String iso3166;
  String branch;
  String centre;
  String district;
  bool upi;
  String city;
  bool imps;
  String state;
  bool rtgs;
  String bank;
  String bankcode;
  String ifsc;

  factory BankResponseModel.fromJson(Map<String, dynamic> json) =>
      BankResponseModel(
        micr: json["MICR"] == null ? null : json["MICR"],
        contact: json["CONTACT"] == null ? null : json["CONTACT"],
        address: json["ADDRESS"] == null ? null : json["ADDRESS"],
        neft: json["NEFT"] == null ? null : json["NEFT"],
        swift: json["SWIFT"] == null ? null : json["SWIFT"],
        iso3166: json["ISO3166"] == null ? null : json["ISO3166"],
        branch: json["BRANCH"] == null ? null : json["BRANCH"],
        centre: json["CENTRE"] == null ? null : json["CENTRE"],
        district: json["DISTRICT"] == null ? null : json["DISTRICT"],
        upi: json["UPI"] == null ? null : json["UPI"],
        city: json["CITY"] == null ? null : json["CITY"],
        imps: json["IMPS"] == null ? null : json["IMPS"],
        state: json["STATE"] == null ? null : json["STATE"],
        rtgs: json["RTGS"] == null ? null : json["RTGS"],
        bank: json["BANK"] == null ? null : json["BANK"],
        bankcode: json["BANKCODE"] == null ? null : json["BANKCODE"],
        ifsc: json["IFSC"] == null ? null : json["IFSC"],
      );

  Map<String, dynamic> toJson() => {
        "MICR": micr == null ? null : micr,
        "CONTACT": contact == null ? null : contact,
        "ADDRESS": address == null ? null : address,
        "NEFT": neft == null ? null : neft,
        "SWIFT": swift == null ? null : swift,
        "ISO3166": iso3166 == null ? null : iso3166,
        "BRANCH": branch == null ? null : branch,
        "CENTRE": centre == null ? null : centre,
        "DISTRICT": district == null ? null : district,
        "UPI": upi == null ? null : upi,
        "CITY": city == null ? null : city,
        "IMPS": imps == null ? null : imps,
        "STATE": state == null ? null : state,
        "RTGS": rtgs == null ? null : rtgs,
        "BANK": bank == null ? null : bank,
        "BANKCODE": bankcode == null ? null : bankcode,
        "IFSC": ifsc == null ? null : ifsc,
      };
}
