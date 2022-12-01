import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  get isVisible => _isVisible;
  bool _isVisible = false;
  set isVisible(value) {
    _isVisible = value;
    notifyListeners();
  }

  get isValid => _isValid;
  bool _isValid = false;
  void isValidEmail(String input) {
    _isValid = input.isNotEmpty;
    notifyListeners();
  }
}
