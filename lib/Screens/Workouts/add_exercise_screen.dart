import 'package:flutter/material.dart';
import 'package:pangains/Http/requests.dart';
import 'package:pangains/Screens/Workouts/populated_workout_screen.dart';
import 'package:pangains/Screens/Workouts/workout_screen.dart';

import '../../Models/exercise.dart';

class AddExerciseScreen extends StatefulWidget {
  @override
  State<AddExerciseScreen> createState() => _AddExerciseScreenState();
}

class _AddExerciseScreenState extends State<AddExerciseScreen> {
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
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            listAllExercises[index].ExerciseName,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Theme(
                          data: ThemeData(
                            unselectedWidgetColor:
                                Color(0xffBDBDBD), // Your color
                          ),
                          child: IconButton(
                            onPressed: () async {
                              selectedExercise.add(listAllExercises[index]);
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PopulatedWorkoutScreen(),
                              ));
                            },
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    );
                  },
                  itemCount: listAllExercises.length,
                )),
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
