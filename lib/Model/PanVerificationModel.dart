import 'dart:convert';

import 'package:meta/meta.dart';

PanVerificationModel panVerificationModelFromJson(String str) =>
    PanVerificationModel.fromJson(json.decode(str));

String panVerificationModelToJson(PanVerificationModel data) =>
    json.encode(data.toJson());

class PanVerificationModel {
  PanVerificationModel({
    @required this.success,
    @required this.kycDone,
    @required this.appName,
  });

  bool? success;
  bool? kycDone;
  String? appName;

  factory PanVerificationModel.fromJson(Map<String, dynamic> json) =>
      PanVerificationModel(
        success: json["success"],
        kycDone: json["kycDone"],
        appName: json["appName"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "kycDone": kycDone,
        "appName": appName,
      };
}
