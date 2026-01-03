import 'package:atm_machine/widgets/buildbuttonrow.dart';
import 'package:flutter/material.dart';
import 'package:atm_machine/widgets/atm_button.dart';
import 'package:atm_machine/pages/other_page.dart';

class SelectTranscationPage extends StatefulWidget {
  //final String amount;
  const SelectTranscationPage({
    super.key,
  });

  @override
  State<SelectTranscationPage> createState() => _SelectTranscationPageState();
}

class _SelectTranscationPageState extends State<SelectTranscationPage> {
  // String selectedAmount = '';

  @override
  Widget build(BuildContext context) {
    //final pinpro = context.watch<AmountPro>();
    final pro = Buildbuttonrow;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 243, 226, 174),
        title: const Center(
          child: Text("@@@", style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://flutterassets.com/wp-content/uploads/2022/11/Flutter-starsview-example.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 50.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                "Please Select AMOUNT!",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),

              // Amount buttons
              // Buildbuttonrow([
              //   '1000',
              //   '2000',
              //   '5000',
              // ]),
              // Buildbuttonrow(['5000', '10000']),
              // Buildbuttonrow(['15000', '20000']),
              // Buildbuttonrow(['30000']),

              const SizedBox(height: 20),

              // Other option
              AtmButton(
                height: 60,
                elevation: 5,
                width: 380,
                text: 'Other...',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => OtherPage()),
                  );
                },
                textColor: Colors.black,
                backgroundColor: Colors.white,
              ),

              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AtmButton(
                    height: 60,
                    elevation: 5,
                    width: 180,
                    text: 'NO',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    textColor: Colors.black,
                    backgroundColor: Colors.white,
                  ),
                  AtmButton(
                    height: 60,
                    elevation: 5,
                    width: 180,
                    text: 'YES',
                    onPressed: () {
                      if (pro.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Please select an amount first!"),
                            backgroundColor: Colors.red,
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.only(
                                bottom: 30.0,
                                left: 20.0,
                                right: 20.0), // Add space from bottom
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        );
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    textColor: Colors.black,
                    backgroundColor: Colors.white,
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
