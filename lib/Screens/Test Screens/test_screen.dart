import 'package:flutter/material.dart';
import 'package:pangains/Http/requests.dart';

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
                //getAllSpecificCompletedWorkouts(1);
                postNewCompletedWorkout(
                    1, 1, DateTime.now().toString(), "0:0:15:12", 42);
              },
              child: Text("CLICK ME BITCH"),
            )
          ],
        ),
      ),
    );
  }
}
