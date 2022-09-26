import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:moneyphi/Http/Interceptors.dart';
import 'package:moneyphi/Model/SIgnUpModel.dart';
import 'package:moneyphi/screens/signUp/OtpScreen.dart';
import 'package:moneyphi/utils/AppSnackBar.dart';
import 'package:moneyphi/utils/SharedPref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpController extends ChangeNotifier {
  bool isLoading = false;
  SignupApiModel? signupApiModel;
  Future<SignupApiModel?> signUpApi(
      {String? email,
      String? pass,
      String? name,
      String? phone,
      BuildContext? context}) async {
    isLoading = true;
    notifyListeners();
    Map<String, dynamic> data = {
      "email": email,
      "phoneCode": "91",
      "phoneNumber": phone!,
      "password": pass
    };

    Response res = await HttpService()
        .postRequest(endPoint: "/ins/register/", data: (data), context: context)
        .whenComplete(() {
      isLoading = false;
      notifyListeners();
    });
    // print("===============>${json.decode(res.data)['isInvestorExist']}");
    isLoading = false;
    notifyListeners();
    print(jsonEncode(res.data['isInvestorExist']));
    if (json.decode(jsonEncode(res.data['isInvestorExist'])) == true) {
      appSnackBar(
          content: "This Account is Already Registered", context: context);
      isLoading = false;
    } else {
      signupApiModel = SignupApiModel.fromJson(res.data);

      if (signupApiModel?.isInvestorExist != true) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.clear();
        SharedPref().setString(key: "token", value: signupApiModel!.token);
        SharedPref().setString(
            key: "refreshToken", value: signupApiModel!.refreshToken);
        SharedPref()
            .setString(key: "email", value: signupApiModel!.investor.email);
        SharedPref().setString(
            key: "phone", value: signupApiModel!.investor.phoneNumber);
        SharedPref().setString(
            key: "insId", value: signupApiModel!.investor.insId.toString());
        SharedPref().setString(
            key: "phoneCode", value: signupApiModel!.investor.phoneCode);

        print(prefs.getString("token"));
        print(prefs.getString("email"));
        print(prefs.getString("phoneCode"));
        print(prefs.getString("phone"));
        Navigator.push(
            context!, MaterialPageRoute(builder: (context) => OtpScreen()));
        return signupApiModel;
      } else {
        isLoading = false;
        appSnackBar(
            content: "This Account is Already Registered", context: context);
      }
    }
  }

  loadingof(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
