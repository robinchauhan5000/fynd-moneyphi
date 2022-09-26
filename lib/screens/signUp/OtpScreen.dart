import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:moneyphi/Http/Interceptors.dart';
import 'package:moneyphi/controller/otpVarification.dart';
import 'package:moneyphi/controller/otpVerificationRepo.dart';
import 'package:moneyphi/screens/dashboard/dashboard.dart';
import 'package:moneyphi/utils/Colors.dart';
import 'package:moneyphi/utils/SharedPref.dart';
import 'package:moneyphi/utils/SizeConfig.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpScreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final GlobalKey<State> loginLoader = new GlobalKey<State>();
  OtpVerificationRepo otpVarification = OtpVerificationRepo();

  var digit;
  bool isError = false;
  bool isLoading = false;
  OtpFieldController? otpController;

  bool selected = false;

  @override
  void initState() {
    otpController = OtpFieldController();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.lock,
                color: Color(0xffD9D9D9),
                size: 50,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "OTP Verify Screen",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: SizeConfig.blockSizeVertical * 2.5,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Please enter the 6-digit verification code\nSent on your registered mobile number",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: fontGrey,
                fontSize: SizeConfig.blockSizeVertical * 2,
              ),
            ),

            // Text(
            //   "Sent to widget.phonenumber",
            //   style: TextStyle(
            //     fontWeight: FontWeight.w400,
            //     fontSize: SizeConfig.blockSizeVertical * 1.5,
            //     color: Colors.grey,
            //   ),
            // ),
            Container(
              height: 200,
              child: OTPTextField(
                length: 6,
                width: MediaQuery.of(context).size.width,
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldWidth: 40,
                otpFieldStyle: OtpFieldStyle(
                  borderColor: Colors.grey,
                ),
                keyboardType: TextInputType.number,
                fieldStyle: FieldStyle.box,
                outlineBorderRadius: 15,
                style: TextStyle(fontSize: 17),
                onChanged: (pin) {
                  print("Changed: " + pin);
                },
                onCompleted: (pin) {
                  digit = pin;
                  print(digit);
                  print("Completed: " + pin);

                  getDone(digit);
                  setState(() {
                    selected = true;
                  });
                },
              ),
            ),

            TextButton(
                onPressed: () {
                  OtpVarification.resendOTP(context: context);
                },
                child: Text('Resend the OTP'))
          ],
        ),
      ),
    );
  }

  getDone(String? otp) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    String? number = await SharedPref().getString(key: 'phone');
    String? insID = await SharedPref().getString(key: 'insId');
    //String phoneCode = preferences.getString('phoneCode')!;
    print(number! + insID!);
    Map<String, dynamic> map = {
      "hostMobile": "91" + number,
      "code": otp,
      "insId": insID
    };
    Response res = await HttpService().postRequest(
        endPoint: '/ins/authenticate/v1/validateMobileCode',
        data: json.encode(map),
        context: context);
    // var value =
    //     await otpVarification.otpVerify(otp: otp, number: number, insID: insID);
    if (res.statusCode == 200) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => DashboardScreen()));
    }
    print('fao ${res.data}');
    // return value;
  }
}
