import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:moneyphi/Model/OrderStatusModel.dart';
import 'package:moneyphi/Model/RegisterSipModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Http/Interceptors.dart';
import '../utils/AppSnackBar.dart';

class PaymentController extends ChangeNotifier {
  bool isLoading = false;
  List<RegisterSipModel>? paymentModel = [];

  Future<Response> registerSIP(
      {context, String? mandateID, String? methodOfPay, String? upiID}) async {
    isLoading = true;
    notifyListeners();

    Response response = await HttpService().postRequest(
        endPoint: "/ins/sip/executeOrdersFromCart",
        data: json.encode({
          "mandateId": "755462",
          "paymentMethod": "netBanking",
          "deviceType": "webApp",
        }),
        context: context);

    print(jsonEncode({
      "mandateId": "755462",
      "paymentMethod": methodOfPay,
      "deviceType": "webApp",
    }));

    if (response.statusCode == 200 || response.statusCode == 201) {
      if (response.data['success'] == true) {
        appSnackBar(content: "Funds are added", context: context);
        isLoading = false;
        notifyListeners();

        return response;
      } else {
        appSnackBar(content: response.data['message'], context: context);
        isLoading = false;
        notifyListeners();
        return response;
      }
    }
    return response;
  }

  Future<void> dummy(
      {context, String? mandateID, String? methodOfPay, String? upiID}) async {
    isLoading = true;
    notifyListeners();

    SharedPreferences sharedPreferencess =
        await SharedPreferences.getInstance();
    String token = sharedPreferencess.getString('token')!;
    var headers = {'x-access-token': token, 'Content-Type': 'application/json'};
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://stag.app.moneyphi.com/api/ins/sip/executeOrdersFromCart'));
    request.body =
        '''{\r\n    "mandateId": 755462,\r\n    "paymentMethod": "netBanking",\r\n    "deviceType": "webApp"\r\n}\r\n ''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<bool> registerSIPDates(
      {context, int? inputId, int? selectedDate}) async {
    isLoading = true;
    notifyListeners();
    try {
      Response response = await HttpService().postRequest(
          endPoint: "/ins/cart/updateCart/order/$inputId",
          data: jsonEncode({"sipDate": selectedDate, "folioNumber": null}),
          context: context);

      if (response.statusCode == 200) {
        // appSnackBar(content: "Dates are Added", context: context);
        return true;
      } else {
        // appSnackBar(content: "Something went wrong", context: context);
        return true;
      }
      return false;
    } catch (e) {
      print("e");
      print(e);
      isLoading = false;
      notifyListeners();
      return false;
    }
  }

  OrderStatusModel? orderStatusModel;
  getOrderList(context) async {
    isLoading = true;
    notifyListeners();
    try {
      Response response = await HttpService().getRequest(
          endPoint: '/ins/mftrans/pending_order_status', context: context);
      if (response.statusCode == 200) {
        orderStatusModel = OrderStatusModel.fromJson(response.data);
      }
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      notifyListeners();
    }
  }
}
