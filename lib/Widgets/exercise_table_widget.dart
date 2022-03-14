import 'package:flutter/material.dart';

class ExerciseTableWidget extends StatelessWidget {
  const ExerciseTableWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "14/03/2022",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Text(
                "Pull - Medium",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(top: 8),
              child: Text.rich(
                TextSpan(
                  text: "58 Minutes ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: "Workout time",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              child: Text.rich(
                TextSpan(
                  text: "3852 Kg ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: "Weight lifted",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              child: Text.rich(
                TextSpan(
                  text: "128 ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: "Workout reps",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(top: 32),
              child: Text(
                "Bicep Curls",
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
                "Set",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Text(
                "Previous",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Text(
                "Kg",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Text(
                "Reps",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(top: 30, left: 10),
              child: Text(
                "1",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Text(
                "10x7",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Text(
                "10",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30, right: 10),
              child: Text(
                "8",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10, left: 10),
              child: Text(
                "2",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                "10x7",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                "10",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, right: 10),
              child: Text(
                "8",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10, left: 10),
              child: Text(
                "3",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                "10x7",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                "10",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, right: 10),
              child: Text(
                "8",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
