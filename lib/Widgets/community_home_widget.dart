import 'package:flutter/material.dart';
import 'package:pangains/Widgets/dashboard_nav.dart';

class CommunityHome extends StatelessWidget {
  const CommunityHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Home",
                  style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Popular",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 173),
          child: Text(
            "When you follow people, you can see",
            style: TextStyle(color: Colors.grey, fontSize: 18),
          ),
        ),
        Container(
          child: Text(
            "stuff they’ve posted here",
            style: TextStyle(color: Colors.grey, fontSize: 18),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 32),
          width: MediaQuery.of(context).size.width,
          height: 48,
          child: ElevatedButton(
            onPressed: () {},
            child: Text("Explore The PanGains Community"),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "Change to populated",
          ),
        ),
      ],
    );
  }
}
