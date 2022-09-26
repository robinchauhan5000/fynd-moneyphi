// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.token,
    required this.refreshToken,
    required this.investor,
  });

  String token;
  String refreshToken;
  Investor investor;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    token: json["token"],
    refreshToken: json["refreshToken"],
    investor: Investor.fromJson(json["investor"]),
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "refreshToken": refreshToken,
    "investor": investor.toJson(),
  };
}

class Investor {
  Investor({
    required this.userRole,
    required this.insId,
    required this.name,
    required this.userName,
    required this.phoneCode,
    required this.phoneNumber,
    required this.status,
    required this.phoneVerified,
    required this.emailVerified,
    required this.kycStatus,
    required this.isKycDone,
    required this.isFactaDone,
  });

  String userRole;
  int insId;
  String name;
  String userName;
  int phoneCode;
  int phoneNumber;
  String status;
  bool phoneVerified;
  bool emailVerified;
  String kycStatus;
  int isKycDone;
  int isFactaDone;

  factory Investor.fromJson(Map<String, dynamic> json) => Investor(
    userRole: json["userRole"],
    insId: json["insId"],
    name: json["name"],
    userName: json["userName"],
    phoneCode: json["phoneCode"],
    phoneNumber: json["phoneNumber"],
    status: json["status"],
    phoneVerified: json["phoneVerified"],
    emailVerified: json["emailVerified"],
    kycStatus: json["kycStatus"],
    isKycDone: json["isKycDone"],
    isFactaDone: json["isFactaDone"],
  );

  Map<String, dynamic> toJson() => {
    "userRole": userRole,
    "insId": insId,
    "name": name,
    "userName": userName,
    "phoneCode": phoneCode,
    "phoneNumber": phoneNumber,
    "status": status,
    "phoneVerified": phoneVerified,
    "emailVerified": emailVerified,
    "kycStatus": kycStatus,
    "isKycDone": isKycDone,
    "isFactaDone": isFactaDone,
  };
}
