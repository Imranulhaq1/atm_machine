import 'package:atm_machine/provider/amount_pro.dart';
import 'package:atm_machine/widgets/atm_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Buildbuttonrow extends StatelessWidget {
  final List<String> values;

  const Buildbuttonrow(this.values, {super.key});

  @override
  Widget build(BuildContext context) {
    final pinpro = context.watch<AmountPro>();

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: values.map((amount) {
          bool isSelected = pinpro.selectedAmount == amount;

          return GestureDetector(
            onTap: () {
              context.read<AmountPro>().setSelectedAmount(amount);
            },
            child: AtmButton(
              height: 60,
              elevation: 5,
              width: 180,
              text: amount,
              textColor: isSelected ? Colors.white : Colors.black,
              backgroundColor: isSelected ? Colors.blue : Colors.white,
            ),
          );
        }).toList(),
      ),
    );
  }
}
