import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:moneyphi/Http/Interceptors.dart';
import 'package:moneyphi/Model/LoginModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends ChangeNotifier {
  bool isLoading = false;
  LoginModel? loginModel;
  Future<LoginModel?> loginApi(
      {String? email, String? pass, BuildContext? context}) async {
    isLoading = true;
    notifyListeners();
    Map<String, dynamic> data = {"userEmail": email, "password": pass};
    print("resahhjjh");
    Response res = await HttpService().postRequest(
        endPoint: "/ins/authenticate/",
        data: json.encode(data),
        context: context);
    print("res.statusCode");
    print(res.statusCode);
    // print("===============>${json.decode(res.data)['isInvestorExist']}");
    isLoading = false;
    notifyListeners();

    print("res.data");
    print(res.statusCode);

    loginModel = LoginModel.fromJson(res.data);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    prefs.setString("refreshToken", loginModel!.refreshToken);

    prefs.setString('token', loginModel!.token);
    prefs.setString("email", loginModel!.investor.userName);
    prefs.setString("phone", loginModel!.investor.phoneNumber.toString());
    prefs.setString("insId", loginModel!.investor.insId.toString());
    prefs.setString("phoneCode", loginModel!.investor.phoneCode.toString());

    return loginModel;
  }
}
