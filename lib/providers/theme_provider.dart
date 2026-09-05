import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
   ThemeMode appTheme = ThemeMode.light;

  void changeTheme(ThemeMode themeMode) {
    if (appTheme == themeMode) {
      return;
    }
    appTheme =themeMode ;
    notifyListeners();
  }
}
