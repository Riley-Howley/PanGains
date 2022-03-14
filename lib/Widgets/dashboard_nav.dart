import 'package:flutter/material.dart';

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
            width: 100,
            child: TextButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, "/accounts");
              },
              child: Text("Account"),
            ),
          ),
          Container(
            width: 100,
            child: TextButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, "/workouts");
              },
              child: Text("Workouts"),
            ),
          ),
          Container(
            width: 100,
            child: TextButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, "/community");
              },
              child: Text("Community"),
            ),
          ),
          Container(
            width: 110,
            child: TextButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, "/leaderboard");
              },
              child: Text("Leaderboard"),
            ),
          ),
        ],
      ),
    );
  }
}
