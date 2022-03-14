import 'package:flutter/material.dart';
import 'package:pangains/Screens/Workouts/add_exercise_screen.dart';

class EmptyWorkoutScreen extends StatelessWidget {
  const EmptyWorkoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff222831),
        elevation: 0,
      ),
      backgroundColor: Color(0xff222831),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 24.0,
          right: 24.0,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30),
                  width: 200,
                  child: Text(
                    "Empty Workout",
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
                    "Add exercises as you go",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 32),
                  child: Icon(
                    Icons.timer,
                    color: Colors.white,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 32, left: 8),
                  child: Text(
                    "00:00",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 64),
              width: MediaQuery.of(context).size.width,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AddExerciseScreen(),
                    ),
                  );
                },
                child: Text(
                  "Add Exercise",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
