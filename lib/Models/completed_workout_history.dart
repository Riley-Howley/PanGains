import 'package:pangains/Models/set.dart';
import 'package:pangains/Widgets/set_row.dart';

class CompletedWorkoutHistory {
  String date;
  String routineName;
  String totalWorkoutTime;
  String weightLifted;
  String workoutReps;
  String exerciseName;
  List<Sets> sets;

  CompletedWorkoutHistory(
    this.date,
    this.routineName,
    this.totalWorkoutTime,
    this.weightLifted,
    this.workoutReps,
    this.exerciseName,
    this.sets,
  );
}
