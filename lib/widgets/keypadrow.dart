import 'package:atm_machine/provider/pin_provider.dart';
import 'package:atm_machine/widgets/atm_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Keypadrow extends StatelessWidget {
  const Keypadrow({super.key});

  @override
  Widget build(BuildContext context) {
    final pinProvider = Provider.of<PinProvider>(context);
    Widget buildKeypadRow(List<String> labels) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: labels.map((label) {
            return AtmButton(
              text: label,
              elevation: 5,
              height: 50,
              width: 100,
              onPressed: () {
                if (label == 'Enter') {
                  pinProvider.validatePIN(context);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const SelectTranscationPage()),
                  // );
                } else if (label == 'Clear') {
                  pinProvider.clearPin();
                } else {
                  pinProvider.appendToPin(label);
                }
              },
            );
          }).toList(),
        ),
      );
    }

    return Column(
      children: [
        buildKeypadRow(['1', '2', '3']),
        buildKeypadRow(['4', '5', '6']),
        buildKeypadRow(['7', '8', '9']),
        buildKeypadRow(['0', 'Clear', 'Enter']),
      ],
    );
  }
}
