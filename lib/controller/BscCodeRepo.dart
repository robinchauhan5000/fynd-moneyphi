import 'dart:convert';

import 'package:http/http.dart';
import 'package:moneyphi/Constent/ServiceApis.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BscCodeRepo {
  Future<dynamic> getAllData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.get('token').toString();
    try {
      Response response = await get(
        Uri.parse('${BaseUrl}ins/bsecodes/'),
        headers: {
          "Content-Type": "application/json",
          'x-access-token': '$token',
        },
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
