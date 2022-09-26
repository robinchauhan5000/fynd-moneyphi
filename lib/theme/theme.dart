import 'package:flutter/material.dart';
import 'package:moneyphi/utils/Colors.dart';

Color disabledColor = Color(0xff747474);
Color scaffoldBackgroundColor = Colors.white;
Color primaryColor = Color(0xff2AD95A);

//app theme
// final ThemeData appTheme = ThemeData(
//   scaffoldBackgroundColor: scaffoldBackgroundColor,
//   fontFamily: 'ProductSans',
//   backgroundColor: Colors.black,
//   primaryColor: primaryColor,
//   bottomAppBarColor: Colors.white,
//   dividerColor: Color(0xffF8F9FD),
//   disabledColor: disabledColor,
//   buttonColor: primaryColor,
//   focusColor: Color(0xff7b49c3),
//   cursorColor: primaryColor,
//   indicatorColor: primaryColor,
//   accentColor: primaryColor,
//   cardColor: Color(0xff222e3e),
//   hintColor: Color(0xffa3a3a3),
//   bottomAppBarTheme: BottomAppBarTheme(color: primaryColor),
//   appBarTheme: AppBarTheme(
//     color: Colors.transparent,
//     elevation: 0.0,
//   ),
//   //text theme which contains all text styles
//   textTheme: TextTheme(
//     //default text style of Text Widget
//     bodyText1: TextStyle(),
//     bodyText2: TextStyle(),
//     subtitle1: TextStyle(),
//     subtitle2: TextStyle(color: disabledColor),
//     headline3: TextStyle(),
//     headline4:
//         TextStyle(color: scaffoldBackgroundColor, fontWeight: FontWeight.bold),
//     headline5:
//         TextStyle(color: scaffoldBackgroundColor, fontWeight: FontWeight.bold),
//     headline6: TextStyle(color: disabledColor),
//     caption: TextStyle(),
//     overline: TextStyle(),
//     button: TextStyle(),
//   ),
// );

enum AppTheme {
  LightAppTheme,
  DarkAppTheme,
}

final appThemeData = {
  AppTheme.DarkAppTheme: ThemeData(
    scaffoldBackgroundColor: Colors.black,
    fontFamily: 'AvenirNextLTPro',
    primaryColor: primaryColor,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: appColorPrimary,
      selectionHandleColor: appColorPrimary,
    ),
    textTheme: TextTheme(
      headline1: TextStyle().copyWith(color: Colors.white),
      headline2: TextStyle().copyWith(color: Colors.white),
      headline3: TextStyle().copyWith(color: Colors.white),
      headline4: TextStyle().copyWith(color: Color(0xffEF9918)),
    ),
  ),
  AppTheme.LightAppTheme: ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'AvenirNextLTPro',
    primaryColor: primaryColor,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: appColorPrimary,
      selectionHandleColor: appColorPrimary,
    ),
    textTheme: TextTheme(
        headline3: TextStyle().copyWith(color: Colors.black, fontSize: 18),
        headline4: TextStyle().copyWith(
          color: Colors.black,
        )),
  ),
};

var mainboxshadow = BoxShadow(
  color: Colors.grey.withOpacity(0.4),
  spreadRadius: 2,
  blurRadius: 8,
  offset: Offset(0, 4), // changes position of shadow
);
