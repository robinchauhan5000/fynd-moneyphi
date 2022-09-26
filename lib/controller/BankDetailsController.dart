import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../Http/Interceptors.dart';
import '../Model/KycFormModel/BankDetailsModel.dart';

class KYCController extends ChangeNotifier {
  bool isLoading = false;
  TextEditingController? ifscCodeController = TextEditingController();
  TextEditingController? bankNameController = TextEditingController();
  TextEditingController? branchNameController = TextEditingController();
  TextEditingController? accountNumberController = TextEditingController();
  TextEditingController? reaccountNumberController = TextEditingController();
  BankResponseModel? bankResponseModel;
  Future<dynamic?> getIfscCode(context, text) async {
    Response res = await HttpService()
        .getRequest(endPoint: "/ins/bsecodes/ifsc/$text", context: context);
    log(res.data.toString());
    bankResponseModel = BankResponseModel.fromJson((res.data));

    if (bankResponseModel?.micr != null) {
      branchNameController =
          TextEditingController(text: bankResponseModel?.branch);
      bankNameController = TextEditingController(text: bankResponseModel?.bank);

      print(branchNameController?.text);
      notifyListeners();
    }
    notifyListeners();
  }

  dispose() {
    ifscCodeController!.dispose();
    reaccountNumberController!.dispose();
    bankNameController!.dispose();
    branchNameController!.dispose();
    accountNumberController!.dispose();
  }

  Future<Response> sendBankDetails(context) async {
    isLoading = true;
    notifyListeners();
    var data = {
      "accType1": "SB",
      "ifscCode1": ifscCodeController?.text,
      "accNo1": accountNumberController?.text,
      "bankName1": bankNameController?.text,
      "defaultbank1": true
    };
    print(data);
    isLoading = false;
    notifyListeners();
    Response res = await HttpService().postRequest(
        endPoint: "/ins/mftrans/part2-4",
        context: context,
        data: json.encode(data));
    print(res);
    return res;
  }
}
