import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:moneyphi/Http/Interceptors.dart';
import 'package:moneyphi/Model/LoginModel.dart';
import 'package:moneyphi/screens/NavigatonBar/BottomNavigation.dart';
import 'package:moneyphi/screens/sign_in/mobile_otp_number.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/AppSnackBar.dart';

class LoginController extends ChangeNotifier {
  bool isLoading = false;
  LoginModel? loginModel;
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController otp = TextEditingController();

  Future<LoginModel?> loginApi(
      {String? email, String? pass, BuildContext? context}) async {
    isLoading = true;
    notifyListeners();
    Map<String, dynamic> data = {"userEmail": email, "password": pass};
    print("resahhjjh");
    try {
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

      if (res.statusCode == 200) {
        loginModel = LoginModel.fromJson(res.data);

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.clear();
        prefs.setString("refreshToken", loginModel!.refreshToken);

        prefs.setString('token', loginModel!.token);
        prefs.setString("email", loginModel!.investor.userName);
        prefs.setString("phone", loginModel!.investor.phoneNumber.toString());
        prefs.setString("insId", loginModel!.investor.insId.toString());
        prefs.setString("phoneCode", loginModel!.investor.phoneCode.toString());

        Navigator.push(context!,
            MaterialPageRoute(builder: (context) => BottomNavBarV2()));
      }
      return loginModel;
    } catch (e) {}
    return null;
  }

  Future<int?> verifyOtp(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    Map<String, dynamic> data = {
      // "email": email.text,
      "phoneCode": "91",
      "phoneNumber": phoneNumber.text,
      "otp": otp.text,
    };

    print("phoneNumber.text");
    print(phoneNumber.text);

    Response res = await HttpService().postRequest(
        endPoint: "/ins/authenticate/mobile/verify",
        data: (data),
        context: context);

    isLoading = false;
    notifyListeners();

    print("res.statusCode");
    print(res.statusCode);
    if (res.statusCode == 200) {
      loginModel = LoginModel.fromJson(res.data);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.clear();
      prefs.setString("refreshToken", loginModel!.refreshToken);

      prefs.setString('token', loginModel!.token);
      prefs.setString("email", loginModel!.investor.userName);
      prefs.setString("phone", loginModel!.investor.phoneNumber.toString());
      prefs.setString("insId", loginModel!.investor.insId.toString());
      prefs.setString("phoneCode", loginModel!.investor.phoneCode.toString());
      return 200;
    } else {
      appSnackBar(content: "${res.data['message']}", context: context);
      return 400;
    }
    return null;
  }

  Future<int?> signUpWithMobile(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    Map<String, dynamic> data = {
      // "email": email.text,
      "phoneCode": "91",
      "phoneNumber": phoneNumber.text,
      // "password": password.text
    };

    print("phoneNumber.text");
    print(phoneNumber.text);

    Response res = await HttpService().postRequest(
        endPoint: "/ins/authenticate/mobile", data: (data), context: context);
    // print("===============>${json.decode(res.data)['isInvestorExist']}");
    //  Response res = await post(Uri.parse("${BaseUrl}/ins/authenticate/mobile"));
    isLoading = false;
    notifyListeners();

    print("res.statusCode");
    print(res.statusCode);
    if (res.statusCode == 200) {
      if (res.data['isExist'] == false) {
        appSnackBar(content: "Number is not registered", context: context);
      } else if (res.data['isExist'] == true) {
        //  appSnackBar(content: "Number is not registered", context: context);

      }
      Future.delayed(Duration(milliseconds: 1500), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SignInOtpVerify()));

        return res.statusCode;
      });
    }
    return null;
  }
}
