import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:moneyphi/Http/Interceptors.dart';

import '../Model/PortfolioModal.dart';

class PortfolioController extends ChangeNotifier {
  bool isLoading = false;
  PortfolioModal? portfolioModal;

  Future<PortfolioModal?> getDashboard(context) async {
    isLoading = true;

    Response response = await HttpService().getRequest(
        endPoint: "/ins/reports/v2/tranactions_summary", context: context);

    print("jsonDecode(response.body");
    print(jsonDecode(response.body));

    portfolioModal = PortfolioModal.fromJson(jsonDecode(response.body));
    isLoading = false;
    notifyListeners();
    return portfolioModal;
  }
}
