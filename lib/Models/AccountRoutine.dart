import 'package:pangains/Models/YourExercise.dart';
import 'package:pangains/Models/exercise.dart';

class AccountRoutine {
  int routineID;
  String routineName;
  List<Exercise> exercises;

  AccountRoutine(this.routineID, this.routineName, this.exercises);
}
