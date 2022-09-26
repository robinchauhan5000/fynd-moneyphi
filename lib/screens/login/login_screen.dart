import 'package:flutter/material.dart';
import 'package:moneyphi/controller/LoginController.dart';
import 'package:moneyphi/utils/Colors.dart';
import 'package:moneyphi/utils/SizeConfig.dart';
import 'package:provider/provider.dart';

import '../NavigatonBar/BottomNavigation.dart';
import '../signUp/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  LoginController? loginController;
  bool isLoading = false;
  @override
  void initState() {
    loginController = Provider.of<LoginController>(context, listen: false);

    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  bool hidePass = true;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: SizeConfig.blockSizeHorizontal * 6),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Enter your registered details',
                        style: TextStyle(
                            fontSize: SizeConfig.blockSizeHorizontal * 4,
                            fontWeight: FontWeight.w500,
                            color: fontGrey),
                      ),
                    ],
                  ),
                ),
                customTextField(
                    icon: Icons.person,
                    label: 'Email ID',
                    controller: email,
                    hint: 'example@mail.com'),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Enter Password"),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: TextFormField(
                          obscureText: hidePass,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'It Can\'t be empty';
                            }
                            if (text.length < 4) {
                              return 'Too short';
                            }
                            return null;
                          },
                          controller: pass,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white70,
                              border: OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              hintText: "********",
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.grey,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  if (hidePass) {
                                    setState(() {
                                      hidePass = false;
                                    });
                                  } else {
                                    setState(() {
                                      hidePass = true;
                                    });
                                  }
                                },
                                icon: Icon(
                                  Icons.remove_red_eye,
                                  color:
                                      hidePass ? Colors.grey : appColorPrimary,
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forget Password',
                        style: TextStyle(color: fontGrey),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Consumer<LoginController>(
                    builder: (context, controller, child) {
                  return Center(
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(appButtonColor),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  horizontal: 70, vertical: 20))),
                      onPressed: () {
                        // PanVerificationRepo.login(email.text, pass.text);
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });
                          LoginController()
                              .loginApi(
                                  email: email.text,
                                  context: context,
                                  pass: pass.text)
                              .then((value) {
                            isLoading = false;
                            if (value != null) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BottomNavBarV2()));
                            }
                          }).whenComplete(() {
                            setState(() {
                              isLoading = false;
                            });
                          });
                        }
                      },
                      child: controller.isLoading == true || isLoading
                          ? CircularProgressIndicator()
                          : Text('Submit'),
                    ),
                  );
                }),
                SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'By proceeding you agree to',
                          style: TextStyle(
                            fontSize: SizeConfig.blockSizeHorizontal * 4,
                            color: fontGrey,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Terms & Conditions',
                            style: TextStyle(
                                fontSize: SizeConfig.blockSizeHorizontal * 4,
                                color: fontGrey,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'and',
                          style: TextStyle(
                            fontSize: SizeConfig.blockSizeHorizontal * 4,
                            color: fontGrey,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Privacy Policy',
                            style: TextStyle(
                                fontSize: SizeConfig.blockSizeHorizontal * 4,
                                color: fontGrey,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an Account?',
                          style: TextStyle(
                            fontSize: SizeConfig.blockSizeHorizontal * 4,
                            color: fontGrey,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpScreen()));
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: SizeConfig.blockSizeHorizontal * 5,
                                color: fontGrey,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  customTextField(
      {String? label,
      String? hint,
      IconData? icon,
      TextEditingController? controller}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label ?? ""),
          SizedBox(
            height: 10,
          ),
          Container(
            child: TextFormField(
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'It Can\'t be empty';
                }
                if (text.length < 4) {
                  return 'Too short';
                }
                return null;
              },
              controller: controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white70,
                border: OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: hint,
                prefixIcon: Icon(
                  icon,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
