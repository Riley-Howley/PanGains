import 'package:flutter/material.dart';
import 'package:pangains/Http/requests.dart';
import 'package:pangains/Models/exercise.dart';
import 'package:pangains/Models/routine.dart';
import 'package:pangains/Screens/Workouts/populated_workout_screen.dart';

import '../../Widgets/account_routine_widget.dart';

class CommunityRoutineScreen extends StatelessWidget {
  const CommunityRoutineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff222831),
      ),
      backgroundColor: Color(0xff222831),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 200,
                child: Text(
                  "Community Routines",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 200,
                margin: EdgeInsets.only(bottom: 20, top: 20),
                child: Text(
                  "Explore...",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PopulatedWorkoutScreen(1)));
                listExercises.add(new Exercise(1, "Lat Pulldown"));
                listExercises.add(new Exercise(2, "Dumbbell Row"));
              },
              child: Container(
                child: AccountRoutineWidget("Community One"),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PopulatedWorkoutScreen(1)));
                listExercises.add(new Exercise(3, "Shrug"));
                listExercises.add(new Exercise(4, "Pull Up"));
              },
              child: Container(
                child: AccountRoutineWidget("Community Two"),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PopulatedWorkoutScreen(1)));
                listExercises.add(new Exercise(5, "Seated Incline Curl"));
                listExercises.add(new Exercise(6, "Bicep Curl"));
              },
              child: Container(
                child: AccountRoutineWidget("Community Three"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}







// Container(
//             width: MediaQuery.of(context).size.width,
//             height: 400,
//             child: ListView.builder(
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   onTap: () {
//                     listExercises.clear();
//                     for (var i in listSpecificRoutine[index].exercises) {
//                       listExercises.add(new Exercise(i.id, i.ExerciseName));
//                     }
//                     Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => PopulatedWorkoutScreen(
//                           listSpecificRoutine[index].routineID),
//                     ));
//                   },
//                   child: AccountRoutineWidget(
//                       listSpecificRoutine[index].routineName),
//                 );
//               },
//               itemCount: listSpecificRoutine.length,
//             ),
//           ),