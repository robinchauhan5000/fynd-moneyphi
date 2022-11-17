// To parse this JSON data, do
//
//     final signupApiModel = signupApiModelFromJson(jsonString);

import 'dart:convert';

SignupApiModel signupApiModelFromJson(String str) =>
    SignupApiModel.fromJson(json.decode(str));

String signupApiModelToJson(SignupApiModel data) => json.encode(data.toJson());

class SignupApiModel {
  String? token;
  String? refreshToken;
  Investor? investor;

  SignupApiModel({this.token, this.refreshToken, this.investor});

  SignupApiModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    refreshToken = json['refreshToken'];
    investor = json['investor'] != null
        ? new Investor.fromJson(json['investor'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['refreshToken'] = this.refreshToken;
    if (this.investor != null) {
      data['investor'] = this.investor!.toJson();
    }
    return data;
  }
}

class Investor {
  String? userRole;
  int? insId;
  String? name;
  String? userName;
  int? phoneCode;
  int? phoneNumber;
  String? status;
  int? phoneVerified;
  int? emailVerified;
  String? kycStatus;
  int? isKycDone;
  int? isFactaDone;

  Investor(
      {this.userRole,
      this.insId,
      this.name,
      this.userName,
      this.phoneCode,
      this.phoneNumber,
      this.status,
      this.phoneVerified,
      this.emailVerified,
      this.kycStatus,
      this.isKycDone,
      this.isFactaDone});

  Investor.fromJson(Map<String, dynamic> json) {
    userRole = json['userRole'];
    insId = json['insId'];
    name = json['name'];
    userName = json['userName'];
    phoneCode = json['phoneCode'];
    phoneNumber = json['phoneNumber'];
    status = json['status'];
    phoneVerified = json['phoneVerified'];
    emailVerified = json['emailVerified'];
    kycStatus = json['kycStatus'];
    isKycDone = json['isKycDone'];
    isFactaDone = json['isFactaDone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userRole'] = this.userRole;
    data['insId'] = this.insId;
    data['name'] = this.name;
    data['userName'] = this.userName;
    data['phoneCode'] = this.phoneCode;
    data['phoneNumber'] = this.phoneNumber;
    data['status'] = this.status;
    data['phoneVerified'] = this.phoneVerified;
    data['emailVerified'] = this.emailVerified;
    data['kycStatus'] = this.kycStatus;
    data['isKycDone'] = this.isKycDone;
    data['isFactaDone'] = this.isFactaDone;
    return data;
  }
}
