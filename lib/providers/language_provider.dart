import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String language = "en";

  changeLanguage(String newLanguage) {
    if (language == newLanguage) {
      return;
    }
    language = newLanguage;
    notifyListeners();
  }
}
