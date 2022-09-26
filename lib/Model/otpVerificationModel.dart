import 'dart:convert';

import 'package:meta/meta.dart';

OtpVarificationModel otpVarificationModelFromJson(String str) =>
    OtpVarificationModel.fromJson(json.decode(str));

class OtpVarificationModel {
  OtpVarificationModel({
    @required this.success,
    @required this.message,
    @required this.errorMessage,
  });

  bool? success;
  String? message;
  String? errorMessage;

  factory OtpVarificationModel.fromJson(Map<String, dynamic> json) =>
      OtpVarificationModel(
        success: json["success"],
        message: json["message"],
        errorMessage: json["errorMessage"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "errorMessage": errorMessage,
      };
}
