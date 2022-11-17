// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:moneyphi/controller/signUpController.dart';
import 'package:moneyphi/utils/AppSnackBar.dart';
import 'package:provider/provider.dart';

class ConfirmPassword extends StatefulWidget {
  @override
  State<ConfirmPassword> createState() => _MobileNumberState();
}

class _MobileNumberState extends State<ConfirmPassword>
    with TickerProviderStateMixin {
  AnimationController? _controller;
  AnimationController? _controller2;
  AnimationController? _controller3;

  Animation<Offset>? _animation;
  Animation<Offset>? _animation2;
  Animation<Color?>? _animation3;
  SignUpController? signUpController;

  @override
  void initState() {
    super.initState();
    signUpController = Provider.of<SignUpController>(context, listen: false);
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    )..forward();
    _animation = Tween<Offset>(
      begin: const Offset(-1.2, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller!,
      curve: Curves.easeInCubic,
    ));
    _controller2 = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    _animation2 = Tween<Offset>(
      begin: const Offset(0.0, 0.0),
      end: const Offset(2.2, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller2!,
      curve: Curves.easeInCubic,
    ));
    _controller3 =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _animation3 = (ColorTween(
            begin: Color(0xff00124C).withOpacity(0.3), end: Color(0xff00124C))
        .animate(_controller3!)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      }));
  }

  newAnimate() {
    if (signUpController?.confirmPassword.text !=
        signUpController?.password.text) {
      appSnackBar(content: "Password Does not match", context: context);
    } else {
      signUpController?.addPassword(context);
      _controller2!.forward();
    }
    // Future.delayed(Duration(milliseconds: 1500), () {
    //   Navigator.push(
    //       context, MaterialPageRoute(builder: (context) => VerifyOTPScreen()));
    //
    //   _controller2!.reset();
    // });
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Tween<double> scaleTween = Tween<double>(begin: 1, end: 2);

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
              TweenAnimationBuilder(
                tween: scaleTween,
                duration: const Duration(milliseconds: 1500),
                builder: (context, scale, child) {
                  return Transform.scale(scale: scale as double, child: child);
                },
                child: Container(
                  child: Center(
                    child: Text(
                      'Confirm Password',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SlideTransition(
                  position: _animation!,
                  transformHitTests: true,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        elevation: 3,
                        child: TextField(
                          controller: signUpController?.confirmPassword,
                          onChanged: (val) {
                            if (val != "") {
                              setState(() {
                                // The state that has changed here is the animation object’s value.
                              });

                              _controller3!.forward();
                            }
                          },
                          textAlign: TextAlign.center,
                          // controller: someTextXontroller,
                          keyboardType: TextInputType.text,
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
                  )),
              Spacer(),
              SlideTransition(
                position: _animation2!,
                transformHitTests: true,
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      newAnimate();
                      //
                    },
                    child: Text('Continue'),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff00124C).withOpacity(0.3),
                      minimumSize: Size(MediaQuery.of(context).size.width * 0.6,
                          MediaQuery.of(context).size.height * 0.08),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
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
