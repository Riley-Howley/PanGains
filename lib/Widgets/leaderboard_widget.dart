import 'package:flutter/material.dart';

class LeaderboardWidget extends StatelessWidget {
  const LeaderboardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(top: 32),
              child: Image.asset(
                "assets/images/diamond.png",
                width: 36,
                height: 24,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 32),
              child: Text(
                "1",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 32),
          child: Text(
            "Wamp Boi",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 32),
          child: Text(
            "1,000",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ],
    );
  }
}
