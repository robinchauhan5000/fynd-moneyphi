import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moneyphi/screens/login/login_screen.dart';
import 'package:moneyphi/screens/signUp/signup_screen.dart';
import 'package:moneyphi/utils/Colors.dart';
import 'package:moneyphi/utils/SizeConfig.dart';

class AskLoginOrSignUp extends StatefulWidget {
  const AskLoginOrSignUp({Key? key}) : super(key: key);

  @override
  State<AskLoginOrSignUp> createState() => _AskLoginOrSignUpState();
}

class _AskLoginOrSignUpState extends State<AskLoginOrSignUp> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: LayoutBuilder(builder: (context, BoxConstraints constraints) {
        return Container(
          width: constraints.maxWidth,
          child: Column(
            children: <Widget>[
              Container(
                  color: Colors.blue,
                  width: constraints.maxWidth, //70%
                  height: (constraints.maxWidth * 1.2) //ratio,
                  ),
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Make Your Investment Process\nEasier with Moneyphi',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: SizeConfig.blockSizeHorizontal * 5,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                              style: ButtonStyle(
                                  minimumSize: MaterialStateProperty.all(Size(
                                      SizeConfig.screenWidth * 0.8,
                                      SizeConfig.blockSizeHorizontal * 12)),
                                  backgroundColor:
                                      MaterialStateProperty.all(fontGrey)),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUpScreen()));
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal * 5),
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Already have an account?'),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen()));
                                  },
                                  child: Text('Login')),
                            ],
                          )
                        ],
                      )
                    ],
                  ),

                  //another video player,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
