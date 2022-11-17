// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:moneyphi/controller/LoginController.dart';
import 'package:moneyphi/utils/SizeConfig.dart';
import 'package:provider/provider.dart';

import '../../theme/theme.dart';

class LoginWithEmailPassword extends StatefulWidget {
  @override
  State<LoginWithEmailPassword> createState() => _LoginWithEmailPasswordState();
}

class _LoginWithEmailPasswordState extends State<LoginWithEmailPassword> {
  bool buttonColor = false;
  final _formKey = GlobalKey<FormState>();
  LoginController? loginController;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 100), () {
      loginController = Provider.of<LoginController>(context, listen: false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.04),
                child: Text(
                  "Your Email",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [mainboxshadow],
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: email,
                  onChanged: (val) {
                    if (RegExp(
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                        .hasMatch(val)) {
                      // _controller3!.forward();
                      setState(() {
                        buttonColor = true;
                      });
                    } else {
                      setState(() {
                        buttonColor = false;
                      });
                    }
                  },
                  validator: (val) {
                    if (val == "") {
                      return "Please Enter Email address";
                    }
                    if (!RegExp(
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                        .hasMatch(val!)) {
                      return 'Enter a Valid Email address';
                    }
                  },
                  // maxLength: 10,
                  textAlign: TextAlign.center,

                  // controller: someTextXontroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Hint Text',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    contentPadding: EdgeInsets.all(16),
                    fillColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.04),
                child: Text(
                  "Your Password",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [mainboxshadow],
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: password,
                  validator: (val) {
                    if (val == "") {
                      return "Please Enter Password here";
                    }
                  },
                  // maxLength: 10,
                  textAlign: TextAlign.center,

                  // controller: someTextXontroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Hint Text',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    contentPadding: EdgeInsets.all(16),
                    fillColor: Colors.white,
                  ),
                ),
              ),
              Spacer(),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    loginController?.loginApi(
                        email: email.text,
                        pass: password.text,
                        context: context);
                  },
                  child: Text('Login'),
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
