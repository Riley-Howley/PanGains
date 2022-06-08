import 'package:flutter/material.dart';
import 'package:pangains/Http/requests.dart';
import 'package:pangains/Screens/Workouts/empty_workout_screen.dart';
import 'package:pangains/Screens/Workouts/workout_history.dart';
import 'package:pangains/Widgets/folder_widget.dart';

import '../../Widgets/dashboard_nav.dart';

class WorkOutScreen extends StatelessWidget {
  const WorkOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff222831),
      body: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    width: 200,
                    child: Text(
                      "Your Dashboard",
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
                      "View and explore...",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              DashboadNav(),
              Container(
                margin: EdgeInsets.only(top: 48),
                width: MediaQuery.of(context).size.width,
                height: 48,
                child: ElevatedButton(
                  child: Text("Start Empty Workout"),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EmptyWorkoutScreen(),
                    ));
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 24),
                child: Text(
                  "Choose your workouts as you go",
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 32),
                child: Text(
                  "OR",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 32),
                width: MediaQuery.of(context).size.width,
                height: 48,
                child: ElevatedButton(
                  child: Text("Browse Community Routines"),
                  onPressed: () {},
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 24),
                child: Text(
                  "Browse routines created by the community",
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 140,
                    margin: EdgeInsets.only(top: 64),
                    child: Text(
                      "Your Folders",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              listSpecificAllFolders.isEmpty
                  ? Container(
                      child: Text(
                        "You have no Folders! A folder stores multiple routines. Routines are made up of different exercises",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                        ),
                      ),
                    )
                  : Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {},
                            child: FolderWidget(
                                listSpecificAllFolders[index].FolderName,
                                listSpecificAllFolders[index].FolderLikes),
                          );
                        },
                        itemCount: listSpecificAllFolders.length,
                      )),
              listSpecificAllFolders.isEmpty
                  ? Container(
                      margin: EdgeInsets.only(
                        top: 24,
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text("Create Folder"),
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.only(
                        top: 24,
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text("View Your Folders"),
                      ),
                    ),
              Row(
                children: [
                  Container(
                    width: 160,
                    margin: EdgeInsets.only(top: 64),
                    child: Text(
                      "Workout History",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Container(
                child: Text(
                  "Browse workouts that you or your friends have completed previously",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 24, bottom: 100),
                width: MediaQuery.of(context).size.width,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => WorkoutHistoryScreen(),
                      ),
                    );
                  },
                  child: Text("Show History"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
