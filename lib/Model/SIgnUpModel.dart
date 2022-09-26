// To parse this JSON data, do
//
//     final signupApiModel = signupApiModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:flutter/cupertino.dart';

import 'package:flutter/cupertino.dart';

SignupApiModel signupApiModelFromJson(String str) => SignupApiModel.fromJson(json.decode(str));

String signupApiModelToJson(SignupApiModel data) => json.encode(data.toJson());

class SignupApiModel {
  SignupApiModel({
    required this.token,
    required this.refreshToken,
    required this.investor,
     required this.isInvestorExist
  }


  );

  String token;
  String refreshToken;
  Investor investor;
  bool isInvestorExist=false;

  factory SignupApiModel.fromJson(Map<String, dynamic> json) => SignupApiModel(
    token: json["token"],
    refreshToken: json["refreshToken"],
    isInvestorExist: json["isInvestorExist"]==null?false:json["isInvestorExist"],
    investor: Investor.fromJson(json["investor"]),
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "refreshToken": refreshToken,
    "isInvestorExist": isInvestorExist==null?false:true,
    "investor": investor.toJson(),
  };
}

class Investor {
  Investor({
    required this.insId,
    required this.name,
    required this.email,
    required this.phoneCode,
    required this.phoneNumber,
    required this.msg,
  });

  int insId;
  String name;
  String email;
  String phoneCode;
  String phoneNumber;
  String msg;

  factory Investor.fromJson(Map<String, dynamic> json) => Investor(
    insId: json["insId"],
    name: json["name"],
    email: json["email"],
    phoneCode: json["phoneCode"],
    phoneNumber: json["phoneNumber"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "insId": insId,
    "name": name,
    "email": email,
    "phoneCode": phoneCode,
    "phoneNumber": phoneNumber,
    "msg": msg,
  };
}
