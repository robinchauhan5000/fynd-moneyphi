// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:moneyphi/controller/signUpController.dart';
import 'package:moneyphi/screens/sign_up/create_password_screen.dart';
import 'package:provider/provider.dart';

class VerifyEmailOTPScreen extends StatefulWidget {
  bool isUserExist;
  VerifyEmailOTPScreen({required this.isUserExist});
  @override
  State<VerifyEmailOTPScreen> createState() => _VerifyEmailOTPScreenState();
}

class _VerifyEmailOTPScreenState extends State<VerifyEmailOTPScreen> {
  SignUpController? signUpController;
  bool clearText = false;
  @override
  void initState() {
    signUpController = Provider.of<SignUpController>(context, listen: false);
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
                "OTP has been sent to ${signUpController?.email.text}",
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
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  signUpController?.otp.text = verificationCode;
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
                    var statusCode =
                        await signUpController?.verifyEmailOtp(context);

                    if (statusCode == 200) {
                      // if (widget.isUserExist) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreatePassword()));
                      // } else {
                      //   Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => EnterEmailAddress()));
                      // }
                    } else {
                      setState(() {
                        clearText = true;
                      });
                    }
                  },
                  child: Text('Continue'),
                  style: ElevatedButton.styleFrom(
                    primary: signUpController!.otp.text.length == 6
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
