import 'package:flutter/material.dart';

class AppLocale extends ChangeNotifier {
  Locale ?_locale;

  Locale get locale => _locale ?? Locale('en');

  void changeLocale(newLocale) {
    print("--------${newLocale}");
    if(newLocale == "Gujarati") {

      _locale = Locale('gu');
    }
    else if(newLocale == "Hindi"){
      _locale = Locale('hi');
    }
    else {

      _locale = Locale('en');
    }
    print("======>>$_locale");
    notifyListeners();
  }
}