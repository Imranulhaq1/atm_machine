import 'package:atm_machine/pages/create_pin.dart';
import 'package:atm_machine/provider/pin_provider.dart';
import 'package:atm_machine/widgets/keypadrow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // listens to changes
  @override
  Widget build(BuildContext context) {
    final pinpro = context.watch<PinProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 241, 225, 176),
        title: const Center(
          child: Text("ATM MACHINE",
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              final slected = await showMenu(
                  context: context,
                  position: const RelativeRect.fromLTRB(1000, 65, 18, 20),
                  items: [
                    const PopupMenuItem(
                      value: 'Create PIN',
                      child: Text('Create PIN'),
                    ),
                    const PopupMenuItem(
                      value: 'Page2',
                      child: Text('Open Page 2'),
                    ),
                  ]);
              if (slected == 'Create PIN') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CreatePin()),
                );
              } else if (slected == 'Page2') {
                Navigator.pushNamed(context, '/page2');
              }
            },
            icon: const Icon(Icons.arrow_drop_down_circle),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 172, 197, 240),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 35.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 183, 181, 181),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text("ENTER PIN:",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                const SizedBox(height: 40),
                TextField(
                  controller: pinpro.textController,
                  obscureText: true,
                  readOnly: true,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Enter your PIN...",
                    fillColor: Colors.white,
                    filled: true,
                    border: const OutlineInputBorder(),
                  ),
                ),
                if (pinpro.errorText != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(pinpro.errorText!,
                        style:
                            const TextStyle(color: Colors.red, fontSize: 16)),
                  ),
                const SizedBox(height: 40),

                // Keypad
                Keypadrow(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
