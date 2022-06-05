import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:pangains/Screens/Workouts/populated_workout_screen.dart';
import 'package:pangains/Screens/Workouts/save_routine_screen.dart';
import 'package:pangains/Widgets/folder_widget.dart';

import '../../Http/requests.dart';

class TestScreen extends StatefulWidget {
  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  var workoutNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Future workoutSaveDialog() => showDialog(
          context: context,
          builder: (context) => Dialog(
            child: Container(
              color: Color(0xff222831),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 18.0,
                  right: 18.0,
                  top: 24,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Save Workout",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(top: 16),
                        child: Text(
                          "Name your workout",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 32,
                      ),
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        controller: workoutNameController,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffBDBDBD))),
                          hintText: "Search for...",
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 64),
                      width: MediaQuery.of(context).size.width,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff335EF5),
                        ),
                        onPressed: () async {
                          await postNewFolder(
                            listSpecificAccount[0].accountID,
                            workoutNameController.text,
                            0,
                          );
                          await getSpecificFolders(
                              listSpecificAccount[0].accountID);
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => SaveRoutineScreen(),
                            ),
                          );
                        },
                        child: Text("Save"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
    return Scaffold(
      backgroundColor: Color(0xff222831),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: TextButton(
                onPressed: () {
                  workoutSaveDialog();
                },
                child: Text("CLICK ME"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
