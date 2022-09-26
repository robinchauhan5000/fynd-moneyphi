import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:moneyphi/Http/Interceptors.dart';

import '../Model/GetProfileModel.dart';
import '../Model/dashBoard_model.dart';
import '../utils/SharedPref.dart';

class DashBoardController extends ChangeNotifier {
  GetProfileModel? getProfileModel;
  GetDashboardModel? getDashboardModel;
  int cartCount = 0;
  bool? isLoading = false;

  Future<GetProfileModel?> getUserProfile(context) async {
    isLoading = true;

    Response response = await HttpService()
        .getRequest(endPoint: "/ins/user/v2/get_profile", context: context);

    getProfileModel = GetProfileModel.fromJson(response.data);
    isLoading = false;
    notifyListeners();
    return getProfileModel;
  }

  Future<GetDashboardModel?> getDashboard(context) async {
    isLoading = true;

    Response response = await HttpService()
        .getRequest(endPoint: "/ins/reports/dashboard", context: context);

    getDashboardModel = GetDashboardModel.fromJson(response.data);
    isLoading = false;
    notifyListeners();
    return getDashboardModel;
  }

  Future<dynamic> sendsignature({BuildContext? context, String? data}) async {
    isLoading = true;
    notifyListeners();
    var request = http.MultipartRequest('POST',
        Uri.parse('https://stag.app.moneyphi.com/api/ins/mftrans/uploadSign'));
    request.fields.addAll({'signImage': 'data:image/png;base64,${data}'});
    SharedPref().getString(key: "token").then((token) {
      print("token======>>$token");
      var headers = {'x-access-token': '$token'};
      request.headers.addAll(headers);
    });
    // request.headers.addAll(headers)

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<bool> getCartCount(context) async {
    try {
      Response response = await HttpService()
          .getRequest(endPoint: "/ins/cart/cartCount", context: context);

      print(cartCount);
      print(response.data['cartItems']);
      print("cartCount");

      cartCount = response.data['cartItems'];
      notifyListeners();
      return true;
    } catch (e) {
      print(e);
      print("cach");
      return false;
    }
  }
}
