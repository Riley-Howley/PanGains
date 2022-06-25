import 'package:flutter/material.dart';
import 'package:pangains/Models/completed_workout_history.dart';

import '../Http/requests.dart';

class ExerciseTableWidget extends StatelessWidget {
  CompletedWorkoutHistory historyObj;

  ExerciseTableWidget(
    this.historyObj,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              historyObj.date,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Text(
                historyObj.routineName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(top: 8),
              child: Text.rich(
                TextSpan(
                  text: "${historyObj.totalWorkoutTime} ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: "Workout time",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              child: Text.rich(
                TextSpan(
                  text: "${historyObj.weightLifted} Kg ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: "Weight lifted",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              child: Text.rich(
                TextSpan(
                  text: "${historyObj.workoutReps} ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: "Workout reps",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(top: 32),
              child: Text(
                "${historyObj.exerciseName}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Text(
                "Set",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Text(
                "Previous",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Text(
                "Kg",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Text(
                "Reps",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
        // for (int i = 0; i < historyObj.sets.length; i++)
        //   Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Container(
        //         margin: EdgeInsets.only(top: 30, left: 10),
        //         child: Text(
        //           historyObj.sets[i].SetID.toString(),
        //           style: TextStyle(color: Colors.white, fontSize: 18),
        //         ),
        //       ),
        //       Container(
        //         margin: EdgeInsets.only(top: 30),
        //         child: Text(
        //           "---------",
        //           style: TextStyle(color: Colors.white, fontSize: 18),
        //         ),
        //       ),
        //       Container(
        //         margin: EdgeInsets.only(top: 30),
        //         child: Text(
        //           historyObj.sets[i].kg.toString(),
        //           style: TextStyle(color: Colors.white, fontSize: 18),
        //         ),
        //       ),
        //       Container(
        //         margin: EdgeInsets.only(top: 30, right: 10),
        //         child: Text(
        //           historyObj.sets[i].reps.toString(),
        //           style: TextStyle(color: Colors.white, fontSize: 18),
        //         ),
        //       ),
        //     ],
        //   ),
      ],
    );
  }
}
