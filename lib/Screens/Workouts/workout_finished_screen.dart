import 'package:flutter/material.dart';
import 'package:pangains/Screens/Workouts/populated_workout_screen.dart';

class WorkoutFinishScreen extends StatelessWidget {
  const WorkoutFinishScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var kgCount = 0;
    var repCount = 0;
    for (var i in finishedSets) {
      kgCount += i.kg;
      repCount += i.rep;
    }
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
                    text: "58 Minutes ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: "Workout time",
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
                margin: EdgeInsets.only(top: 64),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "6 Pack Ab Routine",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 8, bottom: 16),
                          child: Text.rich(
                            TextSpan(
                              text: "Created by ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                              children: [
                                TextSpan(
                                  text: "Sally Burger",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.white, style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 20, top: 20),
                                child: Text(
                                  "Folder Contains",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 20, top: 16),
                                child: Text(
                                  "Abs - Easy",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 20, top: 16),
                                child: Text(
                                  "Abs - Medium",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 20, top: 16),
                                child: Text(
                                  "Abs - Hard",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 64),
                    child: Text(
                      "Workouts PR",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 64, left: 20),
                    child: Image.asset("assets/images/troph.png"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 32),
                    child: Text(
                      "Sit ups",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 32),
                    child: Text(
                      "200x",
                      style: TextStyle(
                        color: Color(0xffE2B93B),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 64, bottom: 64),
                width: MediaQuery.of(context).size.width,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
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
