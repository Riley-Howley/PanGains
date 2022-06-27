import 'package:flutter/material.dart';
import 'package:pangains/Http/requests.dart';
import 'package:pangains/Screens/Workouts/populated_workout_screen.dart';

import '../../Models/workouts_perweek.dart';
import 'workout_history.dart';

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
    getSpecificAllDaysWorkedOut(listSpecificAccount[0].accountID);
    if (getExerciseName(listAllExercises.firstWhere((element) => element.id == listAllChallengeStats[0].``)) ==
          listAllChallenges
              .firstWhere((element) =>
                  element.challengesID == listOfAllLeaderboard[0].challengesID)
              .challengeName) {
        updateSpecificChallengeStat(
            listAllChallengeStats
                .firstWhere((element) =>
                    element.AccountID == listSpecificAccount[0].accountID)
                .ChallengeStatsID,
            listSpecificAccount[0].accountID,
            listAllChallengeStats
                .firstWhere((element) =>
                    element.AccountID == listSpecificAccount[0].accountID)
                .LeaderBoardID,
            listAllChallengeStats
                    .firstWhere((element) =>
                        element.AccountID == listSpecificAccount[0].accountID)
                    .challengeTotalReps +
                repCount);
      }
    for (var i in listAllSpecificYourExercises) {
      // for (var s in finishedSets) {
      //   // postNewSet(i.YourExerciseID, s.id, "", "", s.kg, s.rep);
      // }
    }
    var hour = workoutTime.split(":");
    var formatHour = hour[0].split("")[1];

    for (var i in finishedSets) {
      kgCount += i.kg;
      repCount += i.rep;
    }
    if (int.parse(formatHour) <= 0) {
      print("Not Valid Hour");
    } else {
      var id = listSpecificDaysWorkedOut
          .firstWhere((e) => e.day == getDay(DateTime.now().weekday));
      updateDaysWorkedOut(id.DaysWorkedOutID, listSpecificAccount[0].accountID,
          getDay(DateTime.now().weekday), id.hours + int.parse(formatHour));
    }
    postNewCompletedWorkout(listSpecificAccount[0].accountID, routineId,
        DateTime.now().toString(), workoutTime, kgCount);

    updateStatistics(
        listSpecificStatistic[0].StatisticsID,
        listSpecificAccount[0].accountID,
        listSpecificStatistic[0].TotalWorkouts + 1,
        listSpecificStatistic[0].AvgWorkoutTime + int.parse(formatHour),
        listSpecificStatistic[0].TotalLifted + kgCount,
        listSpecificStatistic[0].AvgReps + repCount,
        listSpecificStatistic[0].AvgSets + listAllSets.length);

    getSpecificStatistic(listSpecificAccount[0].accountID);

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

getDay(int num) {
  switch (num) {
    case 1:
      return "Mon";
    case 2:
      return "Tue";
    case 3:
      return "Wed";
    case 4:
      return "Thu";
    case 5:
      return "Fri";
    case 6:
      return "Sat";
    case 7:
      return "Sun";
    default:
      return "N/A";
  }
}
