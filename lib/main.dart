import 'package:atm_machine/pages/my_home_page.dart';
import 'package:atm_machine/pages/splashscreen.dart';
import 'package:atm_machine/provider/amount_pro.dart';
import 'package:atm_machine/provider/pin_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => PinProvider(),
      ),
      ChangeNotifierProvider(create: (context) => PinProvider()),
      ChangeNotifierProvider(create: (context) => AmountPro()),
    ],
    child: const MyApp(),
  ));
  // const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
