import 'package:flutter/material.dart';
import 'package:pangains/Screens/Workouts/workout_finished_screen.dart';

class PopulatedWorkoutScreen extends StatelessWidget {
  const PopulatedWorkoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff222831),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff222831),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => WorkoutFinishScreen(),
                  ),
                );
              },
              child: Text(
                "Finish",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 32),
                      child: Icon(
                        Icons.access_time,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 32, left: 8),
                      child: Text(
                        "01:20",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 32),
                      child: Icon(
                        Icons.timer_outlined,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 32, left: 8),
                      child: Text(
                        "01:00",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 64),
                  child: Text(
                    "Bicep Curls",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        child: Text(
                          "Set",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                      Container(
                        child: Text(
                          "1",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                      Container(
                        child: Text(
                          "2",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                      Container(
                        child: Text(
                          "3",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        child: Text(
                          "Previous",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                      Container(
                        child: Text(
                          "-",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                      Container(
                        child: Text(
                          "-",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                      Container(
                        child: Text(
                          "-",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        child: Text(
                          "Kg",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                      Container(
                        child: Text(
                          "10",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                      Container(
                        child: Text(
                          "20",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                      Container(
                        child: Text(
                          "30",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        child: Text(
                          "Reps",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                      Container(
                        child: Text(
                          "20",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                      Container(
                        child: Text(
                          "30",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                      Container(
                        child: Text(
                          "40",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        child: Text(
                          "Done",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                      Container(
                        height: 28,
                        child: Checkbox(value: true, onChanged: (check) {}),
                      ),
                      Container(
                        height: 28,
                        child: Checkbox(value: true, onChanged: (check) {}),
                      ),
                      Container(
                        height: 28,
                        child: Checkbox(value: true, onChanged: (check) {}),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 64),
              width: MediaQuery.of(context).size.width,
              height: 48,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Add Set",
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff222831),
                  side: BorderSide(
                    width: 2,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 64),
              width: MediaQuery.of(context).size.width,
              height: 48,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Add Exercise"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 100),
              child: Text(
                "Cancel Workout",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
