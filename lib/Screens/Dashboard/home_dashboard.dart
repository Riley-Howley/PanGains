import 'package:flutter/material.dart';
import 'package:pangains/Http/requests.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:pangains/Screens/Auth%20Screens/signin_screen.dart';
import 'package:pangains/Screens/Dashboard/edit_account_screen.dart';
import 'package:pangains/Screens/Test%20Screens/test_screen.dart';
import 'package:pangains/Screens/splash_screen.dart';
import 'package:pangains/Widgets/followers_dialog_widget.dart';
import 'package:pangains/Widgets/following_dialog_widget.dart';
import 'package:pangains/Widgets/workout_week_chart.dart';
import 'package:pangains/main.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';
import '../../Widgets/dashboard_nav.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../Widgets/row_user_widget.dart';

class HomeDashboardScreen extends StatefulWidget {
  final StreamChatClient? client;
  HomeDashboardScreen(this.client);
  @override
  State<HomeDashboardScreen> createState() => _HomeDashboardScreenState();
}

class _HomeDashboardScreenState extends State<HomeDashboardScreen> {
  DateTime _focusedDay = DateTime.now();

  DateTime? _selectedDay;

  CalendarFormat _calendarFormat = CalendarFormat.month;

  DateTime _dateTime = DateTime.now();
  bool isSwitched = listSpecificAccount[0].private;
  bool isNotification = listSpecificAccount[0].notifications;

  @override
  Widget build(BuildContext context) {
    var title = listSpecificAccount[0].title;
    Icon icon;
    if (title == "Personal Trainer") {
      icon = Icon(Icons.medical_services, size: 40, color: Colors.white);
    } else {
      icon = Icon(
        Icons.workspace_premium,
        color: Colors.blue,
      );
    }
    return Scaffold(
      backgroundColor: Color(0xff222831),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
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
                margin: EdgeInsets.only(top: 24),
                child: CircleAvatar(
                    radius: 70,
                    backgroundImage:
                        NetworkImage(listSpecificAccount[0].profilePicUrl)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: Text(
                      listSpecificAccount[0].firstName +
                          " " +
                          listSpecificAccount[0].lastName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => EditAccountScreen(),
                      ));
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Icon(
                        Icons.edit,
                        size: 30,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                child: Text(
                  listSpecificAccount[0].description.isNotEmpty
                      ? listSpecificAccount[0].description
                      : "Set an account description here",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 16,
                    ),
                    child: icon,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 24,
                      top: 16,
                    ),
                    child: Text(
                      listSpecificAccount[0].title.isNotEmpty
                          ? listSpecificAccount[0].title
                          : "New User",
                      style: TextStyle(
                        color: Color.fromARGB(255, 4, 236, 205),
                        fontSize: 24,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 32,
                ),
                child: Text(
                  "Account Visibility",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Public",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Switch(
                    value: isSwitched,
                    onChanged: (value) async {
                      setState(() {
                        isSwitched = value;
                      });
                      await updateSpecificAccount(
                        listSpecificAccount[0].accountID,
                        listSpecificAccount[0].firstName,
                        listSpecificAccount[0].lastName,
                        listSpecificAccount[0].email,
                        listSpecificAccount[0].password,
                        listSpecificAccount[0].title,
                        listSpecificAccount[0].profilePicUrl,
                        listSpecificAccount[0].description,
                        value,
                        listSpecificAccount[0].notifications,
                        listSpecificAccount[0].averageChallengePos,
                        listSpecificAccount[0].type,
                      );
                    },
                  ),
                  Text(
                    "Private",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => FollowersDialogWidget());
                    },
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 32),
                          child: Text(
                            getAccountFollowers.length.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            "Followers",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => FollowingDialogWidget());
                    },
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 32),
                          child: Text(
                            getAccountFollowing.length.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            "Following",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 64),
                    child: Text(
                      "Your Stats:",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ],
              ),
              ListTile(
                leading: Icon(
                  Icons.fiber_manual_record,
                  color: Colors.white,
                ),
                title: Text(
                  listSpecificStatistic[0].TotalWorkouts.toString().isNotEmpty
                      ? "${listSpecificStatistic[0].TotalWorkouts.toString()} Workouts Completed"
                      : "NO WORKOUTS COMPLETED",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.fiber_manual_record,
                  color: Colors.white,
                ),
                title: Text(
                  listSpecificStatistic[0].AvgWorkoutTime.toString().isNotEmpty
                      ? "${listSpecificStatistic[0].AvgWorkoutTime} Hours Workout Time"
                      : "NO WORKOUTS COMPLETED",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.fiber_manual_record,
                  color: Colors.white,
                ),
                title: Text(
                  listSpecificStatistic[0].TotalLifted.toString().isNotEmpty
                      ? "${listSpecificStatistic[0].TotalLifted} Total KG Lifted"
                      : "NO WORKOUTS COMPLETED",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.fiber_manual_record,
                  color: Colors.white,
                ),
                title: Text(
                  "${listSpecificStatistic[0].AvgReps} Average workout reps",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 64),
                decoration: BoxDecoration(
                  border:
                      Border.all(color: Colors.white, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(15),
                ),
                width: MediaQuery.of(context).size.width,
                height: 215,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: Text(
                        "Total Hours Worked Out",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    Expanded(child: WorkoutWeekChart(dataList)),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 32),
                    child: Text(
                      "Account Settings",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 32),
                    child: Text(
                      "Receive Notifications?",
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 32),
                    child: Switch(
                      value: isNotification,
                      onChanged: (value) async {
                        setState(() {
                          isNotification = value;
                        });
                        await updateSpecificAccount(
                          listSpecificAccount[0].accountID,
                          listSpecificAccount[0].firstName,
                          listSpecificAccount[0].lastName,
                          listSpecificAccount[0].email,
                          listSpecificAccount[0].password,
                          listSpecificAccount[0].title,
                          listSpecificAccount[0].profilePicUrl,
                          listSpecificAccount[0].description,
                          listSpecificAccount[0].private,
                          value,
                          listSpecificAccount[0].averageChallengePos,
                          listSpecificAccount[0].type,
                        );
                      },
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 64, bottom: 100),
                width: MediaQuery.of(context).size.width,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SplashScreen(widget.client),
                    ));
                  },
                  child: Text("Sign Out"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
