import 'package:flutter/material.dart';
import 'package:pangains/Http/requests.dart';
import 'package:pangains/Widgets/exercise_table_widget.dart';
import 'package:pangains/Widgets/folder_widget.dart';
import 'package:pangains/Widgets/followers_dialog_widget.dart';
import 'package:pangains/Widgets/routine_widget.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../../Models/account.dart';
import '../../Models/workouts_perweek.dart';
import '../../Widgets/dashboard_nav.dart';
import '../../Widgets/following_dialog_widget.dart';
import '../../Widgets/workout_week_chart.dart';

class PublicAccountScreen extends StatefulWidget {
  Account account;
  PublicAccountScreen(this.account);

  @override
  State<PublicAccountScreen> createState() => _PublicAccountScreenState();
}

class _PublicAccountScreenState extends State<PublicAccountScreen> {
  bool checkContains() {
    bool isInList = false;
    for (var i in signInUsersFollowing) {
      if (i.accountID == widget.account.accountID) {
        isInList = true;
      } else {
        continue;
      }
    }
    return isInList;
  }

  @override
  Widget build(BuildContext context) {
    print("${widget.account.accountID}");

    print(signInUsersFollowing.contains(widget.account));
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
              checkContains()
                  ? Container(
                      margin: EdgeInsets.only(top: 48),
                      width: MediaQuery.of(context).size.width,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () async {
                          await deleteSocialMedia(
                              listSpecificAccount[0].accountID,
                              widget.account.accountID);
                          await getAllSignedInFollowingsAccount(
                              listSpecificAccount[0].accountID);
                          await getAllFollowersAccount(
                              widget.account.accountID);
                          await getAllFollowingsAccount(
                              widget.account.accountID);
                          setState(() {});
                        },
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
                    )
                  : Container(
                      margin: EdgeInsets.only(top: 48),
                      width: MediaQuery.of(context).size.width,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () async {
                          await postNewSocialMedia(
                              listSpecificAccount[0].accountID,
                              widget.account.accountID);
                          await getAllSignedInFollowingsAccount(
                              listSpecificAccount[0].accountID);
                          await getAllFollowersAccount(
                              widget.account.accountID);
                          await getAllFollowingsAccount(
                              widget.account.accountID);
                          setState(() {});
                        },
                        child: Text(
                          "Follow",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
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
                      "${widget.account.firstName}'s Stats:",
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
                      ? "${listSpecificStatistic[0].AvgWorkoutTime} Minutes AVG Workout Time"
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
                    margin: EdgeInsets.only(top: 64),
                    child: Text(
                      "${widget.account.firstName}'s Folders",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              listSpecificAllFolders.isEmpty
                  ? Container(
                      height: 100,
                      child: Center(
                        child: Text(
                          "NO FOLDERS",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                    )
                  : Container(
                      width: MediaQuery.of(context).size.width,
                      height: 400,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return FolderWidget(
                              listSpecificAllFolders[index].FolderID,
                              listSpecificAllFolders[index].FolderName,
                              listSpecificAllFolders[index].FolderLikes);
                        },
                        itemCount: listSpecificAllFolders.length,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
