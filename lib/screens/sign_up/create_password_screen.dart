// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:moneyphi/controller/signUpController.dart';
import 'package:provider/provider.dart';

import 'confirm_password_screen.dart';

class CreatePassword extends StatefulWidget {
  @override
  State<CreatePassword> createState() => _MobileNumberState();
}

class _MobileNumberState extends State<CreatePassword>
    with TickerProviderStateMixin {
  AnimationController? _controller;
  AnimationController? _controller2;
  AnimationController? _controller3;

  Animation<Offset>? _animation;
  Animation<Offset>? _animation2;
  Animation<Color?>? _animation3;
  bool smallCharacter = false;
  bool capitalCharacter = false;
  bool numericCharacter = false;
  bool specialCharacter = false;
  bool eightCharacter = false;
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
    _controller2!.forward();
    Future.delayed(Duration(milliseconds: 1500), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ConfirmPassword()));

      _controller2!.reset();
    });
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
                      'Create a password',
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
                          controller: signUpController?.password,
                          onChanged: (val) {
                            if (val.contains(RegExp('[0-9]'))) {
                              setState(() {
                                numericCharacter = true;
                                // The state that has changed here is the animation object’s value.
                              });

                              _controller3!.forward();
                            }

                            if (val.contains(RegExp(r'[a-z]'))) {
                              smallCharacter = true;
                            }
                            if (val.contains(RegExp(r'[A-Z]'))) {
                              capitalCharacter = true;
                            }
                            if (val.contains(RegExp(r'[!@#$ %^&*(),.?"]'))) {
                              specialCharacter = true;
                            }
                            if (val.length >= 8) {
                              eightCharacter = true;
                            }

                            // --------------------------
                            if (!val.contains(RegExp('[0-9]'))) {
                              setState(() {
                                numericCharacter = false;
                                // The state that has changed here is the animation object’s value.
                              });

                              _controller3!.forward();
                            }

                            if (!val.contains(RegExp(r'[a-z]'))) {
                              smallCharacter = false;
                            }
                            if (!val.contains(RegExp(r'[A-Z]'))) {
                              capitalCharacter = false;
                            }
                            if (!val.contains(RegExp(r'[!@#$ %^&*(),.?"]'))) {
                              specialCharacter = false;
                            }
                            if (val.length <= 8) {
                              eightCharacter = false;
                            }
                            // else if()
                            setState(() {
                              // numericCharacter=true;
                              // The state that has changed here is the animation object’s value.
                            });
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
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                    radius: 15,
                    backgroundColor:
                        eightCharacter ? Colors.green : Color(0xffD9D9D),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text("Password should contain 8 letters"),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                    radius: 15,
                    backgroundColor:
                        capitalCharacter ? Colors.green : Color(0xffD9D9D),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text("At least 1 capital letter"),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                    radius: 15,
                    backgroundColor:
                        smallCharacter ? Colors.green : Color(0xffD9D9D),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text("At least 1 small letter"),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                    radius: 15,
                    backgroundColor:
                        numericCharacter ? Colors.green : Color(0xffD9D9D),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text("At least 2 numerical letter"),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                    radius: 15,
                    backgroundColor:
                        specialCharacter ? Colors.green : Color(0xffD9D9D),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text("At least 1 special character"),
                ],
              ),
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
