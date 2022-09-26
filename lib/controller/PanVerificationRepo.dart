import 'dart:convert';

import 'package:http/http.dart';
import 'package:moneyphi/Constent/ServiceApis.dart';
import 'package:moneyphi/Model/KycFormModel/PartTwoOneModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/KycFormModel/PartTwoThreeModel.dart';
import '../Model/KycFormModel/PartTwoTwoModel.dart';

class PanVerificationRepo {
  static Future<dynamic?> login(String email, String password) async {
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // var token = preferences.get('token').toString();

    Map<String, dynamic> data = {"userEmail": email, "password": password};
    try {
      Response response = await post(
        Uri.parse('https://stag.app.moneyphi.com/api/ins/authenticate/'),
        body: json.encode(data),
        headers: {
          "Content-Type": "application/json",
        },
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        print("response.body");
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.clear();
        prefs.setString("token", jsonDecode(response.body)["token"]);
        print(response.body);
        return jsonDecode(response.body);
      } else {
        print(jsonDecode(response.body));
        return jsonDecode(response.body);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<dynamic?> checkKycWithVerification({required String panNumber}) async {
    print(json.encode({"pan": panNumber}));
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.get('token').toString();
    try {
      Response response = await post(
        Uri.parse('https://stag.app.moneyphi.com/api/ins/mftrans/checkkyc'),
        body: json.encode({"pan": panNumber}),
        headers: {
          "Content-Type": "application/json",
          'x-access-token': '$token',
        },
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print(jsonDecode(response.body));
        return jsonDecode(response.body);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<dynamic?> submitPartTwoOne(
      {required PartTwoOneModel partTwoOneModel}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.get('token').toString();
    print(partTwoOneModelToJson(partTwoOneModel));
    try {
      Response response = await post(
        Uri.parse('${BaseUrl}ins/mftrans/part2-1'),
        body: partTwoOneModelToJson(partTwoOneModel),
        headers: {
          "Content-Type": "application/json",
          'x-access-token': '$token',
        },
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print(jsonDecode(response.body));
        return jsonDecode(response.body);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<dynamic?> partTwoTwo(
      {required PartTwoTwoModel partTwoTwoModel}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.get('token').toString();
    print(partTwoTwoModelToJson(partTwoTwoModel));
    try {
      Response response = await post(
        Uri.parse('https://stag.app.moneyphi.com/api/ins/mftrans/part2-2'),
        body: partTwoTwoModelToJson(partTwoTwoModel),
        headers: {
          "Content-Type": "application/json",
          'x-access-token': '$token',
        },
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print(jsonDecode(response.body));
        return jsonDecode(response.body);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<dynamic?> partTwoThree(
      {required PartTwoThreeModel partTwoThreeModel}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.get('token').toString();
    try {
      Response response = await post(
        Uri.parse('https://stag.app.moneyphi.com/api/ins/mftrans/part2-3'),
        body: partTwoThreeModelToJson(partTwoThreeModel),
        headers: {
          "Content-Type": "application/json",
          'x-access-token': '$token',
        },
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print(jsonDecode(response.body));
        return jsonDecode(response.body);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<dynamic?> partTwoFive() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.get('token').toString();
    try {
      Response response = await post(
        Uri.parse('https://stag.app.moneyphi.com/api/ins/mftrans/part2-5'),
        headers: {
          "Content-Type": "application/json",
          'x-access-token': '$token',
        },
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print(jsonDecode(response.body));
        return jsonDecode(response.body);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
