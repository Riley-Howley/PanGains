import 'package:flutter/material.dart';
import '../../Widgets/community_home_widget.dart';
import '../../Widgets/community_popular.dart';
import '../../Widgets/dashboard_nav.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  @override
  Widget build(BuildContext context) {
    bool home = true;
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
              home == false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                home == true;
                              });
                            },
                            child: Text(
                              "Home",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                home == false;
                              });
                            },
                            child: Text(
                              "Popular",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                home == true;
                              });
                            },
                            child: Text(
                              "Home",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                home == false;
                              });
                            },
                            child: Text(
                              "Popular",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
              home == true ? CommunityPopular() : CommunityHome(),
            ],
          ),
        ),
      ),
    );
  }
}
