import 'package:atm_machine/widgets/atm_button.dart';
import 'package:flutter/material.dart';

class OtherPage extends StatefulWidget {
  const OtherPage({super.key});

  @override
  State<OtherPage> createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 243, 226, 174),
        title: Center(
          child: Text(
            "@@@",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://flutterassets.com/wp-content/uploads/2022/11/Flutter-starsview-example.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 100),
              TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              AtmButton(
                height: 50,
                elevation: 5,
                width: 380,
                text: 'Enter...',
                onPressed: () {
                  Navigator.of(context).pop();
                },
                textColor: Colors.black,
                backgroundColor: Colors.white,
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Flutter is Google’s UI toolkit for building beautiful, natively compiled applications '
                'for mobile, web, and desktop from a single codebase. With Flutter, developers can create '
                'visually appealing user interfaces with high performance. It provides a rich set of widgets, '
                'extensive libraries, and great developer tools, making it one of the most popular frameworks '
                'for cross-platform app development today.'
                'Flutter is Google’s UI toolkit for building beautiful, natively compiled applications '
                'for mobile, web, and desktop from a single codebase. With Flutter, developers can create '
                'visually appealing user interfaces with high performance. It provides a rich set of widgets, '
                'extensive libraries, and great developer tools, making it one of the most popular frameworks '
                'for cross-platform app development today.',
                style: const TextStyle(
                    fontSize: 16, height: 1.5, color: Colors.teal),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
