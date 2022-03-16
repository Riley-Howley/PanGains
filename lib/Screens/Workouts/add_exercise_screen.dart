import 'package:flutter/material.dart';

import '../../Widgets/exercise_widget.dart';

class AddExerciseScreen extends StatelessWidget {
  const AddExerciseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff222831),
      appBar: AppBar(
        backgroundColor: Color(0xff222831),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 24.0,
          right: 24.0,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 200,
                  child: Text(
                    "Add An Exercise",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Text(
                    "Choose an exercise to add below",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffBDBDBD))),
                  hintText: "Search for...",
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 32),
              height: MediaQuery.of(context).size.height / 2,
              child: ListView(
                children: [
                  ExerciseWidget(),
                  ExerciseWidget(),
                  ExerciseWidget(),
                  ExerciseWidget(),
                  ExerciseWidget(),
                  ExerciseWidget(),
                  ExerciseWidget(),
                  ExerciseWidget(),
                  ExerciseWidget(),
                  ExerciseWidget(),
                  ExerciseWidget(),
                  ExerciseWidget(),
                  ExerciseWidget(),
                  ExerciseWidget(),
                  ExerciseWidget(),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/populatedWorkout');
                },
                child: Text("Add Exercise"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
