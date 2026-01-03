import 'package:flutter/material.dart';

class AmountPro with ChangeNotifier {
  String selectedAmount = '';
  void setSelectedAmount(String amount) {
    selectedAmount = amount;
    notifyListeners();
  }
}
