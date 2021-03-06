import 'package:flutter/material.dart';
import 'package:pangains/Http/requests.dart';
import 'package:pangains/Models/exercise.dart';
import 'package:pangains/Widgets/account_routine_widget.dart';

import 'populated_workout_screen.dart';

class DisplayAccountRoutinesScreen extends StatefulWidget {
  String name;
  int folderID;
  DisplayAccountRoutinesScreen(this.name, this.folderID);

  @override
  State<DisplayAccountRoutinesScreen> createState() =>
      _DisplayAccountRoutinesScreenState();
}

class _DisplayAccountRoutinesScreenState
    extends State<DisplayAccountRoutinesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: Color(0xff222831),
      ),
      backgroundColor: Color(0xff222831),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 200,
                    child: Text(
                      "${widget.name} Folder",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await DeleteFolder(widget.folderID);
                    for (var i in listSpecificRoutine) {
                      await deleteSpecificRoutine(i.routineID);
                      await deleteSpecificCompletedWorkout(
                          listSpecificCompletedWorkouts
                              .firstWhere(
                                  (element) => element.RoutineID == i.routineID)
                              .CompletedWorkoutID);
                    }
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: 40,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 200,
                margin: EdgeInsets.only(bottom: 20, top: 20),
                child: Text(
                  "Your Routines",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 400,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onLongPress: () async {
                      await deleteSpecificRoutine(
                          listSpecificRoutine[index].routineID);
                      await deleteSpecificCompletedWorkout(
                          listAllCompletedWorkouts
                              .firstWhere((element) =>
                                  element.RoutineID ==
                                  listSpecificRoutine[index].routineID)
                              .CompletedWorkoutID);
                      Navigator.pop(context);
                    },
                    onTap: () {
                      listExercises.clear();
                      for (var i in listSpecificRoutine[index].exercises) {
                        listExercises.add(new Exercise(i.id, i.ExerciseName));
                      }
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PopulatedWorkoutScreen(
                            listSpecificRoutine[index].routineID),
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
