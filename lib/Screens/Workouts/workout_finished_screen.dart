import 'package:flutter/material.dart';

class WorkoutFinishScreen extends StatelessWidget {
  const WorkoutFinishScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff222831),
      body: Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 64),
              child: Image.asset("assets/images/title.png"),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 32),
            child: Text(
              "Here are your stats",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            child: Text(
              "for the session",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
