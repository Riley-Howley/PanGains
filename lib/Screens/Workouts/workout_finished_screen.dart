import 'package:flutter/material.dart';
import 'package:pangains/Http/requests.dart';
import 'package:pangains/Screens/Workouts/populated_workout_screen.dart';

class WorkoutFinishScreen extends StatelessWidget {
  String workoutTime;
  int routineId;
  int hour;
  WorkoutFinishScreen(
    this.workoutTime,
    this.routineId,
    this.hour,
  );

  @override
  Widget build(BuildContext context) {
    var kgCount = 0;
    var repCount = 0;
    getSpecificYourExercise(routineId);
    for (var i in listAllSpecificYourExercises) {
      for (var s in finishedSets) {
        //postNewSet(i.YourExerciseID, s.id, "", "", s.kg, s.rep);
      }
    }

    for (var i in finishedSets) {
      kgCount += i.kg;
      repCount += i.rep;
    }
    print("New Completed Workout");
    print(routineId);
    postNewCompletedWorkout(listSpecificAccount[0].accountID, routineId,
        DateTime.now().toString(), workoutTime, kgCount);

    return Scaffold(
      backgroundColor: Color(0xff222831),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          child: Column(
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
              Container(
                margin: EdgeInsets.only(top: 32),
                child: Text.rich(
                  TextSpan(
                    text: "${workoutTime} ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: "Total workout time",
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
              Container(
                child: Text.rich(
                  TextSpan(
                    text: "${kgCount} Kg ",
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
              Container(
                child: Text.rich(
                  TextSpan(
                    text: "${repCount} ",
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
              Row(
                children: [
                  Container(
                    width: 160,
                    margin: EdgeInsets.only(top: 64),
                    child: Text(
                      "Workout Completed:",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${listExercises[index].ExerciseName}",
                            style:
                                TextStyle(color: Colors.white, fontSize: 24)),
                        Icon(
                          Icons.done_all,
                          color: Colors.green,
                          size: 40,
                        ),
                      ],
                    );
                  },
                  itemCount: listExercises.length,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 64, bottom: 64),
                width: MediaQuery.of(context).size.width,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    listExercises.clear();
                    finishedSets.clear();
                    Navigator.of(context)
                        .popUntil(ModalRoute.withName('/workouts'));
                  },
                  child: Text(
                    "Continue",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
