import 'package:flutter/material.dart';

class Spinner extends ChangeNotifier {
  bool _showSpinner = false;

  void isActiveSpiner() {
    _showSpinner = true;
    notifyListeners();
  }

  void isInActiveSpiner() {
    _showSpinner = false;
    notifyListeners();
  }

  get showSpinner => _showSpinner;
}
