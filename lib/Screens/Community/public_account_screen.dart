import 'dart:html';

import 'package:flutter/material.dart';
import 'package:pangains/Http/requests.dart';
import 'package:pangains/Widgets/exercise_table_widget.dart';
import 'package:pangains/Widgets/routine_widget.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../../Models/account.dart';
import '../../Models/workouts_perweek.dart';
import '../../Widgets/dashboard_nav.dart';
import '../../Widgets/row_user_widget.dart';
import '../../Widgets/workout_week_chart.dart';

class PublicAccountScreen extends StatefulWidget {
  Account account;
  PublicAccountScreen(this.account);

  @override
  State<PublicAccountScreen> createState() => _PublicAccountScreenState();
}

class _PublicAccountScreenState extends State<PublicAccountScreen> {
  final List<WorkoutsPerWeek> data = [
    WorkoutsPerWeek("Mon", 8, charts.ColorUtil.fromDartColor(Colors.blue)),
    WorkoutsPerWeek("Tue", 0, charts.ColorUtil.fromDartColor(Colors.blue)),
    WorkoutsPerWeek("Wed", 2, charts.ColorUtil.fromDartColor(Colors.blue)),
    WorkoutsPerWeek("Thu", 4, charts.ColorUtil.fromDartColor(Colors.blue)),
    WorkoutsPerWeek("Fri", 3, charts.ColorUtil.fromDartColor(Colors.blue)),
    WorkoutsPerWeek("Sat", 0, charts.ColorUtil.fromDartColor(Colors.blue)),
    WorkoutsPerWeek("Sun", 0, charts.ColorUtil.fromDartColor(Colors.blue)),
  ];

  DateTime _focusedDay = DateTime.now();

  DateTime? _selectedDay;

  CalendarFormat _calendarFormat = CalendarFormat.month;

  DateTime _dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    Future followersDialog() => showDialog(
          context: context,
          builder: (context) => Dialog(
            backgroundColor: Color(0xff222831),
            child: Column(
              children: [
                Card(
                  color: Color(0xff222831),
                  elevation: 8.0,
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                top: 42,
                              ),
                              child: Text(
                                "Followers",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 42),
                          width: MediaQuery.of(context).size.width / 3,
                          child: Divider(
                            color: Colors.white,
                            thickness: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 1.6,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PublicAccountScreen(
                                  getAccountFollowers[index]),
                            ));
                          },
                          child: RowUserWidget(
                            getAccountFollowers[index].firstName +
                                " " +
                                getAccountFollowers[index].lastName,
                            getAccountFollowers[index].profilePicUrl,
                          ),
                        );
                      },
                      itemCount: getAccountFollowers.length,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.8,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Close",
                    ),
                  ),
                ),
              ],
            ),
          ),
        );

    Future followingDialog() => showDialog(
          context: context,
          builder: (context) => Dialog(
            backgroundColor: Color(0xff222831),
            child: Column(
              children: [
                Card(
                  color: Color(0xff222831),
                  elevation: 8.0,
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                top: 42,
                              ),
                              child: Text(
                                "Following",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 42),
                          width: MediaQuery.of(context).size.width / 3,
                          child: Divider(
                            color: Colors.white,
                            thickness: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 1.6,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PublicAccountScreen(
                                  getAccountFollowing[index]),
                            ));
                          },
                          child: RowUserWidget(
                            getAccountFollowing[index].firstName +
                                " " +
                                getAccountFollowing[index].lastName,
                            getAccountFollowing[index].profilePicUrl,
                          ),
                        );
                      },
                      itemCount: getAccountFollowing.length,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.8,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Close",
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
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
                margin: EdgeInsets.only(top: 48),
                child: CircleAvatar(
                  radius: 74,
                  backgroundImage: NetworkImage(widget.account.profilePicUrl),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 32),
                child: Text(
                  widget.account.firstName + " " + widget.account.lastName,
                  style: TextStyle(color: Colors.white, fontSize: 36),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 16,
                    ),
                    child: Image.asset(
                      "assets/images/diamond.png",
                      width: 30,
                      height: 36,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 24,
                      top: 16,
                    ),
                    child: Text(
                      widget.account.title,
                      style: TextStyle(
                        color: Color(0xffADD8E6),
                        fontSize: 24,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 48),
                width: MediaQuery.of(context).size.width,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Following",
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
              Container(
                margin: EdgeInsets.only(top: 36),
                width: MediaQuery.of(context).size.width,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Report",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xffEB5757),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      followersDialog();
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
                      followingDialog();
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
                  "5 Workouts completed",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.fiber_manual_record,
                  color: Colors.white,
                ),
                title: Text(
                  "58 Minutes avg workout time",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.fiber_manual_record,
                  color: Colors.white,
                ),
                title: Text(
                  "3852 Kg total weight lifted",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.fiber_manual_record,
                  color: Colors.white,
                ),
                title: Text(
                  "128 Average workout reps",
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
                        "Hours worked out this week:",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    Expanded(child: WorkoutWeekChart(data)),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 64),
                    child: Text(
                      "Sally Burger's Folders",
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
                child: RoutineWidgets(),
              ),
              Container(
                child: RoutineWidgets(),
              ),
              Container(
                child: RoutineWidgets(),
              ),
              Container(
                child: RoutineWidgets(),
              ),
              Container(
                child: RoutineWidgets(),
              ),
              Container(
                child: RoutineWidgets(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
