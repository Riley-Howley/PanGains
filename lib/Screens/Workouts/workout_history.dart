import 'package:flutter/material.dart';
import 'package:pangains/Http/requests.dart';
import 'package:pangains/Models/completed_workout_history.dart';
import 'package:pangains/Screens/Workouts/workout_screen.dart';

import '../../Widgets/exercise_table_widget.dart';

class WorkoutHistoryScreen extends StatefulWidget {
  @override
  State<WorkoutHistoryScreen> createState() => _WorkoutHistoryScreenState();
}

class _WorkoutHistoryScreenState extends State<WorkoutHistoryScreen> {
  bool home = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff222831),
      appBar: AppBar(
        backgroundColor: Color(0xff222831),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
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
                      "Workout History",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
              ),
              for (var i in listSpecificCompletedWorkouts)
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                  ),
                  margin: EdgeInsets.only(bottom: 40),
                  child: Column(
                    children: [
                      Text(
                        "Routine Completed: ${getRoutineName(i.RoutineID)}",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Text(
                        "Completed on ${i.date.split(" ")[0]}",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Text(
                        "Duration ${i.duration} hours",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Text(
                        "Total Lifted: ${i.totalWeightLifted}kg",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

String getExerciseName(int id) {
  return listAllExercises.firstWhere((e) => e.id == id).ExerciseName;
}
