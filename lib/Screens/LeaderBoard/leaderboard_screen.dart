import 'package:flutter/material.dart';
import 'package:pangains/Http/requests.dart';
import 'package:pangains/Models/challenge_stats.dart';

import '../../Widgets/dashboard_nav.dart';
import '../../Widgets/leaderboard_widget.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getMonth(int num) {
      switch (num) {
        case 1:
          return "January";
        case 2:
          return "February";
        case 3:
          return "March";
        case 4:
          return "April";
        case 5:
          return "May";
        case 6:
          return "June";
        case 7:
          return "July";
        case 8:
          return "August";
        case 9:
          return "September";
        case 10:
          return "October";
        case 11:
          return "November";
        case 12:
          return "December";
        default:
          return "N/A";
      }
    }

    listAllChallengeStats.sort(
      (a, b) => a.challengeTotalReps.compareTo(b.challengeTotalReps),
    );

    List<ChallengeStats> reversedList =
        new List.from(listAllChallengeStats.reversed);

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
              Row(
                children: [
                  Container(
                    child: Text(
                      "This Month’s Challenge:",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: Text(
                      "${getMonth(DateTime.now().month)} ${DateTime.now().year}",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              ),
              listOfAllLeaderboard.isEmpty
                  ? Center(
                      child: Text(
                      "No Monthly Challenge Set",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ))
                  : Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 16),
                          child: Text(
                            listAllChallenges
                                .firstWhere((element) =>
                                    element.challengesID ==
                                    listOfAllLeaderboard[0].challengesID)
                                .challengeName,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 48,
                          ),
                          child: Text(
                            "Total Participants",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Text(
                            listOfAllLeaderboard[0]
                                .totalParticipants
                                .toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 36,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                "Rank",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                            Container(
                              child: Text(
                                "Name",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                            Container(
                              child: Text(
                                "Amount",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                        for (int i = 0; i < reversedList.length; i++)
                          LeaderboardWidget(i, reversedList[i].AccountID),
                        Container(
                          height: 20,
                        ),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
