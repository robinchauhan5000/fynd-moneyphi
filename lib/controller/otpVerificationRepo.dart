import 'package:dio/dio.dart';
import 'package:moneyphi/Http/Interceptors.dart';

import '../Constent/ServiceApis.dart';

class OtpVerificationRepo {
  Future<Map<String, dynamic>?> otpVerify(
      {String? otp, String? number, String? insID}) async {
    Map<String, dynamic> map = {
      "hostMobile": number,
      "code": otp,
      "insId": insID
    };
    print(map);
    try {
      var dio = Dio();
      print("response.statusCode");

      Response response = await dio.post(
        BaseUrl + OtpVerificationApi,
        data: map,
      );
      print(response.statusMessage);
      if (response.statusCode == 200) {
        print(response.statusCode);

        print('success  ${response.data['success']}');
        return response.data;
      } else {
        return response.data["message"];
      }
    } on DioError catch (e) {
      dioErrorHandler(response: e.response!, dioErrorType: e.type);

      throw Exception(e.message);
    }
  }
}
