import 'package:flutter/material.dart';

class Model extends ChangeNotifier {
  int activeMenu1 = 0;
  int activeMenu2 = 0;

  changeActiveMenuOne(int index) {
    activeMenu1 = index;
    notifyListeners();
  }

  changeActiveMenuTwo(int index) {
    activeMenu2 = index;
    notifyListeners();
  }
}
