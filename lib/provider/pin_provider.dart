import 'package:atm_machine/pages/select_transcation_page.dart';
import 'package:flutter/material.dart';

class PinProvider with ChangeNotifier {
  final TextEditingController textController = TextEditingController();
  String? errorText;
  // final List<String> amounts = [
  //   '1000',
  //   '2000',
  //   '5000',
  //   '10000',
  //   '15000',
  //   '20000',
  //   '30000'
  // ];
  void validatePIN(BuildContext context) {
    if (textController.text.isEmpty) {
      errorText = "Must be enter a PIN code";
    } else if (textController.text != '1234') {
      errorText = "Required PIN must be valid";
    } else {
      errorText = null;
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SelectTranscationPage(),
          ));
      // notifyListeners();
    }
    notifyListeners();
  }

  void initState() {
    textController.text = textController.text.trim();
    notifyListeners();
    // TODO: implement initState
  }

  void appendToPin(String digit) {
    textController.text += digit;
    notifyListeners();
  }

  void clearPin() {
    textController.clear();
    errorText = null;
    notifyListeners();
  }
}
