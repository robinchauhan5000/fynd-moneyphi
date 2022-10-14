import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:moneyphi/Http/Interceptors.dart';
import 'package:moneyphi/Model/PortfolioTransaction.dart';

import '../Model/PortfolioModal.dart';

class PortfolioController extends ChangeNotifier {
  bool isLoading = false;
  PortfolioModal? portfolioModal;
  PortfolioTransactionModel? portfolioTransactionModel;

  Future<PortfolioModal?> getPortfolioDetails(context) async {
    isLoading = true;

    Response response = await HttpService().getRequest(
        endPoint: "/ins/reports/v2/tranactions_summary", context: context);

    print("jsonDecode(response.body${response.data}");
    // print(jsonDecode(response.data));

    portfolioModal = PortfolioModal.fromJson(response.data);
    isLoading = false;
    notifyListeners();
    return portfolioModal;
  }

  Future<PortfolioTransactionModel?> getPorfolioTransaction(
      context, int fundId) async {
    isLoading = true;

    Response response = await HttpService().getRequest(
        endPoint: "/ins/reports/alltransactions/${fundId}", context: context);

    print("jsonDecode(response.body${response.data}");
    // print(jsonDecode(response.data));

    portfolioTransactionModel =
        PortfolioTransactionModel.fromJson(response.data);
    isLoading = false;
    notifyListeners();
    return portfolioTransactionModel;
  }
}
