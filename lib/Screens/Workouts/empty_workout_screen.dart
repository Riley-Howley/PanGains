import 'package:flutter/material.dart';
import 'package:pangains/Screens/Workouts/add_exercise_screen.dart';

class EmptyWorkoutScreen extends StatelessWidget {
  const EmptyWorkoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future chooseFolder() => showDialog(
          context: context,
          builder: (context) => Dialog(
            backgroundColor: Color(0xff222831),
            child: Container(
              height: MediaQuery.of(context).size.height / 2.5,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 20),
                        child: Text(
                          "Save Workout",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
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
                          "Choose where to save this workout:",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 25,
                        margin: EdgeInsets.only(
                          left: 20,
                        ),
                        child: Theme(
                          child: Checkbox(
                            value: false,
                            onChanged: (check) {},
                          ),
                          data: ThemeData(
                            primarySwatch: Colors.blue,
                            unselectedWidgetColor:
                                Color(0xffBDBDBD), // Your color
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 14),
                        child: Text(
                          "My Folder",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Container(
                      margin: EdgeInsets.only(top: 48),
                      width: MediaQuery.of(context).size.width,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Create New Folder",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color(
                            0xff222831,
                          ),
                          side: BorderSide(
                            width: 2,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Container(
                      margin: EdgeInsets.only(top: 32),
                      width: MediaQuery.of(context).size.width,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text("Save"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
    Future saveWorkoutDialog() => showDialog(
          context: context,
          builder: (context) => Dialog(
            backgroundColor: Color(0xff222831),
            child: Container(
              height: MediaQuery.of(context).size.height / 3,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 20),
                        child: Text(
                          "Save Workout",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
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
                          "Name your workout",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 32,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffBDBDBD))),
                          hintText: "Workout Name",
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Container(
                      margin: EdgeInsets.only(top: 32),
                      width: MediaQuery.of(context).size.width,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          chooseFolder();
                        },
                        child: Text("Save"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff222831),
        elevation: 0,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: TextButton(
              onPressed: () {
                saveWorkoutDialog();
              },
              child: Text(
                "Save Workout",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xff222831),
      body: Padding(
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
              children: [
                Container(
                  margin: EdgeInsets.only(top: 32),
                  child: Icon(
                    Icons.timer,
                    color: Colors.white,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 32, left: 8),
                  child: Text(
                    "00:00",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 64),
              width: MediaQuery.of(context).size.width,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AddExerciseScreen(),
                    ),
                  );
                },
                child: Text(
                  "Add Exercise",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
