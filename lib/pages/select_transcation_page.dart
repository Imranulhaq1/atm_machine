import 'package:atm_machine/provider/amount_pro.dart';
import 'package:atm_machine/widgets/atm_button.dart';
import 'package:atm_machine/widgets/buildbuttonrow.dart';
import 'package:atm_machine/pages/other_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectTranscationPage extends StatefulWidget {
  const SelectTranscationPage({super.key});

  @override
  State<SelectTranscationPage> createState() => _SelectTranscationPageState();
}

class _SelectTranscationPageState extends State<SelectTranscationPage> {
  @override
  Widget build(BuildContext context) {
    final amountPro = context.watch<AmountPro>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 243, 226, 174),
        centerTitle: true,
        title: const Text(
          "SELECT TRANSACTION",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://flutterassets.com/wp-content/uploads/2022/11/Flutter-starsview-example.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 40),
          child: Column(
            children: [
              const Text(
                "Please Select AMOUNT!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 40),

              // Amount buttons
              Buildbuttonrow(['1000', '2000']),
              Buildbuttonrow(['5000', '10000']),
              Buildbuttonrow(['15000', '20000']),
              Buildbuttonrow(['30000']),

              const SizedBox(height: 30),

              // Other amount
              AtmButton(
                height: 60,
                width: double.infinity,
                elevation: 5,
                text: 'Other...',
                textColor: Colors.black,
                backgroundColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const OtherPage(),
                    ),
                  );
                },
              ),

              const Spacer(),

              // YES / NO buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AtmButton(
                    height: 60,
                    width: 160,
                    elevation: 5,
                    text: 'NO',
                    textColor: Colors.black,
                    backgroundColor: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  AtmButton(
                    height: 60,
                    width: 160,
                    elevation: 5,
                    text: 'YES',
                    textColor: Colors.black,
                    backgroundColor: Colors.white,
                    onPressed: () {
                      if (amountPro.selectedAmount.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                const Text("Please select an amount first!"),
                            backgroundColor: Colors.red,
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 30,
                            ),
                          ),
                        );
                      } else {
                        Navigator.pop(context);
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
