import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:moneyphi/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState.initial());

  globalTheme({required bool isDarkTheme}) {
    if (isDarkTheme) {
      setTheme(isDarkTheme: true);
      emit(state.copyWith(
          isDarkThemeOn: true, theme: appThemeData[AppTheme.DarkAppTheme]));
    } else {
      emit(state.copyWith(
          isDarkThemeOn: false, theme: appThemeData[AppTheme.LightAppTheme]));
    }
  }

  setTheme({required bool isDarkTheme}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('theme', isDarkTheme);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool value = await prefs.getBool('theme')!;
    return value;
  }
}
