import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:moneyphi/controller/LoginController.dart';
import 'package:provider/provider.dart';

import '../NavigatonBar/BottomNavigation.dart';

class SignInOtpVerify extends StatefulWidget {
  @override
  State<SignInOtpVerify> createState() => _SignInOtpVerifyState();
}

class _SignInOtpVerifyState extends State<SignInOtpVerify> {
  LoginController? loginController;
  bool buttonColor = false;

  bool clearText = false;

  @override
  void initState() {
    // Future.delayed(Duration(milliseconds: 100), () {
    loginController = Provider.of<LoginController>(context, listen: false);
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.arrow_back_ios),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
              ),
              Text(
                "Enter OTP",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "OTP has been sent to ${loginController?.phoneNumber.text}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 30,
              ),
              OtpTextField(
                clearText: clearText,
                numberOfFields: 6,
                fieldWidth: 50,
                borderWidth: 5,
                borderColor: Color(0xFF512DA8),
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  if (code.length != 6) {
                    buttonColor = false;
                    setState(() {});
                  }
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  buttonColor = true;
                  setState(() {});
                  loginController?.otp.text = verificationCode;
                  // signUpController!.verifyOtp(context);
                }, // end onSubmit
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                  child: Text(
                "Resend Otp",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              )),
              Spacer(),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    var value = await loginController?.verifyOtp(context);
                    if (value == 200) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BottomNavBarV2()));
                    }
                  },
                  child: Text('Continue'),
                  style: ElevatedButton.styleFrom(
                    primary: buttonColor
                        ? Color(0xff00124C)
                        : Color(0xff00124C).withOpacity(0.3),
                    minimumSize: Size(MediaQuery.of(context).size.width * 0.6,
                        MediaQuery.of(context).size.height * 0.08),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: 'By Continuing, you agree to our '),
                      TextSpan(
                        text: '\nPrivacy',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            color: Colors.blue),
                      ),
                      TextSpan(text: ' and '),
                      TextSpan(
                        text: 'Terms & Conditons',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  " Have Questions? ",
                  style: TextStyle(
                      decoration: TextDecoration.underline, color: Colors.blue),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
