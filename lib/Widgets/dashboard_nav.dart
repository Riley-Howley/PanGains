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
            width: 89,
            child: TextButton(
              onPressed: () {
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
              onPressed: () {
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
