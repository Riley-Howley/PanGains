import 'package:flutter/material.dart';

import 'dashboard_nav.dart';

class community_popular_widget extends StatelessWidget {
  const community_popular_widget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
              Container(
                child: CircleAvatar(
                  radius: 32,
                  backgroundImage: AssetImage("assets/images/1.jpeg"),
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
      ],
    );
  }
}
