import 'package:flutter/material.dart';
import 'package:pangains/Models/exercise.dart';
import 'package:pangains/Screens/Workouts/add_exercise_screen.dart';
import 'package:pangains/Screens/Workouts/workout_finished_screen.dart';
import 'package:pangains/Widgets/formatted_set_widget.dart';

import '../../Http/requests.dart';
import '../../Widgets/set_row.dart';

List<Exercise> listExercises = [];
List<Set_row> finishedSets = [];

class PopulatedWorkoutScreen extends StatefulWidget {
  const PopulatedWorkoutScreen({Key? key}) : super(key: key);

  @override
  State<PopulatedWorkoutScreen> createState() => _PopulatedWorkoutScreenState();
}

class _PopulatedWorkoutScreenState extends State<PopulatedWorkoutScreen> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    Future exercisesDialog() => showDialog(
          context: context,
          builder: (context) => Dialog(
            child: Container(
              color: Color(0xff222831),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(children: [
                  Row(
                    children: [
                      Container(
                        width: 200,
                        child: Text(
                          "Add An Exercise",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 36,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 16),
                        child: Text(
                          "Choose an exercise to add below",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffBDBDBD))),
                        hintText: "Search for...",
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                        suffixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 32),
                      height: MediaQuery.of(context).size.height / 2,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text(
                                  listAllExercises[index].ExerciseName,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Theme(
                                data: ThemeData(
                                  unselectedWidgetColor:
                                      Color(0xffBDBDBD), // Your color
                                ),
                                child: IconButton(
                                  onPressed: () async {
                                    setState(() {
                                      listExercises
                                          .add(listAllExercises[index]);
                                    });
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                        itemCount: listAllExercises.length,
                      )),
                ]),
              ),
            ),
          ),
        );
    return Scaffold(
      backgroundColor: Color(0xff222831),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff222831),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => WorkoutFinishScreen(),
                  ),
                );
              },
              child: Text(
                "Finish",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
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
                    margin: EdgeInsets.only(top: 30),
                    width: 200,
                    child: Text(
                      "Empty Workout",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: Text(
                      "Add exercises as you go",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 32),
                        child: Icon(
                          Icons.access_time,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 32, left: 8),
                        child: Text(
                          "01:20",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 32),
                        child: Icon(
                          Icons.timer_outlined,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 32, left: 8),
                        child: Text(
                          "01:00",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return FormattedSetWidget(index);
                  },
                  itemCount: listExercises.length,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    exercisesDialog();
                  },
                  child: Text(
                    "Add Exercise",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
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
