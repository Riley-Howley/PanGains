import 'package:flutter/material.dart';

import '../../Widgets/exercise_table_widget.dart';

class WorkoutHistoryScreen extends StatefulWidget {
  const WorkoutHistoryScreen({Key? key}) : super(key: key);

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
              home == false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 16),
                          child: TextButton(
                            onPressed: () {
                              setState(
                                () {
                                  home == true;
                                },
                              );
                            },
                            child: Text(
                              "Mine",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 16),
                          child: TextButton(
                            onPressed: () {
                              setState(
                                () {
                                  home == false;
                                },
                              );
                            },
                            child: Text(
                              "Friends",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 16),
                          child: TextButton(
                            onPressed: () {
                              setState(
                                () {
                                  home == true;
                                },
                              );
                            },
                            child: Text(
                              "Mine",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 16),
                          child: TextButton(
                            onPressed: () {
                              setState(
                                () {
                                  home == false;
                                },
                              );
                            },
                            child: Text(
                              "Friends",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
              ExerciseTableWidget(),
              Container(
                margin: EdgeInsets.only(top: 64),
                child: ExerciseTableWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
