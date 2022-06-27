import 'package:flutter/material.dart';

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
              onPressed: () {
                Navigator.popAndPushNamed(context, "");
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
              onPressed: () {
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
