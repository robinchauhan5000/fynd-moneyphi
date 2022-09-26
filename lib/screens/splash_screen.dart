import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moneyphi/screens/NavigatonBar/BottomNavigation.dart';
import 'package:moneyphi/utils/SizeConfig.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'askLoginOrSignUp.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? token;

  autoLogin() async {
    SharedPreferences sharedPreferencess =
        await SharedPreferences.getInstance();
    token = sharedPreferencess.getString('token');
    print('token from autologin');
    print(token);
    if (token != null) {
      Future.delayed(Duration(seconds: 3), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => BottomNavBarV2()));
      });
    } else {
      Future.delayed(Duration(seconds: 3), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => AskLoginOrSignUp()));
      });
    }
  }

  @override
  void didChangeDependencies() {
    // if () {
    //   refreshToker();
    // }
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    autoLogin();
  }

  // @override
  // void didChangeDependencies() {
  //   autoLogin();
  //
  //   print('print did dependancy');
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill, image: AssetImage('assets/splash.png')),
      ),
      child: Image.asset('assets/moneyphi_logo.png'),
    );
  }
}
