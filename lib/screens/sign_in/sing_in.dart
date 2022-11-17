import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moneyphi/controller/LoginController.dart';
import 'package:moneyphi/screens/sign_in/login_with_email_password.dart';
import 'package:provider/provider.dart';

import '../../theme/theme.dart';
import '../../utils/SizeConfig.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool buttonColor = false;
  LoginController? loginController;
  @override
  void initState() {
    loginController = Provider.of<LoginController>(context, listen: false);

    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
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
              Center(
                  child: Container(
                child: Center(
                  child: Text(
                    'Welcome to Investify App',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: SizeConfig.blockSizeHorizontal * 3,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Your Mobile Number",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: SizeConfig.blockSizeHorizontal * 4,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [mainboxshadow],
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      inputFormatters: [
                        new LengthLimitingTextInputFormatter(10),
                      ],
                      controller: loginController?.phoneNumber,
                      onChanged: (val) {
                        if (val.length > 9) {
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
                          return "Please Enter Phone Number";
                        } else if (val!.length < 10) {
                          return "Please Enter Valid Phone Number";
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
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      LoginWithEmailPassword()));
                        },
                        child: Text('Login with email')),
                  )
                ],
              ),
              Spacer(),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      loginController!.signUpWithMobile(context);
                    }
                    //
                  },
                  child: Text('Send OTP to verify'),
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
