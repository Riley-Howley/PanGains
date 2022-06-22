import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff222831),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  print(DateTime.now().hour);
                },
                child: Text("CLICK ME BITCH"),)
          ],
        ),
      ),
    );
  }
}
