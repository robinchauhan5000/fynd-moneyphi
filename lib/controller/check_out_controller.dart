import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:moneyphi/utils/AppSnackBar.dart';

import '../Http/Interceptors.dart';
import '../Model/BankDetailsModel.dart';

class GetBankDetailsController extends ChangeNotifier {
  GetBankDetailsModel? getBankDetailsModel;
  bool isLoading = false;
  bool isOfflineMandateLoading = false;

  bool statusOfCheckBox = false;

  Future<GetBankDetailsModel> getBankDetails(context) async {
    isLoading = true;
    notifyListeners();
    Response response = await HttpService()
        .getRequest(endPoint: "/ins/sip/getallbank", context: context);
    isLoading = false;
    notifyListeners();
    getBankDetailsModel = GetBankDetailsModel.fromJson(response.data);
    print("for mandate id ");
    print(response.data);

    return getBankDetailsModel!;
  }

  Future<bool> onlinecreateMandate(
    context,
    amount,
  ) async {
    isLoading = true;
    notifyListeners();

    var date = DateTime.now();
    var newDate = DateTime(date.year + 5, date.month, date.day);

    print("start date");
    print(DateFormat('dd/MM/yyyy')
        .format(DateTime.now())
        .toString()
        .replaceAll("/", "-"));
    print("end date");
    print(DateFormat('dd/MM/yyyy')
        .format(newDate)
        .toString()
        .replaceAll("/", "-"));
    var data = {
      "amount": amount,
      "startDate": DateFormat('dd-MM-yyyy')
          .format(DateTime.now())
          .toString()
          .replaceAll("/", "-"),
      "endDate": DateFormat('dd-MM-yyyy')
          .format(newDate)
          .toString()
          .replaceAll("/", "-"),
      "mandateType": "N",
      "generateNachForm": false
    };

    var anothe = {
      "amount": 50000,
      "startDate": "2021-07-19",
      "endDate": "2025-07-19",
      "mandateType": "N",
      "generateNachForm": false
    };
    try {
      Response response = await HttpService().postRequest(
          endPoint: "/ins/sip/createmandate",
          context: context,
          data: jsonEncode(anothe));
      if (response.statusCode == 200 || response.statusCode == 201) {
        statusOfCheckBox = true;
        isLoading = false;
        notifyListeners();
        getBankDetailsModel = GetBankDetailsModel.fromJson(response.data);
        print(response.data);
        return true;
      } else {
        statusOfCheckBox = false;
        isLoading = false;
        notifyListeners();
        appSnackBar(content: response.data["message"], context: context);
        return false;
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();

      print(e);
      return false;
    }
  }

  Future<bool> offlineCreateMandate(
    context,
    amount,
  ) async {
    isOfflineMandateLoading = true;
    notifyListeners();
    var date = DateTime.now();
    var newDate = DateTime(date.year + 5, date.month, date.day);
    var data = {
      "amount": amount,
      "startDate": DateFormat('dd-MM-yyyy')
          .format(DateTime.now())
          .toString()
          .replaceAll("/", "-"),
      "endDate": DateFormat('dd-MM-yyyy')
          .format(newDate)
          .toString()
          .replaceAll("/", "-"),
      "mandateType": "X",
      "generateNachForm": true
    };
    try {
      Response response = await HttpService().postRequest(
          endPoint: "/ins/sip/createmandate",
          context: context,
          data: jsonEncode(data));
      if (response.statusCode == 200 || response.statusCode == 201) {
        statusOfCheckBox = true;
        isOfflineMandateLoading = false;
        notifyListeners();
        getBankDetailsModel = GetBankDetailsModel.fromJson(response.data);
        print(response.data);
        return true;
      } else {
        statusOfCheckBox = false;
        isOfflineMandateLoading = false;
        notifyListeners();
        appSnackBar(content: response.data["message"], context: context);
        return false;
      }
    } catch (e) {
      isOfflineMandateLoading = false;
      notifyListeners();

      print(e);
      return false;
    }
  }

  Future<bool> getMandate(context) async {
    isLoading = true;
    notifyListeners();
    Response response = await HttpService()
        .getRequest(endPoint: "/ins/sip/getallmandate", context: context);
    isLoading = false;
    notifyListeners();
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
