import 'package:flutter/material.dart';
import 'package:pangains/Screens/Workouts/workout_finished_screen.dart';

import '../../Http/requests.dart';
import '../../Widgets/formatted_set_table.dart';
import '../../Widgets/set_row.dart';

class PopulatedWorkoutScreen extends StatefulWidget {
  const PopulatedWorkoutScreen({Key? key}) : super(key: key);

  @override
  State<PopulatedWorkoutScreen> createState() => _PopulatedWorkoutScreenState();
}

class _PopulatedWorkoutScreenState extends State<PopulatedWorkoutScreen> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
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
              Column(
                children: [
                  Flexible(
                    child: ListView(
                      children: <Widget>[
                        ConstrainedBox(
                          constraints: BoxConstraints(
                              maxHeight:
                                  1000), // **THIS is the important part**
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return listOfSets[index];
                            },
                            itemCount: listOfSets.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/** 
 * 
 * Container(
                margin: EdgeInsets.only(top: 32),
                child: ElevatedButton(
                  onPressed: () {
                    listOfSets.add(new Set_row(count++, 0, 0, false));
                    setState(() {});
                  },
                  child: Text(
                    "Add Set",
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Add Exercise"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 100),
                child: Text(
                  "Cancel Workout",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
 * 
*/