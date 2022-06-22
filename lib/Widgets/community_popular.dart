import 'package:flutter/material.dart';
import 'package:pangains/Widgets/routine_widget.dart';

import 'dashboard_nav.dart';

class CommunityPopular extends StatelessWidget {
  const CommunityPopular({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 3,
          child: Divider(
            color: Colors.white,
            thickness: 2,
          ),
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(top: 32),
              child: Text(
                "Popular Accounts",
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
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).popAndPushNamed("/publicAccount");
                },
                child: Container(
                  child: CircleAvatar(
                    radius: 32,
                    backgroundImage: AssetImage("assets/images/1.jpeg"),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 16),
                child: CircleAvatar(
                  radius: 32,
                  backgroundImage: AssetImage("assets/images/2.jpeg"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 16),
                child: CircleAvatar(
                  radius: 32,
                  backgroundImage: AssetImage("assets/images/3.jpeg"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 16),
                child: CircleAvatar(
                  radius: 32,
                  backgroundImage: AssetImage("assets/images/4.jpeg"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 16),
                child: CircleAvatar(
                  radius: 32,
                  backgroundImage: AssetImage("assets/images/portait.jpg"),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(top: 48),
              child: Text(
                "Popular Routines",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            ),
          ],
        ),
        RoutineWidgets(),
        RoutineWidgets(),
        RoutineWidgets(),
        RoutineWidgets(),
        RoutineWidgets(),
        Container(
          height: 50,
        ),
      ],
    );
  }
}
