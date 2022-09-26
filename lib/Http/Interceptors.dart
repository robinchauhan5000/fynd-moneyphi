import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:moneyphi/Model/ErrorModel.dart';
import 'package:moneyphi/utils/AppSnackBar.dart';

import '../screens/login/login_screen.dart';
import '../utils/SharedPref.dart';

class HttpService {
  Dio? _dio;

  HttpService() {
    _dio = Dio(BaseOptions(
      baseUrl: "https://stag.app.moneyphi.com/api",
      responseType: ResponseType.json,
      connectTimeout: 100000,
      receiveTimeout: 30000,
    ));
    // _dio.interceptors.clear();
    // _dio.interceptors.clear();

    initializeInterceptors();
  }

  // [GET]

  Future getRequest(
      {@required String? endPoint, @required BuildContext? context}) async {
    var response;

    try {
      response = await _dio!.get(endPoint ?? '');
      log("============>>>>>>" + response.toString());
    } on DioError catch (e) {
      response = dioErrorHandler(
          response: e.response!, context: context, dioErrorType: e.type);

      // throw Exception(e.message);
    }
    dioErrorHandler(response: response);
    return response;
  }

  // [POST]

  Future<dynamic> postRequest(
      {@required String? endPoint, dynamic data, BuildContext? context}) async {
    dynamic response;

    try {
      print("---------" + data.toString());
      response = await _dio!.post(endPoint ?? '', data: data);
      print("(response).toString()");
      print((response).toString());
    } on DioError catch (e) {
      print("(responsectchdcdvc).toString()$e");
      response = dioErrorHandler(
          response: e.response!, dioErrorType: e.type, context: context!);
      print("(responsectch).toString()$e");
      throw Exception(e.message);
    }
    dioErrorHandler(response: response, context: context!);

    return response;
  }

  // [Delete]
  //
  // Future deleteRequest({String endPoint, Map<String, dynamic> body}) async {
  //   var response;
  //
  //   try {
  //     response = await _dio.delete(endPoint ?? '', queryParameters: body ?? {});
  //   } on DioError catch (e) {
  //     response = dioErrorHandler(response: e.response, dioErrorType: e.type);
  //   }
  //   dioErrorHandler(response: response);
  //   return response;
  // }
  //
  // //upload Image
  // Future uploadImage({String endPoint, dynamic data}) async {
  //   var response;
  //
  //   try {
  //     response = await _dio.post(
  //       endPoint ?? '',
  //       // queryParameters: body ?? {},
  //       data: data,
  //     );
  //   } on DioError catch (e) {
  //     print(e.message);
  //     throw Exception(e.message);
  //   }
  //
  //   return response;
  // }

  initializeInterceptors() {
    _dio?.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      // Do something before request is sent
      SharedPref().getString(key: "token").then((token) {
        print("token======>>$token");
        options.headers["x-access-token"] = "$token";
      });
      return handler.next(options);
    }, onResponse: (response, handler) {
      // Do something with response data

      return handler.next(response); // continue
      // If you want to reject the request with a error message,
      // you can reject a `DioError` object eg: return `dio.reject(dioError)`
    }, onError: (DioError e, handler) {
      // Do something with response error

      // print("here dio error ${e.type}");

      if (e.type == DioErrorType.other) {
        print("error===>$e");
        // Get.defaultDialog(
        //     title: "Opps!",
        //     middleText: "Internet is not Connected",
        //     onCancel: () {},
        //     onConfirm: () {
        //       Get.back();
        //     });
      }

      return handler.next(e); //continue
      // If you want to resolve the request with some custom data，
      // you can resolve a `Response` object eg: return `dio.resolve(response)`.
    }));
  }
}

// [Response Error]

Response? dioErrorHandler(
    {Response? response, DioErrorType? dioErrorType, BuildContext? context}) {
  ErrorModel? errorModal;
  try {
    errorModal = ErrorModel.fromJson(response?.data);
  } catch (e) {
    print(e);
  }

  if (response?.statusCode == 200) {
    // logPrint(
    //     color: logColor.Green,
    //     text: "Successfully GET - 200 ${response?.data} ");

    return response;
  } else if (response?.statusCode == 201) {
    // logPrint(
    //     color: logColor.Green,
    //     text: "Successfully POST - 201 ${response?.data}");

    return response;
  } else if (response?.statusCode == 400) {
    // logPrint(
    //     color: logColor.Yellow, text: "Bad Reqest - 400 ${response?.data}");

    appSnackBar(
        duration: Duration(seconds: 5),
        background: Colors.red,
        context: context,
        content: "${errorModal?.errorMessage}");
    return response;
  } else if (response?.statusCode == 404) {
    appSnackBar(
        duration: Duration(seconds: 5),
        background: Colors.red,
        context: context,
        content: "${errorModal?.errorMessage}");
    return response;
  } else if (response?.statusCode == 422) {
    // logPrint(
    //     color: logColor.Red,
    //     text: "Unprocessable Entity - 422 ${response?.data}");
    appSnackBar(
        duration: Duration(seconds: 5),
        context: context,

        // background: Colors.red,
        content: "${errorModal?.errorMessage}");
    return response;
  } else if (response?.statusCode == 500) {
    // logPrint(
    //     color: logColor.Yellow, text: "Server Error - 500 ${response?.data}");
    appSnackBar(
        duration: Duration(seconds: 5),
        context: context,
        background: Colors.red,
        content: "${errorModal?.errorMessage}");
    return response;
  } else if (response?.statusCode == 401) {
    print(response!.statusMessage);
    appSnackBar(
        duration: Duration(seconds: 5),
        context: context,
        background: Colors.red,
        content: "${response.statusMessage}");
    Navigator.push(
        context!, MaterialPageRoute(builder: (context) => LoginScreen()));

    return response;
  } else if (response?.statusCode == 504) {
    print(response!.statusMessage);
    appSnackBar(
        duration: Duration(seconds: 5),
        context: context,
        background: Colors.red,
        content: "${response.statusMessage}");
    return response;
  } else if (response?.statusCode == 412) {
    print(response!.statusMessage);
    appSnackBar(
        duration: Duration(seconds: 5),
        context: context,
        background: Colors.red,
        content: "${response.data['message']}");
    return response;
  } else if (response?.statusCode == 403) {
    log("Forbidden - 403 ${response?.data}");
    appSnackBar(
        duration: Duration(seconds: 5),
        context: context,
        background: Colors.red,
        content: "${errorModal?.errorMessage}");

    return response;
  } else if (dioErrorType == DioErrorType.connectTimeout) {
    // logPrint(
    //     color: logColor.Yellow, text: "ConnectTimeout - $response?.data}");
    // [ Here impliment internet Slow widget ]
    appSnackBar(
        background: Colors.red, context: context, content: "Internet slow");

    return response;
  } else if (dioErrorType == DioErrorType.receiveTimeout) {
    // logPrint(
    //     color: logColor.Yellow, text: "ReceiveTimeout - ${response?.data}");
    appSnackBar(
        background: Colors.red, context: context, content: "Internet slow");
    // [ Here impliment internet Slow widget ]

    return response;
  } else if (dioErrorType == DioErrorType.sendTimeout) {
    // logPrint(color: logColor.Yellow, text: "SentTimeout - ${response?.data}");

    // [ Here impliment internet Slow widget ]
    appSnackBar(
        background: Colors.red, context: context, content: "Internet slow");

    return response;
  } else if (dioErrorType == DioErrorType.other) {
    // logPrint(
    //     color: logColor.Yellow, text: "Other Internet - ${response?.data}");
    appSnackBar(
        background: Colors.red, context: context, content: "No Internet");

    return response;
  } else {
    appSnackBar(
        background: Colors.red,
        context: context,
        content: "${response!.statusMessage.toString()}");
  }
  return response;
}
