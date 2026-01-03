import 'package:atm_machine/provider/amount_pro.dart';
import 'package:atm_machine/widgets/atm_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Buildbuttonrow extends StatelessWidget {
  //final dynamic values;

  const Buildbuttonrow(List<String> list, {super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    final String amount;
    List<String> values = [
      '1000',
      '2000',
      '5000',
      '10000',
      '15000',
      '20000',
      '30000'
    ];
    String selectedAmount = '';
    //final pinpro = context.watch<AmountPro>();
    // final List<String> values;
    //return  Widget buildButtonRow(List<String> values) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: values.map((amount) {
          bool isSelected = selectedAmount == amount;
          return GestureDetector(
            onTap: () {
              selectedAmount = amount;
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
