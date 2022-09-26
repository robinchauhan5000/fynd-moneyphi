import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:moneyphi/Http/Interceptors.dart';
import 'package:moneyphi/Model/otpVerificationModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpVarification {
  Future<dynamic> varifyOTP(
      {String? otp, String? number, String? insID}) async {
    Map<String, dynamic> data = {
      "hostMobile": number,
      "code": otp,
      "insId": insID
    };

    try {
      print("2000000000");
      Response response = await HttpService().postRequest(
          endPoint: "/ins/authenticate/v1/validateMobileCode", data: (data));

      print(response.statusCode);

      if (response.statusCode == 200) {
        print(response.statusCode);

        print('data  ${jsonDecode(response.data)}');

        return response.data;
      }
    } catch (e) {
      print(e);
    }
  }

  static resendOTP({BuildContext? context}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    String number = preferences.getString('phone')!;
    String insID = preferences.getString('insId')!;
    String email = preferences.getString('email')!;

    print(number + insID + email);

    try {
      Response response = await HttpService().getRequest(
          endPoint:
              "/ins/register/v1/resendMobileCode/${email}/${number}?insId=${insID}",
          context: context);
      if (response.statusCode == 200) {
        OtpVarificationModel model =
            otpVarificationModelFromJson(response.toString());
        return model;
      }
    } catch (e) {
      print(e);
    }
  }
}
