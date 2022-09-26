import 'dart:convert';

import 'package:http/http.dart';
import 'package:moneyphi/Constent/ServiceApis.dart';

class SignUpRepo {
  Future<dynamic?> SignUp({String? email, String? phone, String? pass}) async {
    print(email);
    Map<String, dynamic> data = {
      "email": email,
      "phoneCode": "91",
      "phoneNumber": phone,
      "password": pass
    };
    print(jsonEncode(data));
    try {
      Response response = await post(
        Uri.parse('${BaseUrl}ins/register'),
        body: json.encode(data),
      );

      var decoded = jsonDecode(response.body);

      print('decode');
      print(decoded);
      return decoded;
    } catch (e) {
      print('catch');
      print(e);
      return e.toString();
    }
  }
}
