class CompletedWorkout {
  int CompletedWorkoutID;
  int AccountID;
  int RoutineID;
  String date;
  String duration;
  int totalWeightLifted;

  CompletedWorkout(this.CompletedWorkoutID, this.AccountID, this.RoutineID,
      this.date, this.duration, this.totalWeightLifted);
}
