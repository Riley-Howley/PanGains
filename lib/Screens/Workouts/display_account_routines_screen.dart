import 'package:flutter/material.dart';
import 'package:pangains/Http/requests.dart';
import 'package:pangains/Models/exercise.dart';
import 'package:pangains/Widgets/account_routine_widget.dart';

import 'populated_workout_screen.dart';

class DisplayAccountRoutinesScreen extends StatelessWidget {
  String name;
  DisplayAccountRoutinesScreen(this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Text(
                "${name} Folder Routines",
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 400,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      listExercises.clear();
                      for (var i in listSpecificRoutine[index].exercises) {
                        listExercises.add(new Exercise(0, i));
                      }
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PopulatedWorkoutScreen(),
                      ));
                    },
                    child: AccountRoutineWidget(
                        listSpecificRoutine[index].routineName),
                  );
                },
                itemCount: listSpecificRoutine.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
