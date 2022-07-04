import 'package:flutter/material.dart';
import 'package:pangains/Screens/Messages/screens/home_screen.dart';
import 'package:pangains/main.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

import '../Http/requests.dart';
import '../Models/workouts_perweek.dart';

import 'package:charts_flutter/flutter.dart' as charts;

class DashboadNav extends StatelessWidget {
  const DashboadNav({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            width: 89,
            child: TextButton(
              onPressed: () async {
                await getAllFollowersAccount(listSpecificAccount[0].accountID);
                await getAllFollowingsAccount(listSpecificAccount[0].accountID);
                await getSpecificStatistic(listSpecificAccount[0].accountID);
                dataList.clear();
                await getSpecificAllDaysWorkedOut(
                    listSpecificAccount[0].accountID);
                for (var i in listSpecificDaysWorkedOut) {
                  dataList.add(WorkoutsPerWeek(i.day, i.hours,
                      charts.ColorUtil.fromDartColor(Colors.blue)));
                }
                Navigator.popAndPushNamed(context, "/accounts");
              },
              child: Text(
                "Account",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          Container(
            width: 100,
            child: TextButton(
              onPressed: () async {
                await getEveryAccount();
                await getAllLeaderboards();
                await getAllChallengeStats();
                await getAllExercises();
                await getSpecificFolders(listSpecificAccount[0].accountID);
                Navigator.popAndPushNamed(context, "/workouts");
              },
              child: Text(
                "Workouts",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          Container(
            width: 110,
            child: TextButton(
              onPressed: () async {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ));
              },
              child: Text(
                "Messages",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          Container(
            width: 120,
            child: TextButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, "/community");
              },
              child: Text(
                "Community",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          Container(
            width: 130,
            child: TextButton(
              onPressed: () async {
                await getEveryAccount();
                await getAllLeaderboards();
                await getAllChallengeStats();
                if (listAllChallengeStats.length <
                        listOfAllLeaderboard[0].totalParticipants ||
                    listAllChallengeStats.length >
                        listOfAllLeaderboard[0].totalParticipants) {
                  await updateSpecificLeaderboard(
                      listOfAllLeaderboard[0].LeaderBoardID,
                      listOfAllLeaderboard[0].challengesID,
                      listOfAllLeaderboard[0].date,
                      listAllChallengeStats.length);
                }
                await getAllLeaderboards();
                await getAllChallengeStats();

                Navigator.popAndPushNamed(context, "/leaderboard");
              },
              child: Text(
                "Leaderboard",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
