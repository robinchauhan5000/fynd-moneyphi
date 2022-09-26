import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moneyphi/Http/Interceptors.dart';
import 'package:moneyphi/controller/dashBoardController.dart';
import 'package:moneyphi/utils/AppSnackBar.dart';

import '../Model/GetCartListModel.dart';
import '../Model/MutualFundCategoryModel.dart';
import '../Model/MutualFundModel.dart';
import '../Model/categoryModel.dart';

class MutualFundsController extends ChangeNotifier {
  bool isLoading = false;
  MutualFundModel? mutualFundModel;
  var sipDateAdded = [];
  MutualFundCategoryModel? mutualFundCategoryModel;
  CategoryModel? categoryModel;
  GetCartListModel? getCartListModel;
  List filterModel = [];
  String? subcats;
  DashBoardController dashBoardController = DashBoardController();
  String? cats;
  bool wishlist = false;
  int wishlistindex = 98008808;
  Future<Response> getsearchfunds(context, cat, subcat, {text}) async {
    isLoading = true;
    subcats = subcat;
    print("subcat");
    print(subcat);
    print("cat");
    print(cat);
    cats = cat;
    notifyListeners();

    Response response = await HttpService().getRequest(
        endPoint:
            "/ins/mffund/searchfunds?fundname=${text ?? ""}&investmentType=Growth&cat=${Uri.encodeComponent(cat ?? "")}&subcat=${Uri.encodeComponent(subcat ?? "")}",
        context: context);

    print("response direct");
    print(response.data);

    mutualFundModel = MutualFundModel.fromJson(response.data);

    if (response.statusCode == 200) {
      isLoading = false;

      notifyListeners();
    }
    return response;
  }

  Future<MutualFundCategoryModel> getCatFunds(context) async {
    isLoading = true;
    notifyListeners();
    Response response = await HttpService()
        .getRequest(endPoint: "/ins/mffund/fundcatfilters", context: context);
    isLoading = false;
    notifyListeners();
    mutualFundCategoryModel = MutualFundCategoryModel.fromJson(response.data);
    print(response.data);
    notifyListeners();
    if (response.statusCode == 200) {
      // Navigator.push(context,
      //     MaterialPageRoute(builder: (context) => FundsPhiScreen()));
    }
    return mutualFundCategoryModel!;
  }

  addToWatchList(context, fundId, index) async {
    var data = {"fundId": fundId};
    try {
      Response response = await HttpService().postRequest(
          endPoint: "/ins/mffund/watchlist", data: data, context: context);
      if (response.statusCode == 200 || response.statusCode == 201) {
        appSnackBar(
            content: response.data['operation'].toString().toUpperCase(),
            context: context);
        if (response.data['operation'].toString() == "added") {
          print("knasfdklmlvmap");
          mutualFundModel!.funds.elementAt(index).watchListId = fundId;
          print(
              "knasfdklmlvmap${mutualFundModel!.funds.elementAt(index).watchListId}");
          notifyListeners();
        } else {
          mutualFundModel!.funds.elementAt(index).watchListId = null;
          print(
              "knasfdklmsdsalvmap${mutualFundModel!.funds.elementAt(index).watchListId}");
          notifyListeners();
        }
      }
    } catch (e) {
      print("knasfdklmlvmapzxjbcalsd$e");
    }
  }

  Future<bool> addToCart(
      {context, fundId, investmentType, amount, totalInstallments}) async {
    var data = {
      "fundIds": [fundId],
      "investmentType": investmentType == "" || investmentType == null
          ? "lumpsum"
          : investmentType,
      "amount": amount,
      "totalInstallments": totalInstallments
    };
    isLoading = true;
    notifyListeners();
    try {
      Response response = await HttpService().postRequest(
          endPoint: "/ins/goal/v2/saveuserinput/12",
          data: data,
          context: context);
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data['success'] == true) {
          // appSnackBar(content: "Funds are added", context: context);
          dashBoardController.cartCount += 1;
          isLoading = false;
          notifyListeners();
          return true;
        } else {
          appSnackBar(content: response.data['message'], context: context);
          isLoading = false;
          notifyListeners();
          return false;
        }
      } else {
        isLoading = false;
        notifyListeners();
        appSnackBar(
            content: response.data['message'].toString().toUpperCase(),
            context: context);
        return false;
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> removeAddedToCart(
      {context, fundId, usergoalinputId, goalId, index}) async {
    var data = {
      "usergoalinputId": usergoalinputId,
      "fundId": 0,
      "amount": 0,
      "operation": "deleteGoal",
      "goalId": 12
    };
    isLoading = true;
    notifyListeners();

    Response response = await HttpService().postRequest(
        endPoint: "/ins/cart/updateCart", data: data, context: context);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print('getcalled');
      isLoading = false;
      notifyListeners();
      getCartList(context);

      return true;
    } else {
      isLoading = false;
      notifyListeners();
      appSnackBar(
          content: response.data['message'].toString().toUpperCase(),
          context: context);

      return false;
    }

    // catch (e) {
    //   print('getcalled' + e.toString());
    //   isLoading = false;
    //   notifyListeners();
    //   return false;
    // }
  }

  void makeFavourite(int index, bool val) {
    wishlistindex = index;
    wishlist = val;
    notifyListeners();
  }

  Future<CategoryModel> getCategories(context) async {
    isLoading = true;
    notifyListeners();
    Response response = await HttpService().getRequest(
        endPoint: "/ins/mffund/v2/fundcatfilters", context: context);
    print("jndjnkp");
    categoryModel = CategoryModel.fromJson(response.data);
    isLoading = false;
    notifyListeners();
    return categoryModel!;
  }

  Future<bool> getCartList(context) async {
    isLoading = true;
    notifyListeners();
    Response response = await HttpService()
        .getRequest(endPoint: "/ins/cart/getCartData", context: context);
    print("sddssd");
    print(response.statusCode);

    if (response.statusCode == 200) {
      print("jndjnkp");
      if (response.data['emptyCart'] == true) {
        print("assasas");
        getCartListModel = GetCartListModel();
        isLoading = false;
        notifyListeners();
        appSnackBar(
            content: response.data['message'].toString().toUpperCase(),
            context: context);
        return true;
      } else {
        getCartListModel = GetCartListModel.fromJson(response.data);
        isLoading = false;
        notifyListeners();
      }

      return true;
    }
    return false;
  }
}
