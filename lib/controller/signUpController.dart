import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:moneyphi/Model/SIgnUpModel.dart';
import 'package:moneyphi/screens/NavigatonBar/BottomNavigation.dart';
import 'package:moneyphi/screens/sign_up/verify_otp_screens.dart';
import 'package:moneyphi/utils/AppSnackBar.dart';
import 'package:moneyphi/utils/SharedPref.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Http/Interceptors.dart';
import '../screens/sign_up/verify_email_otp_screens.dart';

class SignUpController extends ChangeNotifier {
  bool isLoading = false;
  SignupApiModel? signupApiModel;
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController otp = TextEditingController();

  Future<int?> verifyOtp(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    Map<String, dynamic> data = {
      // "email": email.text,
      "phoneCode": "91",
      "phoneNumber": phoneNumber.text,
      "otp": otp.text
    };

    print("phoneNumber.text");
    print(phoneNumber.text);

    Response res = await HttpService().postRequest(
        endPoint: "/ins/register/mobile/verify",
        data: (data),
        context: context);

    isLoading = false;
    notifyListeners();

    print("res.statusCode");
    print(res.statusCode);
    if (res.statusCode == 200) {
      if (res.data['verified'] == true) {
        return 200;
      } else {
        appSnackBar(content: "${res.data['message']}", context: context);
        return 400;
      }
    }
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
        endPoint: "/ins/register/mobile", data: (data), context: context);
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
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    VerifyOTPScreen(isUserExist: res.data['isExist'])));

        return res.statusCode;
      });
    }
  }

  Future<int?> registerEmail(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    Map<String, dynamic> data = {
      "email": email.text,
      "phoneCode": "91",
      "phoneNumber": phoneNumber.text,
      // "password": password.text
    };

    print("phoneNumber.text");
    print(phoneNumber.text);

    Response res = await HttpService().postRequest(
        endPoint: "/ins/register/email", data: (data), context: context);
    // print("===============>${json.decode(res.data)['isInvestorExist']}");
    //  Response res = await post(Uri.parse("${BaseUrl}/ins/authenticate/mobile"));
    isLoading = false;
    notifyListeners();

    print("res.statusCode");
    print(res.statusCode);
    if (res.statusCode == 200) {
      if (res.data['isExist'] == true) {
        appSnackBar(content: "Email is already registered", context: context);
      } else if (res.data['isExist'] == false) {
        //  appSnackBar(content: "Number is not registered", context: context);
        Future.delayed(Duration(milliseconds: 1500), () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      VerifyEmailOTPScreen(isUserExist: res.data['isExist'])));

          return res.statusCode;
        });
      }
    }
  }

  Future<int?> verifyEmailOtp(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    Map<String, dynamic> data = {
      "phoneCode": "91",
      "phoneNumber": phoneNumber.text,
      "otp": otp.text,
      "email": email.text
    };

    print("phoneNumber.text");
    print(phoneNumber.text);

    Response res = await HttpService().postRequest(
        endPoint: "/ins/register/email/verify", data: (data), context: context);

    isLoading = false;
    notifyListeners();

    print("res.statusCode");
    print(res.statusCode);
    if (res.statusCode == 200) {
      if (res.data['verified'] == true) {
        return 200;
      } else {
        appSnackBar(content: "${res.data['message']}", context: context);
        return 400;
      }
    }
  }

  Future<SignupApiModel?> addPassword(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    Map<String, dynamic> data = {
      "phoneCode": "91",
      "phoneNumber": phoneNumber.text,
      "email": email.text,
      "password": confirmPassword.text
    };

    Response res = await HttpService().postRequest(
        endPoint: "/ins/register/password", data: (data), context: context);

    isLoading = false;
    notifyListeners();

    print("res.statusCode");
    print(res.statusCode);
    if (res.statusCode == 200) {
      if (res.data['token'] != null) {
        signupApiModel = SignupApiModel.fromJson(res.data);

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.clear();
        SharedPref().setString(key: "token", value: signupApiModel!.token);
        SharedPref().setString(
            key: "refreshToken", value: signupApiModel!.refreshToken);
        SharedPref().setString(
            key: "email", value: signupApiModel?.investor?.userName ?? "");
        SharedPref().setString(
            key: "phone",
            value: signupApiModel!.investor?.phoneNumber.toString() ?? "");
        SharedPref().setString(
            key: "insId",
            value: signupApiModel!.investor?.insId.toString() ?? "");
        SharedPref().setString(
            key: "phoneCode",
            value: signupApiModel!.investor?.phoneCode.toString() ?? "");

        print(prefs.getString("token"));
        print(prefs.getString("email"));
        print(prefs.getString("phoneCode"));
        print(prefs.getString("phone"));
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => BottomNavBarV2()));
        return signupApiModel;
      } else {
        // appSnackBar(content: "${res.data['message']}", context: context);
        // return 400;
      }
    }
  }

  Future<void> loginAPi(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    Map<String, dynamic> data = {
      "email": email.text,
      "password": confirmPassword.text
    };
    try {
      Response res = await HttpService().postRequest(
          endPoint: "/ins/authenticate", data: (data), context: context);

      isLoading = false;
      notifyListeners();

      print("res.statusCode");
      print(res.statusCode);
      if (res.statusCode == 200) {
        if (res.data['token'] != null) {
          signupApiModel = SignupApiModel.fromJson(res.data);

          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.clear();
          SharedPref().setString(key: "token", value: signupApiModel!.token);
          SharedPref().setString(
              key: "refreshToken", value: signupApiModel!.refreshToken);
          SharedPref().setString(
              key: "email", value: signupApiModel?.investor?.userName ?? "");
          SharedPref().setString(
              key: "phone",
              value: signupApiModel!.investor?.phoneNumber.toString() ?? "");
          SharedPref().setString(
              key: "insId",
              value: signupApiModel!.investor?.insId.toString() ?? "");
          SharedPref().setString(
              key: "phoneCode",
              value: signupApiModel!.investor?.phoneCode.toString() ?? "");

          print(prefs.getString("token"));
          print(prefs.getString("email"));
          print(prefs.getString("phoneCode"));
          print(prefs.getString("phone"));
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => BottomNavBarV2()));
          // return signupApiModel;
        } else {
          // appSnackBar(content: "${res.data['message']}", context: context);
          // return 400;
        }
      }
    } catch (e) {}
  }
}
